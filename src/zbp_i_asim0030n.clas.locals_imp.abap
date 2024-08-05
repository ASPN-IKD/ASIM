CLASS lhc_YI_ASIM0030N DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR yi_asim0030n RESULT result.

  METHODS create_number FOR DETERMINE ON SAVE
      IMPORTING keys FOR yi_asim0030n~create_number.

  METHODS delete_order FOR MODIFY
      IMPORTING keys FOR ACTION yi_asim0030n~delete_order.

  CONSTANTS:
      c_scenario TYPE string VALUE 'ZCS_PO_001',
      c_service  TYPE string VALUE 'ZSTD_PO_ITEM_001_REST'.

  DATA: http_client TYPE REF TO zcl_if_common_001.
  DATA: uri TYPE string.

  DATA: asim0030s TYPE TABLE FOR UPDATE yi_asim0030n,
        asim0030  TYPE STRUCTURE FOR UPDATE yi_asim0030n,
        asim0040s TYPE TABLE FOR UPDATE yi_asim0040n,
        asim0040  TYPE STRUCTURE FOR UPDATE yi_asim0040n.

ENDCLASS.

CLASS lhc_YI_ASIM0030N IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create_number.


    TRY.
        "CBO Read
        READ ENTITIES OF yi_asim0030n IN LOCAL MODE
        ENTITY yi_asim0030n
        ALL FIELDS
            WITH CORRESPONDING #( keys )
        RESULT DATA(lt_result)
        FAILED    DATA(lt_failed)
        REPORTED  DATA(lt_reported).

        "현재 Header의 Blino가 존재 하지 않을때만 number range해서 header 설정 해줌.
        IF lt_result[ 1 ]-Blino IS INITIAL.
             "number range 가져오기
            cl_numberrange_runtime=>number_get(
              EXPORTING
                nr_range_nr       = '02'
                object            = 'ZNR_10_NO'
                quantity          = 1
              IMPORTING
                number            = DATA(number_range_key)
                returncode        = DATA(number_range_return_code)
                returned_quantity = DATA(number_range_returned_quantity)
            ).

            "필드 값 수정
            LOOP AT lt_result INTO DATA(ls_result).
                asim0030 = CORRESPONDING #( ls_result ).

                "오늘의 연도로 처리
                asim0030-Bliyr = sy-datum(4).

                "Blino : 1000000004
                asim0030-Blino = substring( val = number_range_key off = 10 len = 10 ).

                "reqmu : Bliyr-4자리 + Blino-6자리 2023000004
                "DATA(sub_Blino) = substring( val = asim0030-Blino off = 4 len = 6 ).
                "asim0030-Reqmu = asim0030-Bliyr && sub_Blino.

                APPEND asim0030 TO asim0030s.
                CLEAR : asim0030.
            ENDLOOP.

            "CBO Update
            MODIFY ENTITIES OF yi_asim0030n IN LOCAL MODE
            ENTITY yi_asim0030n UPDATE SET FIELDS WITH asim0030s
            MAPPED   DATA(ls_mapped_modify)
            FAILED   DATA(lt_failed_modify)
            REPORTED DATA(lt_reported_modify).
        ENDIF.

      CATCH cx_number_ranges INTO DATA(lx_number_ranges).
        EXIT.
    ENDTRY.

  ENDMETHOD.

  METHOD delete_order.

    "Header값 읽기
    READ ENTITIES OF yi_asim0030n IN LOCAL MODE
    ENTITY yi_asim0030n
    ALL FIELDS
        WITH CORRESPONDING #( keys )
    RESULT    DATA(lt_result)
    FAILED    DATA(lt_failed)
    REPORTED  DATA(lt_reported).

    DATA(ls_result) = lt_result[ 1 ].
    DATA(header_uuid) = ls_result-Uuid.

    "UUID로 Item 읽기
    SELECT ebeln, ebelp, uuid
      FROM yi_asim0040n
     WHERE ParentUUID = @header_uuid
     INTO TABLE @DATA(lt_result_item).

    "Item이 존재 하지 않으면 종료
    IF lines( lt_result_item ) < 0.
        EXIT.
    ENDIF.

    "통신 규약 존재 확인
    CREATE OBJECT me->http_client
      EXPORTING
        i_scenario     = c_scenario
        i_service      = c_service
      EXCEPTIONS
        no_arrangement = 1.

    CHECK sy-subrc <> 1.

    "수입계약에 해당 구매 문서 번호가 존재하면 삭제 안됨
    SELECT count( 1 ) FROM yi_asim0010n WHERE Ebeln = @ls_result-Ebeln INTO @DATA(lv_count).

    IF lv_count IS INITIAL.
        "Order, ItemNo 번호 가져오기
        LOOP AT lt_result_item INTO DATA(ls_result_item).

            IF ls_result_item-ebeln IS NOT INITIAL AND ls_result_item-ebelp IS NOT INITIAL.

                DATA(order) = '''' && ls_result_item-ebeln && ''''.
                DATA(item)  = '''' && ls_result_item-ebelp && ''''.
                "uri = '(PurchaseOrder=' && order && ',PurchaseOrderItem=' && item && ')'.
                uri = '(PurchaseOrder=' && order && ',PurchaseOrderItem=' && item && ')'.

                "GET TOKEN
                DATA(token) = me->http_client->get_token_cookies( ).

                "Delete
                IF token IS NOT INITIAL.
                  me->http_client->delete(
                    EXPORTING
                        uri    = uri
                    IMPORTING
                        body   = DATA(body)
                        status = DATA(status)
                    ).
                ENDIF.

                "삭제에 실패 한 경우
                IF status NE 204.
                    "실패 Msg 파싱
                    DATA: abap_msg      TYPE REF TO data,
                          result_msg    TYPE string.

                    /ui2/cl_json=>deserialize( EXPORTING json = body CHANGING data = abap_msg ).

                    FIELD-SYMBOLS:<fs_msg>        TYPE any,
                                  <fs_error>      TYPE any,
                                  <fs_innererror> TYPE any,
                                  <fs_detail>     TYPE any,
                                  <fs_line>       TYPE any,
                                  <fs_result_msg> TYPE any.

                    ASSIGN abap_msg->* TO <fs_msg>.

                    "400과 405에 따라 message 가져올 구조가 다르기 때문에 조건 추가
                    IF status EQ 400.
                        ASSIGN ('<fs_msg>-error->*') TO <fs_error>.
                        ASSIGN ('<fs_error>-message->*') TO <fs_line>.
                        ASSIGN ('<fs_line>-value->*') TO <fs_result_msg>.

                        IF <fs_result_msg> IS ASSIGNED.
                            result_msg = <fs_result_msg>.
                        ENDIF.
                    ENDIF.

                    IF status EQ 405.
                        ASSIGN ('<fs_msg>-error->*') TO <fs_error>.
                        ASSIGN ('<fs_error>-innererror->*') TO <fs_innererror>.
                        ASSIGN ('<fs_innererror>-errordetails->*') TO <fs_detail>.
                        ASSIGN ('<fs_detail>-errordetails->*') TO <fs_detail>.

                        LOOP AT <fs_detail> ASSIGNING FIELD-SYMBOL(<fs_message>).
                            ASSIGN ('<fs_message>-message->*') TO <fs_line>.

                            IF <fs_line> IS ASSIGNED.
                                result_msg = <fs_line>.
                            ENDIF.
                        ENDLOOP.
                    ENDIF.

                    "APPEND VALUE #( %tky = ls_result-%tky ) TO failed-yi_asim0030n.
                    "APPEND VALUE #( %tky = ls_result-%tky %state_area = 'api_error' %msg = new_message( id = 'YASIM_MSG' number = 001 severity = if_abap_behv_message=>severity-error v1 = result_msg ) ) TO reported-yi_asim0030n.
                    EXIT.
                ENDIF.

            ENDIF.

        ENDLOOP.
    ENDIF.

    "모든 Item이 정상적으로 삭제 된 경우 Header 삭제 지시자 처리
    IF result_msg IS INITIAL.
        asim0030 = CORRESPONDING #( ls_result ).
        asim0030-Loekz = 'X'.

        APPEND asim0030 TO asim0030s.

        MODIFY ENTITIES OF yi_asim0030n IN LOCAL MODE
        ENTITY yi_asim0030n UPDATE SET FIELDS WITH asim0030s
        MAPPED   DATA(ls_mapped_modify)
        FAILED   DATA(lt_failed_modify)
        REPORTED DATA(lt_reported_modify).

        LOOP AT lt_result_item INTO ls_result_item.

            "header에 연관된 item 삭제
            asim0040 = CORRESPONDING #( ls_result_item ).
            asim0040-Loekz = 'X'.

            APPEND asim0040 TO asim0040s.
        ENDLOOP.

        MODIFY ENTITIES OF yi_asim0040n
        ENTITY yi_asim0040n UPDATE SET FIELDS WITH asim0040s
        MAPPED   DATA(ls_mapped_modify_item)
        FAILED   DATA(lt_failed_modify_item)
        REPORTED DATA(lt_reported_modify_item).
    ENDIF.
  ENDMETHOD.

ENDCLASS.

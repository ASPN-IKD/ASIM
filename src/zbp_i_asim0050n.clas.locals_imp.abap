CLASS lhc_YI_ASIM0050N DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR yi_asim0050n RESULT result.

    METHODS delete_invoice FOR MODIFY
      IMPORTING keys FOR ACTION yi_asim0050n~delete_invoice.

    DATA:
        http_client TYPE REF TO zcl_if_common_001,
        uri         TYPE string,
        asim0050s   TYPE TABLE FOR UPDATE yi_asim0050n,
        asim0050    TYPE STRUCTURE FOR UPDATE yi_asim0050n,
        asim0060s   TYPE TABLE FOR UPDATE yi_asim0060n,
        asim0060    TYPE STRUCTURE FOR UPDATE yi_asim0060n.

    CONSTANTS:
        c_scenario   TYPE string VALUE 'ZCS_SINV_001',
        c_service    TYPE string VALUE 'ZSTD_SINV_003_REST',
        c_service1   TYPE string VALUE 'ZSTD_SINV_001_REST'.

ENDCLASS.

CLASS lhc_YI_ASIM0050N IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD delete_invoice.

    "Header값 읽기
    READ ENTITIES OF yi_asim0050n IN LOCAL MODE
    ENTITY yi_asim0050n
    ALL FIELDS
        WITH CORRESPONDING #( keys )
    RESULT    DATA(lt_result)
    FAILED    DATA(lt_failed)
    REPORTED  DATA(lt_reported).

    DATA(ls_result) = lt_result[ 1 ].

    "송장문서번호가 존재하지 않으면 종료
    IF ls_result-Belnr IS INITIAL.
        EXIT.
    ENDIF.

    "통신 규약 존재 확인
    CLEAR : http_client.
    CREATE OBJECT me->http_client
      EXPORTING
        i_scenario     = c_scenario
        i_service      = c_service1
      EXCEPTIONS
        no_arrangement = 1.

    CHECK sy-subrc <> 1.

    "Cancel?PostingDate=datetime'2023-11-14T00:00'&ReversalReason='01'&FiscalYear='2023'&SupplierInvoice='5105600113'
    DATA(datetime) = '''' && ls_result-BudatIv+0(4) && '-' && ls_result-BudatIv+4(2) && '-' && ls_result-BudatIv+6(2) && 'T00:00:00' && '''' .
    DATA(reason)   = '''01'''.
    DATA(year)     = '''' && ls_result-BudatIv+0(4) && ''''.
    DATA(invoice)  = '''' && ls_result-Belnr && ''''.

    uri = '/Cancel?PostingDate=datetime' && datetime && '&ReversalReason=' && reason && '&FiscalYear=' && year && '&SupplierInvoice=' && invoice.

    "GET TOKEN
    DATA(token_cookies) = me->http_client->get_token_cookies( ).

    CLEAR : http_client.
    CREATE OBJECT me->http_client
      EXPORTING
        i_scenario     = c_scenario
        i_service      = c_service
      EXCEPTIONS
        no_arrangement = 1.

    CHECK sy-subrc <> 1.

    "Delete
    IF token_cookies IS NOT INITIAL.
      me->http_client->cookies = token_cookies-cookies.
      me->http_client->token   = token_cookies-token.

      me->http_client->post(
        EXPORTING
            uri    = uri
        IMPORTING
            body   = DATA(body)
            status = DATA(status)
        ).
    ENDIF.

    "삭제에 실패 한 경우
    IF status NE 200.
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

        IF status EQ 400.
            ASSIGN ('<fs_msg>-error->*') TO <fs_error>.
            ASSIGN ('<fs_error>-message->*') TO <fs_line>.
            ASSIGN ('<fs_line>-value->*') TO <fs_result_msg>.

            IF <fs_result_msg> IS ASSIGNED.
                result_msg = <fs_result_msg>.
            ENDIF.
        ENDIF.

*        IF status EQ 405.
*            ASSIGN ('<fs_msg>-error->*') TO <fs_error>.
*            ASSIGN ('<fs_error>-innererror->*') TO <fs_innererror>.
*            ASSIGN ('<fs_innererror>-errordetails->*') TO <fs_detail>.
*            ASSIGN ('<fs_detail>-errordetails->*') TO <fs_detail>.
*
*            LOOP AT <fs_detail> ASSIGNING FIELD-SYMBOL(<fs_message>).
*                ASSIGN ('<fs_message>-message->*') TO <fs_line>.
*
*                IF <fs_line> IS ASSIGNED.
*                    result_msg = <fs_line>.
*                ENDIF.
*            ENDLOOP.
*        ENDIF.

        "APPEND VALUE #( %tky = ls_result-%tky ) TO failed-yi_asim0030n.
        "APPEND VALUE #( %tky = ls_result-%tky %state_area = 'api_error' %msg = new_message( id = 'YASIM_MSG' number = 001 severity = if_abap_behv_message=>severity-error v1 = result_msg ) ) TO reported-yi_asim0030n.
        EXIT.
    ENDIF.

    "모든 Item이 정상적으로 삭제 된 경우 Header 삭제 지시자 처리
    IF result_msg IS INITIAL.
        asim0050 = CORRESPONDING #( lt_result[ 1 ] ).
        asim0050-%control-Loekz = if_abap_behv=>mk-on.
        asim0050-Loekz = 'X'.

        /ui2/cl_json=>deserialize( EXPORTING json = body CHANGING data = abap_msg ).

        ASSIGN abap_msg->* TO <fs_msg>.

        FIELD-SYMBOLS:<fs_success>      TYPE any,
                      <fs_document>     TYPE any,
                      <fs_year>         TYPE any.

        ASSIGN ('<fs_msg>-d->Cancel->ReverseDocument->*') TO <fs_document>.
        ASSIGN ('<fs_msg>-d->Cancel->FiscalYear->*') TO <fs_year>.

        IF <fs_document> IS ASSIGNED AND <fs_year> IS ASSIGNED.

            asim0050-%control-Stblg = if_abap_behv=>mk-on.
            asim0050-%control-Stjah = if_abap_behv=>mk-on.

            "취소송장
            asim0050-Stblg = <fs_document>.
            "취소송장연도
            asim0050-Stjah = <fs_year>.
        ENDIF.

        APPEND asim0050 TO asim0050s.

        MODIFY ENTITIES OF yi_asim0050n IN LOCAL MODE
        ENTITY yi_asim0050n UPDATE FROM asim0050s
        MAPPED   DATA(ls_mapped_modify)
        FAILED   DATA(lt_failed_modify)
        REPORTED DATA(lt_reported_modify).

        "Item Read
        SELECT * FROM yi_asim0060n WHERE ParentUUID = @ls_result-Uuid INTO TABLE @DATA(lt_item_result).

        LOOP AT lt_item_result INTO DATA(ls_item_result).
            asim0060 = CORRESPONDING #( ls_item_result ).
            asim0060-Loekz = 'X'.

            APPEND asim0060 TO asim0060s.
        ENDLOOP.

        "Item Update
        MODIFY ENTITIES OF yi_asim0060n
        ENTITY yi_asim0060n UPDATE SET FIELDS WITH asim0060s
        MAPPED   DATA(ls_mapped_modify_item)
        FAILED   DATA(lt_failed_modify_item)
        REPORTED DATA(lt_reported_modify_item).

    ENDIF.

  ENDMETHOD.

ENDCLASS.

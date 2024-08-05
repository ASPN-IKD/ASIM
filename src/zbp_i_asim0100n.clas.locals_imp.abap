CLASS lhc_YI_ASIM0100N DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PUBLIC SECTION.
    CLASS-DATA: return_msg TYPE string.

  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR yi_asim0100n RESULT result.

    METHODS calc_value FOR DETERMINE ON SAVE
      IMPORTING keys FOR yi_asim0100n~calc_value.

    METHODS api_error FOR VALIDATE ON SAVE
      IMPORTING keys FOR yi_asim0100n~api_error.

    TYPES:
      "스탠다드 API Response Information
      BEGIN OF post_result,
        post_body   TYPE string,
        post_status TYPE string,
      END OF post_result.

    DATA: http_client TYPE REF TO zcl_if_common_001.

    "상수
    CONSTANTS:
      c_scenario   TYPE string VALUE 'ZCS_IG_001',
      c_service    TYPE string VALUE 'ZSTD_IG_001_REST'.

ENDCLASS.

CLASS lhc_YI_ASIM0100N IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD calc_value.
    "Sequence 기준으로 Item No 생성
    TRY.
        READ ENTITIES OF yi_asim0100n IN LOCAL MODE
        ENTITY yi_asim0100n
        ALL FIELDS
            WITH CORRESPONDING #( keys )
        RESULT DATA(lt_item_result)
        FAILED    DATA(lt_item_failed)
        REPORTED  DATA(lt_item_reported).

        SORT lt_item_result BY ItemIndex ASCENDING.

        IF lt_item_result IS NOT INITIAL.
          DATA(parentUUID) = lt_item_result[ 1 ]-ParentUUID.
        ENDIF.

        DATA : asim0090s TYPE TABLE FOR UPDATE     yi_asim0090n,
               asim0090  TYPE STRUCTURE FOR UPDATE yi_asim0090n.
        DATA : asim0100s TYPE TABLE FOR UPDATE     yi_asim0100n,
               asim0100  TYPE STRUCTURE FOR UPDATE yi_asim0100n,
               itemNo    TYPE i VALUE 1.

        "CBO Read - Item 해당 Table
        SELECT MAX( Zeile ) FROM yi_asim0100n WHERE ParentUUID = @parentUUID INTO @DATA(lv_max_zeile).

        "Item 값 설정
        LOOP AT lt_item_result INTO DATA(ls_item_result).
          asim0100 = CORRESPONDING #( ls_item_result ).

          IF asim0100-Zeile IS INITIAL.
            asim0100-Zeile = lv_max_zeile + 10.
            ls_item_result-Zeile = itemNo.
          ENDIF.

          MODIFY lt_item_result FROM ls_item_result TRANSPORTING Zeile WHERE Uuid = ls_item_result-Uuid.

          APPEND asim0100 TO asim0100s.
          CLEAR : asim0100.
          itemNo += 1.
        ENDLOOP.

      CATCH cx_root INTO DATA(result).
        EXIT.
    ENDTRY.

    "Supplier Invoice API 호출
    DATA(key) = keys[ 1 ].

    "통신 규약 존재 확인
    CREATE OBJECT me->http_client
      EXPORTING
        i_scenario     = c_scenario
        i_service      = c_service
      EXCEPTIONS
        no_arrangement = 1.

    CHECK sy-subrc <> 1.

    "Item의 Header UUID 기준으로 Header Read
    READ ENTITIES OF yi_asim0090n
    ENTITY yi_asim0090n
    ALL FIELDS
        WITH VALUE #( ( Uuid = parentUUID ) )
    RESULT DATA(lt_result_header)
    FAILED    DATA(lt_failed_header)
    REPORTED  DATA(lt_reported_header).

    "Item Json
    DATA : matdocitem_json TYPE string.

    "날짜 Type을 YYYY-MM-DD로 바꿔야 해서 가공
    DATA(gr_header) = lt_result_header[ 1 ].

    LOOP AT lt_item_result INTO DATA(ls_result).

        DATA(ShelfLifeExpDate) = ls_result-Vfdat+0(4) && '-' && ls_result-Vfdat+4(2) && '-' && ls_result-Vfdat+6(2) && 'T00:00:00'.
        DATA(ManufactureDate) = ls_result-Hsdat+0(4) && '-' && ls_result-Hsdat+4(2) && '-' && ls_result-Hsdat+6(2) && 'T00:00:00'.

        IF ( matdocitem_json <> '' ).
            matdocitem_json = matdocitem_json && ',{'.
        ENDIF.

        matdocitem_json = matdocitem_json && '"Material":"' && ls_result-Matnr && '",' &&
                                             '"Plant":"' && ls_result-Werks && '",' &&
                                             '"StorageLocation":"' && ls_result-Lgort && '",' &&
                                             '"Batch":"' && ls_result-Charg && '",' &&
                                             '"GoodsMovementType":"' && '101' && '",' &&
                                             '"Supplier":"' && gr_header-Lifnr && '",' &&
                                             '"PurchaseOrder":"' && ls_result-Ebeln && '",' &&
                                             '"PurchaseOrderItem":"' && ls_result-Ebelp && '",' &&
                                             '"GoodsMovementRefDocType":"' && 'B' && '",' &&
                                             '"EntryUnit":"' && ls_result-Grmns && '",' &&
                                             '"QuantityInEntryUnit":"' && ls_result-Grmng && '",' &&
                                             '"ShelfLifeExpirationDate":"' && ShelfLifeExpDate && '",' &&
                                             '"ManufactureDate":"' && ManufactureDate && '"' &&
                                             '}'.
    ENDLOOP.

    DATA(DocumentDate) = gr_header-BudatGr+0(4) && '-' && gr_header-BudatGr+4(2) && '-' && gr_header-BudatGr+6(2) && 'T00:00:00'.

    " post할 데이터 가공
    DATA(json) =
        '{' &&
        ' "DocumentDate":"' && DocumentDate && '",' &&
        ' "PostingDate":"' && DocumentDate && '",' &&
        ' "MaterialDocumentHeaderText":"' && gr_header-bktxt && '",' &&
        ' "ReferenceDocument":"' && gr_header-reqmu && '",' &&
        ' "GoodsMovementCode":"' && '01' && '",' &&
        ' "to_MaterialDocumentItem":{' &&
        '  "results":[{' &&
        '  ' && matdocitem_json &&
        '  ]' &&
        ' }' &&
        '}'.

    "GET TOKEN
    DATA(token) = me->http_client->get_token_cookies( ).

    "POST
    IF token IS NOT INITIAL.
        me->http_client->post(
            EXPORTING
                json = json
            IMPORTING
                body   = DATA(body)
                status = DATA(status)
        ).
    ENDIF.

    "호출 후 결과 값 확인
    DATA result_msg    TYPE string.
    DATA order_id      TYPE string.
    DATA fiscal_year   TYPE string.
    DATA result_status TYPE string.

    result_status = status.
    result_msg    = body.

    IF ( result_msg CS ',"value":"' ).
      result_msg = substring_before( val = substring_after( val = body
                                                            sub = ',"value":"' )
                                     sub = '"' ).
    ENDIF.

    IF ( result_msg CS '"MaterialDocument":' ).
      "PurchaseOrder"뒤에 오는 문자열 조회
      order_id   = substring_before( val = substring_after( val = body
                                                            sub = '"MaterialDocument":' )
                                     sub = ',"' ).

      fiscal_year = substring_before( val = substring_after( val = body
                                                             sub = '"MaterialDocumentYear":' )
                                      sub = ',"' ).

      "찾은 order id에서 " -> 공백으로 replace, occ = 전체 변경
      order_id   = replace( val  = order_id
                            sub  = '"'
                            with = ''
                            occ  = 0 ).

      fiscal_year   = replace( val  = fiscal_year
                            sub  = '"'
                            with = ''
                            occ  = 0 ).

      result_msg = ''.

      "공급업체송장 번호 + 회계연도 = 51056001222023
      DATA(orgDocID) = order_id && fiscal_year.

      "분개 타입이 공급업체 송장이고, 회사코드, 참조문서(공급업체송장)을 기준으로 분개 문서 ID가져옴.
      SELECT AccountingDocument FROM I_JournalEntry WHERE CompanyCode = @gr_header-Bukrs AND OriginalReferenceDocument = @orgDocId AND ReferenceDocumentType = 'MKPF' INTO @DATA(lv_posting). ENDSELECT.

    ENDIF.

    CLEAR : asim0090, asim0090s.

    "Header 값 설정 : Item 게산 한 값으로 Header의 총 금액 업데이트
    LOOP AT lt_result_header INTO DATA(ls_header).
      asim0090 = CORRESPONDING #( ls_header ).
      asim0090-Mblnr = order_id.
      asim0090-Mjahr = fiscal_year.

      IF lv_posting IS NOT INITIAL.
        asim0090-BelnrGr = lv_posting.
        asim0090-GjahrGr = fiscal_year.
      ENDIF.

      IF order_id IS INITIAL.
        asim0090-ReturnMsg = result_msg.
        asim0090-Loekz = 'X'.
      ENDIF.

      APPEND asim0090 TO asim0090s.
      CLEAR : asim0090.
    ENDLOOP.

    CLEAR : ls_item_result, asim0100, asim0100s.
    LOOP AT lt_item_result INTO ls_item_result.
      asim0100 = CORRESPONDING #( ls_item_result ).

      asim0100-Mblnr = order_id.
      asim0100-Mjahr = fiscal_year.

      IF order_id IS INITIAL.
        asim0100-loekz = 'X'.
        lhc_YI_ASIM0100N=>return_msg = result_msg.
      ENDIF.

      APPEND asim0100 TO asim0100s.
      CLEAR : asim0100.
    ENDLOOP.

    "호출 성공 시, 결과 값 CBO에 저장
    MODIFY ENTITIES OF yi_asim0090n
    ENTITY yi_asim0090n UPDATE SET FIELDS WITH asim0090s
    MAPPED   DATA(ls_mapped_modify_update)
    FAILED   DATA(lt_failed_modify_update)
    REPORTED DATA(lt_reported_modify_update).

    MODIFY ENTITIES OF yi_asim0100n
    ENTITY yi_asim0100n UPDATE SET FIELDS WITH asim0100s
    MAPPED   DATA(ls_item_mapped_modify2)
    FAILED   DATA(lt_item_failed_modify2)
    REPORTED DATA(lt_item_reported_modify2).

  ENDMETHOD.

  METHOD api_error.

    READ ENTITIES OF yi_asim0100n IN LOCAL MODE
        ENTITY yi_asim0100n
        ALL FIELDS
            WITH CORRESPONDING #( keys )
        RESULT DATA(lt_item_result)
        FAILED    DATA(lt_item_failed)
        REPORTED  DATA(lt_item_reported).
*
*    SORT lt_item_result BY ItemIndex ASCENDING.
*
*    IF lt_item_result IS NOT INITIAL.
*      DATA(parentUUID) = lt_item_result[ 1 ]-ParentUUID.
*    ENDIF.

    IF lhc_YI_ASIM0100N=>return_msg IS NOT INITIAL.
      LOOP AT lt_item_result INTO DATA(ls_result).

        APPEND VALUE #( %tky = ls_result-%tky ) TO failed-yi_asim0100n.
        APPEND VALUE #( %tky = ls_result-%tky %state_area = 'api_error' %msg = new_message( id = 'YASIM_MSG' number = 001 severity = if_abap_behv_message=>severity-error v1 = return_msg ) ) TO reported-yi_asim0100n.

      ENDLOOP.
    ENDIF.

  ENDMETHOD.

ENDCLASS.

CLASS lhc_YI_ASIM0130N DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PUBLIC SECTION.
    CLASS-DATA: return_msg TYPE string,
                param_uuid TYPE sysuuid_x16.

  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR yi_asim0130n RESULT result.

    METHODS create_number FOR DETERMINE ON SAVE
      IMPORTING keys FOR yi_asim0130n~create_number.

    METHODS post_action FOR MODIFY
      IMPORTING keys FOR ACTION yi_asim0130n~post_action RESULT result.

    METHODS api_error FOR VALIDATE ON SAVE
      IMPORTING keys FOR yi_asim0130n~api_error.

    TYPES:
      "스탠다드 API Response Information
      BEGIN OF post_result,
        post_body   TYPE string,
        post_status TYPE string,
      END OF post_result.

    "API 통신을 위해 생성한 함수
    METHODS:
      get_connection
        IMPORTING url           TYPE string
        RETURNING VALUE(result) TYPE REF TO if_web_http_client
        RAISING   cx_static_check.

    "상수
    CONSTANTS:
      content_type TYPE string VALUE 'Content-type',
      json_content TYPE string VALUE 'application/json; charset=UTF-8'.

ENDCLASS.

CLASS lhc_YI_ASIM0130N IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  "HTTP 통신을 위한 셋팅
  METHOD get_connection.
    DATA(dest) = cl_http_destination_provider=>create_by_url( url ).
    result = cl_web_http_client_manager=>create_by_http_destination( dest ).
  ENDMETHOD.

  METHOD create_number.
    "부대비-생성 기능 작동 시 구현 예정.
    "연도를 참고할 필드가 있는지? 아니면 그냥 오늘 날짜의 연도를 넣으면 되는지 확인 필요.

    DATA : asim0130s TYPE TABLE FOR UPDATE yi_asim0130n,
           asim0130  TYPE STRUCTURE FOR UPDATE yi_asim0130n.

    TRY.
        "CBO Read
        READ ENTITIES OF yi_asim0130n IN LOCAL MODE
        ENTITY yi_asim0130n
        ALL FIELDS
            WITH CORRESPONDING #( keys )
        RESULT DATA(lt_result)
        FAILED    DATA(lt_failed)
        REPORTED  DATA(lt_reported).

        IF lt_result[ 1 ]-feeno IS INITIAL.
          "number range 가져오기
          cl_numberrange_runtime=>number_get(
            EXPORTING
              nr_range_nr       = '06'
              object            = 'ZNR_10_NO'
              quantity          = 1
            IMPORTING
              number            = DATA(number_range_key)
              returncode        = DATA(number_range_return_code)
              returned_quantity = DATA(number_range_returned_quantity)
          ).

*            "필드 값 수정
          CLEAR: asim0130, asim0130s.
          LOOP AT lt_result INTO DATA(ls_result).
            asim0130 = CORRESPONDING #( ls_result ).

            "부대비 번호
            DATA(year) = asim0130-BudatFees(4).
            IF year IS INITIAL.
              year = sy-datum(4).
            ENDIF.
            asim0130-feeno = substring( val = number_range_key off = 10 len = 10 ).
            asim0130-feeyr = year.

            APPEND asim0130 TO asim0130s.
            CLEAR : asim0130.
          ENDLOOP.

          "CBO Update
          MODIFY ENTITIES OF yi_asim0130n IN LOCAL MODE
          ENTITY yi_asim0130n UPDATE SET FIELDS WITH asim0130s
          MAPPED   DATA(ls_mapped_modify)
          FAILED   DATA(lt_failed_modify)
          REPORTED DATA(lt_reported_modify).
        ENDIF.

      CATCH cx_number_ranges INTO DATA(lx_number_ranges).
        EXIT.
    ENDTRY.

  ENDMETHOD.

  METHOD post_action.

    "Supplier Invoice API 호출
    DATA(key) = keys[ 1 ].
    lhc_YI_ASIM0130N=>param_uuid = key-%param-uuid.
    TRY.
        READ ENTITIES OF yi_asim0130n IN LOCAL MODE
        ENTITY yi_asim0130n
        ALL FIELDS
            WITH VALUE #( ( Uuid = lhc_YI_ASIM0130N=>param_uuid ) )
        RESULT DATA(lt_result)
        FAILED    DATA(lt_failed)
        REPORTED  DATA(lt_reported).

      CATCH cx_root INTO DATA(result1).
        EXIT.
    ENDTRY.

    "시나리오 이름으로 통신이 존재하는지 확인
    DATA: lr_cscn TYPE if_com_scenario_factory=>ty_query-cscn_id_range.
    lr_cscn = VALUE #( ( sign = 'I' option = 'EQ' low = 'ZCS_SINV_001' ) ).

    DATA(lo_factory) = cl_com_arrangement_factory=>create_instance( ).
    lo_factory->query_ca(
          EXPORTING
            is_query           = VALUE #( cscn_id_range = lr_cscn )
          IMPORTING
            et_com_arrangement = DATA(lt_ca)
        ).

    "해당 시나리오가 존재 하지 않으면 종료
    IF lt_ca IS INITIAL.
      EXIT.
    ENDIF.

    "조회 한 값 중 1번째 값
    DATA(lo_ca) = lt_ca[ 1 ].

    IF lt_result IS NOT INITIAL.
      SELECT * FROM yi_asim0140n
        FOR ALL ENTRIES IN @lt_result
        WHERE ParentUUID = @lt_result-uuid
        INTO TABLE @DATA(lt_item_result).
    ENDIF.

    SORT lt_item_result BY Feeno Feeyr Feenp.

    SELECT * FROM yi_asim0001n
      WHERE Zcode LIKE '%POSTNO'
      INTO TABLE @DATA(lt_zcdno).

    SORT lt_zcdno BY Zcdno.

    DATA: lv_chk1, lv_chk2.

    "이미 전기된 문서는 제외처리.
    CLEAR: lv_chk1, lv_chk2.
    LOOP AT lt_result INTO DATA(ls_result).
      IF ls_result-Zvalu4 = 'S'.
        IF ls_result-Belnr IS NOT INITIAL AND ls_result-BelnrAp IS NOT INITIAL.
          ls_result-Mesg = 'X'.
          MODIFY lt_result FROM ls_result TRANSPORTING mesg WHERE uuid = ls_result-uuid.
          CONTINUE.
        ENDIF.
      ELSE.
        IF ls_result-belnr IS NOT INITIAL.
          ls_result-Mesg = 'X'.
          MODIFY lt_result FROM ls_result TRANSPORTING mesg WHERE uuid = ls_result-uuid.
          CONTINUE.
        ENDIF.
      ENDIF.

      LOOP AT lt_item_result INTO DATA(ls_item_result) WHERE ParentUUID = ls_result-uuid.
        SELECT SUM(  a~QuantityInPurchaseOrderUnit )
          FROM I_SuplrInvcItemPurOrdRefAPI01 AS a
          JOIN I_SupplierInvoiceAPI01 AS b ON a~SupplierInvoice = b~SupplierInvoice
                                          AND a~FiscalYear = b~FiscalYear
          WHERE a~PurchaseOrder = @ls_item_result-Ebeln
          AND a~PurchaseOrderItem = @ls_item_result-Ebelp
          AND b~ReverseDocument IS NULL
          AND b~AccountingDocumentType = 'RE'
          AND a~IsSubsequentDebitCredit IS NULL
          INTO @DATA(iv_menge).

        SELECT SINGLE OrderQuantity FROM I_PurchaseOrderItemAPI01
          WHERE PurchaseOrder = @ls_item_result-Ebeln
          AND PurchaseOrderItem = @ls_item_result-Ebelp
          INTO @DATA(po_menge).

        IF iv_menge > 0.
          IF iv_menge = po_menge.
            ls_item_result-chk = 'B'.
            lv_chk2 = 'X'.
          ELSEIF iv_menge < po_menge.
            ls_item_result-chk = 'A'.
            lv_chk1 = 'X'.
          ELSEIF iv_menge > po_menge.
            ls_item_result-chk = 'B'.
            lv_chk2 = 'X'.
          ENDIF.
        ELSE.
          ls_item_result-chk = 'A'.
          lv_chk1 = 'X'.
        ENDIF.

        MODIFY LT_item_RESULT FROM LS_item_RESULT TRANSPORTING chk WHERE uuid = ls_item_result-uuid.
      ENDLOOP.

      IF lv_chk1 = 'X' AND lv_chk2 = 'X'.
        ls_result-Mesg = '하나의 문서에 송장과 차후차변을 함께 전기할 수 없습니다.'.
        MODIFY lt_result FROM ls_result TRANSPORTING mesg WHERE uuid = ls_result-uuid.
      ENDIF.

    ENDLOOP.

    DELETE lt_result WHERE Mesg = 'X'.

    DATA : asim0130s TYPE TABLE FOR UPDATE     yi_asim0130n,
           asim0130  TYPE STRUCTURE FOR UPDATE yi_asim0130n.

    "lv_sub: 차후차대변지시자.
    "lv_cd: 송장,대변메모지시자.
    DATA: lv_sub, lv_cd.
    DATA : lv_zvalu1 TYPE string.

    "Item Json
    DATA : net_json TYPE string.
    DATA : selected_po_json TYPE string.
    DATA : supitem_json TYPE string.
    DATA : acct_json TYPE string.
    DATA : tax_json TYPE string.
    DATA : result_msg    TYPE string.
    DATA : order_id      TYPE string.
    DATA : fiscal_year   TYPE string.
    DATA : result_status TYPE string.

    DATA : Wmwst1Fees TYPE i.
    DATA : IvamtFees TYPE i.

    CLEAR: asim0130, asim0130s.
    LOOP AT lt_zcdno INTO DATA(ls_zcdno).
      LOOP AT lt_result INTO ls_result WHERE zvalu1 = ls_zcdno-zvalu1
                                       AND zvalu2 = ls_zcdno-zvalu2
                                       AND zvalu3 = ls_zcdno-zvalu3
                                       AND zvalu4 = ls_zcdno-zvalu4
                                       AND zvalu6 = ls_zcdno-zvalu6
                                       AND zvalu7 = ls_zcdno-zvalu7.

        SELECT Zvalu2 FROM yi_asim0001n WHERE Zcode LIKE '%BUPLA' AND Zvalu1 = @ls_result-Bukrs INTO @DATA(place). ENDSELECT.
        SELECT Zvalu2 FROM yi_asim0001n WHERE Zcode LIKE '%GSBER' AND Zvalu1 = @ls_result-Bukrs INTO @DATA(area).  ENDSELECT.
        SELECT Zvalu3 FROM yi_asim0001n WHERE Zcode LIKE '%CURR' AND Zvalu1 = @ls_result-WaersFees INTO @DATA(currm). ENDSELECT.

        IF currm <> 0 AND currm IS NOT INITIAL AND ls_result-WaersFees <> 'KRW'.
          ls_result-kursf = ls_result-kursf / currm.
        ENDIF.

        IF ls_zcdno-zvalu5 ='RE'. "송장전표 생성
          IF ls_result-zvalu3 = 'H'.
            IF ls_result-Zvalu1 = 'PBXX'.
              lv_sub = 'X'. "차후차변.
              lv_cd = ''.
              lv_zvalu1 = ''.
            ELSE.
              lv_zvalu1 = ls_result-Zvalu1.
              READ TABLE lt_item_result INTO ls_item_result WITH KEY ParentUUID = ls_result-uuid.
              IF ls_item_result-chk = 'A'.
                lv_sub = ''. "송장
                lv_cd = ''.
              ELSE.
                lv_sub = 'X'. "차후차변.
                lv_cd = ''.
              ENDIF.
            ENDIF.
          ENDIF.

          DATA(postdate) = ls_result-BudatFees+0(4) && '-' && ls_result-BudatFees+4(2) && '-' && ls_result-BudatFees+6(2) && 'T00:00:00'.
          DATA(basedate) = ls_result-Zfbdt+0(4) && '-' && ls_result-Zfbdt+4(2) && '-' && ls_result-Zfbdt+6(2) && 'T00:00:00'.
          DATA(taxdate) = ls_result-BudatFees+0(4) && '-' && ls_result-BudatFees+4(2) && '-' && ls_result-BudatFees+6(2) && 'T00:00:00'.

          "통화가 KRW, JPY인 경우 * 100.
          IF ls_result-WaersFees EQ 'KRW' OR ls_result-WaersFees EQ 'JPY'.
            Wmwst1Fees = ls_result-Wmwst1Fees * 100.
            IvamtFees = ls_result-IvamtFees * 100.
          ENDIF.

          LOOP AT lt_item_result INTO ls_item_result WHERE ParentUUID = ls_result-uuid.
            "송장 생성.
            IF ( supitem_json <> '' ).
              supitem_json = supitem_json && ',{'.
            ENDIF.

            supitem_json = supitem_json && '"SupplierInvoiceItem":"' && ls_item_result-Feenp && '",' &&
                                           '"PurchaseOrder":"' && ls_item_result-Ebeln && '",' &&
                                           '"PurchaseOrderItem":"' && ls_item_result-ebelp && '",' &&
                                           '"Plant":"' && ls_item_result-werks && '",' &&
                                           '"IsSubsequentDebitCredit":"' && lv_sub && '",' &&
                                           '"TaxCode":"' && ls_result-mwskz && '",' &&
                                           '"DocumentCurrency":"' && ls_result-WaersFees && '",' &&
                                           '"SupplierInvoiceItemAmount":"' && ls_item_result-NetwrFees && '",' &&
                                           '"PurchaseOrderQuantityUnit":"' && ls_item_result-MeinsFees && '",' &&
                                           '"QuantityInPurchaseOrderUnit":"' && ls_item_result-MengeFees && '",' &&
                                           '"PurchaseOrderPriceUnit":"' && ls_item_result-MeinsFees && '",' &&
                                           '"QtyInPurchaseOrderPriceUnit":"' && ls_item_result-MengeFees && '",' &&
                                           '"TaxDeterminationDate":"' && taxdate && '",' &&
                                           '"SuplrInvcDeliveryCostCndnType":"' && lv_zvalu1 && '"' &&
                                           '}'.
          ENDLOOP.

          IF ( tax_json EQ '' ).
            tax_json = tax_json && '"TaxCode":"' && ls_result-mwskz && '",' &&
                                   '"DocumentCurrency":"' && ls_result-WaersFees && '",' &&
                                   '"TaxAmount":"' && Wmwst1Fees && '",' &&
                                   '"TaxDeterminationDate":"' && taxdate && '"' &&
                                   '}'.
          ENDIF.

          "netPaymentDays가 0일때와 0초과일때로 나눠서 처리.
          IF ls_result-zbd1t EQ '0'.
            net_json = net_json && ' "NetPaymentDays":"' && ls_result-zbd1t && '",' &&
                                   ' "PaymentTerms":"' && ls_result-ZtermFees && '",'.
          ELSE.
            net_json = net_json && ' "CashDiscount1Days":"' && ls_result-zbd1t && '",' &&
                                   ' "PaymentTerms":"' && '' && '",'.
          ENDIF.

          DATA(json) =
           '{' &&
           ' "CompanyCode":"' && ls_result-Bukrs && '",' &&
           ' "DocumentDate":"' && postdate && '",' &&
           ' "PostingDate":"' && postdate && '",' &&
           ' "TaxDeterminationDate":"' && taxdate && '",' &&
           ' "SupplierInvoiceIDByInvcgParty":"' && ls_result-Reqmu && '",' &&
           ' "InvoicingParty":"' && ls_result-LifreFees && '",' &&
           ' "DocumentCurrency":"' && ls_result-WaersFees && '",' &&
           ' "InvoiceGrossAmount":"' && IvamtFees && '",' &&
           ' "DocumentHeaderText":"' && ls_result-bktxt && '",'.
          json = json && net_json &&
              ' "DueCalculationBaseDate":"' && basedate && '",' &&
              ' "PaymentBlockingReason": "A",' &&
              ' "AccountingDocumentType": "RE",' &&
              ' "DirectQuotedExchangeRate":"' && ls_result-kursf && '",' &&
              ' "PaymentMethod":"' && ls_result-zlsch && '",' &&
              ' "AssignmentReference":"' && ls_result-bleno && '",' &&
              ' "SupplierPostingLineItemText":"' && ls_result-Zcdnot && '",' &&
              ' "TaxIsCalculatedAutomatically": false,' &&
              ' "BusinessPlace":"' && place && '",' &&
              ' "BusinessArea":"' && area && '",' &&
              ' "SupplierInvoiceIsCreditMemo":"' && lv_cd && '",' &&
              ' "to_SuplrInvcItemPurOrdRef":{' &&
              '  "results":[{' &&
              '  ' && supitem_json &&
              '  ]' &&
              ' }'.

          IF tax_json IS NOT INITIAL.
            json = json && ' ,"to_SupplierInvoiceTax":{' &&
                           '  "results":[{' &&
                           '  ' && tax_json &&
                           '  ]' &&
                           ' }'.
          ENDIF.

          json = json && '}'.

          "GET
          TRY.
              DATA(lo_dest) = cl_http_destination_provider=>create_by_comm_arrangement(
                  comm_scenario  = 'ZCS_SINV_001'
                  service_id     = 'ZSTD_SINV_001_REST'
                  comm_system_id = lo_ca->get_comm_system_id( ) ).
              DATA(lo_http_client) = cl_web_http_client_manager=>create_by_http_destination( lo_dest ).

              DATA(lo_request) = lo_http_client->get_http_request( ).
              lo_request->set_uri_path( EXPORTING i_uri_path = '?$top=1' ).
              lo_request->set_header_field( i_name = 'x-csrf-token' i_value = 'fetch' ).
              DATA(lo_response) = lo_http_client->execute( if_web_http_client=>get ).

              "get 해서, token이랑 cookie값 가져오기
              DATA(token)   = lo_response->get_header_field( i_name = 'x-csrf-token' ).
              DATA(cookies) = lo_response->get_cookies( ).

            CATCH cx_http_dest_provider_error.
              " handle exception here

            CATCH cx_web_http_client_error.
              " handle exception here
          ENDTRY.

          "POST
          TRY.
              lo_dest = cl_http_destination_provider=>create_by_comm_arrangement(
                  comm_scenario  = 'ZCS_SINV_001'
                  service_id     = 'ZSTD_SINV_001_REST'
                  comm_system_id = lo_ca->get_comm_system_id( ) ).
              lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_dest ).
              lo_request  = lo_http_client->get_http_request( ).

              "json body 설정
              lo_request->set_text( json ).
              "GET에서 가져왔던 cookie, token값 셋팅
              LOOP AT cookies INTO DATA(cookie).
                lo_request->set_cookie( i_name = cookie-name i_value = cookie-value ).
              ENDLOOP.

              lo_request->set_header_field( i_name = content_type i_value = json_content ).
              lo_request->set_header_field( i_name = 'Accept' i_value = 'application/json' ).
              lo_request->set_header_field( i_name = 'x-csrf-token' i_value = token ).
              lo_response = lo_http_client->execute( if_web_http_client=>post ).

              DATA(body)   = lo_response->get_text( ).
              DATA(status) = lo_response->get_status( )-code.

            CATCH cx_http_dest_provider_error.
              " handle exception here

            CATCH cx_web_http_client_error.
              " handle exception here
          ENDTRY.

          "호출 후 결과 값 확인
          result_status = status.
          result_msg    = body.

          " en,value를 포함한 문자열 일때만 parsing
          IF ( result_msg CS ',"value":"' ).
            result_msg = substring_before( val = substring_after( val = body
                                                                  sub = '"value":"' )
                                           sub = '"' ).
          ENDIF.

          ""PurchaseOrder": 를 포함한 문자열 일때만 parsing
          IF ( result_msg CS '"SupplierInvoice":' ).
            "PurchaseOrder"뒤에 오는 문자열 조회
            order_id   = substring_before( val = substring_after( val = body
                                                                  sub = '"SupplierInvoice":' )
                                           sub = ',"' ).

            fiscal_year = substring_before( val = substring_after( val = body
                                                                   sub = '"FiscalYear":' )
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
            SELECT AccountingDocument FROM I_JournalEntry WHERE CompanyCode = @ls_result-Bukrs AND OriginalReferenceDocument = @orgDocId AND ReferenceDocumentType = 'RMRP' INTO @DATA(lv_posting). ENDSELECT.
          ENDIF.
          ls_result-Belnr = order_id.
          ls_result-Gjahr = fiscal_year.
          ls_result-BelnrFi = lv_posting.
          ls_result-Mesg = result_msg.
          lhc_YI_ASIM0130N=>return_msg = result_msg.

        ELSE. "회계전표 생성.

        ENDIF.

        asim0130 = CORRESPONDING #( ls_result ).

        APPEND asim0130 TO asim0130s.
        CLEAR asim0130.

        CLEAR: lv_sub, lv_cd, lv_zvalu1, net_json, selected_po_json, supitem_json, acct_json, tax_json, result_msg, order_id, fiscal_year, result_status.
      ENDLOOP.
    ENDLOOP.

    "호출 성공 시, 결과 값 CBO에 저장
    MODIFY ENTITIES OF yi_asim0130n
    ENTITY yi_asim0130n UPDATE SET FIELDS WITH asim0130s
    MAPPED   DATA(ls_mapped_modify_update)
    FAILED   DATA(lt_failed_modify_update)
    REPORTED DATA(lt_reported_modify_update).

    READ ENTITIES OF yi_asim0130n IN LOCAL MODE
    ENTITY yi_asim0130n
    ALL FIELDS
        WITH VALUE #( ( Uuid = lhc_YI_ASIM0130N=>param_uuid ) )
    RESULT DATA(lt_msg)
    FAILED    DATA(lt_msg_failed)
    REPORTED  DATA(lt_msg_reported).

    IF lhc_YI_ASIM0130N=>return_msg IS NOT INITIAL.
      LOOP AT lt_result INTO DATA(ls_msg_result).

        APPEND VALUE #( %tky = ls_msg_result-%tky ) TO failed-yi_asim0130n.
        APPEND VALUE #( %tky = ls_msg_result-%tky %msg = new_message( id = 'YASIM_MSG' number = 001 severity = if_abap_behv_message=>severity-error v1 = return_msg ) ) TO reported-yi_asim0130n.

      ENDLOOP.
    ENDIF.

  ENDMETHOD.

  METHOD api_error.

*    READ ENTITIES OF yi_asim0130n IN LOCAL MODE
*    ENTITY yi_asim0130n
*    ALL FIELDS
*        WITH VALUE #( ( Uuid = lhc_YI_ASIM0130N=>param_uuid ) )
*    RESULT DATA(lt_result)
*    FAILED    DATA(lt_failed)
*    REPORTED  DATA(lt_reported).
*
*    IF lhc_YI_ASIM0130N=>return_msg IS NOT INITIAL.
*      LOOP AT lt_result INTO DATA(ls_result).
*
*        APPEND VALUE #( %tky = ls_result-%tky ) TO failed-yi_asim0130n.
*        APPEND VALUE #( %tky = ls_result-%tky %msg = new_message( id = 'YASIM_MSG' number = 001 severity = if_abap_behv_message=>severity-error v1 = return_msg ) ) TO reported-yi_asim0130n.
*
*      ENDLOOP.
*    ENDIF.

*    DATA lr_busi_exception TYPE REF TO /iwbep/cx_mgw_busi_exception.
*    DATA lr_mcontainer TYPE REF TO /iwbep/if_message_container.
*
*    DATA lv_message_text TYPE bapi_msg.
*    DATA lv_message_attr1 TYPE symsgv.
*    DATA lv_message_attr2 TYPE symsgv.
*    DATA lv_message_attr3 TYPE symsgv.
*    DATA lv_message_attr4 TYPE symsgv.
*
*    CREATE OBJECT lr_busi_exception.
*    CALL METHOD lr_busi_exception->get_msg_container
*      RECEIVING
*        ro_message_container = lr_mcontainer.
*
*    lv_message_text = 'Error'.
*    lv_message_attr1 = ''.
*    lv_message_attr2 = ''.
*    lv_message_attr3 = ''.
*    lv_message_attr4 = ''.
*
*    lr_mcontainer->add_message(
*      EXPORTING
*        iv_msg_type   = 'E'
*        iv_msg_id     = 'MY_CUSTOM_CODE'
*        iv_msg_number = 001
*        iv_msg_text   = lv_message_text
*        iv_msg_v1     = lv_message_attr1
*        iv_msg_v2     = lv_message_attr2
*        iv_msg_v3     = lv_message_attr3
*        iv_msg_v4     = lv_message_attr4
*    ).
*
*    RAISE EXCEPTION TYPE /iwbep/cx_gateway
*      EXPORTING
*        message_container = lr_mcontainer.

  ENDMETHOD.
ENDCLASS.

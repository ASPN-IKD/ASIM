CLASS lhc_YI_ASIM0060N DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PUBLIC SECTION.
    CLASS-DATA: return_msg TYPE string.

  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR yi_asim0060n RESULT result.

    METHODS calc_value FOR DETERMINE ON SAVE
      IMPORTING keys FOR yi_asim0060n~calc_value.

    METHODS api_error FOR VALIDATE ON SAVE
      IMPORTING keys FOR yi_asim0060n~api_error.

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
*
*        CREATE_INV
*            IMPORTING params TYPE sysuuid_x16
*            RETURNING VALUE(result)   TYPE post_result
*            RAISING   cx_static_check.

    "상수
    CONSTANTS:
      content_type TYPE string VALUE 'Content-type',
      json_content TYPE string VALUE 'application/json; charset=UTF-8'.

ENDCLASS.

CLASS lhc_YI_ASIM0060N IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  "HTTP 통신을 위한 셋팅
  METHOD get_connection.
    DATA(dest) = cl_http_destination_provider=>create_by_url( url ).
    result = cl_web_http_client_manager=>create_by_http_destination( dest ).
  ENDMETHOD.

  METHOD calc_value.

    "Sequence 기준으로 Item No 생성
    TRY.
        READ ENTITIES OF yi_asim0060n IN LOCAL MODE
        ENTITY yi_asim0060n
        ALL FIELDS
            WITH CORRESPONDING #( keys )
        RESULT DATA(lt_item_result)
        FAILED    DATA(lt_item_failed)
        REPORTED  DATA(lt_item_reported).

        SORT lt_item_result BY ItemIndex ASCENDING.

        IF lt_item_result IS NOT INITIAL.
          DATA(parentUUID) = lt_item_result[ 1 ]-ParentUUID.
        ENDIF.

        DATA : asim0060s TYPE TABLE FOR UPDATE     yi_asim0060n,
               asim0060  TYPE STRUCTURE FOR UPDATE yi_asim0060n,
               itemNo    TYPE i VALUE 1.

        "CBO Read - Item 해당 Table
        SELECT MAX( Buzei ) FROM yi_asim0060n WHERE ParentUUID = @parentUUID INTO @DATA(lv_max_buzei).

        "Item 값 설정
        LOOP AT lt_item_result INTO DATA(ls_item_result).
          asim0060 = CORRESPONDING #( ls_item_result ).

          IF asim0060-Buzei IS INITIAL.
            asim0060-Buzei = lv_max_buzei + 10.
            ls_item_result-Buzei = itemNo.
          ENDIF.

          MODIFY lt_item_result FROM ls_item_result TRANSPORTING Buzei WHERE Uuid = ls_item_result-Uuid.

          APPEND asim0060 TO asim0060s.
          CLEAR : asim0060.
          itemNo += 1.
        ENDLOOP.

      CATCH cx_root INTO DATA(result).
        EXIT.
    ENDTRY.

    "Supplier Invoice API 호출
    DATA(key) = keys[ 1 ].

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

    "Item의 Header UUID 기준으로 Header Read
    READ ENTITIES OF yi_asim0050n
    ENTITY yi_asim0050n
    ALL FIELDS
        WITH VALUE #( ( Uuid = parentUUID ) )
    RESULT DATA(lt_result_header)
    FAILED    DATA(lt_failed_header)
    REPORTED  DATA(lt_reported_header).

    "Item Json
    DATA : selected_po_json TYPE string.
    DATA : supitem_json TYPE string.
    DATA : acct_json TYPE string.
    DATA : tax_json TYPE string.

    "날짜 Type을 YYYY-MM-DD로 바꿔야 해서 가공
    DATA(iv_header) = lt_result_header[ 1 ].

    LOOP AT lt_item_result INTO DATA(ls_result).

      "구매오더가 있는 경우에만 적용
      IF ls_result-Ebeln IS NOT INITIAL.
        IF ( selected_po_json <> '' ).
          selected_po_json = selected_po_json && ',{'.
        ENDIF.

        selected_po_json = selected_po_json && '"PurchaseOrder":"' && ls_result-Ebeln && '",' &&
                                               '"PurchaseOrderItem":"' && ls_result-Ebelp && '"' &&
                                               '}'.
      ENDIF.
*        IF ( acct_json <> '' ).
*            acct_json = acct_json && ',{'.
*        ENDIF.
*        acct_json = acct_json && '"SupplierInvoiceItem":"' && sy-tabix && '",' &&
*                                 '"OrdinalNumber":"' && '1' && '",' &&
**                                 '"CostCenter":"' &&  && '",' &&
**                                 '"GLAccount":"' &&  && '",' &&
*                                 '"SuplrInvcAcctAssignmentAmount":"' && lt_result_header[ 1 ]-ivamt && '",' &&
*                                 '"PurchaseOrderQuantityUnit":"' && ls_result-MEINS && '",' &&
*                                 '"Quantity":"' && ls_result-IVMNG && '",' &&
*                                 '"TaxCode":"' && lt_result_header[ 1 ]-MWSKZ && '",' &&
*                                 '"AccountAssignmentNumber":"' && '1' && '"' &&
*
**                                 '"AccountAssignmentNumber":"' && '1' && '",' &&
**                                 '"MasterFixedAsset":"' && ls_result-ANLN1 && '"' &&
*                                 '}'.

      IF ( supitem_json <> '' ).
        supitem_json = supitem_json && ',{'.
      ENDIF.

      supitem_json = supitem_json && '"SupplierInvoiceItem":"' && ls_result-Buzei && '",' &&
                                     '"PurchaseOrder":"' && ls_result-Ebeln && '",' &&
                                     '"PurchaseOrderItem":"' && ls_result-ebelp && '",' &&
                                     '"Plant":"' && ls_result-werks && '",' &&
                                     '"IsSubsequentDebitCredit":"' && '' && '",' &&
                                     '"TaxCode":"' && iv_header-mwskz && '",' &&
                                     '"DocumentCurrency":"' && iv_header-ivwae && '",' &&
                                     '"SupplierInvoiceItemAmount":"' && ls_result-ivwra && '",' &&
                                     '"PurchaseOrderQuantityUnit":"' && ls_result-meins && '",' &&
                                     '"QuantityInPurchaseOrderUnit":"' && ls_result-ivmng && '"' &&
*                                       ' "to_SuplrInvcItemPurOrdRef":{' &&
*                                       '  "results":[{' &&
*                                       '  ' && acct_json &&
*                                       '  ]' &&
*                                       ' }' &&
                                     '}'.

      "세금 코드가 존재하는 경우에만 사용
      IF iv_header-mwskz IS NOT INITIAL.
        IF ( tax_json EQ '' ).

          tax_json = tax_json && '"TaxCode":"' && iv_header-mwskz && '",' &&
                                 '"DocumentCurrency":"' && iv_header-ivwae && '",' &&
                                 '"TaxAmount":"' && iv_header-wmwst1 && '"' &&
                                 '}'.
        ENDIF.
      ENDIF.

    ENDLOOP.

    DATA(DocumentYear)  = substring( val =  iv_header-BudatIv len = 4 ).
    DATA(DocumentMonth) = substring( val =  iv_header-BudatIv off = 4 len = 2 ).
    DATA(DocumentDay)   = substring( val =  iv_header-BudatIv off = 6 len = 2 ).

    DATA(BaseYear)  = substring( val =  iv_header-zfbdt len = 4 ).
    DATA(BaseMonth) = substring( val =  iv_header-zfbdt off = 4 len = 2 ).
    DATA(BaseDay)   = substring( val =  iv_header-zfbdt off = 6 len = 2 ).

    SELECT Zvalu2 FROM yi_asim0001n WHERE Zcode LIKE '%BUPLA' AND Zvalu1 = @iv_header-Bukrs INTO @DATA(place). ENDSELECT.
    SELECT Zvalu2 FROM yi_asim0001n WHERE Zcode LIKE '%GSBER' AND Zvalu1 = @iv_header-Bukrs INTO @DATA(area).  ENDSELECT.
    SELECT Zvalu3 FROM yi_asim0001n WHERE Zcode LIKE '%CURR' AND Zvalu1 = @iv_header-ivwae INTO @DATA(currm). ENDSELECT.

    IF currm <> 0.
     iv_header-kursf = iv_header-kursf / currm.
    endif.

    DATA : net_json TYPE string.

    "netPaymentDays가 0일때와 0초과일때로 나눠서 처리.
    IF iv_header-zbd1t EQ '0'.
      net_json = net_json && ' "NetPaymentDays":"' && iv_header-zbd1t && '",' &&
                             ' "PaymentTerms":"' && iv_header-iverm && '",'.
    ELSE.
      net_json = net_json && ' "CashDiscount1Days":"' && iv_header-zbd1t && '",' &&
                             ' "PaymentTerms":"' && '' && '",'.
    ENDIF.

    " post할 데이터 가공
    DATA(json) =
        '{' &&
        ' "CompanyCode":"' && iv_header-Bukrs && '",' &&
        ' "DocumentDate":"' && DocumentYear && '-' && DocumentMonth && '-' && DocumentDay && 'T00:00:00' && '",' &&
        ' "PostingDate":"' && DocumentYear && '-' && DocumentMonth && '-' && DocumentDay && 'T00:00:00' && '",' &&
        ' "TaxDeterminationDate":"' && DocumentYear && '-' && DocumentMonth && '-' && DocumentDay && 'T00:00:00' && '",' &&
        "' "TaxDeterminationDate":"' && DocumentYear && '-' && DocumentMonth && '-' && DocumentDay && '",' &&
        ' "SupplierInvoiceIDByInvcgParty":"' && iv_header-Reqmu && '",' &&
        ' "InvoicingParty":"' && iv_header-ivlif && '",' &&
        ' "DocumentCurrency":"' && iv_header-ivwae && '",' &&
        ' "InvoiceGrossAmount":"' && iv_header-ivamt && '",' &&
        ' "DocumentHeaderText":"' && iv_header-bktxt && '",'.
    json = json && net_json &&
        ' "DueCalculationBaseDate":"' && BaseYear && '-' && BaseMonth && '-' && BaseDay && 'T00:00:00' && '",' &&
        "' "NetPaymentDays":"' && iv_header-ZBD1T && '",' &&
        ' "PaymentBlockingReason": "A",' &&
        "' "AccountingDocumentType":" "RE",' &&
        ' "DirectQuotedExchangeRate":"' && iv_header-kursf && '",' &&
        ' "PaymentMethod":"' && iv_header-zlsch && '",' &&
        ' "AssignmentReference":"' && iv_header-bleno && '",' &&
        ' "SupplierPostingLineItemText":"' && iv_header-bleno && '(IV)' && '",' &&
        ' "TaxIsCalculatedAutomatically": false,' &&
        ' "BusinessPlace":"' && place && '",' &&
        ' "BusinessArea":"' && area && '",' &&
        ' "SupplierInvoiceIsCreditMemo":"' && '' && '",' &&
*         ' "to_SelectedPurchaseOrders":{' &&
*         '  "results":[{' &&
*         '  ' && selected_po_json &&
*         '  ]' &&
*         ' },' &&
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
    DATA result_msg    TYPE string.
    DATA order_id      TYPE string.
    DATA fiscal_year   TYPE string.
    DATA result_status TYPE string.

    result_status = status.
    result_msg    = body.

    " en,value를 포함한 문자열 일때만 parsing
    IF ( result_msg CS ',"value":"' ).
      result_msg = substring_before( val = substring_after( val = body
                                                            sub = ',"value":"' )
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
      SELECT AccountingDocument FROM I_JournalEntry WHERE CompanyCode = @iv_header-Bukrs AND OriginalReferenceDocument = @orgDocId AND ReferenceDocumentType = 'RMRP' INTO @DATA(lv_posting). ENDSELECT.

    ENDIF.

    DATA : asim0050s TYPE TABLE FOR UPDATE     yi_asim0050n,
           asim0050  TYPE STRUCTURE FOR UPDATE yi_asim0050n.

    CLEAR : asim0050, asim0050s.

    "Header 값 설정 : Item 게산 한 값으로 Header의 총 금액 업데이트
    LOOP AT lt_result_header INTO DATA(ls_header).
      asim0050 = CORRESPONDING #( ls_header ).
      asim0050-Belnr = order_id.
      asim0050-Gjahr = fiscal_year.

      IF lv_posting IS NOT INITIAL.
        asim0050-BelnrFi = lv_posting.
      ENDIF.

      IF order_id IS INITIAL.

        asim0050-ReturnMsg = result_msg.
        asim0050-Loekz = 'X'.
        lhc_YI_ASIM0060N=>return_msg = asim0050-ReturnMsg.
      ENDIF.

      APPEND asim0050 TO asim0050s.
      CLEAR : asim0050.
    ENDLOOP.

    CLEAR : ls_item_result, asim0060, asim0060s.
    LOOP AT lt_item_result INTO ls_item_result.
      asim0060 = CORRESPONDING #( ls_item_result ).

      asim0060-Belnr = order_id.
      asim0060-Gjahr = fiscal_year.

      IF lv_posting IS NOT INITIAL.
        asim0060-BelnrFi = lv_posting.
      ENDIF.

      IF order_id IS INITIAL.
        asim0060-loekz = 'X'.
      ENDIF.

      APPEND asim0060 TO asim0060s.
      CLEAR : asim0060.
    ENDLOOP.

    "호출 성공 시, 결과 값 CBO에 저장
    MODIFY ENTITIES OF yi_asim0050n
    ENTITY yi_asim0050n UPDATE SET FIELDS WITH asim0050s
    MAPPED   DATA(ls_mapped_modify_update)
    FAILED   DATA(lt_failed_modify_update)
    REPORTED DATA(lt_reported_modify_update).

    MODIFY ENTITIES OF yi_asim0060n
    ENTITY yi_asim0060n UPDATE SET FIELDS WITH asim0060s
    MAPPED   DATA(ls_item_mapped_modify2)
    FAILED   DATA(lt_item_failed_modify2)
    REPORTED DATA(lt_item_reported_modify2).
  ENDMETHOD.

  METHOD api_error.

    READ ENTITIES OF yi_asim0060n IN LOCAL MODE
        ENTITY yi_asim0060n
        ALL FIELDS
            WITH CORRESPONDING #( keys )
        RESULT DATA(lt_item_result)
        FAILED    DATA(lt_item_failed)
        REPORTED  DATA(lt_item_reported).

    SORT lt_item_result BY ItemIndex ASCENDING.

    IF lt_item_result IS NOT INITIAL.
      DATA(parentUUID) = lt_item_result[ 1 ]-ParentUUID.
    ENDIF.

    IF lhc_YI_ASIM0060N=>return_msg IS NOT INITIAL.
      LOOP AT lt_item_result INTO DATA(ls_result).

        APPEND VALUE #( %tky = ls_result-%tky ) TO failed-yi_asim0060n.
        APPEND VALUE #( %tky = ls_result-%tky %state_area = 'api_error' %msg = new_message( id = 'YASIM_MSG' number = 001 severity = if_abap_behv_message=>severity-error v1 = return_msg ) ) TO reported-yi_asim0060n.

      ENDLOOP.
    ENDIF.

  ENDMETHOD.

ENDCLASS.

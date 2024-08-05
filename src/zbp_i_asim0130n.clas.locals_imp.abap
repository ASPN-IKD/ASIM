CLASS lsc_yi_asim0130n DEFINITION INHERITING FROM cl_abap_behavior_saver.

  PROTECTED SECTION.

    METHODS save_modified REDEFINITION.

ENDCLASS.

CLASS lsc_yi_asim0130n IMPLEMENTATION.

  METHOD save_modified.

    DATA : lt_asim0130n TYPE STANDARD TABLE OF zasimt0130n.
    DATA : ys_asim0130n TYPE STRUCTURE FOR UPDATE yi_asim0130n.
    DATA : yt_asim0130n TYPE TABLE FOR UPDATE yi_asim0130n.
    DATA : lr_asim0130n_uuid TYPE RANGE OF yi_asim0130n-uuid.

*    "Implement Logic for all possible Save Operations - Create / Update / Delete
    IF create IS NOT INITIAL.
      lt_asim0130n = CORRESPONDING #( create-yi_asim0130n MAPPING FROM ENTITY ).

      INSERT zasimt0130n FROM TABLE @lt_asim0130n.
    ENDIF.


    IF update IS NOT INITIAL.
      lt_asim0130n = CORRESPONDING #( update-yi_asim0130n MAPPING FROM ENTITY ).

      yt_asim0130n = CORRESPONDING #( update-yi_asim0130n ).

      LOOP AT yt_asim0130n INTO ys_asim0130n.
        IF ys_asim0130n-BelnrAP IS NOT INITIAL AND ys_asim0130n-Belnr IS NOT INITIAL
           AND ys_asim0130n-loekz = '' AND ys_asim0130n-stat = 'P'.

          "부대비문서로 이미 처리된 반제전표가 있는지 확인
          SELECT SINGLE ClearingJournalEntry FROM I_JournalEntryItem
                 WHERE SourceLedger = '0L'
                 AND AccountingDocument = @ys_asim0130n-Belnr
                 AND FiscalYear = @ys_asim0130n-Gjahr
                 AND FinancialAccountType = 'F'
                 INTO @DATA(Augbl).

          IF Augbl = ''.

*         "전기 지급반제 **********************************************************************************
            DATA : req_je_arapitem    TYPE zjournal_entry_clearing_reque5,
                   req_je_arapitemT   TYPE TABLE OF zjournal_entry_clearing_reque5,

                   req_journal_entry  TYPE zjournal_entry_clearing_reque2,
                   req_je_clearing    TYPE zjournal_entry_clearing_reque4,
                   message_header     TYPE zbusiness_document_message_he3,
                   message_id         TYPE zbusiness_document_message_id2,

                   req_create_reqitem TYPE zjournal_entry_clearing_reque1,
                   req_create_request TYPE TABLE OF zjournal_entry_clearing_reque1.


            DATA: lr_cscn TYPE if_com_scenario_factory=>ty_query-cscn_id_range.
            lr_cscn = VALUE #( ( sign = 'I' option = 'EQ' low = 'ZCS_JE_001' ) ).

            DATA(lo_factory) = cl_com_arrangement_factory=>create_instance( ).
            lo_factory->query_ca(
                  EXPORTING
                    is_query           = VALUE #( cscn_id_range = lr_cscn )
                  IMPORTING
                    et_com_arrangement = DATA(lt_ca)
                ).

            IF lt_ca IS INITIAL.
              EXIT.
            ENDIF.

            DATA(lo_ca) = lt_ca[ 1 ].

            "해당 시나리오가 존재 하지 않으면 종료
            TRY.
                DATA(destination) = cl_soap_destination_provider=>create_by_comm_arrangement(
                    comm_scenario  = 'ZCS_JE_001'
                    service_id     = 'ZSTD_JE_CLEARING_001_SPRX'
                    comm_system_id = lo_ca->get_comm_system_id( ) ).

                DATA(proxy) = NEW zco_journal_entry_bulk_clearin(
                                destination = destination  ).

                DATA tsl TYPE timestampl.

                GET TIME STAMP FIELD DATA(ts).
                GET TIME STAMP FIELD tsl.
                "APAR items
                CLEAR: req_je_arapitem, req_je_arapitemT.
                req_je_arapitem-reference_document_item = '1'.
                req_je_arapitem-company_code = ys_asim0130n-Bukrs.
                req_je_arapitem-account_type = 'K'.
                req_je_arapitem-aparaccount = ys_asim0130n-LifreFees.
                req_je_arapitem-fiscal_year = ys_asim0130n-Gjahr.
                req_je_arapitem-accounting_document = ys_asim0130n-BelnrFi.
                req_je_arapitem-accounting_document_item = '1'.

                APPEND req_je_arapitem TO req_je_arapitemT.
                CLEAR req_je_arapitem.

                req_je_arapitem-reference_document_item = '2'.
                req_je_arapitem-company_code = ys_asim0130n-Bukrs.
                req_je_arapitem-account_type = 'K'.
                req_je_arapitem-aparaccount = ys_asim0130n-LifreFees.
                req_je_arapitem-fiscal_year = ys_asim0130n-Gjahr.
                req_je_arapitem-accounting_document = ys_asim0130n-BelnrAP.
                req_je_arapitem-accounting_document_item = '1'.

                APPEND req_je_arapitem TO req_je_arapitemT.
                CLEAR req_je_arapitem.

                "Header
                CLEAR: req_journal_entry, req_create_reqitem, req_create_request, req_je_clearing, message_header, message_id .

                message_id-content = 'SUB_IM_' && ys_asim0130n-Feeno.

                message_header-id = message_id.
                message_header-creation_date_time = tsl.

                req_journal_entry-company_code = ys_asim0130n-bukrs.
                req_journal_entry-accounting_document_type = 'AB'.
                req_journal_entry-document_date = ys_asim0130n-BudatFees.
                req_journal_entry-posting_date = ys_asim0130n-BudatFees.
                req_journal_entry-currency_code = 'KRW'.
                req_journal_entry-currency_translation_date = ys_asim0130n-BudatFees.
                req_journal_entry-document_header_text = ys_asim0130n-Bleno && '/' && ys_asim0130n-Zcdnot.
                req_journal_entry-created_by_user = sy-uname.
                req_journal_entry-aparitems = req_je_arapitemT.

                req_create_reqitem-journal_entry = req_journal_entry.
                req_create_reqitem-message_header = message_header.
                APPEND req_create_reqitem TO req_create_request.

                CLEAR: message_header, message_id .

                message_id-content = 'IM_' && ys_asim0130n-Feeno.

                message_header-id = message_id.
                message_header-creation_date_time = tsl.

                req_je_clearing-message_header = message_header.
                req_je_clearing-journal_entry_clearing_request = req_create_request.


                DATA(request) = VALUE zjournal_entry_bulk_clearing_1( journal_entry_bulk_clearing_re = req_je_clearing ).
                proxy->journal_entry_bulk_clearing_re(
                       EXPORTING
                       input = request
                                      ).

              CATCH cx_soap_destination_error INTO DATA(soap_destination_error).


              CATCH cx_ai_system_fault INTO DATA(ai_system_fault).


            ENDTRY.
          ENDIF.
        ENDIF.
      ENDLOOP.

      MODIFY zasimt0130n FROM TABLE @lt_asim0130n.
    ENDIF.

    IF delete IS NOT INITIAL.
      lt_asim0130n = CORRESPONDING #( delete-yi_asim0130n MAPPING FROM ENTITY ).


      DELETE zasimt0130n FROM TABLE @lt_asim0130n.
    ENDIF.







    IF sy-subrc = 0.

    ENDIF.

  ENDMETHOD.

ENDCLASS.

CLASS lhc_YI_ASIM0130N DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PUBLIC SECTION.
    CLASS-DATA: return_msg TYPE string,
                param_uuid TYPE sysuuid_x16.

    INTERFACES if_abap_conv_in.

  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR yi_asim0130n RESULT result.

    METHODS create_number FOR DETERMINE ON SAVE
      IMPORTING keys FOR yi_asim0130n~create_number.

    METHODS post_action FOR MODIFY
      IMPORTING keys FOR ACTION yi_asim0130n~post_action RESULT result.

    METHODS api_error FOR VALIDATE ON SAVE
      IMPORTING keys FOR yi_asim0130n~api_error.

    METHODS delete_invoice FOR MODIFY
      IMPORTING keys FOR ACTION yi_asim0130n~delete_invoice.

    METHODS cancel_invoice FOR MODIFY
      IMPORTING keys FOR ACTION yi_asim0130n~cancel_invoice.


    TYPES:
      "스탠다드 API Response Information
      BEGIN OF post_result,
        post_body   TYPE string,
        post_status TYPE string,
      END OF post_result.

    DATA: http_client TYPE REF TO zcl_if_common_001,
          asim0130s   TYPE TABLE FOR UPDATE yi_asim0130n,
          asim0130    TYPE STRUCTURE FOR UPDATE yi_asim0130n,
          result_msg  TYPE string,
          uri         TYPE string.

    "상수
    CONSTANTS:
      c_scenario  TYPE string VALUE 'ZCS_SINV_001',
      c_service   TYPE string VALUE 'ZSTD_SINV_001_REST',
      c_service1  TYPE string VALUE 'ZSTD_SINV_003_REST',

      c_scenario2 TYPE string VALUE 'ZCS_JE_001',
      c_service2  TYPE string VALUE 'ZSTD_JE_001_SPRX'.


ENDCLASS.

CLASS lhc_YI_ASIM0130N IMPLEMENTATION.

  METHOD get_instance_authorizations.
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
        IF ls_result-Belnr IS NOT INITIAL AND ls_result-BelnrAp IS NOT INITIAL AND ls_result-Augbl IS NOT INITIAL.
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

      DATA(codntype) = ls_result-Zvalu1.
      IF ls_result-Zvalu1 <> 'ZDC1' AND ls_result-Zvalu1 <> 'ZDC2'.
        codntype = ''.
      ENDIF.

      LOOP AT lt_item_result INTO DATA(ls_item_result) WHERE ParentUUID = ls_result-uuid
                                                       AND ebeln IS NOT INITIAL
                                                       AND ebelp IS NOT INITIAL.
        SELECT SUM(  a~QuantityInPurchaseOrderUnit )
          FROM I_SuplrInvcItemPurOrdRefAPI01 AS a
          JOIN I_SupplierInvoiceAPI01 AS b ON a~SupplierInvoice = b~SupplierInvoice
                                          AND a~FiscalYear = b~FiscalYear
          WHERE a~PurchaseOrder = @ls_item_result-Ebeln
          AND a~PurchaseOrderItem = @ls_item_result-Ebelp
          AND b~ReverseDocument = ''
          AND b~AccountingDocumentType = 'RE'
          AND a~IsSubsequentDebitCredit = ''
          AND a~SuplrInvcDeliveryCostCndnType = @codntype
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

    CREATE OBJECT me->http_client
      EXPORTING
        i_scenario     = c_scenario
        i_service      = c_service
      EXCEPTIONS
        no_arrangement = 1.

    CHECK sy-subrc <> 1.
    "lv_sub: 차후차대변지시자.
    "lv_cd: 송장,대변메모지시자.
    "lv_sh: 차대변지시자.
    DATA: lv_sub, lv_cd.
    DATA: lv_sh.
    DATA : lv_zvalu1 TYPE string.

    "Item Json
    DATA : json TYPE string.
    DATA : net_json TYPE string.
    DATA : selected_po_json TYPE string.
    DATA : supitem_json TYPE string.
    DATA : supgla_json TYPE string.
    DATA : supgla1_json TYPE string.
    DATA : acct_json TYPE string.
    DATA : tax_json TYPE string.
    DATA : result_msg    TYPE string.
    DATA : order_id      TYPE string.
    DATA : fiscal_year   TYPE string.
    DATA : result_status TYPE string.
    DATA : lv_reftxt TYPE string.

    DATA : Wmwst1Fees TYPE p DECIMALS 2 LENGTH 16.
    DATA : IvamtFees TYPE p DECIMALS 2 LENGTH 16.
    DATA : NetwrFees TYPE p DECIMALS 2 LENGTH 16.
    DATA : BasamtFees TYPE p DECIMALS 2 LENGTH 16.

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

        CLEAR lv_reftxt.
*        IF ls_result-zvalu2 = 'A' .
*          lv_reftxt = ls_result-Cont1.
*        ELSE.
*          lv_reftxt = ls_result-Bleno.
*        ENDIF.
        lv_reftxt = ls_result-Feeno && ls_result-Feeyr.

        DATA(postdate) = ls_result-BudatFees+0(4) && '-' && ls_result-BudatFees+4(2) && '-' && ls_result-BudatFees+6(2) && 'T00:00:00'.
        DATA(basedate) = ls_result-Zfbdt+0(4) && '-' && ls_result-Zfbdt+4(2) && '-' && ls_result-Zfbdt+6(2) && 'T00:00:00'.
        DATA(taxdate) = ls_result-BudatFees+0(4) && '-' && ls_result-BudatFees+4(2) && '-' && ls_result-BudatFees+6(2) && 'T00:00:00'.

        "부대비문서로 이미 처리된 전표가 있는지 확인
        IF ls_result-Belnr IS INITIAL.
          DATA(iv_referance) = ls_result-Feeno && ls_result-Feeyr.
          SELECT SupplierInvoiceWthnFiscalYear FROM I_SupplierInvoiceAPI01 WHERE AssignmentReference = @iv_referance
                                                               AND ReverseDocument = ''
                                     INTO @DATA(iv_belyr).
          ENDSELECT.
          IF iv_belyr IS NOT INITIAL.
            SELECT AccountingDocument FROM I_JournalEntry WHERE CompanyCode = @ls_result-Bukrs
                                                          AND OriginalReferenceDocument = @iv_belyr
                                                          AND ReferenceDocumentType = 'RMRP'
                                      INTO @DATA(lv_fibel).
            ENDSELECT.

            ls_result-Belnr = iv_belyr+0(10).
            ls_result-Gjahr = iv_belyr+10(4).
            ls_result-BelnrFi = lv_fibel.
            ls_result-GjahrFi = iv_belyr+10(4).
            ls_result-Mesg = ''.
          ENDIF.
        ENDIF.

        IF ls_result-Belnr IS INITIAL.

          IF ls_zcdno-zvalu5 = 'RE'. "송장전표 생성**********************************************************************************
            IF ls_result-zvalu3 = 'H'.
              lv_cd = ''.
            ELSE.
              lv_cd = 'X'.
            ENDIF.

            IF ls_result-Zvalu1 = 'PBXX'.
              lv_sub = 'X'. "차후차변.
              lv_zvalu1 = ''.
            ELSE.
              lv_zvalu1 = ls_result-Zvalu1.
              READ TABLE lt_item_result INTO ls_item_result WITH KEY ParentUUID = ls_result-uuid.
              IF ls_item_result-chk = 'A'.
                lv_sub = ''. "송장
              ELSE.
                lv_sub = 'X'. "차후차변.
              ENDIF.
            ENDIF.

            "통화가 KRW, JPY인 경우 * 100.
            IF ls_result-WaersFees EQ 'KRW' OR ls_result-WaersFees EQ 'JPY'.
              Wmwst1Fees = ls_result-Wmwst1Fees * 100.
              IvamtFees = ls_result-IvamtFees * 100.
            ELSE.
              Wmwst1Fees = ls_result-Wmwst1Fees.
              IvamtFees = ls_result-IvamtFees.
            ENDIF.

            LOOP AT lt_item_result INTO ls_item_result WHERE ParentUUID = ls_result-uuid.
              "송장 생성.

              "통화가 KRW, JPY인 경우 * 100.
              IF ls_result-WaersFees EQ 'KRW' OR ls_result-WaersFees EQ 'JPY'.
                ls_item_result-NetwrFees = ls_item_result-NetwrFees * 100.
              ENDIF.

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

            json =
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
                ' "AssignmentReference":"' && lv_reftxt && '",' &&
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
            ls_result-GjahrFi = fiscal_year.
            ls_result-Mesg = result_msg.
            lhc_YI_ASIM0130N=>return_msg = result_msg.

          ELSE. "회계전표 생성 **********************************************************************************
            IF ls_zcdno-zvalu5 = 'KR'. "송장전표 생성(G/L 계정 참조)
              IF ls_result-zvalu3 = 'H'.
                lv_sh = 'S'.
                lv_cd = ''.
              ELSEIF ls_result-zvalu3 = 'S'.
                lv_sh = 'H'.
                lv_cd = 'X'.
              ENDIF.

              CLEAR: Wmwst1Fees, IvamtFees, NetwrFees, BasamtFees.
              IF ls_result-zvalu6 <> ''. "연동 세금이 있을 때 총금액은 과세표준으로 세액은 총금액으로.
                Wmwst1Fees = 0.
                IvamtFees = ls_result-Wmwst1Fees.
                NetwrFees = ls_result-Wmwst1Fees.
                BasamtFees = ls_result-RmwwrFees.
              ELSE.
                Wmwst1Fees = ls_result-Wmwst1Fees.
                IvamtFees = ls_result-IvamtFees.
                NetwrFees = ls_result-RmwwrFees.
              ENDIF.

              "통화가 KRW, JPY인 경우 * 100.
              IF ls_result-WaersFees EQ 'KRW' OR ls_result-WaersFees EQ 'JPY'.
                Wmwst1Fees = Wmwst1Fees * 100.
                IvamtFees = IvamtFees * 100.
                NetwrFees = NetwrFees * 100.
                BasamtFees = BasamtFees * 100.
              ENDIF.
              IF ls_result-zvalu6 <> ''.
                supgla1_json = '"TaxBaseAmountInTransCrcy":"' && BasamtFees && '",'.
              ENDIF.

              supgla_json = '"SupplierInvoiceItem":"' && '1' && '",' &&
                            '"CompanyCode":"' && ls_result-Bukrs && '",' &&
                            '"GLAccount":"' && ls_result-Zvalu1 && '",' &&
                            '"TaxCode":"' && ls_result-mwskz && '",' &&
                            '"DocumentCurrency":"' && ls_result-WaersFees && '",' &&
                            '"SupplierInvoiceItemAmount":"' && Netwrfees && '",'.

              supgla_json = supgla_json && supgla1_json && '"DebitCreditCode":"' && lv_sh && '"' &&
                                             '}'.

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

              json =
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
                  ' "AssignmentReference":"' && lv_reftxt && '",' &&
                  ' "SupplierPostingLineItemText":"' && ls_result-Zcdnot && '",' &&
                  ' "TaxIsCalculatedAutomatically": false,' &&
                  ' "BusinessPlace":"' && place && '",' &&
                  ' "BusinessArea":"' && area && '",' &&
                  ' "SupplierInvoiceIsCreditMemo":"' && lv_cd && '",' &&
                  ' "to_SupplierInvoiceItemGLAcct":{' &&
                  '  "results":[{' &&
                  '  ' && supgla_json &&
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

              "GET TOKEN
              DATA(token1) = me->http_client->get_token_cookies( ).

              "POST
              IF token1 IS NOT INITIAL.
                me->http_client->post(
                    EXPORTING
                        json = json
                    IMPORTING
                        body   = DATA(body1)
                        status = DATA(status1)
                ).
              ENDIF.

              "호출 후 결과 값 확인
              result_status = status1.
              result_msg    = body1.

              " en,value를 포함한 문자열 일때만 parsing
              IF ( result_msg CS ',"value":"' ).
                result_msg = substring_before( val = substring_after( val = body1
                                                                      sub = '"value":"' )
                                               sub = '"' ).
              ENDIF.

              ""PurchaseOrder": 를 포함한 문자열 일때만 parsing
              IF ( result_msg CS '"SupplierInvoice":' ).
                "PurchaseOrder"뒤에 오는 문자열 조회
                order_id   = substring_before( val = substring_after( val = body1
                                                                      sub = '"SupplierInvoice":' )
                                               sub = ',"' ).

                fiscal_year = substring_before( val = substring_after( val = body1
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
                DATA(orgDocID1) = order_id && fiscal_year.

                "분개 타입이 공급업체 송장이고, 회사코드, 참조문서(공급업체송장)을 기준으로 분개 문서 ID가져옴.
                SELECT AccountingDocument FROM I_JournalEntry WHERE CompanyCode = @ls_result-Bukrs AND OriginalReferenceDocument = @orgDocId1 AND ReferenceDocumentType = 'RMRP' INTO @DATA(lv_posting1). ENDSELECT.
              ENDIF.
              ls_result-Belnr = order_id.
              ls_result-Gjahr = fiscal_year.
              ls_result-BelnrFi = lv_posting1.
              ls_result-GjahrFi = fiscal_year.
              ls_result-Mesg = result_msg.
              lhc_YI_ASIM0130N=>return_msg = result_msg.

            ELSE. "일반 회계전표 생성.

            ENDIF.

          ENDIF.
        ENDIF.

        "부대비문서로 이미 처리된 전표가 있는지 확인
        IF ls_result-zvalu4 = 'S' AND ls_result-Belnr IS NOT INITIAL AND ls_result-BelnrAp IS INITIAL.
          DATA(iv_referanceAP) = ls_result-Feeno && ls_result-Feeyr && 'AP'.
          SELECT SupplierInvoiceWthnFiscalYear FROM I_SupplierInvoiceAPI01 WHERE AssignmentReference = @iv_referance
                                                               AND ReverseDocument = ''
                                     INTO @DATA(iv_belyrAP).
          ENDSELECT.
          IF iv_belyr IS NOT INITIAL.
            SELECT AccountingDocument FROM I_JournalEntry WHERE CompanyCode = @ls_result-Bukrs
                                                          AND OriginalReferenceDocument = @iv_belyrAP
                                                          AND ReferenceDocumentType = 'RMRP'
                                      INTO @DATA(lv_fibelAP).
            ENDSELECT.

            ls_result-BelnrAp = lv_fibelAP.
            ls_result-GjahrAp = iv_belyrAP+10(4).
            ls_result-Mesg = ''.
          ENDIF.
        ENDIF.

        "선급전환**********************************************************************************
        IF ls_result-zvalu4 = 'S' AND ls_result-Belnr IS NOT INITIAL AND ls_result-BelnrAp IS INITIAL.
          CLEAR: lv_sub, lv_cd, lv_zvalu1, net_json, selected_po_json, supitem_json, acct_json, tax_json, result_msg, order_id, fiscal_year, result_status,
                 supgla_json, supgla1_json, json.

          SELECT * FROM yi_asim0130n
                  WHERE Reqmu = @ls_result-Reqmu
                    AND Reqno = @ls_result-Reqno
                    AND Zcdno = @ls_result-Zvalu5
                    AND Loekz = ''
                  INTO TABLE @DATA(lt_result1).

          READ TABLE lt_result1 INDEX 1 INTO DATA(ls_result1).
          IF sy-subrc = 0.
            IF ls_result-zvalu4 = 'H'.
              lv_sh = 'S'.
              lv_cd = ''.
            ELSEIF ls_result-zvalu4 = 'S'.
              lv_sh = 'H'.
              lv_cd = 'X'.
            ENDIF.

            CLEAR: Wmwst1Fees, IvamtFees, NetwrFees, BasamtFees.
            IF ls_result-zvalu6 <> ''. "연동 세금이 있을 때 총금액은 과세표준으로 세액은 총금액으로.
              Wmwst1Fees = 0.
              IvamtFees = ls_result-Wmwst1Fees.
              NetwrFees = ls_result-Wmwst1Fees.
              BasamtFees = ls_result-RmwwrFees.
            ELSE.
              Wmwst1Fees = ls_result-Wmwst1Fees.
              IvamtFees = ls_result-IvamtFees.
              NetwrFees = ls_result-RmwwrFees.
            ENDIF.

            "통화가 KRW, JPY인 경우 * 100.
            IF ls_result-WaersFees EQ 'KRW' OR ls_result-WaersFees EQ 'JPY'.
              Wmwst1Fees = Wmwst1Fees * 100.
              IvamtFees = IvamtFees * 100.
              NetwrFees = NetwrFees * 100.
              BasamtFees = BasamtFees * 100.
            ENDIF.

            IF ls_result-zvalu6 <> ''.
              supgla1_json = '"TaxBaseAmountInTransCrcy":"' && BasamtFees && '",'.
            ENDIF.

            CLEAR lv_reftxt.
*            IF ls_result1-zvalu2 = 'A' .
*              lv_reftxt = ls_result1-Cont1.
*            ELSE.
*              lv_reftxt = ls_result1-Bleno.
*            ENDIF.
            lv_reftxt = ls_result-Feeno && ls_result-Feeyr && 'AP'.

            supgla_json = '"SupplierInvoiceItem":"' && '1' && '",' &&
                          '"CompanyCode":"' && ls_result1-Bukrs && '",' &&
                          '"GLAccount":"' && ls_result1-Zvalu1 && '",' &&
                          '"TaxCode":"' && ls_result1-mwskz && '",' &&
                          '"DocumentCurrency":"' && ls_result1-WaersFees && '",' &&
                          '"SupplierInvoiceItemAmount":"' && Netwrfees && '",'.

            supgla_json = supgla_json && supgla1_json && '"DebitCreditCode":"' && lv_sh && '"' &&
                                           '}'.

            IF ( tax_json EQ '' ).
              tax_json = tax_json && '"TaxCode":"' && ls_result1-mwskz && '",' &&
                                     '"DocumentCurrency":"' && ls_result1-WaersFees && '",' &&
                                     '"TaxAmount":"' && Wmwst1Fees && '",' &&
                                     '"TaxDeterminationDate":"' && taxdate && '"' &&
                                     '}'.
            ENDIF.

            "netPaymentDays가 0일때와 0초과일때로 나눠서 처리.
            IF ls_result-zbd1t EQ '0'.
              net_json = net_json && ' "NetPaymentDays":"' && ls_result1-zbd1t && '",' &&
                                     ' "PaymentTerms":"' && ls_result1-ZtermFees && '",'.
            ELSE.
              net_json = net_json && ' "CashDiscount1Days":"' && ls_result1-zbd1t && '",' &&
                                     ' "PaymentTerms":"' && '' && '",'.
            ENDIF.

            json =
             '{' &&
             ' "CompanyCode":"' && ls_result1-Bukrs && '",' &&
             ' "DocumentDate":"' && postdate && '",' &&
             ' "PostingDate":"' && postdate && '",' &&
             ' "TaxDeterminationDate":"' && taxdate && '",' &&
             ' "SupplierInvoiceIDByInvcgParty":"' && ls_result1-Reqmu && '",' &&
             ' "InvoicingParty":"' && ls_result1-LifreFees && '",' &&
             ' "DocumentCurrency":"' && ls_result1-WaersFees && '",' &&
             ' "InvoiceGrossAmount":"' && IvamtFees && '",' &&
             ' "DocumentHeaderText":"' && ls_result1-bktxt && '",'.

            json = json && net_json &&
                ' "DueCalculationBaseDate":"' && basedate && '",' &&
                ' "PaymentBlockingReason": "A",' &&
                ' "AccountingDocumentType": "RE",' &&
                ' "DirectQuotedExchangeRate":"' && ls_result1-kursf && '",' &&
                ' "PaymentMethod":"' && ls_result1-zlsch && '",' &&
                ' "AssignmentReference":"' && lv_reftxt && '",' &&
                ' "SupplierPostingLineItemText":"' && ls_result-Zcdnot && '",' &&
                ' "TaxIsCalculatedAutomatically": false,' &&
                ' "BusinessPlace":"' && place && '",' &&
                ' "BusinessArea":"' && area && '",' &&
                ' "SupplierInvoiceIsCreditMemo":"' && lv_cd && '",' &&
                ' "to_SupplierInvoiceItemGLAcct":{' &&
                '  "results":[{' &&
                '  ' && supgla_json &&
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

            "GET TOKEN
            DATA(token2) = me->http_client->get_token_cookies( ).

            "POST
            IF token2 IS NOT INITIAL.
              me->http_client->post(
                  EXPORTING
                      json = json
                  IMPORTING
                      body   = DATA(body2)
                      status = DATA(status2)
              ).
            ENDIF.

            "호출 후 결과 값 확인
            result_status = status2.
            result_msg    = body2.

            " en,value를 포함한 문자열 일때만 parsing
            IF ( result_msg CS ',"value":"' ).
              result_msg = substring_before( val = substring_after( val = body2
                                                                    sub = '"value":"' )
                                             sub = '"' ).
            ENDIF.

            ""PurchaseOrder": 를 포함한 문자열 일때만 parsing
            IF ( result_msg CS '"SupplierInvoice":' ).
              "PurchaseOrder"뒤에 오는 문자열 조회
              order_id   = substring_before( val = substring_after( val = body2
                                                                    sub = '"SupplierInvoice":' )
                                             sub = ',"' ).

              fiscal_year = substring_before( val = substring_after( val = body2
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
              DATA(orgDocID2) = order_id && fiscal_year.

              "분개 타입이 공급업체 송장이고, 회사코드, 참조문서(공급업체송장)을 기준으로 분개 문서 ID가져옴.
              SELECT AccountingDocument FROM I_JournalEntry WHERE CompanyCode = @ls_result-Bukrs AND OriginalReferenceDocument = @orgDocId2 AND ReferenceDocumentType = 'RMRP' INTO @DATA(lv_posting2). ENDSELECT.
            ENDIF.
            ls_result-GjahrAP = fiscal_year.
            ls_result-BelnrAp = lv_posting2.
            ls_result-Mesg = result_msg.
            lhc_YI_ASIM0130N=>return_msg = result_msg.
          ENDIF.

        ENDIF.

        ls_result-Stat = 'P'.

        asim0130 = CORRESPONDING #( ls_result ).

        APPEND asim0130 TO asim0130s.
        CLEAR asim0130.

        CLEAR: lv_sub, lv_cd, lv_zvalu1, net_json, selected_po_json, supitem_json, acct_json, tax_json, result_msg, order_id, fiscal_year, result_status,
               supgla_json, supgla1_json, json.
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

*        APPEND VALUE #( %tky = ls_msg_result-%tky ) TO failed-yi_asim0130n.
        APPEND VALUE #( %tky = ls_msg_result-%tky %msg = new_message( id = 'YASIM_MSG'
                                                                      number = 001
                                                                      severity = if_abap_behv_message=>severity-error
                                                                      v1 = return_msg ) )
              TO reported-yi_asim0130n.

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

  METHOD delete_invoice.

*    DATA: datetime TYPE string,
*          reason   TYPE string,
*          year     TYPE string,
*          invoice  TYPE string.

    "Header값 읽기
    READ ENTITIES OF yi_asim0130n IN LOCAL MODE
    ENTITY yi_asim0130n
    ALL FIELDS
        WITH CORRESPONDING #( keys )
    RESULT    DATA(lt_result)
    FAILED    DATA(lt_failed)
    REPORTED  DATA(lt_reported).

*    SELECT * FROM yi_asim0001n
*      WHERE Zcode LIKE '%POSTNO'
*      INTO TABLE @DATA(lt_zcdno).
*
*    SORT lt_zcdno BY Zcdno DESCENDING.
*
*    "통신 규약 존재 확인
*    CLEAR : http_client.
*    CREATE OBJECT me->http_client
*      EXPORTING
*        i_scenario     = c_scenario
*        i_service      = c_service
*      EXCEPTIONS
*        no_arrangement = 1.
*
*    CHECK sy-subrc <> 1.


    CLEAR : asim0130s.
*    LOOP AT lt_zcdno INTO DATA(ls_zcdno).
*      LOOP AT lt_result INTO DATA(ls_result) WHERE zvalu1 = ls_zcdno-zvalu1
*                                       AND zvalu2 = ls_zcdno-zvalu2
*                                       AND zvalu3 = ls_zcdno-zvalu3
*                                       AND zvalu4 = ls_zcdno-zvalu4
*                                       AND zvalu6 = ls_zcdno-zvalu6
*                                       AND zvalu7 = ls_zcdno-zvalu7.

*    DATA(ls_result) = lt_result[ 1 ].
    LOOP AT lt_result INTO DATA(ls_result).
      "전기 전이면, 문서 삭제
      IF ls_result-Postgb EQ ''.
        asim0130 = CORRESPONDING #( ls_result ).
        asim0130-Loekz = 'X'.

        APPEND asim0130 TO asim0130s.

        MODIFY ENTITIES OF yi_asim0130n IN LOCAL MODE
        ENTITY yi_asim0130n UPDATE SET FIELDS WITH asim0130s
        MAPPED   DATA(ls_mapped_modify)
        FAILED   DATA(lt_failed_modify)
        REPORTED DATA(lt_reported_modify).


      ENDIF.
    ENDLOOP.
*    ENDLOOP.


  ENDMETHOD.

  METHOD cancel_invoice.
    DATA: datetime TYPE string,
          reason   TYPE string,
          year     TYPE string,
          invoice  TYPE string.
    DATA: num TYPE n LENGTH 3.

    "Header값 읽기
    READ ENTITIES OF yi_asim0130n IN LOCAL MODE
    ENTITY yi_asim0130n
    ALL FIELDS
        WITH CORRESPONDING #( keys )
    RESULT    DATA(lt_result)
    FAILED    DATA(lt_failed)
    REPORTED  DATA(lt_reported).

    SELECT * FROM yi_asim0001n
      WHERE Zcode LIKE '%POSTNO'
      INTO TABLE @DATA(lt_zcdno).

    SORT lt_zcdno BY Zcdno DESCENDING.

    "통신 규약 존재 확인
    CLEAR : http_client.
    CREATE OBJECT me->http_client
      EXPORTING
        i_scenario     = c_scenario
        i_service      = c_service
      EXCEPTIONS
        no_arrangement = 1.

    CHECK sy-subrc <> 1.

    DATA(token_cookiesAP) = me->http_client->get_token_cookies( ).

    CLEAR : http_client.
    CREATE OBJECT me->http_client
      EXPORTING
        i_scenario     = c_scenario
        i_service      = c_service1
      EXCEPTIONS
        no_arrangement = 1.

    CHECK sy-subrc <> 1.

    CLEAR : asim0130s.
    CLEAR : num, result_msg.
    LOOP AT lt_zcdno INTO DATA(ls_zcdno).
      LOOP AT lt_result INTO DATA(ls_result) WHERE zvalu1 = ls_zcdno-zvalu1
                                       AND zvalu2 = ls_zcdno-zvalu2
                                       AND zvalu3 = ls_zcdno-zvalu3
                                       AND zvalu4 = ls_zcdno-zvalu4
                                       AND zvalu6 = ls_zcdno-zvalu6
                                       AND zvalu7 = ls_zcdno-zvalu7.

        CLEAR : asim0130.
        asim0130 = CORRESPONDING #( ls_result ).

        IF ls_result-Augbl = ''.
*          asim0130-%control-Belnr = if_abap_behv=>mk-on.
*          asim0130-%control-Gjahr = if_abap_behv=>mk-on.
*          asim0130-%control-BelnrFi = if_abap_behv=>mk-on.
*          asim0130-%control-GjahrFi = if_abap_behv=>mk-on.
*          asim0130-%control-BelnrAp = if_abap_behv=>mk-on.
*          asim0130-%control-GjahrAp = if_abap_behv=>mk-on.

          IF ls_result-BelnrAp <> ''.
            SELECT OriginalReferenceDocument FROM I_JournalEntry WHERE CompanyCode = @ls_result-Bukrs
                                                            AND AccountingDocument = @ls_result-BelnrAp
                                                            AND FiscalYear = @ls_result-Gjahr
                                                            AND ReferenceDocumentType = 'RMRP'
                                      INTO @DATA(iv_Refdoc).
            ENDSELECT.

            DATA(iv_belnr) = iv_refdoc+0(10).

            SELECT ReverseDocument FROM I_SupplierInvoiceAPI01 WHERE SupplierInvoice = @iv_belnr
                                                               AND FiscalYear = @ls_result-Gjahr
                                   INTO @DATA(iv_revap).
            ENDSELECT.

            IF iv_revap IS NOT INITIAL.
              asim0130-BelnrAp = ''.
              asim0130-GjahrAp = ''.
              ls_result-BelnrAp = ''.
              ls_result-GjahrAp = ''.
              ls_result-Postgb = ''.

            ELSE.
              datetime = '''' && ls_result-BudatFees+0(4) && '-' && ls_result-BudatFees+4(2) && '-' && ls_result-BudatFees+6(2) && 'T00:00:00' && '''' .
              reason   = '''01'''.
              year     = '''' && ls_result-BudatFees+0(4) && ''''.
              invoice  = '''' && iv_belnr && ''''.

              uri = '/Cancel?PostingDate=datetime' && datetime && '&ReversalReason=' && reason && '&FiscalYear=' && year && '&SupplierInvoice=' && invoice.

              "GET TOKEN
*            DATA(token_cookiesAP) = me->http_client->get_token_cookies( ).

              "Delete
              IF token_cookiesAP IS NOT INITIAL.
                me->http_client->cookies = token_cookiesAP-cookies.
                me->http_client->token   = token_cookiesAP-token.

                me->http_client->post(
                  EXPORTING
                      uri    = uri
                  IMPORTING
                      body   = DATA(bodyAP)
                      status = DATA(statusAP)
                  ).

              ENDIF.

              IF statusAP EQ '200'.
                "문서번호 clear
                asim0130-BelnrAp = ''.
                asim0130-GjahrAp = ''.
                ls_result-BelnrAp = ''.
                ls_result-GjahrAp = ''.
                ls_result-Postgb = ''.
              ELSE.

                DATA: lv_body_string   TYPE string,
                      lo_json_parser   TYPE REF TO /ui2/cl_json,
                      lv_error_message TYPE string.

                lv_body_string = bodyAp. " 가정: bodyAp 변수는 JSON 문자열을 포함합니다.


                IF ( lv_body_string CS ',"value":"' ).
                  result_msg = substring_before( val = substring_after( val = bodyAp
                                                                        sub = '"value":"' )
                                                 sub = '"' ).
                ENDIF.
                asim0130-mesg = result_msg.
*                lhc_YI_ASIM0130N=>return_msg = result_msg.
*                num = num + 1.
*                APPEND VALUE #( %tky = asim0130-%tky ) TO failed-yi_asim0130n.
*                APPEND VALUE #( %tky = asim0130-%tky %msg = new_message( id = 'YASIM_MSG' number = num severity = if_abap_behv_message=>severity-error v1 = result_msg ) ) TO reported-yi_asim0130n.
              ENDIF.
            ENDIF.
          ENDIF.

          IF ls_result-BelnrAp = '' AND ls_result-Belnr <> ''.
            SELECT ReverseDocument FROM I_SupplierInvoiceAPI01 WHERE SupplierInvoice = @ls_result-Belnr
                                                               AND FiscalYear = @ls_result-Gjahr
                                   INTO @DATA(iv_rev).
            ENDSELECT.

            IF iv_rev IS NOT INITIAL.
              "문서번호 clear
              asim0130-Belnr   = ''.
              asim0130-Gjahr   = ''.
              asim0130-BelnrFi = ''.
              asim0130-GjahrFi = ''.
              ls_result-Belnr   = ''.
              ls_result-Gjahr   = ''.
              ls_result-BelnrFi = ''.
              ls_result-GjahrFi = ''.
              ls_result-Postgb = ''.
            ELSE.

              datetime = '''' && ls_result-BudatFees+0(4) && '-' && ls_result-BudatFees+4(2) && '-' && ls_result-BudatFees+6(2) && 'T00:00:00' && '''' .
              reason   = '''01'''.
              year     = '''' && ls_result-BudatFees+0(4) && ''''.
              invoice  = '''' && ls_result-Belnr && ''''.

              uri = '/Cancel?PostingDate=datetime' && datetime && '&ReversalReason=' && reason && '&FiscalYear=' && year && '&SupplierInvoice=' && invoice.

              "GET TOKEN
              DATA(token_cookies) = me->http_client->get_token_cookies( ).

              "Delete
              IF token_cookies IS NOT INITIAL.
                me->http_client->cookies = token_cookiesAP-cookies.
                me->http_client->token   = token_cookiesAP-token.
*              me->http_client->cookies = token_cookies-cookies.
*              me->http_client->token   = token_cookies-token.

                me->http_client->post(
                  EXPORTING
                      uri    = uri
                  IMPORTING
                      body   = DATA(body)
                      status = DATA(status)
                  ).
              ENDIF.

              IF status EQ '200'.
                "문서번호 clear
                asim0130-Belnr   = ''.
                asim0130-Gjahr   = ''.
                asim0130-BelnrFi = ''.
                asim0130-GjahrFi = ''.
                ls_result-Belnr   = ''.
                ls_result-Gjahr   = ''.
                ls_result-BelnrFi = ''.
                ls_result-GjahrFi = ''.
                ls_result-Postgb = ''.
              ELSE.
                lv_body_string = body. " 가정: bodyAp 변수는 JSON 문자열을 포함합니다.


                IF ( lv_body_string CS ',"value":"' ).
                  result_msg = substring_before( val = substring_after( val = body
                                                                        sub = '"value":"' )
                                                 sub = '"' ).
                ENDIF.
                asim0130-mesg = result_msg.
              ENDIF.
            ENDIF.
          ENDIF.

        ELSE.
          result_msg = '반제항목이 존재합니다. 반제 재설정부터 진행해주세요.'.
          asim0130-mesg = result_msg.

*          lhc_YI_ASIM0130N=>return_msg = result_msg.
*          num = num + 1.
*          APPEND VALUE #( %tky = asim0130-%tky ) TO failed-yi_asim0130n.
*          APPEND VALUE #( %tky = asim0130-%tky %msg = new_message( id = 'YASIM_MSG' number = num severity = if_abap_behv_message=>severity-error v1 = result_msg ) ) TO reported-yi_asim0130n.
        ENDIF.

        APPEND asim0130 TO asim0130s.
      ENDLOOP.
    ENDLOOP.

    MODIFY ENTITIES OF yi_asim0130n IN LOCAL MODE
      ENTITY yi_asim0130n UPDATE SET FIELDS WITH asim0130s
      MAPPED   DATA(ls_mapped_modify)
      FAILED   DATA(lt_failed_modify)
      REPORTED DATA(lt_reported_modify).

    IF result_msg IS NOT INITIAL.
      num = num + 1.
*      APPEND VALUE #( %tky = asim0130-%tky ) TO reported-yi_asim0130n.
      APPEND VALUE #( %tky = asim0130-%tky %msg = new_message( id = 'YASIM_MSG'
                                                               number = num
                                                               severity = if_abap_behv_message=>severity-error
                                                               v1 = result_msg ) )
             TO reported-yi_asim0130n.
    ENDIF.

  ENDMETHOD.

ENDCLASS.

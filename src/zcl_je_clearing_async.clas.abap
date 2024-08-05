CLASS zcl_je_clearing_async DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

    TYPES: tt_req_create_request TYPE TABLE OF zjournal_entry_bulk_create_re1.

    METHODS: call_soap_service.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_JE_CLEARING_ASYNC IMPLEMENTATION.


  METHOD call_soap_service .

   DATA : req_je_arapitem    TYPE zjournal_entry_clearing_reque5,
           req_je_arapitemT   TYPE TABLE OF zjournal_entry_clearing_reque5,

           req_journal_entry  TYPE zjournal_entry_clearing_reque2,
           req_create_reqitem TYPE zjournal_entry_clearing_reque1,
           req_create_request TYPE TABLE OF zjournal_entry_clearing_reque1.

    DATA: lr_cscn TYPE if_com_scenario_factory=>ty_query-cscn_id_range.
    lr_cscn = VALUE #( ( sign = 'I' option = 'EQ' low = 'SAP_COM_0002' ) ).

    DATA(lo_factory) = cl_com_arrangement_factory=>create_instance( ).
    lo_factory->query_ca(
          EXPORTING
            is_query           = VALUE #( cscn_id_range = lr_cscn )
          IMPORTING
            et_com_arrangement = DATA(lt_ca)
        ).

    "해당 시나리오가 존재 하지 않으면 종료

    TRY.
*
        "APAR items
        CLEAR: req_je_arapitem, req_je_arapitemT.

        req_je_arapitem-reference_document_item = '1'.
        req_je_arapitem-company_code = '4310'.
        req_je_arapitem-account_type = 'K'.
        req_je_arapitem-aparaccount = '1000030'.
        req_je_arapitem-fiscal_year = '2024'.
        req_je_arapitem-accounting_document = '5100000160'.
        req_je_arapitem-accounting_document_item = '1'.

        APPEND req_je_arapitem TO req_je_arapitemT.
        CLEAR req_je_arapitem.

        req_je_arapitem-reference_document_item = '2'.
        req_je_arapitem-company_code = '4310'.
        req_je_arapitem-account_type = 'K'.
        req_je_arapitem-aparaccount = '1000030'.
        req_je_arapitem-fiscal_year = '2024'.
        req_je_arapitem-accounting_document = '5100000161'.
        req_je_arapitem-accounting_document_item = '1'.

        APPEND req_je_arapitem TO req_je_arapitemT.
        CLEAR req_je_arapitem.

        "Header
        CLEAR: req_journal_entry, req_create_reqitem, req_create_request.

        req_journal_entry-company_code = '4310'.
        req_journal_entry-accounting_document_type = 'AB'.
        req_journal_entry-document_date = '20240214'.
        req_journal_entry-posting_date = '20240214'.
        req_journal_entry-currency_code = 'KRW'.
        req_journal_entry-currency_translation_date = '20240214'.
        req_journal_entry-document_header_text = 'BKLV12475' && '선급전환'.
        req_journal_entry-created_by_user = 'CC0000000002'.
        req_journal_entry-aparitems = req_je_arapitemT.

        req_create_reqitem-journal_entry = req_journal_entry.
        APPEND req_create_reqitem TO req_create_request.

        DATA(destination) = cl_soap_destination_provider=>create_by_url( i_url = 'https://my407000-api.s4hana.cloud.sap/sap/bc/srt/scs_ext/sap/journalentrybulkclearingreques' ).

        DATA(proxy) = NEW zco_journal_entry_bulk_clearin( destination = destination ).

        DATA(request) = VALUE zjournal_entry_bulk_clearing_1( journal_entry_bulk_clearing_re-journal_entry_clearing_request = req_create_request ).
        proxy->journal_entry_bulk_clearing_re(
               EXPORTING
               input = request
                              ).

      CATCH cx_soap_destination_error INTO DATA(soap_destination_error).


      CATCH cx_ai_system_fault INTO DATA(ai_system_fault).


    ENDTRY.
  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.

    DATA : asim0130s TYPE TABLE FOR READ RESULT yi_asim0130n,
           asim0130  TYPE STRUCTURE FOR READ RESULT yi_asim0130n.

    DATA : req_je_arapitem    TYPE zjournal_entry_clearing_reque5,
           req_je_arapitemT   TYPE TABLE OF zjournal_entry_clearing_reque5,

           req_journal_entry  TYPE zjournal_entry_clearing_reque2,
           req_create_reqitem TYPE zjournal_entry_clearing_reque1,
           req_create_request TYPE TABLE OF zjournal_entry_clearing_reque1.



    "시나리오 이름으로 통신이 존재하는지 확인
    DATA: lr_cscn TYPE if_com_scenario_factory=>ty_query-cscn_id_range.
    lr_cscn = VALUE #( ( sign = 'I' option = 'EQ' low = 'ZCS_JE_001' ) ).

    DATA(lo_factory) = cl_com_arrangement_factory=>create_instance( ).
    lo_factory->query_ca(
          EXPORTING
            is_query           = VALUE #( cscn_id_range = lr_cscn )
          IMPORTING
            et_com_arrangement = DATA(lt_ca)
        ).

    "해당 시나리오가 존재 하지 않으면 종료
"조회 한 값 중 1번째 값
        DATA(lo_ca) = lt_ca[ 1 ].
    TRY.
*
        "APAR items
        CLEAR: req_je_arapitem, req_je_arapitemT.

        req_je_arapitem-reference_document_item = '1'.
        req_je_arapitem-company_code = '4310'.
        req_je_arapitem-account_type = 'K'.
        req_je_arapitem-aparaccount = '0001000030'.
        req_je_arapitem-fiscal_year = '2024'.
        req_je_arapitem-accounting_document = '5100000160'.
        req_je_arapitem-accounting_document_item = '1'.

        APPEND req_je_arapitem TO req_je_arapitemT.
        CLEAR req_je_arapitem.

        req_je_arapitem-reference_document_item = '2'.
        req_je_arapitem-company_code = '4310'.
        req_je_arapitem-account_type = 'K'.
        req_je_arapitem-aparaccount = '0001000030'.
        req_je_arapitem-fiscal_year = '2024'.
        req_je_arapitem-accounting_document = '5100000161'.
        req_je_arapitem-accounting_document_item = '1'.

        APPEND req_je_arapitem TO req_je_arapitemT.
        CLEAR req_je_arapitem.

        "Header
        CLEAR: req_journal_entry, req_create_reqitem, req_create_request.

        req_journal_entry-company_code = '4310'.
        req_journal_entry-accounting_document_type = 'AB'.
        req_journal_entry-document_date = '20240214'.
        req_journal_entry-posting_date = '20240214'.
        req_journal_entry-currency_code = 'KRW'.
        req_journal_entry-currency_translation_date = '20240214'.
        req_journal_entry-document_header_text = 'BKLV12475' && '선급전환'.
        req_journal_entry-created_by_user = 'CC0000000002'.
        req_journal_entry-aparitems = req_je_arapitemT.

        req_create_reqitem-journal_entry = req_journal_entry.
        APPEND req_create_reqitem TO req_create_request.

*        DATA(destination) = cl_soap_destination_provider=>create_by_url( i_url = 'https://my407000.s4hana.cloud.sap:443/sap/bc/srt/scs_ext/sap/journalentrybulkclearingreques' ).

        DATA(destination) = cl_soap_destination_provider=>create_by_comm_arrangement(
            comm_scenario  = 'ZCS_JE_001' ).
*            service_id     = 'ZSTD_JE_CLEARING_001_SPRX'
*            comm_system_id = lo_ca->get_comm_system_id( ) ).

        DATA(proxy) = NEW zco_journal_entry_bulk_clearin( destination = destination ).

        DATA(request) = VALUE zjournal_entry_bulk_clearing_1( journal_entry_bulk_clearing_re-journal_entry_clearing_request = req_create_request ).
        proxy->journal_entry_bulk_clearing_re(
               EXPORTING
               input = request
                              ).

        COMMIT WORK.
      CATCH cx_soap_destination_error INTO DATA(soap_destination_error).


      CATCH cx_ai_system_fault INTO DATA(ai_system_fault).


    ENDTRY.

  ENDMETHOD.
ENDCLASS.

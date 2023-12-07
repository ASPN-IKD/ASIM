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

CLASS lhc_YI_ASIM0100N IMPLEMENTATION.

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

    "시나리오 이름으로 통신이 존재하는지 확인
    DATA: lr_cscn TYPE if_com_scenario_factory=>ty_query-cscn_id_range.
    lr_cscn = VALUE #( ( sign = 'I' option = 'EQ' low = 'ZCS_IG_001' ) ).

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

      DATA(ShelfLifeExpYear)  = substring( val =  ls_result-Vfdat len = 4 ).
      DATA(ShelfLifeExpMonth) = substring( val =  ls_result-Vfdat off = 4 len = 2 ).
      DATA(ShelfLifeExpDay)   = substring( val =  ls_result-Vfdat off = 6 len = 2 ).

      DATA(ManufactureYear)  = substring( val =  ls_result-Hsdat len = 4 ).
      DATA(ManufactureMonth) = substring( val =  ls_result-Hsdat off = 4 len = 2 ).
      DATA(ManufactureDay)   = substring( val =  ls_result-HSdat off = 6 len = 2 ).

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
                                           '"ShelfLifeExpirationDate":"' && ShelfLifeExpYear && '-' && ShelfLifeExpMonth && '-' && ShelfLifeExpDay && 'T00:00:00' && '",' &&
                                           '"ManufactureDate":"' && ManufactureYear && '-' && ManufactureMonth && '-' && ManufactureDay && 'T00:00:00' && '"' &&
                                           '}'.
    ENDLOOP.

    DATA(DocumentYear)  = substring( val =  gr_header-BudatGr len = 4 ).
    DATA(DocumentMonth) = substring( val =  gr_header-BudatGr off = 4 len = 2 ).
    DATA(DocumentDay)   = substring( val =  gr_header-BudatGr off = 6 len = 2 ).

    " post할 데이터 가공
    DATA(json) =
        '{' &&
        ' "DocumentDate":"' && DocumentYear && '-' && DocumentMonth && '-' && DocumentDay && 'T00:00:00' && '",' &&
        ' "PostingDate":"' && DocumentYear && '-' && DocumentMonth && '-' && DocumentDay && 'T00:00:00' && '",' &&
        ' "MaterialDocumentHeaderText":"' && gr_header-bktxt && '",' &&
        ' "ReferenceDocument":"' && gr_header-reqmu && '",' &&
        ' "GoodsMovementCode":"' && '01' && '",' &&
        ' "to_MaterialDocumentItem":{' &&
        '  "results":[{' &&
        '  ' && matdocitem_json &&
        '  ]' &&
        ' }' &&
        '}'.

    "GET
    TRY.
        DATA(lo_dest) = cl_http_destination_provider=>create_by_comm_arrangement(
            comm_scenario  = 'ZCS_IG_001'
            service_id     = 'ZSTD_IG_001_REST'
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
            comm_scenario  = 'ZCS_IG_001'
            service_id     = 'ZSTD_IG_001_REST'
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
*    IF ( result_msg CS '"severity":"error"' ).
*      result_msg = substring_before( val = substring_after( val = body
*                                                            sub = '"message":"' )
*                                     sub = '"' ).
*    ENDIF.

    IF ( result_msg CS ',"value":"' ).
      result_msg = substring_before( val = substring_after( val = body
                                                            sub = ',"value":"' )
                                     sub = '"' ).
    ENDIF.

    ""PurchaseOrder": 를 포함한 문자열 일때만 parsing
    "IF ( result_msg CS 'A_MaterialDocumentHeader(MaterialDocument' ).
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

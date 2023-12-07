CLASS lhc_YI_ASIM0040N DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PUBLIC SECTION.
    CLASS-DATA: return_msg TYPE string.

  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR yi_asim0040n RESULT result.

    METHODS calc_value FOR DETERMINE ON SAVE
      IMPORTING keys FOR yi_asim0040n~calc_value.

    METHODS d_calc_value FOR DETERMINE ON SAVE
      IMPORTING keys FOR yi_asim0040n~d_calc_total.

    METHODS api_error FOR VALIDATE ON SAVE
      IMPORTING keys FOR yi_asim0040n~api_error.
*
*    METHODS create_po FOR MODIFY
*        IMPORTING keys FOR ACTION yi_asim0040n~create_po RESULT result.

    DATA : success TYPE c LENGTH 1 VALUE 'X'.

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

CLASS lhc_YI_ASIM0040N IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  "HTTP 통신을 위한 셋팅
  METHOD get_connection.
    DATA(dest) = cl_http_destination_provider=>create_by_url( url ).
    result = cl_web_http_client_manager=>create_by_http_destination( dest ).
  ENDMETHOD.

  METHOD calc_value.
    TRY.
        IF success EQ 'X'.
          "CBO Read - Item 현재 선택해서 넘어오는 Item
          READ ENTITIES OF yi_asim0040n IN LOCAL MODE
          ENTITY yi_asim0040n
          ALL FIELDS
              WITH CORRESPONDING #( keys )
          RESULT DATA(lt_item_result)
          FAILED    DATA(lt_item_failed)
          REPORTED  DATA(lt_item_reported).

          DATA : parentUUID TYPE string.

          IF lt_item_result IS NOT INITIAL.
            parentUUID = lt_item_result[ 1 ]-ParentUUID.
          ENDIF.

          SORT lt_item_result BY ItemIndex ASCENDING.

          "CBO Read - Header
          READ ENTITIES OF yi_asim0030n
          ENTITY yi_asim0030n
          ALL FIELDS
              WITH VALUE #( ( Uuid = parentUUID ) )
          RESULT DATA(lt_result)
          FAILED    DATA(lt_failed)
          REPORTED  DATA(lt_reported).

          DATA : asim0040s TYPE TABLE FOR UPDATE     yi_asim0040n,
                 asim0040  TYPE STRUCTURE FOR UPDATE yi_asim0040n,

                 asim0030s TYPE TABLE FOR UPDATE     yi_asim0030n,
                 asim0030  TYPE STRUCTURE FOR UPDATE yi_asim0030n,

                 total     TYPE p VALUE 0,
                 bliNp     TYPE i VALUE 10.

          "CBO Read - Item 해당 Table
          SELECT blinp, blmwr FROM yi_asim0040n WHERE ParentUUID = @parentUUID INTO TABLE @DATA(lt_item_result2).

          "[2023-09-19;김서현;Itmno 내림차순으로 정렬].
          SORT lt_item_result2 BY blinp DESCENDING.

          "기존에 Item이 존재하면 해당 값에 10더한 값으로 초기값 설정
          IF lt_item_result2 IS NOT INITIAL.
            bliNp = lt_item_result2[ 1 ]-blinp + 10.
          ENDIF.

          "[2023-09-22;김서현;Key로 넘어온 ItmNo는 제외하고 조회하기].
          DATA : select_total TYPE p VALUE 0,
                 select_bliNp TYPE string.

          LOOP AT lt_item_result INTO DATA(ls_item_result).
            IF select_bliNp IS NOT INITIAL.
              select_bliNp = select_bliNp && ','.
            ENDIF.

            select_bliNp = select_bliNp && '''' && ls_item_result-Blinp && ''''.
          ENDLOOP.

          CONCATENATE 'BLINP' 'NOT' 'IN' '(' select_bliNp ')' INTO select_bliNp SEPARATED BY space.

          SELECT blinp, blmwr FROM yi_asim0040n WHERE ParentUUID = @parentUUID AND (select_bliNp) INTO TABLE @lt_item_result2.

          "Key로 넘어오지 않은 값들의 누적 계산
          LOOP AT lt_item_result2 INTO DATA(ls_item_result2).
            select_total += ls_item_result2-Blmwr.
          ENDLOOP.

          "Item 값 설정
          CLEAR : ls_item_result.
          LOOP AT lt_item_result INTO ls_item_result.
            asim0040 = CORRESPONDING #( ls_item_result ).

            "[2023-09-19;김서현;기존 ItemNo가 있는것은 제외하고 해당 값의 가장 큰 값 + 10으로 처리]
            IF asim0040-Blinp IS INITIAL.
              "Item No 채번
              asim0040-Blinp = bliNp.
              asim0040-Ebelp = bliNp.
              ls_item_result-Blinp = bliNp.
              ls_item_result-Ebelp = bliNp.
            ENDIF.

            "Header의 연도로 처리
            asim0040-Reqyr = lt_result[ 1 ]-Reqyr.

            asim0040-Bliyr = lt_result[ 1 ]-Bliyr.

            "Header의 번호로 처리
            asim0040-Reqno = lt_result[ 1 ]-Reqno.

            "Header의 B/L 번호
            asim0040-Blino = lt_result[ 1 ]-Blino.

            "금액 = 수량 * 단가 * 가격단위
            "Peinh값이 0임..
            "asim0020-reqwr = asim0020-Reqmg * asim0020-Reqnr * asim0020-Peinh.
            "[2023-10-11;이연성; 수량x금액 결과 / 가격단위 값을 최종 반영]
            IF asim0040-blmwr IS INITIAL.
              asim0040-blmwr = ( asim0040-blmng * asim0040-blmpr ) / asim0040-blpnh.
            ENDIF.
            "Header에 반영할 Item Total 계산
            total += asim0040-blmwr.

            APPEND asim0040 TO asim0040s.
            MODIFY lt_item_result FROM ls_item_result TRANSPORTING Blinp Ebelp WHERE Uuid = ls_item_result-Uuid.
            CLEAR : asim0040.
            bliNp += 10.
          ENDLOOP.

          "Header 값 설정 : Item 게산 한 값으로 Header의 총 금액 업데이트
          LOOP AT lt_result INTO DATA(ls_result).
            asim0030 = CORRESPONDING #( ls_result ).

            "선택된 값들의 total과 선택되지 않은 데이터의 total
            asim0030-blamt = total + select_total.

            "통화 설정
*                asim0010-Waers = currency.
*                asim0010-Opwrs = currency.
*                asim0010-bbwrs = currency.

            APPEND asim0030 TO asim0030s.
            CLEAR : asim0030.
          ENDLOOP.

          "CBO Update
          IF asim0030s IS NOT INITIAL AND success EQ 'X'.
            MODIFY ENTITIES OF yi_asim0030n
            ENTITY yi_asim0030n UPDATE SET FIELDS WITH asim0030s
            MAPPED   DATA(ls_mapped_modify)
            FAILED   DATA(lt_failed_modify)
            REPORTED DATA(lt_reported_modify).
          ENDIF.
          IF asim0040s IS NOT INITIAL AND success EQ 'X'.
            MODIFY ENTITIES OF yi_asim0040n IN LOCAL MODE
            ENTITY yi_asim0040n UPDATE SET FIELDS WITH asim0040s
            MAPPED   DATA(ls_item_mapped_modify)
            FAILED   DATA(lt_item_failed_modify)
            REPORTED DATA(lt_item_reported_modify).
          ENDIF.

          "update를 추가하니, 계속 타는 문제 발생... 한번만 타기위해 추가함.
          "실패하지 않은 경우
          IF lt_failed_modify IS INITIAL AND lt_item_failed_modify IS INITIAL.
            success = ''.

            "시나리오 이름으로 통신이 존재하는지 확인
            DATA: lr_cscn TYPE if_com_scenario_factory=>ty_query-cscn_id_range.
            lr_cscn = VALUE #( ( sign = 'I' option = 'EQ' low = 'ZCS_PO_001' ) ).

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

            "Order UUID 기준으로 데이터 조회
*                READ ENTITIES OF yi_asim0040n IN LOCAL MODE
*                ENTITY yi_asim0040n
*                ALL FIELDS WITH VALUE #( ( keys ) )
*                RESULT DATA(lt_parent).
*
*                DATA(parentUUID) = lt_parent[ 1 ]-ParentUUID.
*
*                READ ENTITIES OF yi_asim0030n
*                ENTITY yi_asim0030n
*                ALL FIELDS WITH VALUE #( ( Uuid = parentUUID ) )
*                RESULT DATA(lt_header).
*
*                READ ENTITIES OF yi_asim0040n IN LOCAL MODE
*                ENTITY yi_asim0040n
*                ALL FIELDS WITH VALUE #( ( Uuid ) )
*                RESULT DATA(lt_item).
*
*                DATA(header) = lt_header[ 1 ].

            "Item Body
            DATA : prc_json TYPE string.
            DATA : sche_json TYPE string.
            DATA : item_json TYPE string.

            LOOP AT lt_item_result INTO DATA(ls_item).

              IF ls_item-Zdc1_p IS NOT INITIAL.

                prc_json = prc_json && '"ConditionType":"' && 'ZDC1' && '",' &&
                                       '"ConditionRateValue":"' && ls_item-Zdc1_p  && '",' &&
                                       '"ConditionCurrency":"' && '' && '",' &&
                                       '"ConditionQuantityUnit":"' && '' && '"' &&
                                       '}'.
              ENDIF.

              IF ls_item-Zdc2_p IS NOT INITIAL.

                IF ( prc_json <> '').
                  prc_json = prc_json && ',{'.
                ENDIF.

                prc_json = prc_json && '"ConditionType":"' && 'ZDC2' && '",' &&
                                       '"ConditionRateValue":"' && ls_item-Zdc2_p  && '",' &&
                                       '"ConditionCurrency":"' && '' && '",' &&
                                       '"ConditionQuantityUnit":"' && '' && '"' &&
                                       '}'.
              ENDIF.

              IF ls_item-eindt IS NOT INITIAL.
                IF ( sche_json <> '' ).
                  sche_json = sche_json && ',{'.
                ENDIF.

                DATA(DeliveryYear)  = substring( val = ls_item-eindt len = 4 ).
                DATA(DeliveryMonth) = substring( val = ls_item-eindt off = 4 len = 2 ).
                DATA(DeliveryDay)   = substring( val = ls_item-eindt off = 6 len = 2 ).

                sche_json = sche_json && '"ScheduleLine":"' && '1' && '",' &&
                                         '"ScheduleLineDeliveryDate":"' && DeliveryYear && '-' && DeliveryMonth && '-' && DeliveryDay && 'T00:00:00' && '"' &&
                                         '}'.
              ENDIF.

              IF ( item_json <> '' ).
                item_json = item_json && ',{'.
              ENDIF.

              item_json = item_json && '"PurchaseOrderItem":"' && ls_item-ebelp && '",' &&
                                       '"Plant":"' && ls_item-Werks && '",' &&
                                       '"StorageLocation":"' && ls_item-lgort && '",' &&
                                       '"OrderQuantity":"' && ls_item-blmng && '",' &&
                                       '"PurchaseOrderQuantityUnit":"' && ls_item-blmns && '",' &&
                                       '"OrderPriceUnit":"' && ls_item-blmns && '",' &&
                                       '"NetPriceAmount":"' && ls_item-blmpr && '",' &&
                                       '"TaxCode":"' && 'V0' && '",' &&
                                       '"GoodsReceiptIsExpected": true,' &&
                                       '"GoodsReceiptIsNonValuated": false,' &&
                                       '"InvoiceIsExpected": true,' &&
                                       '"InvoiceIsGoodsReceiptBased": false,' &&
                                       '"PurchaseRequisition":"' && ls_item-zebeln && '",' &&
                                       '"PurchaseRequisitionItem":"' && ls_item-zebelp && '",' &&
                                       '"IsReturnsItem": false,' &&
                                       '"Material":"' && ls_item-matnr && '",' &&
                                       '"PurchasingItemIsFreeOfCharge": false'.
              IF prc_json IS NOT INITIAL.
                IF prc_json IS NOT INITIAL.
                  item_json = item_json && ','.
                ENDIF.
                item_json = item_json && ' "to_PurchaseOrderPricingElement":{' &&
                                         '  "results":[{' &&
                                         '  ' && prc_json &&
                                         '  ]' &&
                                         ' }'.
              ENDIF.

              IF sche_json IS NOT INITIAL.
                IF prc_json IS NOT INITIAL.
                  item_json = item_json && ','.
                ENDIF.
                item_json = item_json && ' "to_ScheduleLine":{' &&
                                         '  "results":[{' &&
                                         '  ' && sche_json &&
                                         '  ]' &&
                                         ' }' &&
                                         '}'.
              ENDIF.

              IF prc_json IS INITIAL AND sche_json IS INITIAL.
                item_json = item_json && '}'.
              ENDIF.

              CLEAR : prc_json, sche_json.
            ENDLOOP.

            DATA(OrderYear)  = substring( val = sy-datum len = 4 ).
            DATA(OrderMonth) = substring( val = sy-datum off = 4 len = 2 ).
            DATA(OrderDday)  = substring( val = sy-datum off = 6 len = 2 ).

            DATA(header) = lt_result[ 1 ].
            " post할 데이터 가공
            DATA(json) =
                '{' &&
                ' "CompanyCode":"' && header-Bukrs && '",' &&
                ' "PurchaseOrderType":"' && 'NB' && '",' &&
                ' "Supplier":"' && header-lifnr && '",' &&
                ' "Language":"' && 'KO' && '",' &&
                ' "PaymentTerms":"' && header-Zterm && '",' &&
                ' "PurchasingOrganization":"' && header-Ekorg && '",' &&
                ' "PurchasingGroup":"' && header-ekgrp && '",' &&
                "' "PurchaseOrderDate":"' && orderyear && '-' && ordermonth && '-' && orderdday && '",' &&
                ' "PurchaseOrderDate":"' && orderyear && '-' && ordermonth && '-' && orderdday && 'T00:00:00' && '",' &&
                ' "DocumentCurrency":"' && header-waers && '",' &&
                ' "IncotermsClassification":"' &&  header-inco1 && '",' &&
                ' "CorrespncExternalReference":"' && header-reqmu && '",' &&
                ' "CorrespncInternalReference":"' && header-reqno && '",' &&
                ' "to_PurchaseOrderItem":{' &&
                '  "results":[{' &&
                '  ' && item_json &&
                '  ]' &&
                ' }' &&
                '}'.

            "GET
            TRY.
                DATA(lo_dest) = cl_http_destination_provider=>create_by_comm_arrangement(
                    comm_scenario  = 'ZCS_PO_001'
                    service_id     = 'ZSTD_PO_001_REST'
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
                    comm_scenario  = 'ZCS_PO_001'
                    service_id     = 'ZSTD_PO_001_REST'
                    comm_system_id = lo_ca->get_comm_system_id( ) ).
                lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_dest ).
                lo_request  = lo_http_client->get_http_request( ).

                "json body 설정
                lo_request->set_text( json ).
                "GET에서 가져왔던 cookie, token값 셋팅
                LOOP AT cookies INTO DATA(cookie).
                  lo_request->set_cookie( i_name = cookie-name i_value = cookie-value ).
                ENDLOOP.

                lo_request->set_header_field( i_name = content_type   i_value = json_content ).
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
            DATA result_status TYPE string.

            result_status = status.
            result_msg    = body.

            " en,value를 포함한 문자열 일때만 parsing
            IF ( result_msg CS ',"value":"' ).
              result_msg = substring_before( val = substring_after( val = result_msg
                                                                    sub = ',"value":"' )
                                             sub = '"' ).
            ENDIF.

            ""PurchaseOrder": 를 포함한 문자열 일때만 parsing
            IF ( result_msg CS '"PurchaseOrder":' ).
              " PurchaseOrder"뒤에 오는 문자열 조회
              order_id   = substring_before( val = substring_after( val = result_msg
                                                                    sub = '"PurchaseOrder":' )
                                             sub = ',"' ).

              " 찾은 order id에서 " -> 공백으로 replace, occ = 전체 변경
              order_id   = replace( val  = order_id
                                    sub  = '"'
                                    with = ''
                                    occ  = 0 ).
              result_msg = ''.
            ENDIF.

            CLEAR : asim0030, asim0030s.

            "Header 값 설정 : Item 게산 한 값으로 Header의 총 금액 업데이트
            LOOP AT lt_result INTO DATA(ls_result_u).
              asim0030 = CORRESPONDING #( ls_result_u ).
              asim0030-Ebeln = order_id.
              asim0030-ReturnMsg = result_msg.
              IF result_msg IS NOT INITIAL.
                asim0030-loekz = 'X'.
              ENDIF.
              APPEND asim0030 TO asim0030s.
                CLEAR : asim0030.
              ENDLOOP.

              CLEAR : ls_item_result, asim0040, asim0040s.
              LOOP AT lt_item_result INTO ls_item_result.
                asim0040 = CORRESPONDING #( ls_item_result ).

                asim0040-ebeln = order_id.
*                  DATA(item_no)  = substring_before( val = substring_after( val = substring_after( val = result_msg
*                                                                                                   sub = '"PurchaseOrderItem":"' &&  ( ls_item_result-Itmno , 2)  )
*                                                                            sub = '"Material"')
*                                                     sub = ',"' ).
*
*                  item_no   = replace( val  = item_no
*                                        sub  = '"'
*                                        with = ''
*                                        occ  = 0 ).

                "  asim0040-Ebelp = ls_item_result-blinp.

                IF result_msg IS NOT INITIAL.
                    asim0040-loekz = 'X'.
                    lhc_yi_asim0040n=>return_msg = result_msg.
                ENDIF.

                APPEND asim0040 TO asim0040s.
                CLEAR : asim0040.
              ENDLOOP.
              " CBO 데이터 업데이트
              MODIFY ENTITIES OF yi_asim0030n
              ENTITY yi_asim0030n UPDATE SET FIELDS WITH asim0030s
              MAPPED   DATA(ls_mapped_modify_update)
              FAILED   DATA(lt_failed_modify_update)
              REPORTED DATA(lt_reported_modify_update).

              MODIFY ENTITIES OF yi_asim0040n IN LOCAL MODE
              ENTITY yi_asim0040n UPDATE SET FIELDS WITH asim0040s
              MAPPED   DATA(ls_item_mapped_modify2)
              FAILED   DATA(lt_item_failed_modify2)
              REPORTED DATA(lt_item_reported_modify2).

            ENDIF.
          ENDIF.

*        "CBO Update
          "=====================[2023-09-15;김서현;헤더 reqYr, reqno 채번 시, item도 해당 값 적용] END =====================
        CATCH cx_root INTO DATA(result).
          EXIT.
      ENDTRY.
    ENDMETHOD.

    METHOD d_calc_value.

      TRY.
          DATA(uuid) = keys[ 1 ]-Uuid.

          "삭제 할 ITEM중 한개의 UUID로 PARENT UUID 구함
          SELECT DISTINCT ParentUUID FROM yi_asim0040n WHERE Uuid = @uuid INTO TABLE @DATA(lt_result_0040).
            DATA(lv_uuid) = lt_result_0040[ 1 ]-ParentUUID.

            DATA : lv_del_total TYPE i VALUE 0.

            LOOP AT keys INTO DATA(key).

              "삭제할 item의 BLMWR 구함.
              SELECT blmwr FROM yi_asim0040n WHERE Uuid = @key-Uuid INTO @DATA(lv_blmwr). ENDSELECT.

              "삭제할 ITEM의 총합
              lv_del_total = lv_del_total + lv_blmwr.

            ENDLOOP.

            "parentuuid로 된 전체 reqwr 구함
            SELECT SUM( blmwr ) FROM yi_asim0040n WHERE ParentUUID = @lv_uuid INTO @DATA(lv_total).

              "CBO Read - Header
              READ ENTITIES OF yi_asim0030n
              ENTITY yi_asim0030n
              ALL FIELDS
                  WITH VALUE #( ( Uuid = lv_uuid ) )
              RESULT DATA(lt_result)
              FAILED    DATA(lt_failed)
              REPORTED  DATA(lt_reported).

              DATA : asim0030s TYPE TABLE FOR UPDATE     yi_asim0030n,
                     asim0030  TYPE STRUCTURE FOR UPDATE yi_asim0030n.

              "Header 값 설정 : Item SUM으로 구해서 해당 값으로 업데이트
              LOOP AT lt_result INTO DATA(ls_result).
                asim0030 = CORRESPONDING #( ls_result ).

                "전체값 - 삭제 선택된 item들의 합
                asim0030-blamt = lv_total - lv_del_total.

                APPEND asim0030 TO asim0030s.
                CLEAR : asim0030.
              ENDLOOP.

              "CBO Update
              IF asim0030s IS NOT INITIAL.
                MODIFY ENTITIES OF yi_asim0030n
                ENTITY yi_asim0030n UPDATE SET FIELDS WITH asim0030s
                MAPPED   DATA(ls_mapped_modify)
                FAILED   DATA(lt_failed_modify)
                REPORTED DATA(lt_reported_modify).
              ENDIF.

            CATCH cx_root INTO DATA(result).
              EXIT.
          ENDTRY.

        ENDMETHOD.

        METHOD api_error.

            READ ENTITIES OF yi_asim0040n IN LOCAL MODE
                ENTITY yi_asim0040n
                ALL FIELDS
                    WITH CORRESPONDING #( keys )
                RESULT DATA(lt_item_result)
                FAILED    DATA(lt_item_failed)
                REPORTED  DATA(lt_item_reported).
*
*            SORT lt_item_result BY ItemIndex ASCENDING.
*
*            IF lt_item_result IS NOT INITIAL.
*              DATA(parentUUID) = lt_item_result[ 1 ]-ParentUUID.
*            ENDIF.

            IF lhc_YI_ASIM0040N=>return_msg IS NOT INITIAL.
              LOOP AT lt_item_result INTO DATA(ls_result).

                APPEND VALUE #( %tky = ls_result-%tky ) TO failed-yi_asim0040n.
                APPEND VALUE #( %tky = ls_result-%tky %state_area = 'api_error' %msg = new_message( id = 'YASIM_MSG' number = 001 severity = if_abap_behv_message=>severity-error v1 = return_msg ) ) TO reported-yi_asim0040n.

              ENDLOOP.
            ENDIF.

        ENDMETHOD.

ENDCLASS.

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
    METHODS create_po FOR MODIFY
      IMPORTING keys FOR ACTION yi_asim0040n~create_po RESULT result.
*
*    METHODS create_po FOR MODIFY
*        IMPORTING keys FOR ACTION yi_asim0040n~create_po RESULT result.

    DATA : success TYPE c LENGTH 1 VALUE 'X'.

    TYPES:
      "스탠다드 API Response Information
      BEGIN OF post_result,
        post_body   TYPE string,
        post_status TYPE string,
      END OF post_result,

      BEGIN OF json_data,
        header TYPE zst_test_001,
        BEGIN OF to_PurchaseOrderItem,
          results TYPE zst_test_item_001,
        END OF to_PurchaseOrderItem,
      END OF json_data.

    DATA: http_client TYPE REF TO zcl_if_common_001.

    "상수
    CONSTANTS:
      c_scenario TYPE string VALUE 'ZCS_PO_001',
      c_service  TYPE string VALUE 'ZSTD_PO_001_REST',
      c_service2 TYPE string VALUE 'ZSTD_PO_ITEM_001_REST',
      c_service3 TYPE string VALUE 'ZSTD_PO_SCHE_001_REST'.

ENDCLASS.

CLASS lhc_YI_ASIM0040N IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD calc_value.
    TRY.
        IF success EQ 'X'.

          DATA : lt_json TYPE json_data.

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

            DATA(is_exist) = 'X'.
            "수입계약 품목 테이블에 해당 구매오더 번호가 존재하는지 확인.
            IF ls_result-Ebeln IS NOT INITIAL.
              SELECT COUNT( * )
                FROM yi_asim0020n
               WHERE Ebeln = @ls_result-Ebeln
               INTO @DATA(lv_count).

              "수입계약 품목에 해당 구매 오더가 존재하면, 스탠다드 수정 안함
              IF lv_count > 0.
                EXIT.
              ENDIF.
            ENDIF.

            "통신 규약 존재 확인
            CREATE OBJECT me->http_client
              EXPORTING
                i_scenario     = c_scenario
                i_service      = c_service
              EXCEPTIONS
                no_arrangement = 1.

            CHECK sy-subrc <> 1.

            "구매 오더 번호 없으면, 신규 생성
            IF ls_result-Ebeln IS INITIAL.

              "Item Body
              DATA : prc_json TYPE string.
              DATA : sche_json TYPE string.
              DATA : item_json TYPE string.

              LOOP AT lt_item_result INTO DATA(ls_item).

                IF ls_item-Zdc1_p IS NOT INITIAL.

                  prc_json = prc_json && '"ConditionType":"' && 'ZDC1' && '",' &&
                                         '"ConditionRateValue":"' && ls_item-Zdc1_p && '",' &&
                                         '"ConditionCurrency":"' && '' && '",' &&
                                         '"ConditionQuantityUnit":"' && '' && '"' &&
                                         '}'.
                ENDIF.

                IF ls_item-Zdc2_p IS NOT INITIAL.

                  IF ( prc_json <> '').
                    prc_json = prc_json && ',{'.
                  ENDIF.

                  prc_json = prc_json && '"ConditionType":"' && 'ZDC2' && '",' &&
                                         '"ConditionRateValue":"' && ls_item-Zdc2_p && '",' &&
                                         '"ConditionCurrency":"' && '' && '",' &&
                                         '"ConditionQuantityUnit":"' && '' && '"' &&
                                         '}'.
                ENDIF.

                IF ls_item-eindt IS NOT INITIAL.
                  IF ( sche_json <> '' ).
                    sche_json = sche_json && ',{'.
                  ENDIF.

                  DATA(DeliveryDate)  = ls_item-eindt+0(4) && '-' && ls_item-eindt+4(2) && '-' && ls_item-eindt+6(2) && 'T00:00:00'.

                  sche_json = sche_json && '"ScheduleLine":"' && '1' && '",' &&
                                           '"ScheduleLineDeliveryDate":"' && DeliveryDate && '"' &&
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
                                         '"NetPriceQuantity":"' && ls_item-Blpnh && '",' &&
                                         '"TaxCode":"' && 'V0' && '",' &&
                                         '"GoodsReceiptIsExpected": true,' &&
                                         '"GoodsReceiptIsNonValuated": false,' &&
                                         '"InvoiceIsExpected": true,' &&
                                         '"InvoiceIsGoodsReceiptBased": false,' &&
                                         '"PurchaseContract":"' && ls_item-zebeln && '",' &&
                                         '"PurchaseContractItem":"' && ls_item-zebelp && '",' &&
                                         '"IsReturnsItem": false,' &&
                                         '"Material":"' && ls_item-matnr && '",' &&
                                         '"PurchasingItemIsFreeOfCharge": false'.

                IF prc_json IS NOT INITIAL.
                  IF item_json IS NOT INITIAL.
                    item_json = item_json && ','.
                  ENDIF.

                  item_json = item_json && ' "to_PurchaseOrderPricingElement":{' &&
                                           '  "results":[{' &&
                                           '  ' && prc_json &&
                                           '  ]' &&
                                           ' }'.
                ENDIF.

                IF sche_json IS NOT INITIAL.
                  IF item_json IS NOT INITIAL.
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

              DATA(orderDate)  = sy-datum+0(4) && '-' && sy-datum+4(2) && '-' && sy-datum+6(2) && 'T00:00:00'.

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
                  ' "PurchaseOrderDate":"' && orderDate && '",' &&
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
              DATA result_status TYPE string.

              result_status = status.
              result_msg    = body.

              DATA : lr_data TYPE REF TO data.


*              /ui2/cl_json=>deserialize(
*                EXPORTING
*                  json         = result_msg
*                  pretty_name  = /ui2/cl_json=>pretty_mode-user
*                  assoc_arrays = abap_true
*
*                CHANGING
*                  data         = lr_data ).
*
*              FIELD-SYMBOLS:
*                <body>      TYPE any,
*                <error>     TYPE any,
*                <data>      TYPE any,
*                <inn_error> TYPE any,
*                <err_de>    TYPE any,
*                <msg_table> TYPE any,
*                <mes_struc> TYPE any,
*                <message>   TYPE any.
*
*
*              ASSIGN      lr_data->* TO <body>.
*              ASSIGN COMPONENT 'ERROR' OF STRUCTURE <body> TO <error>.
*              ASSIGN <error>->* TO <inn_error>.
*              ASSIGN COMPONENT 'INNERERROR' OF STRUCTURE <inn_error> TO <err_de>.
*              ASSIGN <err_de>->* TO <msg_table>.
*              ASSIGN COMPONENT 'ERRORDETAILS' OF STRUCTURE <msg_table> TO <mes_struc>.
*              ASSIGN <mes_struc>->* TO <message>.
*
*
*              FIELD-SYMBOLS: <fs_line>    TYPE any,
*                             <fs_message> TYPE any,
*                             <fs_string>  TYPE any,
*                             <return_msg> TYPE string.
*
*
*
*              IF <message> IS ASSIGNED.
*                LOOP AT <message> ASSIGNING <fs_line>.
*                  ASSIGN <fs_line>->* TO <fs_message>.
*                  ASSIGN COMPONENT 'MESSAGE' OF STRUCTURE <fs_message> TO <fs_string>.
*                  IF <fs_string> IS ASSIGNED.
*                    ASSIGN <fs_string>->* TO <return_msg>.
*                    lhc_yi_asim0040n=>return_msg = <return_msg>.
*
*                  ENDIF.
*                ENDLOOP.
*              ENDIF.



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

                IF result_msg IS NOT INITIAL.
                  asim0040-loekz = 'X'.
                  lhc_yi_asim0040n=>return_msg = result_msg.
                ENDIF.

                APPEND asim0040 TO asim0040s.
                CLEAR : asim0040.
              ENDLOOP.
            ENDIF.

          ENDIF.

          "구매 오더 번호가 존재하는 경우 -> 스탠다드 업데이트
          IF ls_result-Ebeln IS NOT INITIAL.

            LOOP AT lt_item_result INTO DATA(ls_item2).

              "수정된 항목 확인
              SELECT Blmng, Eindt
                FROM yi_asim0040n
               WHERE Uuid = @ls_item2-Uuid
               INTO TABLE @DATA(lt_item).

              "수량이 수정된 경우
              IF lt_item[ 1 ]-Blmng NE ls_item2-Blmng.
                json =
                    '{' &&
                        '"Plant":"' && ls_item2-Werks && '",' &&
                        '"StorageLocation":"' && ls_item2-lgort && '",' &&
                        '"OrderQuantity":"' && ls_item2-blmng && '",' &&
                        '"PurchaseOrderQuantityUnit":"' && ls_item2-blmns && '",' &&
                        '"Material":"' && ls_item2-matnr && '"' &&
                    '}'.

                "GET
                CREATE OBJECT me->http_client
                  EXPORTING
                    i_scenario     = c_scenario
                    i_service      = c_service2
                  EXCEPTIONS
                    no_arrangement = 1.

                CHECK sy-subrc <> 1.

                "GET TOKEN
                token = me->http_client->get_token_cookies( ).

                DATA(order) = '''' && ls_item2-Ebeln && ''''.
                DATA(item)  = '''' && ls_item2-ebelp && ''''.
                DATA(uri) = '(PurchaseOrder=' && order && ',PurchaseOrderItem=' && item && ')'.

                "PATCH
                IF token IS NOT INITIAL.
                  me->http_client->patch(
                    EXPORTING
                        uri    = uri
                       json    = json
                    IMPORTING
                        body   = body
                        status = status
                    ).
                ENDIF.

                "호출 후 결과 값 확인
                IF status NE 204.
                  lhc_yi_asim0040n=>return_msg = body.
                ENDIF.

              ENDIF.

              "납품일이 수정된 경우
              IF lt_item[ 1 ]-Eindt NE ls_item2-Eindt.

                DATA(scheDate)  = ls_item2-eindt+0(4) && '-' && ls_item2-eindt+4(2) && '-' && ls_item2-eindt+6(2) && 'T00:00:00'.

                json =
                    '{' &&
                        '"ScheduleLineDeliveryDate":"' && scheDate && '"' &&
                    '}'.

                "통신 규약 존재 확인
                CREATE OBJECT me->http_client
                  EXPORTING
                    i_scenario     = c_scenario
                    i_service      = c_service3
                  EXCEPTIONS
                    no_arrangement = 1.

                CHECK sy-subrc <> 1.

                "GET TOKEN
                token = me->http_client->get_token_cookies( ).

                order = '''' && ls_item2-Ebeln && ''''.
                item  = '''' && ls_item2-ebelp && ''''.
                uri = '(PurchasingDocument=' && order && ',PurchasingDocumentItem=' && item && ',ScheduleLine=' && '''1''' && ')'.

                "PATCH
                IF token IS NOT INITIAL.
                  me->http_client->patch(
                    EXPORTING
                        uri    = uri
                       json    = json
                    IMPORTING
                        body   = body
                        status = status
                    ).
                ENDIF.

                "호출 후 결과 값 확인
                IF status NE '204'.
                  lhc_yi_asim0040n=>return_msg = body.
                ENDIF.

              ENDIF.
            ENDLOOP.
          ENDIF.

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

  METHOD create_po.
  ENDMETHOD.

ENDCLASS.

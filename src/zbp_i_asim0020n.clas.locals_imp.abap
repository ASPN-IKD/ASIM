CLASS lhc_YI_ASIM0020N DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR yi_asim0020n RESULT result.

    METHODS calc_value FOR DETERMINE ON SAVE
      IMPORTING keys FOR yi_asim0020n~calc_value.

    "[2023-10-25;김서현;삭제시 total 계산을 위한 함수 생성]
    METHODS d_calc_value FOR DETERMINE ON SAVE
      IMPORTING keys FOR yi_asim0020n~d_calc_total.

    DATA :
        SUCCESS TYPE c LENGTH 1 VALUE 'X'.
ENDCLASS.

CLASS lhc_YI_ASIM0020N IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  "=====================[2023-09-15;김서현;헤더 reqYr, reqno 채번 시, item도 해당 값 적용] START =====================
  METHOD calc_value.

    TRY.
        "CBO Read - Item 현재 선택해서 넘어오는 Item
        READ ENTITIES OF yi_asim0020n IN LOCAL MODE
        ENTITY yi_asim0020n
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
        READ ENTITIES OF yi_asim0010n
        ENTITY yi_asim0010n
        ALL FIELDS
            WITH VALUE #( ( Uuid = parentUUID ) )
        RESULT DATA(lt_result)
        FAILED    DATA(lt_failed)
        REPORTED  DATA(lt_reported).

        DATA : asim0020s TYPE TABLE FOR UPDATE     yi_asim0020n,
               asim0020  TYPE STRUCTURE FOR UPDATE yi_asim0020n,

               asim0010s TYPE TABLE FOR UPDATE     yi_asim0010n,
               asim0010  TYPE STRUCTURE FOR UPDATE yi_asim0010n,

               total     TYPE p VALUE 0,
               itemNo    TYPE i VALUE 10.

        "CBO Read - Item 해당 Table
        "SELECT Itmno, reqwr FROM yi_asim0020n WHERE ParentUUID = @parentUUID INTO TABLE @DATA(lt_item_result2).
        SELECT Itmno, reqwr FROM yi_asim0020n WHERE ParentUUID = @parentUUID INTO TABLE @DATA(lt_item_result2).

        "[2023-09-19;김서현;Itmno 내림차순으로 정렬].
        SORT lt_item_result2 BY Itmno DESCENDING.

        "기존에 Item이 존재하면 해당 값에 10더한 값으로 초기값 설정
        IF lt_item_result2 IS NOT INITIAL.
            itemNo = lt_item_result2[ 1 ]-itmNo + 10.
        ENDIF.

        "[2023-09-22;김서현;Key로 넘어온 ItmNo는 제외하고 조회하기].
        DATA : select_total TYPE P VALUE 0,
               select_itmNo TYPE string.

        LOOP AT lt_item_result INTO DATA(ls_item_result).
            IF select_itmNo IS NOT INITIAL.
                select_itmNo = select_itmNo && ','.
            ENDIF.

            select_itmNo = select_itmNo && '''' && ls_item_result-Itmno && ''''.
        ENDLOOP.

        CONCATENATE 'Itmno' 'NOT' 'IN' '(' select_itmNo ')' INTO select_itmNo SEPARATED BY space.

        "SELECT Itmno, reqwr FROM yi_asim0020n WHERE ParentUUID = @parentUUID AND Itmno NOT IN ( '0010','0020' ) INTO TABLE @lt_item_result2.
        SELECT Itmno, reqwr FROM yi_asim0020n WHERE ParentUUID = @parentUUID AND (select_itmNo) INTO TABLE @lt_item_result2.

        "Key로 넘어오지 않은 값들의 누적 계산
        LOOP AT lt_item_result2 INTO DATA(ls_item_result2).
            select_total += ls_item_result2-Reqwr.
        ENDLOOP.

        "공급업체 조회해서 통화단위 설정
        "SELECT * FROM I_SupplierPurchasingOrg WHERE Supplier = @bp AND PurchasingOrganization = @po INTO @DATA(lt_supplier). ENDSELECT.

*        DATA : bp, po TYPE string.
*        bp =  lt_result[ 1 ]-Lifnr.
*        po = lt_result[ 1 ]-Ekorg.

        "Item 값 설정
        CLEAR : ls_item_result.
        LOOP AT lt_item_result INTO ls_item_result.
            asim0020 = CORRESPONDING #( ls_item_result ).

            "[2023-09-19;김서현;기존 ItemNo가 있는것은 제외하고 해당 값의 가장 큰 값 + 10으로 처리]
            IF asim0020-Itmno IS INITIAL.
                "Item No 채번
                asim0020-Itmno = itemNo.
            ENDIF.

            "Header의 연도로 처리
            asim0020-Reqyr = lt_result[ 1 ]-Reqyr.

            "Header의 번호로 처리
            asim0020-Reqno = lt_result[ 1 ]-Reqno.

            "금액 = 수량 * 단가 * 가격단위
            "Peinh값이 0임..
            "asim0020-reqwr = asim0020-Reqmg * asim0020-Reqnr * asim0020-Peinh.
            "[2023-10-11;이연성; 수량x금액 결과 / 가격단위 값을 최종 반영]
            IF asim0020-Reqwr IS INITIAL.
                asim0020-Reqwr = ( asim0020-Reqmg * asim0020-Reqnr ) / asim0020-Peinh.
            ENDIF.
            "Header에 반영할 Item Total 계산
            total += asim0020-Reqwr.

            "통화 설정
*            asim0020-waers = currency.

            APPEND asim0020 TO asim0020s.
            CLEAR : asim0020.
            itemNo += 10.
        ENDLOOP.

        "Header 값 설정 : Item 게산 한 값으로 Header의 총 금액 업데이트
        LOOP AT lt_result INTO DATA(ls_result).
            asim0010 = CORRESPONDING #( ls_result ).

            "선택된 값들의 total과 선택되지 않은 데이터의 total
            asim0010-Netwr = total + select_total.

            "통화 설정
*            asim0010-Waers = currency.
*            asim0010-Opwrs = currency.
*            asim0010-bbwrs = currency.

            APPEND asim0010 TO asim0010s.
            CLEAR : asim0010.
        ENDLOOP.

        "CBO Update
        IF asim0010s IS NOT INITIAL AND SUCCESS EQ 'X'.
            MODIFY ENTITIES OF yi_asim0010n
            ENTITY yi_asim0010n UPDATE SET FIELDS WITH asim0010s
            MAPPED   DATA(ls_mapped_modify)
            FAILED   DATA(lt_failed_modify)
            REPORTED DATA(lt_reported_modify).
        ENDIF.
        IF asim0020s IS NOT INITIAL AND SUCCESS EQ 'X'.
            MODIFY ENTITIES OF yi_asim0020n IN LOCAL MODE
            ENTITY yi_asim0020n UPDATE SET FIELDS WITH asim0020s
            MAPPED   DATA(ls_item_mapped_modify)
            FAILED   DATA(lt_item_failed_modify)
            REPORTED DATA(lt_item_reported_modify).
        ENDIF.

        "update를 추가하니, 계속 타는 문제 발생... 한번만 타기위해 추가함.
        "실패하지 않은 경우
        IF lt_failed_modify IS INITIAL AND lt_item_failed_modify IS INITIAL.
            SUCCESS = ''.
        ENDIF.
*        "CBO Update
        "=====================[2023-09-15;김서현;헤더 reqYr, reqno 채번 시, item도 해당 값 적용] END =====================
      CATCH cx_root INTO DATA(result).
        EXIT.
    ENDTRY.
  ENDMETHOD.

  METHOD d_calc_value.

    TRY.
        DATA(UUID) = KEYS[ 1 ]-Uuid.

        "삭제 할 ITEM중 한개의 UUID로 PARENT UUID 구함
        SELECT DISTINCT ParentUUID FROM yi_asim0020n WHERE Uuid = @UUID INTO TABLE @DATA(lt_result_0020).
        DATA(LV_UUID) = lt_result_0020[ 1 ]-ParentUUID.

        DATA : LV_DEL_TOTAL TYPE I VALUE 0.

        LOOP AT KEYS INTO DATA(KEY).

            "삭제할 item의 reqwr구함.
            SELECT Reqwr FROM yi_asim0020n WHERE Uuid = @key-Uuid INTO @DATA(LV_REQWR). ENDSELECT.

            "삭제할 ITEM의 총합
            LV_DEL_TOTAL = LV_DEL_TOTAL + LV_REQWR.

        ENDLOOP.

        "parentuuid로 된 전체 reqwr 구함
        SELECT SUM( REQWR ) FROM yi_asim0020n WHERE ParentUUID = @LV_UUID INTO @DATA(LV_TOTAL).

        "CBO Read - Header
        READ ENTITIES OF yi_asim0010n
        ENTITY yi_asim0010n
        ALL FIELDS
            WITH VALUE #( ( Uuid = LV_UUID ) )
        RESULT DATA(lt_result)
        FAILED    DATA(lt_failed)
        REPORTED  DATA(lt_reported).

        DATA : asim0010s TYPE TABLE FOR UPDATE     yi_asim0010n,
               asim0010  TYPE STRUCTURE FOR UPDATE yi_asim0010n.

        "Header 값 설정 : Item SUM으로 구해서 해당 값으로 업데이트
        LOOP AT lt_result INTO DATA(ls_result).
            asim0010 = CORRESPONDING #( ls_result ).

            "전체값 - 삭제 선택된 item들의 reqwr
            asim0010-Netwr = LV_TOTAL - LV_DEL_TOTAL.

            APPEND asim0010 TO asim0010s.
            CLEAR : asim0010.
        ENDLOOP.

        "CBO Update
        IF asim0010s IS NOT INITIAL.
            MODIFY ENTITIES OF yi_asim0010n
            ENTITY yi_asim0010n UPDATE SET FIELDS WITH asim0010s
            MAPPED   DATA(ls_mapped_modify)
            FAILED   DATA(lt_failed_modify)
            REPORTED DATA(lt_reported_modify).
        ENDIF.

      CATCH cx_root INTO DATA(result).
        EXIT.
    ENDTRY.

  ENDMETHOD.

ENDCLASS.

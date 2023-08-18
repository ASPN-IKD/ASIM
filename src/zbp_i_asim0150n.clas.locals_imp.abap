CLASS lhc_YI_ASIM0150N DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR YI_ASIM0150N RESULT result.

    METHODS referCreate FOR MODIFY
      IMPORTING keys FOR ACTION Head~referCreate.

    METHODS setInit FOR DETERMINE ON SAVE
      IMPORTING keys FOR Head~setInit.

ENDCLASS.

CLASS lhc_YI_ASIM0150N IMPLEMENTATION.

  "필드 값에 따른 버튼 권한 부여
  METHOD get_instance_authorizations.

    READ ENTITIES OF yi_asim0150n IN LOCAL MODE
        ENTITY Head
        FIELDS ( Imche ) WITH CORRESPONDING #( keys )
        RESULT DATA(refer_create)
        FAILED failed.

    "imche값이 1(참조하여 이미 생성함)인 경우 해당 action 버튼 비활성화 처리
    result =
        VALUE #(
            FOR refer IN refer_create
            LET statusval = COND #(   WHEN refer-Imche = '1'
                                      THEN if_abap_behv=>fc-o-disabled
                                      ELSE if_abap_behv=>fc-o-enabled )
                                      IN ( %tky = refer-%tky
                                      %action-referCreate = statusval
                                  )
               ).
  ENDMETHOD.

  "데이터 Create시, 초기 값 설정
  METHOD setInit.

    "Update할 대상 담을 변수 생성
    DATA :
      datas TYPE TABLE FOR UPDATE     yi_asim0150n,
      data  TYPE STRUCTURE FOR UPDATE yi_asim0150n.

    CLEAR : datas, data.

    "데이터 조회
    READ ENTITIES OF yi_asim0150n IN LOCAL MODE
         ENTITY Head
          ALL FIELDS
            "keys 값 설정
            WITH CORRESPONDING #( keys )
            RESULT DATA(lt_result)
        FAILED    DATA(lt_failed)
        REPORTED  DATA(lt_reported).

    "데이터 조회2
    DATA : maxCnt TYPE Ebeln.
    SELECT MAX( Ebeln ) FROM yi_asim0150n INTO @maxCnt.

    "조회한 데이터 값 변경
    LOOP AT lt_result INTO DATA(ls_result).
        data = CORRESPONDING #( ls_result ).

        "상태 변경
        data-Imche = '0'.
        maxCnt += 1.
        data-Ebeln = maxCnt.

        "전기일(오늘날짜)
        data-Budat = SY-datum.
        "회계연도(오늘 날짜의 - 연도)
        data-gjahr = SY-datum(4).

        APPEND data TO datas.
    ENDLOOP.

    "CBO 데이터 업데이트
    MODIFY ENTITIES OF yi_asim0150n IN LOCAL MODE
    ENTITY Head UPDATE SET FIELDS WITH datas
    MAPPED   DATA(lt_mapped_modify)
    FAILED   DATA(lt_failed2_modify)
    REPORTED DATA(lt_reported_modify).
  ENDMETHOD.

  "선택한 데이터 읽어와서 마감참조번호(belnr) - 참조완료로 값 변경
  METHOD referCreate.

    "Update할 대상 담을 변수 생성
    DATA :
      datas TYPE TABLE FOR UPDATE     yi_asim0150n,
      data  TYPE STRUCTURE FOR UPDATE yi_asim0150n.

    CLEAR : datas, data.

    "데이터 조회
    READ ENTITIES OF yi_asim0150n IN LOCAL MODE
         ENTITY Head
          ALL FIELDS
            "keys 값 설정
            WITH CORRESPONDING #( keys )
            RESULT DATA(lt_result)
        FAILED    DATA(lt_failed)
        REPORTED  DATA(lt_reported).

    "조회한 데이터 값 변경
    LOOP AT lt_result INTO DATA(ls_result).

        "수입 완료된 항목만 참조 생성 가능.
        IF ls_result-Imche eq 0.
            data = CORRESPONDING #( ls_result ).

            "마감 참조 번호
            data-Belnr = '참조완료'.
            "상태 변경
            data-Imche = '1'.

            APPEND data TO datas.
        ENDIF.
    ENDLOOP.

    "CBO 데이터 업데이트
    MODIFY ENTITIES OF yi_asim0150n IN LOCAL MODE
    ENTITY Head UPDATE SET FIELDS WITH datas
    MAPPED   DATA(lt_mapped_modify)
    FAILED   DATA(lt_failed2_modify)
    REPORTED DATA(lt_reported_modify).

  ENDMETHOD.

ENDCLASS.

*CLASS lsc_YI_ASIM0150N DEFINITION INHERITING FROM cl_abap_behavior_saver.
*  PROTECTED SECTION.
*
*    METHODS save_modified REDEFINITION.
*
*    METHODS cleanup_finalize REDEFINITION.
*
*ENDCLASS.
*
*CLASS lsc_YI_ASIM0150N IMPLEMENTATION.
*
*  METHOD save_modified.
*  ENDMETHOD.
*
*  METHOD cleanup_finalize.
*  ENDMETHOD.
*
*ENDCLASS.

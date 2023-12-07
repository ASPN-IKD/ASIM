CLASS lhc_YI_ASIM0030N DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR yi_asim0030n RESULT result.

  METHODS create_number FOR DETERMINE ON SAVE
      IMPORTING keys FOR yi_asim0030n~create_number.

ENDCLASS.

CLASS lhc_YI_ASIM0030N IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create_number.
    DATA : asim0030s TYPE TABLE FOR UPDATE yi_asim0030n,
           asim0030  TYPE STRUCTURE FOR UPDATE yi_asim0030n.

    TRY.
        "CBO Read
        READ ENTITIES OF yi_asim0030n IN LOCAL MODE
        ENTITY yi_asim0030n
        ALL FIELDS
            WITH CORRESPONDING #( keys )
        RESULT DATA(lt_result)
        FAILED    DATA(lt_failed)
        REPORTED  DATA(lt_reported).

        "현재 Header의 Blino가 존재 하지 않을때만 number range해서 header 설정 해줌.
        IF lt_result[ 1 ]-Blino IS INITIAL.
             "number range 가져오기
            cl_numberrange_runtime=>number_get(
              EXPORTING
                nr_range_nr       = '02'
                object            = 'ZNR_10_NO'
                quantity          = 1
              IMPORTING
                number            = DATA(number_range_key)
                returncode        = DATA(number_range_return_code)
                returned_quantity = DATA(number_range_returned_quantity)
            ).

            "필드 값 수정
            LOOP AT lt_result INTO DATA(ls_result).
                asim0030 = CORRESPONDING #( ls_result ).

                "오늘의 연도로 처리
                asim0030-Bliyr = sy-datum(4).

                "Blino : 1000000004
                asim0030-Blino = substring( val = number_range_key off = 10 len = 10 ).

                "reqmu : Bliyr-4자리 + Blino-6자리 2023000004
                "DATA(sub_Blino) = substring( val = asim0030-Blino off = 4 len = 6 ).
                "asim0030-Reqmu = asim0030-Bliyr && sub_Blino.

                APPEND asim0030 TO asim0030s.
                CLEAR : asim0030.
            ENDLOOP.

            "CBO Update
            MODIFY ENTITIES OF yi_asim0030n IN LOCAL MODE
            ENTITY yi_asim0030n UPDATE SET FIELDS WITH asim0030s
            MAPPED   DATA(ls_mapped_modify)
            FAILED   DATA(lt_failed_modify)
            REPORTED DATA(lt_reported_modify).
        ENDIF.

      CATCH cx_number_ranges INTO DATA(lx_number_ranges).
        EXIT.
    ENDTRY.

  ENDMETHOD.
ENDCLASS.

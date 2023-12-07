CLASS lhc_YI_ASIM0190N DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR yi_asim0190n RESULT result.
    METHODS create_number FOR DETERMINE ON SAVE
      IMPORTING keys FOR yi_asim0190n~create_number.

ENDCLASS.

CLASS lhc_YI_ASIM0190N IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create_number.

    DATA : asim0190s TYPE TABLE FOR UPDATE yi_asim0190n,
           asim0190  TYPE STRUCTURE FOR UPDATE yi_asim0190n.

    TRY.
        "CBO Read
        READ ENTITIES OF yi_asim0190n IN LOCAL MODE
        ENTITY yi_asim0190n
        ALL FIELDS
            WITH CORRESPONDING #( keys )
        RESULT DATA(lt_result)
        FAILED    DATA(lt_failed)
        REPORTED  DATA(lt_reported).

        IF lt_result[ 1 ]-Eccno IS INITIAL.
             "number range 가져오기
            cl_numberrange_runtime=>number_get(
              EXPORTING
                nr_range_nr       = '03'
                object            = 'ZNR_10_NO'
                quantity          = 1
              IMPORTING
                number            = DATA(number_range_key)
                returncode        = DATA(number_range_return_code)
                returned_quantity = DATA(number_range_returned_quantity)
            ).

*            "필드 값 수정
            LOOP AT lt_result INTO DATA(ls_result).
                asim0190 = CORRESPONDING #( ls_result ).

                "통관예정연도 = 통관예정일의 연도로 처리, 통관예정일이 없는 경우 오늘날짜의 연도로 처리
                DATA(year) = asim0190-Eccdt(4).
                IF year IS INITIAL.
                    year = sy-datum(4).
                ENDIF.
                asim0190-Eccyr = year.

                "통관예정번호
                asim0190-Eccno = substring( val = number_range_key off = 10 len = 10 ).

                APPEND asim0190 TO asim0190s.
                CLEAR : asim0190.
            ENDLOOP.

            "CBO Update
            MODIFY ENTITIES OF yi_asim0190n IN LOCAL MODE
            ENTITY yi_asim0190n UPDATE SET FIELDS WITH asim0190s
            MAPPED   DATA(ls_mapped_modify)
            FAILED   DATA(lt_failed_modify)
            REPORTED DATA(lt_reported_modify).
        ENDIF.

      CATCH cx_number_ranges INTO DATA(lx_number_ranges).
        EXIT.
    ENDTRY.

  ENDMETHOD.

ENDCLASS.

CLASS lhc_YI_ASIM0070N DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR yi_asim0070n RESULT result.

    METHODS create_number FOR DETERMINE ON SAVE
      IMPORTING keys FOR yi_asim0070n~create_number.

ENDCLASS.

CLASS lhc_YI_ASIM0070N IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create_number.

    DATA : asim0070s TYPE TABLE FOR UPDATE yi_asim0070n,
           asim0070  TYPE STRUCTURE FOR UPDATE yi_asim0070n.

    TRY.
        "CBO Read
        READ ENTITIES OF yi_asim0070n IN LOCAL MODE
        ENTITY yi_asim0070n
        ALL FIELDS
            WITH CORRESPONDING #( keys )
        RESULT DATA(lt_header)
        FAILED    DATA(lt_header_failed)
        REPORTED  DATA(lt_header_reported).

        IF lt_header[ 1 ]-Cclno IS INITIAL.
             "number range 가져오기
            cl_numberrange_runtime=>number_get(
              EXPORTING
                nr_range_nr       = '04'
                object            = 'ZNR_10_NO'
                quantity          = 1
              IMPORTING
                number            = DATA(number_range_key)
                returncode        = DATA(number_range_return_code)
                returned_quantity = DATA(number_range_returned_quantity)
            ).

*            "필드 값 수정
            LOOP AT lt_header INTO DATA(ls_header).
                asim0070 = CORRESPONDING #( ls_header ).

                "통관번호
                asim0070-Cclno = substring( val = number_range_key off = 10 len = 10 ).

                APPEND asim0070 TO asim0070s.
                CLEAR : asim0070.
            ENDLOOP.

            "CBO Update
            MODIFY ENTITIES OF yi_asim0070n IN LOCAL MODE
            ENTITY yi_asim0070n UPDATE SET FIELDS WITH asim0070s
            MAPPED   DATA(ls_mapped_modify)
            FAILED   DATA(lt_failed_modify)
            REPORTED DATA(lt_reported_modify).
        ENDIF.

      CATCH cx_number_ranges INTO DATA(lx_number_ranges).
        EXIT.
    ENDTRY.
  ENDMETHOD.

ENDCLASS.

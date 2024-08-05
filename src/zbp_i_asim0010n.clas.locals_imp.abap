CLASS lhc_yi_asim0010n DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR yi_asim0010n RESULT result.

    METHODS create_number FOR DETERMINE ON SAVE
      IMPORTING keys FOR yi_asim0010n~create_number.

    METHODS delete_contract FOR MODIFY
      IMPORTING keys FOR ACTION yi_asim0010n~delete_contract.

    DATA : asim0010s TYPE TABLE FOR UPDATE yi_asim0010n,
           asim0010  TYPE STRUCTURE FOR UPDATE yi_asim0010n,
           asim0020s TYPE TABLE FOR UPDATE yi_asim0020n,
           asim0020  TYPE STRUCTURE FOR UPDATE yi_asim0020n.
ENDCLASS.

CLASS lhc_yi_asim0010n IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create_number.
    TRY.
        "CBO Read
        READ ENTITIES OF yi_asim0010n IN LOCAL MODE
        ENTITY yi_asim0010n
        ALL FIELDS
            WITH CORRESPONDING #( keys )
        RESULT DATA(lt_result)
        FAILED    DATA(lt_failed)
        REPORTED  DATA(lt_reported).

        "현재 Header의 reqno가 존재 하지 않을때만 number range해서 header 설정 해줌.
        IF lt_result[ 1 ]-Reqno IS INITIAL.
             "number range 가져오기
            cl_numberrange_runtime=>number_get(
              EXPORTING
                nr_range_nr       = '01'
                object            = 'ZNR_10_NO'
                quantity          = 1
              IMPORTING
                number            = DATA(number_range_key)
                returncode        = DATA(number_range_return_code)
                returned_quantity = DATA(number_range_returned_quantity)
            ).

            "필드 값 수정
            LOOP AT lt_result INTO DATA(ls_result).
                asim0010 = CORRESPONDING #( ls_result ).

                "오늘의 연도로 처리
                asim0010-Reqyr = sy-datum(4).

                "reqno : 1000000004
                asim0010-Reqno = substring( val = number_range_key off = 10 len = 10 ).

                "reqmu : reqyr-4자리 + reqno-6자리 2023000004
                DATA(sub_reqno) = substring( val = asim0010-Reqno off = 4 len = 6 ).
                asim0010-Reqmu = asim0010-Reqyr && sub_reqno.

                APPEND asim0010 TO asim0010s.
                CLEAR : asim0010.
            ENDLOOP.

            "CBO Update
            MODIFY ENTITIES OF yi_asim0010n IN LOCAL MODE
            ENTITY yi_asim0010n UPDATE SET FIELDS WITH asim0010s
            MAPPED   DATA(ls_mapped_modify)
            FAILED   DATA(lt_failed_modify)
            REPORTED DATA(lt_reported_modify).
        ENDIF.

      CATCH cx_number_ranges INTO DATA(lx_number_ranges).
        EXIT.
    ENDTRY.

  ENDMETHOD.

  METHOD delete_contract.
    "Header Read
    READ ENTITIES OF yi_asim0010n IN LOCAL MODE
    ENTITY yi_asim0010n
    ALL FIELDS
        WITH CORRESPONDING #( keys )
    RESULT    DATA(lt_result)
    FAILED    DATA(lt_failed)
    REPORTED  DATA(lt_reported).

    DATA(ls_result) = lt_result[ 1 ].

    asim0010 = CORRESPONDING #( ls_result ).
    asim0010-Loekz = 'X'.

    APPEND asim0010 TO asim0010s.

    "Header Update
    MODIFY ENTITIES OF yi_asim0010n IN LOCAL MODE
    ENTITY yi_asim0010n UPDATE SET FIELDS WITH asim0010s
    MAPPED   DATA(ls_mapped_modify)
    FAILED   DATA(lt_failed_modify)
    REPORTED DATA(lt_reported_modify).

    "Item Read
    SELECT * FROM yi_asim0020n WHERE ParentUUID = @ls_result-Uuid INTO TABLE @DATA(lt_item_result).

    LOOP AT lt_item_result INTO DATA(ls_item_result).
        asim0020 = CORRESPONDING #( ls_item_result ).
        asim0020-Loekz = 'X'.

        APPEND asim0020 TO asim0020s.
    ENDLOOP.

    "Item Update
    MODIFY ENTITIES OF yi_asim0020n
    ENTITY yi_asim0020n UPDATE SET FIELDS WITH asim0020s
    MAPPED   DATA(ls_mapped_modify_item)
    FAILED   DATA(lt_failed_modify_item)
    REPORTED DATA(lt_reported_modify_item).

  ENDMETHOD.

ENDCLASS.

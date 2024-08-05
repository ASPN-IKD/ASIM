CLASS lhc_YI_ASIM0070N DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR yi_asim0070n RESULT result.

    METHODS create_number FOR DETERMINE ON SAVE
      IMPORTING keys FOR yi_asim0070n~create_number.

      METHODS delete_contract FOR MODIFY
      IMPORTING keys FOR ACTION yi_asim0070n~delete_contract.

      DATA : asim0070s TYPE TABLE FOR UPDATE yi_asim0070n,
           asim0070  TYPE STRUCTURE FOR UPDATE yi_asim0070n,
           asim0080s TYPE TABLE FOR UPDATE yi_asim0080n,
           asim0080  TYPE STRUCTURE FOR UPDATE yi_asim0080n.

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

  METHOD delete_contract.
    "Header Read
    READ ENTITIES OF yi_asim0070n IN LOCAL MODE
    ENTITY yi_asim0070n
    ALL FIELDS
        WITH CORRESPONDING #( keys )
    RESULT    DATA(lt_result)
    FAILED    DATA(lt_failed)
    REPORTED  DATA(lt_reported).

    DATA(ls_result) = lt_result[ 1 ].

    asim0070 = CORRESPONDING #( ls_result ).
    asim0070-Loekz = 'X'.

    APPEND asim0070 TO asim0070s.

    "Header Update
    MODIFY ENTITIES OF yi_asim0070n IN LOCAL MODE
    ENTITY yi_asim0070n UPDATE SET FIELDS WITH asim0070s
    MAPPED   DATA(ls_mapped_modify)
    FAILED   DATA(lt_failed_modify)
    REPORTED DATA(lt_reported_modify).

    "Item Read
    SELECT * FROM yi_asim0080n WHERE ParentUUID = @ls_result-Uuid INTO TABLE @DATA(lt_item_result).

    LOOP AT lt_item_result INTO DATA(ls_item_result).
        asim0080 = CORRESPONDING #( ls_item_result ).
        asim0080-Loekz = 'X'.

        APPEND asim0080 TO asim0080s.
    ENDLOOP.

    "Item Update
    MODIFY ENTITIES OF yi_asim0080n
    ENTITY yi_asim0080n UPDATE SET FIELDS WITH asim0080s
    MAPPED   DATA(ls_mapped_modify_item)
    FAILED   DATA(lt_failed_modify_item)
    REPORTED DATA(lt_reported_modify_item).

  ENDMETHOD.

ENDCLASS.

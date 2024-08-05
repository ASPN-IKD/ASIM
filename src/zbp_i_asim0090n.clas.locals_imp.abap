CLASS lhc_YI_ASIM0090N DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR yi_asim0090n RESULT result.


    METHODS delete_contract FOR MODIFY
      IMPORTING keys FOR ACTION yi_asim0090n~delete_contract.

    DATA : asim0090s TYPE TABLE FOR UPDATE yi_asim0090n,
           asim0090  TYPE STRUCTURE FOR UPDATE yi_asim0090n,
           asim0100s TYPE TABLE FOR UPDATE yi_asim0100n,
           asim0100  TYPE STRUCTURE FOR UPDATE yi_asim0100n.

ENDCLASS.

CLASS lhc_YI_ASIM0090N IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD delete_contract.
    "Header Read
    READ ENTITIES OF yi_asim0090n IN LOCAL MODE
    ENTITY yi_asim0090n
    ALL FIELDS
        WITH CORRESPONDING #( keys )
    RESULT    DATA(lt_result)
    FAILED    DATA(lt_failed)
    REPORTED  DATA(lt_reported).

    DATA(ls_result) = lt_result[ 1 ].

    asim0090 = CORRESPONDING #( ls_result ).
    asim0090-Loekz = 'X'.

    APPEND asim0090 TO asim0090s.

    "Header Update
    MODIFY ENTITIES OF yi_asim0090n IN LOCAL MODE
    ENTITY yi_asim0090n UPDATE SET FIELDS WITH asim0090s
    MAPPED   DATA(ls_mapped_modify)
    FAILED   DATA(lt_failed_modify)
    REPORTED DATA(lt_reported_modify).

    "Item Read
    SELECT * FROM yi_asim0100n WHERE ParentUUID = @ls_result-Uuid INTO TABLE @DATA(lt_item_result).

    LOOP AT lt_item_result INTO DATA(ls_item_result).
        asim0100 = CORRESPONDING #( ls_item_result ).
        asim0100-Loekz = 'X'.

        APPEND asim0100 TO asim0100s.
    ENDLOOP.

    "Item Update
    MODIFY ENTITIES OF yi_asim0100n
    ENTITY yi_asim0100n UPDATE SET FIELDS WITH asim0100s
    MAPPED   DATA(ls_mapped_modify_item)
    FAILED   DATA(lt_failed_modify_item)
    REPORTED DATA(lt_reported_modify_item).

  ENDMETHOD.

ENDCLASS.

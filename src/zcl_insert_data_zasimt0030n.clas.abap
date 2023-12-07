CLASS zcl_insert_data_zasimt0030n DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

protected section.
private section.
ENDCLASS.



CLASS ZCL_INSERT_DATA_ZASIMT0030N IMPLEMENTATION.


    METHOD if_oo_adt_classrun~main.

    DATA: ls_data TYPE zasimt0030n.
    DATA: lv_uuid TYPE sysuuid_x16.

    DATA: system_uuid TYPE REF TO if_system_uuid,
          uuid        TYPE sysuuid_c32.

    DO 1 TIMES.
    system_uuid = cl_uuid_factory=>create_system_uuid( ).
    ENDDO.

    TRY.
        DELETE FROM zasimt0030n.
        DELETE FROM zasimt0040n.
    ENDTRY.



    ENDMETHOD.
ENDCLASS.

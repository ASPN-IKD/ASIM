CLASS zcl_insert_data_zasimt0020n DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

PROTECTED SECTION.
PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_INSERT_DATA_ZASIMT0020N IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

        DELETE FROM zasimt0020n.

        DELETE FROM zasimt0010n.


  ENDMETHOD.
ENDCLASS.

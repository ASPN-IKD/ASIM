CLASS zcl_delete_data_001 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_delete_data_001 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

      DELETE FROM zpogettitem001.
      DELETE FROM zpogettheader001.

  ENDMETHOD.
ENDCLASS.

CLASS zcl_insert_data_zasimt0040n DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

protected section.
private section.
ENDCLASS.



CLASS ZCL_INSERT_DATA_ZASIMT0040N IMPLEMENTATION.


    METHOD if_oo_adt_classrun~main.

    DATA: ls_data TYPE zasimt0040n.
    DATA: lv_uuid TYPE sysuuid_x16.

    DATA: system_uuid TYPE REF TO if_system_uuid,
          uuid        TYPE sysuuid_c32.

    DO 1 TIMES.
    system_uuid = cl_uuid_factory=>create_system_uuid( ).
    ENDDO.

    "TRY.
        "DELETE FROM zasimt0040n.
    "ENDTRY.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
    CATCH cx_uuid_error.
    ENDTRY.

      ls_data-client = '080'.
      ls_data-uuid = lv_uuid.
      ls_data-parentuuid = 'F546EF5CD9E71EEE9CF9174648E39E9D'.
      ls_data-bliyr = '2023'.
      ls_data-blino = '1000000226'.
      ls_data-reqyr = '2023'.
      ls_data-reqno = '2023000226'.

      TRY.
          INSERT zasimt0040n FROM @ls_data.
      ENDTRY.

    ENDMETHOD.
ENDCLASS.

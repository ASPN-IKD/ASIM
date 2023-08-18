CLASS zcl_insert_data_zasimt0030n DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
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
    ENDTRY.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
    CATCH cx_uuid_error.
    ENDTRY.

      ls_data-client = '080'.
      ls_data-uuid = lv_uuid.
      ls_data-bliyr = '2023'.
      ls_data-blino = '1000000003'.
      ls_data-reqyr = '2023'.
      ls_data-reqno = '1000000003'.
      ls_data-reqmu = '2023000003'.

      TRY.
          INSERT zasimt0030n FROM @ls_data.
      ENDTRY.

    ENDMETHOD.
ENDCLASS.
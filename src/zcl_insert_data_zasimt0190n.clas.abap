CLASS zcl_insert_data_zasimt0190n DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_insert_data_zasimt0190n IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA: ls_data TYPE zasimt0190n.
    DATA: lv_uuid TYPE sysuuid_x16.

    DATA: system_uuid TYPE REF TO if_system_uuid,
          uuid        TYPE sysuuid_c32.



    DO 1 TIMES.
    system_uuid = cl_uuid_factory=>create_system_uuid( ).

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.

    ENDTRY.
      ls_data-client = '100'.
      ls_data-uuid = lv_uuid.
      ls_data-reqyr = '2023'.
      ls_data-reqno = '1000000004'.
      LS_DATA-bliyr = '2023'.
      LS_DATA-eccno = '3000000001'.
      ls_data-reqmu = '2023000033'.
      ls_data-reqno = '1000000103'.
      ls_data-crtbu = 'CRTBUVALUE'.
      ls_data-crttm = '123456'.
      ls_data-chgnm = 'CHGNMVALUE'.
      ls_data-chgbu = 'CHGBUVALUE'.
      ls_data-chgdt = '20230630'.
      ls_data-chgtm = '123456'.
      ls_data-local_last_changed_at = '20230630123456'.
      ls_data-last_changed_at = '20230630123456'.

      TRY.
          INSERT zasimt0190n FROM @ls_data.
      ENDTRY.
    ENDDO.
  ENDMETHOD.

ENDCLASS.

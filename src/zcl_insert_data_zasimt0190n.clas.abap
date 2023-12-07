CLASS zcl_insert_data_zasimt0190n DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_INSERT_DATA_ZASIMT0190N IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    DATA: ls_data1 TYPE zasimt0190n.
    DATA: ls_data2 TYPE zasimt0200n.
    DATA: lv_uuid1 TYPE sysuuid_x16.
    DATA: lv_uuid2 TYPE sysuuid_x16.

    DATA: system_uuid TYPE REF TO if_system_uuid,
          uuid        TYPE sysuuid_c32.

    DO 1 TIMES.
    system_uuid = cl_uuid_factory=>create_system_uuid( ).
    ENDDO.

    TRY.
        DELETE FROM zasimt0190n.
    ENDTRY.

    TRY.
        DELETE FROM zasimt0200n.
    ENDTRY.

*    TRY.
*        lv_uuid1 = system_uuid->create_uuid_x16( ).
*    CATCH cx_uuid_error.
*    ENDTRY.
*
*      ls_data1-client = '080'.
*      ls_data1-uuid = lv_uuid1.
*      ls_data1-eccno = '3000000000'.
*      ls_data1-eccyr = '2023'.
*      ls_data1-reqyr = '2023'.
*      ls_data1-reqno = '1000000004'.
*      ls_data1-reqmu = '2023000004'.
*      ls_data1-bukrs = '2000'.
*      ls_data1-ekorg = '2100'.
*      ls_data1-loekz = ''.
*      ls_data1-crtbu = 'CRTBUVALUE'.
*      ls_data1-crttm = '123456'.
*      ls_data1-chgnm = 'CHGNMVALUE'.
*      ls_data1-chgbu = 'CHGBUVALUE'.
*      ls_data1-chgdt = '20230630'.
*      ls_data1-chgtm = '123456'.
*      ls_data1-local_last_changed_at = '20230630123456'.
*      ls_data1-last_changed_at = '20230630123456'.
*
*      TRY.
*          INSERT zasimt0190n FROM @ls_data1.
*      ENDTRY.
*
*
*
*      DO 1 TIMES.
*    system_uuid = cl_uuid_factory=>create_system_uuid( ).
*
*    TRY.
*        lv_uuid2 = system_uuid->create_uuid_x16( ).
*      CATCH cx_uuid_error.
*
*    ENDTRY.
*      ls_data2-client = '100'.
*      ls_data2-uuid = lv_uuid2.
*      ls_data2-ParentUUID = lv_uuid1.
*      ls_data2-eccno = '3000000000'.
*      ls_data2-eccyr = '2023'.
*      ls_data2-reqyr = '2023'.
*      ls_data2-reqno = '1000000004'.
*      ls_data2-itmno = 20.
*      ls_data2-werks = '2100'.
*      ls_data2-lgort = '2100'.
*      ls_data2-matnr = '0000000004'.
*      ls_data2-crtbu = 'CRTBUVALUE'.
*      ls_data2-crttm = '123456'.
*      ls_data2-chgnm = 'CHGNMVALUE'.
*      ls_data2-chgbu = 'CHGBUVALUE'.
*      ls_data2-chgdt = '20230630'.
*      ls_data2-chgtm = '123456'.
*      ls_data2-local_last_changed_at = '20230630123456'.
*      ls_data2-last_changed_at = '20230630123456'.
*
*      TRY.
*          INSERT zasimt0200n FROM @ls_data2.
*      ENDTRY.
*    ENDDO.


  ENDMETHOD.
ENDCLASS.

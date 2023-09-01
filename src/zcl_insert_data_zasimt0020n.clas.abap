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
    DATA: ls_data TYPE zasimt0020n.
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
      ls_data-ParentUUID = '51273E16A2301EDE90994D31739BCE92'.
      ls_data-reqyr = '2023'.
      ls_data-reqno = '1000000003'.
      ls_data-itmno = 20.
      ls_data-werks = '2100'.
      ls_data-lgort = '2100'.
      ls_data-matnr = '0000000004'.
      ls_data-reqmg = 10.
      ls_data-reqms = 'EA'.
      ls_data-reqnr = 1000.
      ls_data-peinh = '1'.
      ls_data-reqwr = 10000.
      ls_data-waers = 'KRW'.
      ls_data-blsep = 'B'.
      ls_data-remak = 'Test'.
      ls_data-crtbu = 'CRTBUVALUE'.
      ls_data-crttm = '123456'.
      ls_data-chgnm = 'CHGNMVALUE'.
      ls_data-chgbu = 'CHGBUVALUE'.
      ls_data-chgdt = '20230630'.
      ls_data-chgtm = '123456'.
      ls_data-local_last_changed_at = '20230630123456'.
      ls_data-last_changed_at = '20230630123456'.

      TRY.
          INSERT zasimt0020n FROM @ls_data.
      ENDTRY.
    ENDDO.

  ENDMETHOD.
ENDCLASS.

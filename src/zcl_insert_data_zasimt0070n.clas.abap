CLASS zcl_insert_data_zasimt0070n DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

PROTECTED SECTION.
private section.
ENDCLASS.



CLASS ZCL_INSERT_DATA_ZASIMT0070N IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: ls_data TYPE zasimt0070n.
    DATA: ls_data2 TYPE zasimt0080n.
    DATA: lv_uuid1 TYPE sysuuid_x16.
    DATA: lv_uuid2 TYPE sysuuid_x16.

    DATA: system_uuid TYPE REF TO if_system_uuid,
          uuid        TYPE sysuuid_c32.

    DO 1 TIMES.
      system_uuid = cl_uuid_factory=>create_system_uuid( ).
    ENDDO.

    TRY.
        DELETE FROM zasimt0070n.
    ENDTRY.

    TRY.
        DELETE FROM zasimt0080n.
    ENDTRY.

*    TRY.
*        lv_uuid1 = system_uuid->create_uuid_x16( ).
*      CATCH cx_uuid_error.
*    ENDTRY.
*
*    ls_data-client = '100'.
*    ls_data-uuid = lv_uuid1.
*    ls_data-cclno = '4000000001'.
*    ls_data-cclyr = '2022'.
*    ls_data-reqmu = '2022000003'.
*    ls_data-reqno = '1000000017'.
*    ls_data-reqyr = '2022'.
*    ls_data-blino = '2000000018'.
*    ls_data-bliyr = '2022'.
*    ls_data-decno = 'R12-192830-M12'.
*    ls_data-cclif = '030'.
*    ls_data-decdt = '20220801'.
*    ls_data-ccldt = '20220801'.
*    ls_data-ccper = '1294'.
*    ls_data-local_last_changed_at = '20230630123456'.
*    ls_data-last_changed_at = '20230630123456'.
*
*    TRY.
*        INSERT zasimt0070n FROM @ls_data.
*    ENDTRY.

ENDMETHOD.
ENDCLASS.

CLASS zcl_insert_data_zasimt0070n DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_insert_data_zasimt0070n IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA: ls_data TYPE zasimt0070n.
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
      ls_data-cclno = '4000000001'.
      ls_data-cclyr = '2022'.
      LS_DATA-reqmu = '2022000003'.
      LS_DATA-reqno = '1000000017'.
      LS_DATA-reqyr = '2022'.
      ls_data-blino = '2000000018'.
      ls_data-bliyr = '2022'.
      ls_data-decno = 'R12-192830-M12'.
      ls_data-cclif = '030'.
      ls_data-decdt = '20220801'.
      ls_data-ccldt = '20220801'.
      ls_data-ccper = '1294'.
      ls_data-local_last_changed_at = '20230630123456'.
      ls_data-last_changed_at = '20230630123456'.

      TRY.
          INSERT zasimt0070n FROM @ls_data.
      ENDTRY.
    ENDDO.
  ENDMETHOD.

ENDCLASS.

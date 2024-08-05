CLASS zcl_insert_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

protected section.
private section.
ENDCLASS.



CLASS ZCL_INSERT_DATA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA: ls_data TYPE zasimt0010n.
    DATA: lv_uuid TYPE sysuuid_x16.

    DATA: system_uuid TYPE REF TO if_system_uuid,
          uuid        TYPE sysuuid_c32.

    DATA: ls_data1 TYPE zasimtboolean.

          ls_data1-yboolean = ''.
           INSERT zasimtboolean FROM @ls_data1.

*    DO 1 TIMES.

*       system_uuid = cl_uuid_factory=>create_system_uuid( ).
*
*    TRY.
*        lv_uuid = system_uuid->create_uuid_x16( ).
*      CATCH cx_uuid_error.
*
*    ENDTRY.
*
*      ls_data-client = '080'.
*      ls_data-uuid = lv_uuid.
*      ls_data-reqyr = '2023'.
*      ls_data-reqno = '1000000003'.
*      ls_data-reqmu = '2023000003'.
*      ls_data-reqdt = '20230630'.
*      ls_data-bukrs = '2000'.
*      ls_data-ekorg = '2100'.
*      ls_data-ekgrp = '001'.
*      ls_data-lifnr = '0001000000'.
*      ls_data-loekz = ''.
*      ls_data-lifre = '1000000'.
*      ls_data-inco1 = 'FOB'.
*      ls_data-inco2 = 'Busan'.
*      ls_data-zterm = 'U900'.
*      ls_data-zcdno1 = 'KR01'.
*      ls_data-zcdno2 = 'T01'.
*      ls_data-zcdno3 = 'US01'.
*      ls_data-zcdno4 = 'G01'.
*      ls_data-netwr = '2000.00'.
*      ls_data-waers = 'USD'.
*      ls_data-opdat = '20230630'.
*      ls_data-opbnk = 'B01'.
*      ls_data-opnum = 'OPNUMVALUE'.
*      ls_data-opamt = '2000.00'.
*      ls_data-opwrs = 'USD'.
*      ls_data-pterm = 'P01'.
*      ls_data-zbd1t = 30.
*      ls_data-pedat = '20230630'.
*      ls_data-pdate = '20230630'.
*      ls_data-oedat = '20230630'.
*      ls_data-oplif = '1000'.
*      ls_data-sdate = '20230630'.
*      ls_data-edate = '20230630'.
*      ls_data-colif = '1000'.
*      ls_data-filif = ''.
*      ls_data-cont1 = 'FS10000NA'.
*      ls_data-cont2 = '20230630-01'.
*      ls_data-acdat = '20230630'.
*      ls_data-bokno = 'BOKNOVALUE'.
*      ls_data-conrt = 'A'.
*      ls_data-trdat = '20230630'.
*      ls_data-trbln = 'TRBLNVALUE'.
*      ls_data-rqrsf = ''.
*      ls_data-bbrsf = ''.
*      ls_data-bbamt = '2000.00'.
*      ls_data-bbwrs = 'USD'.
*      ls_data-bbdat = '20230630'.
*      ls_data-bbgb = 'AR'.
*      ls_data-rqche = ''.
*      ls_data-isdat = '20230630'.
*      ls_data-rqweek = '20'.
*      ls_data-bbno = 'BBNOVALUE'.
*      ls_data-bblif = '01'.
*      ls_data-bbrate = '98.6'.
*      ls_data-blsep = 'B'.
*      ls_data-remak = 'Test'.
*      ls_data-crtbu = 'CRTBUVALUE'.
*      ls_data-crttm = '123456'.
*      ls_data-chgnm = 'CHGNMVALUE'.
*      ls_data-chgbu = 'CHGBUVALUE'.
*      ls_data-chgdt = '20230630'.
*      ls_data-chgtm = '123456'.
*      ls_data-local_last_changed_at = '20230630123456'.
*      ls_data-last_changed_at = '20230630123456'.
*
*      TRY.
*          INSERT zasimt0010n FROM @ls_data.
*      ENDTRY.
*    ENDDO.

  ENDMETHOD.
ENDCLASS.

CLASS zcl_insert_data_zasimt0010n DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_INSERT_DATA_ZASIMT0010N IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: ls_data1 TYPE zasimt0010n.
    DATA: ls_data2 TYPE zasimt0020n.
    DATA: lv_uuid1 TYPE sysuuid_x16.
    DATA: lv_uuid2 TYPE sysuuid_x16.

    DATA: system_uuid TYPE REF TO if_system_uuid,
          uuid        TYPE sysuuid_c32.

    DO 1 TIMES.
      system_uuid = cl_uuid_factory=>create_system_uuid( ).



      TRY.
          DELETE FROM zasimt0010n.
          DELETE FROM zasimt0020n.
          DELETE FROM zasimt0030n.
          DELETE FROM zasimt0040n.
          DELETE FROM zasimt0050n.
          DELETE FROM zasimt0060n.
          DELETE FROM zasimt0070n.
          DELETE FROM zasimt0080n.
          DELETE FROM zasimt0090n.
          DELETE FROM zasimt0100n.
         DELETE FROM zasimt0130n.
          DELETE FROM zasimt0140n.
          DELETE FROM zasimt0150n.
          DELETE FROM zasimt0190n.
          DELETE FROM zasimt0200n.

      ENDTRY.

*    TRY.
*        lv_uuid1 = system_uuid->create_uuid_x16( ).
*    CATCH cx_uuid_error.
*    ENDTRY.
*
*      ls_data1-client = '080'.
*      ls_data1-uuid = lv_uuid1.
*      ls_data1-reqyr = '2023'.
*      ls_data1-reqno = '1000000004'.
*      ls_data1-reqmu = '2023000004'.
*      ls_data1-reqdt = '20230630'.
*      ls_data1-bukrs = '2000'.
*      ls_data1-ekorg = '2100'.
*      ls_data1-ekgrp = '001'.
*      ls_data1-lifnr = '0001000000'.
*      ls_data1-loekz = ''.
*      ls_data1-lifre = '1000000'.
*      ls_data1-inco1 = 'FOB'.
*      ls_data1-inco2 = 'Busan'.
*      ls_data1-zterm = 'U900'.
*      ls_data1-zcdno1 = 'KR01'.
*      ls_data1-zcdno2 = 'T01'.
*      ls_data1-zcdno3 = 'US01'.
*      ls_data1-zcdno4 = 'G01'.
*      ls_data1-netwr = '2000.00'.
*      ls_data1-waers = 'USD'.
*      ls_data1-opdat = '20230630'.
*      ls_data1-opbnk = 'B01'.
*      ls_data1-opnum = 'OPNUMVALUE'.
*      ls_data1-opamt = '2000.00'.
*      ls_data1-opwrs = 'USD'.
*      ls_data1-pterm = 'P01'.
*      ls_data1-zbd1t = 30.
*      ls_data1-pedat = '20230630'.
*      ls_data1-pdate = '20230630'.
*      ls_data1-oedat = '20230630'.
*      ls_data1-oplif = '1000'.
*      ls_data1-sdate = '20230630'.
*      ls_data1-edate = '20230630'.
*      ls_data1-colif = '1000'.
*      ls_data1-filif = ''.
*      ls_data1-cont1 = 'FS10000NA'.
*      ls_data1-cont2 = '20230630-01'.
*      ls_data1-acdat = '20230630'.
*      ls_data1-bokno = 'BOKNOVALUE'.
*      ls_data1-conrt = 'A'.
*      ls_data1-trdat = '20230630'.
*      ls_data1-trbln = 'TRBLNVALUE'.
*      ls_data1-rqrsf = ''.
*      ls_data1-bbrsf = ''.
*      ls_data1-bbamt = '2000.00'.
*      ls_data1-bbwrs = 'USD'.
*      ls_data1-bbdat = '20230630'.
*      ls_data1-bbgb = 'AR'.
*      ls_data1-rqche = ''.
*      ls_data1-isdat = '20230630'.
*      ls_data1-rqweek = '20'.
*      ls_data1-bbno = 'BBNOVALUE'.
*      ls_data1-bblif = '01'.
*      ls_data1-bbrate = '98.6'.
*      ls_data1-blsep = 'B'.
*      ls_data1-remak = 'Test'.
*
*      TRY.
*          INSERT zasimt0010n FROM @ls_data1.
*      ENDTRY.
*
*   ENDDO.
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
*      ls_data2-reqyr = '2023'.
*      ls_data2-reqno = '1000000004'.
*      ls_data2-itmno = 20.
*      ls_data2-werks = '2100'.
*      ls_data2-lgort = '2100'.
*      ls_data2-matnr = '0000000004'.
*      ls_data2-reqmg = 10.
*      ls_data2-reqms = 'EA'.
*      ls_data2-reqnr = 1000.
*      ls_data2-peinh = '1'.
*      ls_data2-reqwr = 10000.
*      ls_data2-waers = 'KRW'.
*      ls_data2-blsep = 'B'.
*      ls_data2-remak = 'Test'.
*
*
*      TRY.
*          INSERT zasimt0020n FROM @ls_data2.
*      ENDTRY.
    ENDDO.

  ENDMETHOD.
ENDCLASS.

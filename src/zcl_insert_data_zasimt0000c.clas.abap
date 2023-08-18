CLASS zcl_insert_data_zasimt0000c DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_INSERT_DATA_ZASIMT0000C IMPLEMENTATION.


    METHOD if_oo_adt_classrun~main.

    DATA: ls_data TYPE zasimt0000c.
    DATA: lv_uuid TYPE sysuuid_x16.

    DATA: system_uuid TYPE REF TO if_system_uuid,
          uuid        TYPE sysuuid_c32.

    DO 1 TIMES.
    system_uuid = cl_uuid_factory=>create_system_uuid( ).
    ENDDO.

    TRY.
        DELETE FROM zasimt0000c.
    ENDTRY.


******************************수입계약생성(수기)******************************************

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
    CATCH cx_uuid_error.
    ENDTRY.

      ls_data-client = '080'.
      ls_data-uuid = lv_uuid.
      ls_data-progid = 'IM01'.
      ls_data-viewid = 'BJIF'.
      ls_data-prognm = '수입계약생성(수기)'.
      ls_data-viewnm = '발주정보'.
      ls_data-viewob = '1'.
      ls_data-viewat = ''.
      ls_data-viewtp = 'B'.
      ls_data-usediv = 'Y'.
      ls_data-fielda = 'Bukrs|Ekorg|Ekgrp|Lifnr|Ekgrp|Zterm|Inco1|Netwr'.
      ls_data-fieldc = 'Bukrs|Ekorg|Ekgrp|Lifnr|Ekgrp|Zterm|Inco1|Netwr'.
      ls_data-fieldu = 'Lifnr|Inco1|Netwr'.
      ls_data-fieldm = 'Bukrs|Ekorg|Ekgrp'.
      ls_data-cdsvid = ''.

      TRY.
          INSERT zasimt0000c FROM @ls_data.
      ENDTRY.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
    CATCH cx_uuid_error.
    ENDTRY.

      ls_data-client = '080'.
      ls_data-uuid = lv_uuid.
      ls_data-progid = 'IM01'.
      ls_data-viewid = 'IMIF'.
      ls_data-prognm = '수입계약생성(수기)'.
      ls_data-viewnm = '수입정보'.
      ls_data-viewob = '2'.
      ls_data-viewat = ''.
      ls_data-viewtp = 'B'.
      ls_data-usediv = 'Y'.
      ls_data-fielda = 'Reqno|Lifre|Reqdt|Zcdno3|Reqmu|Colif|Acdat|Zcdno1|Filif|Conrt|Zcdno2|Cont1|Cont2|Zcdno4|Rqche'.
      ls_data-fieldc = 'Lifre|Reqdt|Zcdno3|Colif|Acdat|Zcdno1|Filif|Conrt|Zcdno2|Cont1|Cont2|Zcdno4|Rqche'.
      ls_data-fieldu = 'Lifre|Reqdt|Zcdno3|Colif|Acdat|Zcdno1|Filif|Conrt|Zcdno2|Cont1|Cont2|Zcdno4|Rqche'.
      ls_data-fieldm = 'Reqno|Lifre|Reqdt'.
      ls_data-cdsvid = ''.

      TRY.
          INSERT zasimt0000c FROM @ls_data.
      ENDTRY.

      TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
    CATCH cx_uuid_error.
    ENDTRY.

      ls_data-client = '080'.
      ls_data-uuid = lv_uuid.
      ls_data-progid = 'IM01'.
      ls_data-viewid = 'GSIF'.
      ls_data-prognm = '수입계약생성(수기)'.
      ls_data-viewnm = '개설정보'.
      ls_data-viewob = '3'.
      ls_data-viewat = ''.
      ls_data-viewtp = 'B'.
      ls_data-usediv = 'Y'.
      ls_data-fielda = 'Pterm|Opnum|Oplif|Zbd1t|Opbnk|Oedat|Pedat|Rqrsf|Opamt|Pdate|Sdate|Edate'.
      ls_data-fieldc = 'Pterm|Opnum|Oplif|Zbd1t|Opbnk|Oedat|Pedat|Rqrsf|Opamt|Pdate|Sdate|Edate'.
      ls_data-fieldu = 'Pterm|Opnum|Oplif|Zbd1t|Opbnk|Oedat|Pedat|Rqrsf|Opamt|Pdate|Sdate|Edate'.
      ls_data-fieldm = 'Pterm|Opnum|Oplif'.
      ls_data-cdsvid = ''.

      TRY.
          INSERT zasimt0000c FROM @ls_data.
      ENDTRY.


      TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
    CATCH cx_uuid_error.
    ENDTRY.

      ls_data-client = '080'.
      ls_data-uuid = lv_uuid.
      ls_data-progid = 'IM01'.
      ls_data-viewid = 'BBIF'.
      ls_data-prognm = '수입계약생성(수기)'.
      ls_data-viewnm = '부보정보'.
      ls_data-viewob = '4'.
      ls_data-viewat = ''.
      ls_data-viewtp = 'B'.
      ls_data-usediv = 'Y'.
      ls_data-fielda = 'Bbno|Bbamt|Bblif|Bbrsf|Bbgb|Bbrate|Bbdat'.
      ls_data-fieldc = 'Bbno|Bbamt|Bblif|Bbrsf|Bbgb|Bbrate|Bbdat'.
      ls_data-fieldu = 'Bbno|Bbamt|Bblif|Bbrsf|Bbgb|Bbrate|Bbdat'.
      ls_data-fieldm = 'Bbno|Bbamt|Bblif'.
      ls_data-cdsvid = ''.

      TRY.
          INSERT zasimt0000c FROM @ls_data.
      ENDTRY.

      TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
    CATCH cx_uuid_error.
    ENDTRY.

      ls_data-client = '080'.
      ls_data-uuid = lv_uuid.
      ls_data-progid = 'IM01'.
      ls_data-viewid = 'IMIT'.
      ls_data-prognm = '수입계약생성(수기)'.
      ls_data-viewnm = '품목'.
      ls_data-viewob = '5'.
      ls_data-viewat = ''.
      ls_data-viewtp = 'G'.
      ls_data-usediv = 'Y'.
      ls_data-fielda = 'Itmno|Knttp|Werks|Matnr|Lgort|Reqmg|Reqms|Reqnr|Reqwr'.
      ls_data-fieldc = 'Werks|Matnr|Lgort|Reqmg|Reqms|Reqnr'.
      ls_data-fieldu = 'Werks|Matnr|Lgort|Reqmg|Reqms|Reqnr'.
      ls_data-fieldm = 'Itmno|Knttp|Werks'.
      ls_data-cdsvid = ''.

      TRY.
          INSERT zasimt0000c FROM @ls_data.
      ENDTRY.


******************************수입계약생성(수입계약참조)******************************************

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
    CATCH cx_uuid_error.
    ENDTRY.

      ls_data-client = '080'.
      ls_data-uuid = lv_uuid.
      ls_data-progid = 'IM02'.
      ls_data-viewid = 'BJIF'.
      ls_data-prognm = '수입계약생성(수입계약참조)'.
      ls_data-viewnm = '발주정보'.
      ls_data-viewob = '1'.
      ls_data-viewat = ''.
      ls_data-viewtp = 'B'.
      ls_data-usediv = 'Y'.
      ls_data-fielda = 'Bukrs|Zterm|Ekorg|Inco1|Ekgrp|Inco2|Lifnr|Netwr|Remak'.
      ls_data-fieldc = 'Bukrs|Zterm|Ekorg|Inco1|Ekgrp|Inco2|Lifnr|Remak'.
      ls_data-fieldu = 'Bukrs|Zterm|Ekorg|Inco1|Ekgrp|Inco2|Lifnr|Remak'.
      ls_data-fieldm = 'Bukrs|Zterm|Ekorg'.
      ls_data-cdsvid = ''.

      TRY.
          INSERT zasimt0000c FROM @ls_data.
      ENDTRY.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
    CATCH cx_uuid_error.
    ENDTRY.

      ls_data-client = '080'.
      ls_data-uuid = lv_uuid.
      ls_data-progid = 'IM02'.
      ls_data-viewid = 'IMIF'.
      ls_data-prognm = '수입계약생성(수입계약참조)'.
      ls_data-viewnm = '수입정보'.
      ls_data-viewob = '2'.
      ls_data-viewat = ''.
      ls_data-viewtp = 'B'.
      ls_data-usediv = 'Y'.
      ls_data-fielda = 'Reqno|Lifre|Reqdt|Zcdno3|Reqmu|Colif|Acdat|Zcdno1|Filif|Conrt|Zcdno2|Cont1|Cont2|Zcdno4|Rqche'.
      ls_data-fieldc = 'Lifre|Reqdt|Zcdno3|Colif|Acdat|Zcdno1|Filif|Conrt|Zcdno2|Cont1|Cont2|Zcdno4|Rqche'.
      ls_data-fieldu = 'Lifre|Reqdt|Zcdno3|Colif|Acdat|Zcdno1|Filif|Conrt|Zcdno2|Cont1|Cont2|Zcdno4|Rqche'.
      ls_data-fieldm = 'Reqno|Lifre|Reqdt'.
      ls_data-cdsvid = ''.

      TRY.
          INSERT zasimt0000c FROM @ls_data.
      ENDTRY.

      TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
    CATCH cx_uuid_error.
    ENDTRY.

      ls_data-client = '080'.
      ls_data-uuid = lv_uuid.
      ls_data-progid = 'IM02'.
      ls_data-viewid = 'GSIF'.
      ls_data-prognm = '수입계약생성(수입계약참조)'.
      ls_data-viewnm = '개설정보'.
      ls_data-viewob = '3'.
      ls_data-viewat = ''.
      ls_data-viewtp = 'B'.
      ls_data-usediv = 'Y'.
      ls_data-fielda = 'Pterm|Opnum|Oplif|Zbd1t|Opbnk|Oedat|Pedat|Rqrsf|Opamt|opwrs|Pdate|Sdate|Edate'.
      ls_data-fieldc = 'Pterm|Opnum|Oplif|Zbd1t|Opbnk|Oedat|Pedat|Rqrsf|Opamt|opwrs|Pdate|Sdate|Edate'.
      ls_data-fieldu = 'Pterm|Opnum|Oplif|Zbd1t|Opbnk|Oedat|Pedat|Rqrsf|Opamt|Pdate|Sdate|Edate'.
      ls_data-fieldm = 'Pterm|Opnum|Oplif'.
      ls_data-cdsvid = ''.

      TRY.
          INSERT zasimt0000c FROM @ls_data.
      ENDTRY.

      TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
    CATCH cx_uuid_error.
    ENDTRY.

      ls_data-client = '080'.
      ls_data-uuid = lv_uuid.
      ls_data-progid = 'IM02'.
      ls_data-viewid = 'BBIF'.
      ls_data-prognm = '수입계약생성(수입계약참조)'.
      ls_data-viewnm = '부보정보'.
      ls_data-viewob = '4'.
      ls_data-viewat = ''.
      ls_data-viewtp = 'B'.
      ls_data-usediv = 'Y'.
      ls_data-fielda = 'Bbno|Bbamt|Bblif|Bbrsf|Bbgb|Bbrate|Bbdat'.
      ls_data-fieldc = 'Bbno|Bbamt|Bblif|Bbrsf|Bbgb|Bbrate|Bbdat'.
      ls_data-fieldu = 'Bbno|Bbamt|Bblif|Bbrsf|Bbgb|Bbrate|Bbdat'.
      ls_data-fieldm = 'Bbno|Bbamt|Bblif'.
      ls_data-cdsvid = ''.

      TRY.
          INSERT zasimt0000c FROM @ls_data.
      ENDTRY.

      TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
    CATCH cx_uuid_error.
    ENDTRY.

      ls_data-client = '080'.
      ls_data-uuid = lv_uuid.
      ls_data-progid = 'IM02'.
      ls_data-viewid = 'IMIT'.
      ls_data-prognm = '수입계약생성(수입계약참조)'.
      ls_data-viewnm = '품목정보'.
      ls_data-viewob = '5'.
      ls_data-viewat = ''.
      ls_data-viewtp = 'G'.
      ls_data-usediv = 'Y'.
      ls_data-fielda = 'Itmno|Knttp|Werks|Matnr|Lgort|Reqmg|Reqms|Reqnr|Reqwr'.
      ls_data-fieldc = 'Werks|Matnr|Lgort|Reqmg|Reqms|Reqnr'.
      ls_data-fieldu = 'Werks|Matnr|Lgort|Reqmg|Reqms|Reqnr'.
      ls_data-fieldm = 'Itmno|Knttp|Werks'.
      ls_data-cdsvid = ''.

      TRY.
          INSERT zasimt0000c FROM @ls_data.
      ENDTRY.


********************************수입계약생성(구매요청참조)*************************************************

      TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
    CATCH cx_uuid_error.
    ENDTRY.

      ls_data-client = '080'.
      ls_data-uuid = lv_uuid.
      ls_data-progid = 'IM03'.
      ls_data-viewid = 'BJIF'.
      ls_data-prognm = '수입계약생성(구매요청참조)'.
      ls_data-viewnm = '발주정보'.
      ls_data-viewob = '1'.
      ls_data-viewat = ''.
      ls_data-viewtp = 'B'.
      ls_data-usediv = 'Y'.
      ls_data-fielda = 'Bukrs|Zterm|Ekorg|Inco1|Ekgrp|Inco2|Lifnr|Netwr|Remak'.
      ls_data-fieldc = 'Bukrs|Zterm|Ekorg|Inco1|Ekgrp|Inco2|Lifnr|Remak'.
      ls_data-fieldu = 'Bukrs|Zterm|Ekorg|Inco1|Ekgrp|Inco2|Lifnr|Remak'.
      ls_data-fieldm = 'Bukrs|Zterm|Ekorg'.
      ls_data-cdsvid = ''.

      TRY.
          INSERT zasimt0000c FROM @ls_data.
      ENDTRY.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
    CATCH cx_uuid_error.
    ENDTRY.

      ls_data-client = '080'.
      ls_data-uuid = lv_uuid.
      ls_data-progid = 'IM03'.
      ls_data-viewid = 'IMIF'.
      ls_data-prognm = '수입계약생성(구매요청참조)'.
      ls_data-viewnm = '수입정보'.
      ls_data-viewob = '2'.
      ls_data-viewat = ''.
      ls_data-viewtp = 'B'.
      ls_data-usediv = 'Y'.
      ls_data-fielda = 'Reqno|Lifre|Reqdt|Zcdno3|Reqmu|Colif|Acdat|Zcdno1|Filif|Conrt|Zcdno2|Cont1|Cont2|Zcdno4|Rqche'.
      ls_data-fieldc = 'Lifre|Reqdt|Zcdno3|Colif|Acdat|Zcdno1|Filif|Conrt|Zcdno2|Cont1|Cont2|Zcdno4|Rqche'.
      ls_data-fieldu = 'Lifre|Reqdt|Zcdno3|Colif|Acdat|Zcdno1|Filif|Conrt|Zcdno2|Cont1|Cont2|Zcdno4|Rqche'.
      ls_data-fieldm = 'Reqno|Lifre|Reqdt'.
      ls_data-cdsvid = ''.

      TRY.
          INSERT zasimt0000c FROM @ls_data.
      ENDTRY.

      TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
    CATCH cx_uuid_error.
    ENDTRY.

      ls_data-client = '080'.
      ls_data-uuid = lv_uuid.
      ls_data-progid = 'IM03'.
      ls_data-viewid = 'GSIF'.
      ls_data-prognm = '수입계약생성(구매요청참조)'.
      ls_data-viewnm = '개설정보'.
      ls_data-viewob = '3'.
      ls_data-viewat = ''.
      ls_data-viewtp = 'B'.
      ls_data-usediv = 'Y'.
      ls_data-fielda = 'Pterm|Opnum|Oplif|Zbd1t|Opbnk|Oedat|Pedat|Rqrsf|Opamt|Pdate|Sdate|Edate'.
      ls_data-fieldc = 'Pterm|Opnum|Oplif|Zbd1t|Opbnk|Oedat|Pedat|Rqrsf|Opamt|Pdate|Sdate|Edate'.
      ls_data-fieldu = 'Pterm|Opnum|Oplif|Zbd1t|Opbnk|Oedat|Pedat|Rqrsf|Opamt|Pdate|Sdate|Edate'.
      ls_data-fieldm = 'Pterm|Opnum|Oplif'.
      ls_data-cdsvid = ''.

      TRY.
          INSERT zasimt0000c FROM @ls_data.
      ENDTRY.

      TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
    CATCH cx_uuid_error.
    ENDTRY.

      ls_data-client = '080'.
      ls_data-uuid = lv_uuid.
      ls_data-progid = 'IM03'.
      ls_data-viewid = 'BBIF'.
      ls_data-prognm = '수입계약생성(구매요청참조)'.
      ls_data-viewnm = '부보정보'.
      ls_data-viewob = '4'.
      ls_data-viewat = ''.
      ls_data-viewtp = 'B'.
      ls_data-usediv = 'Y'.
      ls_data-fielda = 'Bbno|Bbamt|Bblif|Bbrsf|Bbgb|Bbrate|Bbdat'.
      ls_data-fieldc = 'Bbno|Bbamt|Bblif|Bbrsf|Bbgb|Bbrate|Bbdat'.
      ls_data-fieldu = 'Bbno|Bbamt|Bblif|Bbrsf|Bbgb|Bbrate|Bbdat'.
      ls_data-fieldm = 'Bbno|Bbamt|Bblif'.
      ls_data-cdsvid = ''.

      TRY.
          INSERT zasimt0000c FROM @ls_data.
      ENDTRY.

      TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
    CATCH cx_uuid_error.
    ENDTRY.

      ls_data-client = '080'.
      ls_data-uuid = lv_uuid.
      ls_data-progid = 'IM03'.
      ls_data-viewid = 'IMIT'.
      ls_data-prognm = '수입계약생성(구매요청참조)'.
      ls_data-viewnm = '품목정보'.
      ls_data-viewob = '5'.
      ls_data-viewat = ''.
      ls_data-viewtp = 'G'.
      ls_data-usediv = 'Y'.
      ls_data-fielda = 'Itmno|Knttp|Werks|Matnr|Lgort|Reqmg|Reqms|Reqnr|Reqwr|Zebeln'.
      ls_data-fieldc = 'Matnr|Lgort|Reqmg|Reqms|Reqnr'.
      ls_data-fieldu = 'Matnr|Reqmg|Reqms|Reqnr'.
      ls_data-fieldm = 'Itmno|Knttp|Werks'.
      ls_data-cdsvid = ''.

      TRY.
          INSERT zasimt0000c FROM @ls_data.
      ENDTRY.


********************************수입계약생성(구매오더참조)*************************************************

      TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
    CATCH cx_uuid_error.
    ENDTRY.

      ls_data-client = '080'.
      ls_data-uuid = lv_uuid.
      ls_data-progid = 'IM04'.
      ls_data-viewid = 'BJIF'.
      ls_data-prognm = '수입계약생성(구매오더참조)'.
      ls_data-viewnm = '발주정보'.
      ls_data-viewob = '1'.
      ls_data-viewat = ''.
      ls_data-viewtp = 'B'.
      ls_data-usediv = 'Y'.
      ls_data-fielda = 'Bukrs|Zterm|Ekorg|Inco1|Ekgrp|Inco2|Lifnr|Netwr|Remak'.
      ls_data-fieldc = 'Bukrs|Zterm|Ekorg|Inco1|Ekgrp|Inco2|Lifnr|Remak'.
      ls_data-fieldu = 'Bukrs|Zterm|Ekorg|Inco1|Ekgrp|Inco2|Lifnr|Remak'.
      ls_data-fieldm = 'Bukrs|Zterm|Ekorg'.

      ls_data-cdsvid = ''.

      TRY.
          INSERT zasimt0000c FROM @ls_data.
      ENDTRY.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
    CATCH cx_uuid_error.
    ENDTRY.

      ls_data-client = '080'.
      ls_data-uuid = lv_uuid.
      ls_data-progid = 'IM04'.
      ls_data-viewid = 'IMIF'.
      ls_data-prognm = '수입계약생성(구매오더참조)'.
      ls_data-viewnm = '수입정보'.
      ls_data-viewob = '2'.
      ls_data-viewat = ''.
      ls_data-viewtp = 'B'.
      ls_data-usediv = 'Y'.
      ls_data-fielda = 'Reqno|Lifre|Reqdt|Zcdno3|Reqmu|Colif|Acdat|Zcdno1|Filif|Conrt|Zcdno2|Cont1|Cont2|Zcdno4|Rqche'.
      ls_data-fieldc = 'Lifre|Reqdt|Zcdno3|Colif|Acdat|Zcdno1|Filif|Conrt|Zcdno2|Cont1|Cont2|Zcdno4|Rqche'.
      ls_data-fieldu = 'Lifre|Reqdt|Zcdno3|Colif|Acdat|Zcdno1|Filif|Conrt|Zcdno2|Cont1|Cont2|Zcdno4|Rqche'.
      ls_data-fieldm = 'Reqno|Lifre|Reqdt'.
      ls_data-cdsvid = ''.

      TRY.
          INSERT zasimt0000c FROM @ls_data.
      ENDTRY.

      TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
    CATCH cx_uuid_error.
    ENDTRY.

      ls_data-client = '080'.
      ls_data-uuid = lv_uuid.
      ls_data-progid = 'IM04'.
      ls_data-viewid = 'GSIF'.
      ls_data-prognm = '수입계약생성(구매오더참조)'.
      ls_data-viewnm = '개설정보'.
      ls_data-viewob = '3'.
      ls_data-viewat = ''.
      ls_data-viewtp = 'B'.
      ls_data-usediv = 'Y'.
      ls_data-fielda = 'Pterm|Opnum|Oplif|Zbd1t|Opbnk|Oedat|Pedat|Rqrsf|Opamt|Pdate|Sdate|Edate'.
      ls_data-fieldc = 'Pterm|Opnum|Oplif|Zbd1t|Opbnk|Oedat|Pedat|Rqrsf|Opamt|Pdate|Sdate|Edate'.
      ls_data-fieldu = 'Pterm|Opnum|Oplif|Zbd1t|Opbnk|Oedat|Pedat|Rqrsf|Opamt|Pdate|Sdate|Edate'.
      ls_data-fieldm = 'Pterm|Opnum|Oplif'.
      ls_data-cdsvid = ''.

      TRY.
          INSERT zasimt0000c FROM @ls_data.
      ENDTRY.

      TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
    CATCH cx_uuid_error.
    ENDTRY.

      ls_data-client = '080'.
      ls_data-uuid = lv_uuid.
      ls_data-progid = 'IM04'.
      ls_data-viewid = 'BBIF'.
      ls_data-prognm = '수입계약생성(구매오더참조)'.
      ls_data-viewnm = '부보정보'.
      ls_data-viewob = '4'.
      ls_data-viewat = ''.
      ls_data-viewtp = 'B'.
      ls_data-usediv = 'Y'.
      ls_data-fielda = 'Bbno|Bbamt|Bblif|Bbrsf|Bbgb|Bbrate|Bbdat'.
      ls_data-fieldc = 'Bbno|Bbamt|Bblif|Bbrsf|Bbgb|Bbrate|Bbdat'.
      ls_data-fieldu = 'Bbno|Bbamt|Bblif|Bbrsf|Bbgb|Bbrate|Bbdat'.
      ls_data-fieldm = 'Bbno|Bbamt|Bblif'.
      ls_data-cdsvid = ''.

      TRY.
          INSERT zasimt0000c FROM @ls_data.
      ENDTRY.

      TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
    CATCH cx_uuid_error.
    ENDTRY.

      ls_data-client = '080'.
      ls_data-uuid = lv_uuid.
      ls_data-progid = 'IM03'.
      ls_data-viewid = 'IMIT'.
      ls_data-prognm = '수입계약생성(구매오더참조)'.
      ls_data-viewnm = '품목정보'.
      ls_data-viewob = '5'.
      ls_data-viewat = ''.
      ls_data-viewtp = 'G'.
      ls_data-usediv = 'Y'.
      ls_data-fielda = 'Itmno|Knttp|Werks|Matnr|Lgort|Reqmg|Reqms|Reqnr|Reqwr|Peinh|Kostl|Anln1|Sakto|Zdc1_p|Zdc1_n|Zdc2_p|Zdc2_n|Ebeln'.
      ls_data-fieldc = 'Lgort|Reqmg|Reqms|Reqnr'.
      ls_data-fieldu = 'Reqmg|Reqms|Reqnr'.
      ls_data-fieldm = 'Itmno|Knttp|Werks'.
      ls_data-cdsvid = ''.

      TRY.
          INSERT zasimt0000c FROM @ls_data.
      ENDTRY.



********************************BL생성*************************************************

      TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
    CATCH cx_uuid_error.
    ENDTRY.

      ls_data-client = '080'.
      ls_data-uuid = lv_uuid.
      ls_data-progid = 'BL01'.
      ls_data-viewid = 'BJIF'.
      ls_data-prognm = 'BL생성'.
      ls_data-viewnm = '발주정보'.
      ls_data-viewob = '1'.
      ls_data-viewat = ''.
      ls_data-viewtp = 'B'.
      ls_data-usediv = 'Y'.
      ls_data-fielda = 'Bukrs|Zterm|Ekorg|Inco1|Ekgrp|Inco2|Lifnr|Netwr|Remak'.
      ls_data-fieldc = ''.
      ls_data-fieldu = ''.
      ls_data-fieldm = ''.
      ls_data-cdsvid = ''.

      TRY.
          INSERT zasimt0000c FROM @ls_data.
      ENDTRY.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
    CATCH cx_uuid_error.
    ENDTRY.

      ls_data-client = '080'.
      ls_data-uuid = lv_uuid.
      ls_data-progid = 'BL01'.
      ls_data-viewid = 'IMIF'.
      ls_data-prognm = 'BL생성'.
      ls_data-viewnm = '수입정보'.
      ls_data-viewob = '2'.
      ls_data-viewat = ''.
      ls_data-viewtp = 'B'.
      ls_data-usediv = 'Y'.
      ls_data-fielda = 'Reqno|Lifre|Reqdt|Zcdno3|Reqyr|Colif|Acdat|Zcdno1|Filif|Conrt|Zcdno2|Cont1|Cont2|Zcdno4|Rqche'.
      ls_data-fieldc = ''.
      ls_data-fieldu = ''.
      ls_data-fieldm = ''.
      ls_data-cdsvid = ''.

      TRY.
          INSERT zasimt0000c FROM @ls_data.
      ENDTRY.

      TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
    CATCH cx_uuid_error.
    ENDTRY.

      ls_data-client = '080'.
      ls_data-uuid = lv_uuid.
      ls_data-progid = 'BL01'.
      ls_data-viewid = 'GSIF'.
      ls_data-prognm = 'BL생성'.
      ls_data-viewnm = '개설정보'.
      ls_data-viewob = '3'.
      ls_data-viewat = ''.
      ls_data-viewtp = 'B'.
      ls_data-usediv = 'Y'.
      ls_data-fielda = 'Pterm|Opnum|Oplif|Zbd1t|Opbnk|Oedat|Pedat|Rqrsf|Opamt|Pdate|Sdate|Edate'.
      ls_data-fieldc = ''.
      ls_data-fieldu = ''.
      ls_data-cdsvid = ''.

      TRY.
          INSERT zasimt0000c FROM @ls_data.
      ENDTRY.

      TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
    CATCH cx_uuid_error.
    ENDTRY.

      ls_data-client = '080'.
      ls_data-uuid = lv_uuid.
      ls_data-progid = 'BL01'.
      ls_data-viewid = 'BBIF'.
      ls_data-prognm = 'BL생성'.
      ls_data-viewnm = '부보정보'.
      ls_data-viewob = '4'.
      ls_data-viewat = ''.
      ls_data-viewtp = 'B'.
      ls_data-usediv = 'Y'.
      ls_data-fielda = 'Bbno|Bbamt|Bblif|Bbrsf|Bbgb|Bbrate|Bbdat'.
      ls_data-fieldc = ''.
      ls_data-fieldu = ''.
      ls_data-fieldm = ''.
      ls_data-cdsvid = ''.

      TRY.
          INSERT zasimt0000c FROM @ls_data.
      ENDTRY.

       TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
    CATCH cx_uuid_error.
    ENDTRY.

      ls_data-client = '080'.
      ls_data-uuid = lv_uuid.
      ls_data-progid = 'BL01'.
      ls_data-viewid = 'BLIF'.
      ls_data-prognm = 'BL생성'.
      ls_data-viewnm = 'B/L정보'.
      ls_data-viewob = '5'.
      ls_data-viewat = ''.
      ls_data-viewtp = 'B'.
      ls_data-usediv = 'Y'.
      ls_data-fielda = 'Blino|Bleno|Bqetd|Brgew|Ebeln|Bldat|Bqeta|Negew|Eccgb|Bldat2|Bletd|Mosno|Blche|Lgnum|Bleta|Blamt|Blitx'.
      ls_data-fieldc = 'Bleno|Bqetd|Brgew|Bldat|Bqeta|Negew|Eccgb|Bldat2|Bletd|Mosno|Blche|Lgnum|Bleta|Blitx'.
      ls_data-fieldu = 'Bleno|Bqetd|Brgew|Bldat|Bqeta|Negew|Eccgb|Bldat2|Bletd|Mosno|Blche|Lgnum|Bleta|Blitx'.
      ls_data-fieldm = 'Blino|Bleno|Bqetd'.
      ls_data-cdsvid = ''.

      TRY.
          INSERT zasimt0000c FROM @ls_data.
      ENDTRY.

      TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
    CATCH cx_uuid_error.
    ENDTRY.

      ls_data-client = '080'.
      ls_data-uuid = lv_uuid.
      ls_data-progid = 'BL01'.
      ls_data-viewid = 'IMIT'.
      ls_data-prognm = 'BL생성'.
      ls_data-viewnm = '품목정보'.
      ls_data-viewob = '6'.
      ls_data-viewat = ''.
      ls_data-viewtp = 'G'.
      ls_data-usediv = 'Y'.
      ls_data-fielda = 'Itmno|Knttp|Werks|Matnr|Lgort|Reqmg|Reqms|Reqnr|Reqwr|Peinh|Kostl|Anln1|Sakto|Zdc1_p|Zdc1_n|Zdc2_p|Zdc2_n|Ebeln'.
      ls_data-fieldc = 'Lgort|Reqmg|Reqms|Reqnr'.
      ls_data-fieldu = 'Reqmg|Reqms|Reqnr'.
      ls_data-fieldm = 'Itmno|Knttp|Werks'.
      ls_data-cdsvid = ''.

      TRY.
          INSERT zasimt0000c FROM @ls_data.
      ENDTRY.

********************************IV생성*************************************************

      TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
    CATCH cx_uuid_error.
    ENDTRY.

      ls_data-client = '080'.
      ls_data-uuid = lv_uuid.
      ls_data-progid = 'IV01'.
      ls_data-viewid = 'BJIF'.
      ls_data-prognm = 'IV생성'.
      ls_data-viewnm = '발주정보'.
      ls_data-viewob = '1'.
      ls_data-viewat = ''.
      ls_data-viewtp = 'B'.
      ls_data-usediv = 'Y'.
      ls_data-fielda = 'Bukrs|Zterm|Ekorg|Inco1|Ekgrp|Inco2|Lifnr|Netwr|Remak'.
      ls_data-fieldc = ''.
      ls_data-fieldu = ''.
      ls_data-fieldm = ''.
      ls_data-cdsvid = ''.

      TRY.
          INSERT zasimt0000c FROM @ls_data.
      ENDTRY.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
    CATCH cx_uuid_error.
    ENDTRY.

      ls_data-client = '080'.
      ls_data-uuid = lv_uuid.
      ls_data-progid = 'IV01'.
      ls_data-viewid = 'IMIF'.
      ls_data-prognm = 'IV생성'.
      ls_data-viewnm = '수입정보'.
      ls_data-viewob = '2'.
      ls_data-viewat = ''.
      ls_data-viewtp = 'B'.
      ls_data-usediv = 'Y'.
      ls_data-fielda = 'Reqno|Lifre|Reqdt|Zcdno3|Reqyr|Colif|Acdat|Zcdno1|Filif|Conrt|Zcdno2|Cont1|Cont2|Zcdno4|Rqche'.
      ls_data-fieldc = ''.
      ls_data-fieldu = ''.
      ls_data-fieldm = ''.
      ls_data-cdsvid = ''.

      TRY.
          INSERT zasimt0000c FROM @ls_data.
      ENDTRY.

       TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
    CATCH cx_uuid_error.
    ENDTRY.

      ls_data-client = '080'.
      ls_data-uuid = lv_uuid.
      ls_data-progid = 'IV01'.
      ls_data-viewid = 'BLIF'.
      ls_data-prognm = 'IV생성'.
      ls_data-viewnm = 'B/L정보'.
      ls_data-viewob = '3'.
      ls_data-viewat = ''.
      ls_data-viewtp = 'B'.
      ls_data-usediv = 'Y'.
      ls_data-fielda = 'Blino|Bleno|Bqetd|Brgew|Ebeln|Bldat|Bqeta|Negew|Eccgb|Bldat2|Bletd|Mosno|Blche|Lgnum|Bleta|Blamt|Blitx'.
      ls_data-fieldc = ''.
      ls_data-fieldu = ''.
      ls_data-fieldm = ''.
      ls_data-cdsvid = ''.

      TRY.
          INSERT zasimt0000c FROM @ls_data.
      ENDTRY.

 TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
    CATCH cx_uuid_error.
    ENDTRY.

      ls_data-client = '080'.
      ls_data-uuid = lv_uuid.
      ls_data-progid = 'IV01'.
      ls_data-viewid = 'IVIF'.
      ls_data-prognm = 'IV생성'.
      ls_data-viewnm = '수입대금지급정보'.
      ls_data-viewob = '4'.
      ls_data-viewat = ''.
      ls_data-viewtp = 'B'.
      ls_data-usediv = 'Y'.
      ls_data-fielda = 'BELNR_MM|PTERMT|BUDAT_IV|RMWWR|INVNO|IVERM|ZFBDT|MWSKZ|BELNR_FI|IVLIF|ZBD1T|WMWST1|GJAHR|ZLSCH|FBEDT|KURSF|IVAMT|SGTXT'.
      ls_data-fieldc = 'BUDAT_IV|INVNO|IVERM|ZFBDT|MWSKZ|IVLIF|ZBD1T|WMWST1|ZLSCH|IVAMT|SGTXT'.
      ls_data-fieldu = ''.
      ls_data-fielda = 'BELNR_MM|PTERMT|BUDAT_IV'.
      ls_data-cdsvid = ''.

      TRY.
          INSERT zasimt0000c FROM @ls_data.
      ENDTRY.


      TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
    CATCH cx_uuid_error.
    ENDTRY.

      ls_data-client = '080'.
      ls_data-uuid = lv_uuid.
      ls_data-progid = 'IV01'.
      ls_data-viewid = 'IMIT'.
      ls_data-prognm = 'IV생성'.
      ls_data-viewnm = '품목정보'.
      ls_data-viewob = '5'.
      ls_data-viewat = ''.
      ls_data-viewtp = 'G'.
      ls_data-usediv = 'Y'.
      ls_data-fielda = 'Itmno|Knttp|Werks|Matnr|Lgort|Reqmg|Reqms|Reqnr|Reqwr|Peinh|Kostl|Anln1|Sakto|Zdc1_p|Zdc1_n|Zdc2_p|Zdc2_n|Ebeln'.
      ls_data-fieldc = 'Lgort|Reqmg|Reqms|Reqnr'.
      ls_data-fieldu = 'Reqmg|Reqms|Reqnr'.
      ls_data-fieldm = 'Itmno|Knttp|Werks'.
      ls_data-cdsvid = ''.

      TRY.
          INSERT zasimt0000c FROM @ls_data.
      ENDTRY.












    ENDMETHOD.
ENDCLASS.

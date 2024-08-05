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

    DELETE FROM zasimt0000c.


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
    ls_data-fieldall = 'Bukrs|Zterm|Ekorg|Inco1|Ekgrp|Inco2|Lifnr|Netwr'.
    ls_data-fieldcre = 'Bukrs|Zterm|Ekorg|Inco1|Ekgrp|Inco2|Lifnr'.
    ls_data-fieldupd = 'Zterm|Inco1|Ekgrp|Inco2|Lifnr'.
    ls_data-fieldnum = 'Bukrs|Ekorg|Ekgrp'.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = 'Inco1|Inco2'.
    ls_data-roleid = 'IM'.

    INSERT zasimt0000c FROM @ls_data.



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
    ls_data-fieldall = 'Reqno|Lifre|Reqdt|Zcdno3|Reqmu|Colif|Acdat|Zcdno1|Filif|Conrt|Zcdno2|Cont1|Cont2|Zcdno4|Rqche|Remak'.
    ls_data-fieldcre = 'Lifre|Reqdt|Zcdno3|Colif|Acdat|Zcdno1|Filif|Conrt|Zcdno2|Cont1|Cont2|Zcdno4|Rqche|Remak'.
    ls_data-fieldupd = 'Lifre|Reqdt|Zcdno3|Colif|Acdat|Zcdno1|Filif|Conrt|Zcdno2|Cont1|Cont2|Zcdno4|Rqche|Remak'.
    ls_data-fieldnum = 'Reqno|Lifre|Reqdt'.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = 'Lifre|Reqdt|Zcdno3|Colif|Acdat|Zcdno1|Filif|Conrt|Zcdno2|Cont1|Cont2|Zcdno4|Rqche|Remak'.
    ls_data-roleid = 'IM'.

    INSERT zasimt0000c FROM @ls_data.

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
    ls_data-fieldall = 'Pterm|Opnum|Oplif|Zbd1t|Opbnk|Opdat|Pedat|Rqrsf|Opamt|Pdate|Sdate|Edate'.
    ls_data-fieldcre = 'Pterm|Opnum|Oplif|Zbd1t|Opbnk|Opdat|Pedat|Rqrsf|Opamt|Pdate|Sdate|Edate'.
    ls_data-fieldupd = 'Pterm|Opnum|Oplif|Zbd1t|Opbnk|Opdat|Pedat|Rqrsf|Opamt|Pdate|Sdate|Edate'.
    ls_data-fieldnum = 'Pterm|Opnum|Oplif'.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = 'Pterm|Opnum|Oplif|Zbd1t|Opbnk|Opdat|Pedat|Rqrsf|Opamt|Pdate|Sdate|Edate'.
    ls_data-roleid = 'IM'.

    INSERT zasimt0000c FROM @ls_data.

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
    ls_data-fieldall = 'Bbno|Bbamt|Bblif|Bbrsf|Bbgb|Bbrate|Bbdat'.
    ls_data-fieldcre = 'Bbno|Bbamt|Bblif|Bbrsf|Bbgb|Bbrate|Bbdat'.
    ls_data-fieldupd = 'Bbno|Bbamt|Bblif|Bbrsf|Bbgb|Bbrate|Bbdat'.
    ls_data-fieldnum = 'Bbno|Bbamt|Bblif'.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = 'Bbno|Bbamt|Bblif|Bbrsf|Bbgb|Bbrate|Bbdat'.
    ls_data-roleid = 'IM'.

    INSERT zasimt0000c FROM @ls_data.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'IM01'.
    ls_data-viewid = 'IMIT'.
    ls_data-prognm = '수입계약생성(수기)'.
    ls_data-viewnm = '품목정보'.
    ls_data-viewob = '5'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'G'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Itmno|Matnr|Maktx|Reqmg|Reqms|Reqnr|Reqwr|Waers|Werks|Werkst|Lgort|Lgortt|Remak|Peinh'.
    ls_data-fieldcre = 'Matnr|Reqmg|Reqms|Reqmg1|Reqms1|Reqnr|Peinh|Reqwr|Waers|Werks|Lgort|Remak'.
    ls_data-fieldupd = 'Reqmg|Reqms|Reqmg1|Reqms1|Reqnr|Peinh|Reqwr|Waers|Werks|Lgort|Remak'.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = 'Matnr|Werks'.
    ls_data-fieldseq = 'Lgort|Remak'.
    ls_data-roleid = 'IM'.

    INSERT zasimt0000c FROM @ls_data.

*    TRY.
*        lv_uuid = system_uuid->create_uuid_x16( ).
*      CATCH cx_uuid_error.
*    ENDTRY.
*
*    ls_data-client = '080'.
*    ls_data-uuid = lv_uuid.
*    ls_data-progid = 'IM01'.
*    ls_data-viewid = 'FILE'.
*    ls_data-prognm = '수입계약생성(수기)'.
*    ls_data-viewnm = '파일업로드'.
*    ls_data-viewob = '6'.
*    ls_data-viewat = ''.
*    ls_data-viewtp = 'B'.
*    ls_data-usediv = 'Y'.
*    ls_data-fieldall = 'id|fileName|mediaType|url|revision|status|fileSize|lastModifiedBy|lastmodified|documentType'.
*    ls_data-fieldcre = ''.
*    ls_data-fieldupd = ''.
*    ls_data-fieldnum = ''.
*    ls_data-fielddat = ''.
*    ls_data-fieldkey = ''.
*    ls_data-fieldseq = ''.
*    ls_data-roleid = 'IM'.
*
*    INSERT zasimt0000c FROM @ls_data.


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
    ls_data-fieldall = 'Bukrs|Zterm|Ekorg|Inco1|Ekgrp|Inco2|Lifnr|Netwr'.
    ls_data-fieldcre = 'Bukrs|Zterm|Ekorg|Inco1|Ekgrp|Inco2|Lifnr'.
    ls_data-fieldupd = 'Zterm|Inco1|Ekgrp|Inco2|Lifnr'.
    ls_data-fieldnum = 'Bukrs|Zterm|Ekorg'.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = 'Inco1|Inco2'.
    ls_data-roleid = 'IM'.

    INSERT zasimt0000c FROM @ls_data.

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
    ls_data-fieldall = 'Reqno|Lifre|Reqdt|Zcdno3|Reqmu|Colif|Acdat|Zcdno1|Filif|Conrt|Zcdno2|Cont1|Cont2|Zcdno4|Rqche|Remak'.
    ls_data-fieldcre = 'Lifre|Reqdt|Zcdno3|Colif|Acdat|Zcdno1|Filif|Conrt|Zcdno2|Cont1|Cont2|Zcdno4|Rqche|Remak'.
    ls_data-fieldupd = 'Lifre|Reqdt|Zcdno3|Colif|Acdat|Zcdno1|Filif|Conrt|Zcdno2|Cont1|Cont2|Zcdno4|Rqche|Remak'.
    ls_data-fieldnum = 'Reqno|Lifre|Reqdt'.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = 'Lifre|Reqdt|Zcdno3|Colif|Acdat|Zcdno1|Filif|Conrt|Zcdno2|Cont1|Cont2|Zcdno4|Rqche|Remak'.
    ls_data-roleid = 'IM'.

    INSERT zasimt0000c FROM @ls_data.

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
    ls_data-fieldall = 'Pterm|Opnum|Oplif|Zbd1t|Opbnk|Oedat|Pedat|Rqrsf|Opamt|Opwrs|Pdate|Sdate|Edate'.
    ls_data-fieldcre = 'Pterm|Opnum|Oplif|Zbd1t|Opbnk|Opdat|Pedat|Rqrsf|Opamt|Opwrs|Pdate|Sdate|Edate'.
    ls_data-fieldupd = 'Pterm|Opnum|Oplif|Zbd1t|Opbnk|Opdat|Pedat|Rqrsf|Opamt|Pdate|Sdate|Edate'.
    ls_data-fieldnum = 'Pterm|Opnum|Oplif'.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = 'Pterm|Opnum|Oplif|Zbd1t|Opbnk|Oedat|Pedat|Rqrsf|Opamt|Pdate|Sdate|Edate'.
    ls_data-roleid = 'IM'.

    INSERT zasimt0000c FROM @ls_data.

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
    ls_data-fieldall = 'Bbno|Bbamt|Bblif|Bbrsf|Bbgb|Bbrate|Bbdat'.
    ls_data-fieldcre = 'Bbno|Bbamt|Bblif|Bbrsf|Bbgb|Bbrate|Bbdat'.
    ls_data-fieldupd = 'Bbno|Bbamt|Bblif|Bbrsf|Bbgb|Bbrate|Bbdat'.
    ls_data-fieldnum = 'Bbno|Bbamt|Bblif'.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = 'Bbno|Bbamt|Bblif|Bbrsf|Bbgb|Bbrate|Bbdat'.
    ls_data-roleid = 'IM'.

    INSERT zasimt0000c FROM @ls_data.

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
    ls_data-fieldall = 'Itmno|Matnr|Maktx|Reqmg|Reqms|Reqnr|Reqwr|Waers|Werks|Werkst|Lgort|Lgortt|Remak|Peinh'.
    ls_data-fieldcre = 'Matnr|Reqmg|Reqms|Reqmg1|Reqms1|Reqnr|Peinh|Reqwr|Waers|Werks|Lgort|Remak'.
    ls_data-fieldupd = 'Reqmg|Reqms|Reqmg1|Reqms1|Reqnr|Peinh|Reqwr|Waers|Werks|Lgort|Remak'.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = 'Matnr|Werks'.
    ls_data-fieldseq = 'Lgort|Remak'.
    ls_data-roleid = 'IM'.

    INSERT zasimt0000c FROM @ls_data.


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
    ls_data-fieldall = 'Bukrs|Zterm|Ekorg|Inco1|Ekgrp|Inco2|Lifnr|Netwr'.
    ls_data-fieldcre = 'Bukrs|Zterm|Ekorg|Inco1|Ekgrp|Inco2|Lifnr'.
    ls_data-fieldupd = 'Bukrs|Zterm|Ekorg|Inco1|Ekgrp|Inco2|Lifnr'.
    ls_data-fieldnum = 'Bukrs|Zterm|Ekorg'.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = 'Inco1|Inco2'.
    ls_data-roleid = 'IM'.

    INSERT zasimt0000c FROM @ls_data.

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
    ls_data-fieldall = 'Reqno|Lifre|Reqdt|Zcdno3|Reqmu|Colif|Acdat|Zcdno1|Filif|Conrt|Zcdno2|Cont1|Cont2|Zcdno4|Rqche|Remak'.
    ls_data-fieldcre = 'Lifre|Reqdt|Zcdno3|Colif|Acdat|Zcdno1|Filif|Conrt|Zcdno2|Cont1|Cont2|Zcdno4|Rqche|Remak'.
    ls_data-fieldupd = 'Lifre|Reqdt|Zcdno3|Colif|Acdat|Zcdno1|Filif|Conrt|Zcdno2|Cont1|Cont2|Zcdno4|Rqche|Remak'.
    ls_data-fieldnum = 'Reqno|Lifre|Reqdt'.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = 'Lifre|Reqdt|Zcdno3|Colif|Acdat|Zcdno1|Filif|Conrt|Zcdno2|Cont1|Cont2|Zcdno4|Rqche|Remak'.
    ls_data-roleid = 'IM'.

    INSERT zasimt0000c FROM @ls_data.

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
    ls_data-fieldall = 'Pterm|Opnum|Oplif|Zbd1t|Opbnk|Opdat|Pedat|Rqrsf|Opamt|Pdate|Sdate|Edate'.
    ls_data-fieldcre = 'Pterm|Opnum|Oplif|Zbd1t|Opbnk|Opdat|Pedat|Rqrsf|Opamt|Pdate|Sdate|Edate'.
    ls_data-fieldupd = 'Pterm|Opnum|Oplif|Zbd1t|Opbnk|Opdat|Pedat|Rqrsf|Opamt|Pdate|Sdate|Edate'.
    ls_data-fieldnum = 'Pterm|Opnum|Oplif'.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = 'Pterm|Opnum|Oplif|Zbd1t|Opbnk|Opdat|Pedat|Rqrsf|Opamt|Pdate|Sdate|Edate'.
    ls_data-roleid = 'IM'.

    INSERT zasimt0000c FROM @ls_data.

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
    ls_data-fieldall = 'Bbno|Bbamt|Bblif|Bbrsf|Bbgb|Bbrate|Bbdat'.
    ls_data-fieldcre = 'Bbno|Bbamt|Bblif|Bbrsf|Bbgb|Bbrate|Bbdat'.
    ls_data-fieldupd = 'Bbno|Bbamt|Bblif|Bbrsf|Bbgb|Bbrate|Bbdat'.
    ls_data-fieldnum = 'Bbno|Bbamt|Bblif'.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = 'Bbno|Bbamt|Bblif|Bbrsf|Bbgb|Bbrate|Bbdat'.
    ls_data-roleid = 'IM'.

    INSERT zasimt0000c FROM @ls_data.

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
    ls_data-fieldall = 'Itmno|Matnr|Maktx|Reqmg|Reqms|Reqnr|Reqwr|Waers|Werks|Werkst|Lgort|Lgortt|Remak|Peinh'.
    ls_data-fieldcre = 'Matnr|Reqmg|Reqms|Reqmg1|Reqms1|Reqnr|Peinh|Reqwr|Waers|Werks|Remak'.
    ls_data-fieldupd = 'Reqmg|Reqms|Reqmg1|Reqms1|Reqnr|Peinh|Reqwr|Waers|Lgort|Remak'.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = 'Matnr|Werks'.
    ls_data-fieldseq = 'Lgort|Remak'.
    ls_data-roleid = 'IM'.

    INSERT zasimt0000c FROM @ls_data.



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
    ls_data-fieldall = 'Bukrs|Zterm|Ekorg|Inco1|Ekgrp|Inco2|Lifnr|Netwr'.
    ls_data-fieldcre = 'Bukrs|Zterm|Ekorg|Inco1|Ekgrp|Inco2|Lifnr'.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = 'Bukrs|Zterm|Ekorg'.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'IM'.

    INSERT zasimt0000c FROM @ls_data.

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
    ls_data-fieldall = 'Reqno|Lifre|Reqdt|Zcdno3|Reqmu|Colif|Acdat|Zcdno1|Filif|Conrt|Zcdno2|Cont1|Cont2|Zcdno4|Rqche|Remak'.
    ls_data-fieldcre = 'Lifre|Reqdt|Zcdno3|Colif|Acdat|Zcdno1|Filif|Conrt|Zcdno2|Cont1|Cont2|Zcdno4|Rqche|Remak'.
    ls_data-fieldupd = 'Lifre|Reqdt|Zcdno3|Colif|Acdat|Zcdno1|Filif|Conrt|Zcdno2|Cont1|Cont2|Zcdno4|Rqche|Remak'.
    ls_data-fieldnum = 'Reqno|Lifre|Reqdt'.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = 'Lifre|Reqdt|Zcdno3|Colif|Acdat|Zcdno1|Filif|Conrt|Zcdno2|Cont1|Cont2|Zcdno4|Rqche'.
    ls_data-roleid = 'IM'.

    INSERT zasimt0000c FROM @ls_data.

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
    ls_data-fieldall = 'Pterm|Opnum|Oplif|Zbd1t|Opbnk|Opdat|Pedat|Rqrsf|Opamt|Pdate|Sdate|Edate'.
    ls_data-fieldcre = 'Pterm|Opnum|Oplif|Zbd1t|Opbnk|Opdat|Pedat|Rqrsf|Opamt|Pdate|Sdate|Edate'.
    ls_data-fieldupd = 'Pterm|Opnum|Oplif|Zbd1t|Opbnk|Opdat|Pedat|Rqrsf|Opamt|Pdate|Sdate|Edate'.
    ls_data-fieldnum = 'Pterm|Opnum|Oplif'.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = 'Pterm|Opnum|Oplif|Zbd1t|Opbnk|Opdat|Pedat|Rqrsf|Opamt|Pdate|Sdate|Edate'.
    ls_data-roleid = 'IM'.

    INSERT zasimt0000c FROM @ls_data.

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
    ls_data-fieldall = 'Bbno|Bbamt|Bblif|Bbrsf|Bbgb|Bbrate|Bbdat'.
    ls_data-fieldcre = 'Bbno|Bbamt|Bblif|Bbrsf|Bbgb|Bbrate|Bbdat'.
    ls_data-fieldupd = 'Bbno|Bbamt|Bblif|Bbrsf|Bbgb|Bbrate|Bbdat'.
    ls_data-fieldnum = 'Bbno|Bbamt|Bblif'.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = 'Bbno|Bbamt|Bblif|Bbrsf|Bbgb|Bbrate|Bbdat'.
    ls_data-roleid = 'IM'.

    INSERT zasimt0000c FROM @ls_data.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'IM04'.
    ls_data-viewid = 'IMIT'.
    ls_data-prognm = '수입계약생성(구매오더참조)'.
    ls_data-viewnm = '품목정보'.
    ls_data-viewob = '5'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'G'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Itmno|Matnr|Maktx|Reqmg|Reqms|Reqnr|Reqwr|Waers|Werks|Werkst|Lgort|Lgortt|Remak|Peinh'.
    ls_data-fieldcre = 'Reqmg|Reqnr|Peinh|Werks|Remak'.
    ls_data-fieldupd = 'Reqmg|Remak'.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = 'Matnr|Werks'.
    ls_data-fieldseq = 'Remak'.
    ls_data-roleid = 'IM'.

    INSERT zasimt0000c FROM @ls_data.


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
    ls_data-fieldall = 'Bukrs|Zterm|Ekorg|Inco1|Ekgrp|Inco2|Lifnr|Netwr|Remak'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'BL'.

    INSERT zasimt0000c FROM @ls_data.

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
    ls_data-fieldall = 'Reqno|Lifre|Reqdt|Zcdno3|Reqyr|Colif|Acdat|Zcdno1|Filif|Conrt|Zcdno2|Cont1|Cont2|Zcdno4|Rqche|Remak'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'BL'.

    INSERT zasimt0000c FROM @ls_data.

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
    ls_data-fieldall = 'Pterm|Opnum|Oplif|Zbd1t|Opbnk|Opwrs|Opdat|Pedat|Rqrsf|Opamt|Pdate|Sdate|Edate'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'BL'.

    INSERT zasimt0000c FROM @ls_data.

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
    ls_data-fieldall = 'Bbno|Bbamt|Bblif|Bbrsf|Bbgb|Bbrate|Bbdat'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'BL'.

    INSERT zasimt0000c FROM @ls_data.

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
    ls_data-fieldall = 'Blino|Bleno|Rqetd|Brgew|Ebeln|Bldat|Rqeta|Negew|Eccgb|Acdat|Bletd|Mosno|Blche|Lgnum|Bleta|Blamt|Blitx'.
    ls_data-fieldcre = 'Bleno|Rqetd|Brgew|Bldat|Rqeta|Negew|Eccgb|Bldat2|Bletd|Mosno|Blche|Lgnum|Bleta|Blitx'.
    ls_data-fieldupd = 'Rqetd|Brgew|Bldat|Rqeta|Negew|Eccgb|Bldat2|Bletd|Mosno|Blche|Lgnum|Bleta|Blitx'.
    ls_data-fieldnum = 'Blino|Bleno|Rqetd'.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = 'Rqetd|Brgew|Bldat|Rqeta|Negew|Bldat2|Bletd|Mosno|Blche|Lgnum|Bleta|Blitx'.
    ls_data-roleid = 'BL'.

    INSERT zasimt0000c FROM @ls_data.

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
    ls_data-fieldall = 'Blinp|Matnr|Maktx|Blmng|Blmns|Blmpr|Blpnh|Blmwr|Waers|Werks|Werkst|Lgort|Lgortt|Eindt|Zdc1_p|Zdc1_n|Zdc2_p|Zdc2_n|Hsdat'.
    ls_data-fieldcre = 'Matnr|Blmng|Blmns|Blpnh|Blmpr|Werks|Lgort|Eindt|Kostl|Zdc1_p|Zdc2_p|Hsdat'.
    ls_data-fieldupd = 'Blmng|Eindt|Hsdat'.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = 'Matnr|Blmng|Blmns|Waers|Werks|Eindt|Zdc1_p|Zdc2_p'.
    ls_data-fieldseq = 'Hsdat'.
    ls_data-roleid = 'BL'.

    INSERT zasimt0000c FROM @ls_data.

********************************BL생성 (구매오더 기생성)*************************************************

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'BL02'.
    ls_data-viewid = 'BJIF'.
    ls_data-prognm = 'BL생성'.
    ls_data-viewnm = '발주정보'.
    ls_data-viewob = '1'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Bukrs|Zterm|Ekorg|Inco1|Ekgrp|Inco2|Lifnr|Netwr|Remak'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'BL'.

    INSERT zasimt0000c FROM @ls_data.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'BL02'.
    ls_data-viewid = 'IMIF'.
    ls_data-prognm = 'BL생성'.
    ls_data-viewnm = '수입정보'.
    ls_data-viewob = '2'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Reqno|Lifre|Reqdt|Zcdno3|Reqyr|Colif|Acdat|Zcdno1|Filif|Conrt|Zcdno2|Cont1|Cont2|Zcdno4|Rqche|Remak'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'BL'.

    INSERT zasimt0000c FROM @ls_data.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'BL02'.
    ls_data-viewid = 'GSIF'.
    ls_data-prognm = 'BL생성'.
    ls_data-viewnm = '개설정보'.
    ls_data-viewob = '3'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Pterm|Opnum|Oplif|Zbd1t|Opbnk|Opwrs|Opdat|Pedat|Rqrsf|Opamt|Pdate|Sdate|Edate'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'BL'.

    INSERT zasimt0000c FROM @ls_data.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'BL02'.
    ls_data-viewid = 'BBIF'.
    ls_data-prognm = 'BL생성'.
    ls_data-viewnm = '부보정보'.
    ls_data-viewob = '4'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Bbno|Bbamt|Bblif|Bbrsf|Bbgb|Bbrate|Bbdat'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'BL'.

    INSERT zasimt0000c FROM @ls_data.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'BL02'.
    ls_data-viewid = 'BLIF'.
    ls_data-prognm = 'BL생성'.
    ls_data-viewnm = 'B/L정보'.
    ls_data-viewob = '5'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Blino|Bleno|Rqetd|Brgew|Ebeln|Bldat|Rqeta|Negew|Eccgb|Acdat|Bletd|Mosno|Blche|Lgnum|Bleta|Blamt|Blitx'.
    ls_data-fieldcre = 'Bleno|Rqetd|Brgew|Bldat|Rqeta|Negew|Eccgb|Bldat2|Bletd|Mosno|Blche|Lgnum|Bleta|Blitx'.
    ls_data-fieldupd = 'Rqetd|Brgew|Bldat|Rqeta|Negew|Eccgb|Bldat2|Bletd|Mosno|Blche|Lgnum|Bleta|Blitx'.
    ls_data-fieldnum = 'Blino|Bleno|Rqetd'.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = 'Rqetd|Brgew|Bldat|Rqeta|Negew|Bldat2|Bletd|Mosno|Blche|Lgnum|Bleta|Blitx'.
    ls_data-roleid = 'BL'.

    INSERT zasimt0000c FROM @ls_data.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'BL02'.
    ls_data-viewid = 'IMIT'.
    ls_data-prognm = 'BL생성'.
    ls_data-viewnm = '품목정보'.
    ls_data-viewob = '6'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'G'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Blinp|Matnr|Maktx|Blmng|Blmns|Blmpr|Blpnh|Blmwr|Waers|Werks|Werkst|Lgort|Lgortt|Eindt|Zdc1_p|Zdc1_n|Zdc2_p|Zdc2_n|Hsdat'.
    ls_data-fieldcre = 'Blmng|Blmns|Blpnh|Blmpr|Eindt|Hsdat'.
    ls_data-fieldupd = 'Blmng|Eindt|Hsdat'.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = 'Matnr|Blmng|Blmns|Waers|Werks|Eindt|Zdc1_p|Zdc2_p'.
    ls_data-fieldseq = 'Hsdat'.
    ls_data-roleid = 'BL'.

    INSERT zasimt0000c FROM @ls_data.

********************************IV생성(B/L참조) *************************************************

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
    ls_data-fieldall = 'Bukrs|Zterm|Ekorg|Inco1|Ekgrp|Inco2|Lifnr|Netwr'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'IV'.

    INSERT zasimt0000c FROM @ls_data.

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
    ls_data-fieldall = 'Reqno|Lifre|Reqdt|Zcdno3|Reqyr|Colif|Acdat|Zcdno1|Filif|Conrt|Zcdno2|Cont1|Cont2|Zcdno4|Rqche|Remak'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'IV'.

    INSERT zasimt0000c FROM @ls_data.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'IV01'.
    ls_data-viewid = 'GSIF'.
    ls_data-prognm = 'IV생성'.
    ls_data-viewnm = '개설정보'.
    ls_data-viewob = '3'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Pterm|Opnum|Oplif|Zbd1t|Opbnk|Opdat|Pdate|Pedat|Rqrsf|Opamt|Pdate|Sdate|Edate'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'IV'.

    INSERT zasimt0000c FROM @ls_data.

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
    ls_data-viewob = '4'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Blino|Bleno|Rqetd|Brgew|Ebeln|Bldat|Rqeta|Negew|Eccgb|Acdat|Bletd|Mosno|Blche|Lgnum|Bleta|Blamt|Blitx|Bldat2'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = 'Blino|Bleno|Rqetd'.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = 'Bleno|Rqetd|Brgew|Bldat|Rqeta|Negew|Eccgb|Bldat2|Bletd|Mosno|Blche|Lgnum|Blitx'.
    ls_data-roleid = 'IV'.

    INSERT zasimt0000c FROM @ls_data.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'IV01'.
    ls_data-viewid = 'IVIF'.
    ls_data-prognm = 'IV생성'.
    ls_data-viewnm = 'I/V정보'.
    ls_data-viewob = '5'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Belnr|Ivlif|Pdate|Rmwwr|Invno|Iverm|Zbd1t|Zfbdt|Mwskz|Zlsch|Fbedt|Wmwst1|BudatIv|Ivwae|Kursf|Ivamt|Bktxt'.
    ls_data-fieldcre = 'Ivlif|Rmwwr|Iverm|Zfbdt|Mwskz|Invno|Zbd1t|Zlsch|Wmwst1|BudatIv|Kursf|Bktxt'.
    ls_data-fieldupd = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'IV'.

    INSERT zasimt0000c FROM @ls_data.


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
    ls_data-viewob = '6'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'G'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Blinp|Matnr|Maktx|Ivmng|Meins|Ivwra|Ivwmw|Waers|Werks|Werkst|Ebeln'.
    ls_data-fieldcre = 'Ivmng|Ivwra'.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'IV'.

    INSERT zasimt0000c FROM @ls_data.


********************************IV생성(계약참조) ********************************************

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'IV02'.
    ls_data-viewid = 'BJIF'.
    ls_data-prognm = 'IV생성'.
    ls_data-viewnm = '발주정보'.
    ls_data-viewob = '1'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Bukrs|Zterm|Ekorg|Inco1|Ekgrp|Inco2|Lifnr|Netwr'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'IV'.

    INSERT zasimt0000c FROM @ls_data.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'IV02'.
    ls_data-viewid = 'IMIF'.
    ls_data-prognm = 'IV생성'.
    ls_data-viewnm = '수입정보'.
    ls_data-viewob = '2'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Reqno|Lifre|Reqdt|Zcdno3|Reqyr|Colif|Acdat|Zcdno1|Filif|Conrt|Zcdno2|Cont1|Cont2|Zcdno4|Rqche|Remak'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'IV'.

    INSERT zasimt0000c FROM @ls_data.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'IV02'.
    ls_data-viewid = 'GSIF'.
    ls_data-prognm = 'IV생성'.
    ls_data-viewnm = '개설정보'.
    ls_data-viewob = '3'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Pterm|Opnum|Oplif|Zbd1t|Opbnk|Opdat|Pedat|Rqrsf|Opamt|Pdate|Sdate|Edate'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'IV'.

    INSERT zasimt0000c FROM @ls_data.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'IV02'.
    ls_data-viewid = 'IVIF'.
    ls_data-prognm = 'IV생성'.
    ls_data-viewnm = 'I/V정보'.
    ls_data-viewob = '5'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Belnr|Ivlif|Pdate|Rmwwr|Iverm|Zfbdt|Mwskz|Invno|Zlsch|Fbedt|Wmwst1|BudatIv|Ivwae|Kursf|Ivamt|Bktxt'.
    ls_data-fieldcre = 'Ivlif|Rmwwr|Iverm|Zfbdt|Mwskz|Invno|Zbd1t|Zlsch|Wmwst1|BudatIv|Kursf|Bktxt'.
    ls_data-fieldupd = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'IV'.

    INSERT zasimt0000c FROM @ls_data.


    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'IV02'.
    ls_data-viewid = 'IMIT'.
    ls_data-prognm = 'IV생성'.
    ls_data-viewnm = '품목정보'.
    ls_data-viewob = '6'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'G'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Itmno|Matnr|Maktx|Ivmng|Meins|Ivwra|Ivwmw|Waers|Werks|Werkst|Ebeln'.
    ls_data-fieldcre = 'Ivmng|Ivwra'.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'IV'.

    INSERT zasimt0000c FROM @ls_data.





********************************통관예정생성*************************************************

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'EC01'.
    ls_data-viewid = 'BJIF'.
    ls_data-prognm = '통관예정생성'.
    ls_data-viewnm = '발주정보'.
    ls_data-viewob = '1'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Bukrs|Zterm|Ekorg|Inco1|Ekgrp|Inco2|Lifnr|Netwr|Remak'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'EC'.

    INSERT zasimt0000c FROM @ls_data.



    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'EC01'.
    ls_data-viewid = 'IMIF'.
    ls_data-prognm = '통관예정생성'.
    ls_data-viewnm = '수입정보'.
    ls_data-viewob = '2'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Reqno|Lifre|Reqdt|Zcdno3|Reqyr|Colif|Acdat|Zcdno1|Filif|Conrt|Zcdno2|Cont1|Cont2|Zcdno4|Rqche|Remak'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'EC'.

    INSERT zasimt0000c FROM @ls_data.



    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'EC01'.
    ls_data-viewid = 'BLIF'.
    ls_data-prognm = '통관예정생성'.
    ls_data-viewnm = 'B/L정보'.
    ls_data-viewob = '3'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Blino|Bleno|Rqetd|Brgew|Ebeln|Bldat|Rqeta|Negew|Eccgb|Acdat|Bletd|Mosno|Blche|Lgnum|Bleta|Blamt|Blitx|Bldat2'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'EC'.

    INSERT zasimt0000c FROM @ls_data.



    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'EC01'.
    ls_data-viewid = 'ECIF'.
    ls_data-prognm = '통관예정생성'.
    ls_data-viewnm = '통관예정정보'.
    ls_data-viewob = '4'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Eccno|Egrdt|Eccwmn|Eccdt|Cclog|Ccldt|Eccmrn|Cclgort|Ecctrn'.
    ls_data-fieldcre = 'Egrdt|Eccwmn|Eccdt|Cclog|Ccldt|Eccmrn|Cclgort|Ecctrn'.
    ls_data-fieldupd = 'Egrdt|Eccwmn|Eccdt|Cclog|Ccldt|Eccmrn|Cclgort|Ecctrn'.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = 'Egrdt|Eccwmn|Eccdt|Ccldt|Eccmrn|Ecctrn'.
    ls_data-roleid = 'EC'.

    INSERT zasimt0000c FROM @ls_data.



    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'EC01'.
    ls_data-viewid = 'IMIT'.
    ls_data-prognm = '통관예정생성'.
    ls_data-viewnm = '품목정보'.
    ls_data-viewob = '5'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'G'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Matnr|Maktx|Eccmng|Eccmng|Quacd|Quars|Quadt|Failmng|Sampmng|Werks|Werkst|Eccremak'.
    ls_data-fieldcre = 'Eccmng|Quacd|Quars|Quadt|Sampmng|Failmng|Eccremak'.
    ls_data-fieldupd = 'Eccmng|Quacd|Quars|Quadt|Sampmng|Failmng|Eccremak'.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = 'Eccremak'.
    ls_data-roleid = 'EC'.

    INSERT zasimt0000c FROM @ls_data.

********************************통관생성(B/L참조)*************************************************
    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'CC01'.
    ls_data-viewid = 'BJIF'.
    ls_data-prognm = '통관생성'.
    ls_data-viewnm = '발주정보'.
    ls_data-viewob = '1'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Bukrs|Zterm|Ekorg|Inco1|Ekgrp|Inco2|Lifnr|Netwr|Remak'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'CC'.

    INSERT zasimt0000c FROM @ls_data.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'CC01'.
    ls_data-viewid = 'IMIF'.
    ls_data-prognm = '통관생성'.
    ls_data-viewnm = '수입정보'.
    ls_data-viewob = '2'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Reqno|Lifre|Reqdt|Zcdno3|Reqyr|Colif|Acdat|Zcdno1|Filif|Conrt|Zcdno2|Cont1|Cont2|Zcdno4|Rqche|Remak'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'CC'.

    INSERT zasimt0000c FROM @ls_data.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'CC01'.
    ls_data-viewid = 'BLIF'.
    ls_data-prognm = '통관생성'.
    ls_data-viewnm = 'B/L정보'.
    ls_data-viewob = '3'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Blino|Bleno|Rqetd|Brgew|Ebeln|Bldat|Rqeta|Negew|Eccgb|Acdat|Bletd|Mosno|Blche|Lgnum|Bleta|Blamt|Blitx|Bldat2'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'CC'.

    INSERT zasimt0000c FROM @ls_data.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'CC01'.
    ls_data-viewid = 'CCIF'.
    ls_data-prognm = '통관생성'.
    ls_data-viewnm = '통관정보'.
    ls_data-viewob = '4'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Cclno|Decno|Cclif|Ccper|Decdt|Ccdat1|Ccdat2|Ccdat|Cclgort|Cclog|Ccmos|Ccamt|Ccwae|Ccrsf|Ccvat1|Ccvat2|Hwbas|Ccltx|Ccamtk|Ccwaek'.
    ls_data-fieldcre = 'Decno|Cclif|Ccper|Decdt|Ccdat1|Ccdat2|Ccdat|Cclgort|Cclog|Ccmos|Ccamt|Ccwae|Ccrsf|Ccvat1|Ccvat2|Hwbas|Ccltx|Ccamtk|Ccwaek'.
    ls_data-fieldupd = 'Decno|Cclif|Ccper|Decdt|Ccdat1|Ccdat2|Ccdat|Ccldt|Cclgort|Cclog|Ccmos|Ccamt|Ccwae|Ccrsf|Ccvat1|Ccvat2|Hwbas|Ccltx|Ccamtk'.
    ls_data-fieldnum = 'Egrdt|Eccdt|Ccldt|Cclog|Eccmrn|Ecctrn'.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = 'Decno|Cclif|Ccper|Decdt|Ccdat1|Ccdat2|Ccdat|Ccldt|Cclgort|Cclog|Ccmos|Ccamt|Ccwae|Ccrsf|Ccvat1|Ccvat2|Hwbas|Ccltx|Ccamtk'.
    ls_data-roleid = 'CC'.

    INSERT zasimt0000c FROM @ls_data.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'CC01'.
    ls_data-viewid = 'IMIT'.
    ls_data-prognm = '통관생성'.
    ls_data-viewnm = '품목정보'.
    ls_data-viewob = '5'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'G'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Matnr|Maktx|Cclmng|Cclmns|Werks|Werkst|Lgort|Lgortt'.
    ls_data-fieldcre = 'Lgort|Cclmng'.
    ls_data-fieldupd = 'Lgort|Cclmng'.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = 'Lgort'.
    ls_data-roleid = 'CC'.

    INSERT zasimt0000c FROM @ls_data.


********************************통관생성(통관예정참조)*************************************************
    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'CC02'.
    ls_data-viewid = 'BJIF'.
    ls_data-prognm = '통관생성'.
    ls_data-viewnm = '발주정보'.
    ls_data-viewob = '1'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Bukrs|Zterm|Ekorg|Inco1|Ekgrp|Inco2|Lifnr|Netwr|Remak'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'CC'.

    INSERT zasimt0000c FROM @ls_data.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'CC02'.
    ls_data-viewid = 'IMIF'.
    ls_data-prognm = '통관생성'.
    ls_data-viewnm = '수입정보'.
    ls_data-viewob = '2'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Reqno|Lifre|Reqdt|Zcdno3|Reqyr|Colif|Acdat|Zcdno1|Filif|Conrt|Zcdno2|Cont1|Cont2|Zcdno4|Rqche|Remak'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'CC'.

    INSERT zasimt0000c FROM @ls_data.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'CC02'.
    ls_data-viewid = 'BLIF'.
    ls_data-prognm = '통관생성'.
    ls_data-viewnm = 'B/L정보'.
    ls_data-viewob = '3'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Blino|Bleno|Rqetd|Brgew|Ebeln|Bldat|Rqeta|Negew|Eccgb|Acdat|Bletd|Mosno|Blche|Lgnum|Bleta|Blamt|Blitx|Bldat2'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'CC'.

    INSERT zasimt0000c FROM @ls_data.



    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'CC02'.
    ls_data-viewid = 'ECIF'.
    ls_data-prognm = '통관생성'.
    ls_data-viewnm = '통관예정정보'.
    ls_data-viewob = '4'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Eccno|Egrdt|Eccwmn|Eccdt|Cclog|Ccldt|Eccmrn|Cclgort|Ecctrn'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = 'Egrdt|Eccwmn|Eccdt|Cclog|Ccldt|Eccmrn|Cclgort|Ecctrn'.
    ls_data-roleid = 'CC'.

    INSERT zasimt0000c FROM @ls_data.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'CC02'.
    ls_data-viewid = 'CCIF'.
    ls_data-prognm = '통관생성'.
    ls_data-viewnm = '통관정보'.
    ls_data-viewob = '5'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Cclno|Decno|Cclif|Ccper|Ccldt|Decdt|Ccdat1|Ccdat2|Ccdat|Cclgort|Cclog|Ccmos|Ccamt|Ccwae|Ccrsf|Ccvat1|Ccvat2|Hwbas|Ccltx|Ccamtk|Ccwaek'.
    ls_data-fieldcre = 'Decno|Cclif|Ccper|Decdt|Ccdat1|Ccdat2|Ccdat|Ccmos|Ccamt|Ccwae|Ccrsf|Ccvat1|Ccvat2|Hwbas|Ccltx|Ccamtk'.
    ls_data-fieldupd = 'Decno|Cclif|Ccper|Decdt|Ccdat1|Ccdat2|Ccdat|Cclog|Ccmos|Ccamt|Ccwae|Ccrsf|Ccvat1|Ccvat2|Hwbas|Ccltx|Ccamtk'.
    ls_data-fieldnum = 'Egrdt|Eccdt|Ccldt|Cclog|Eccmrn|Ecctrn'.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = 'Blino|Reqmu|Ebeln|Lifnr|Bleno|Bldat|Bldat2|Lgnum|Rqetd|Rqeta|Bletd|Bleta|Brgew|Ntgew|Mosnot|Blitx'.
    ls_data-roleid = 'CC'.

    INSERT zasimt0000c FROM @ls_data.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'CC02'.
    ls_data-viewid = 'IMIT'.
    ls_data-prognm = '통관생성'.
    ls_data-viewnm = '품목정보'.
    ls_data-viewob = '6'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'G'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Matnr|Maktx|Cclmng|Cclmns|Werks|Werkst|Lgort|Lgortt|Sampmng|Failmng|Quadt'.
    ls_data-fieldcre = 'Lgort|Cclmng'.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'CC'.

    INSERT zasimt0000c FROM @ls_data.

********************************수입입고*************************************************
    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'IG01'.
    ls_data-viewid = 'BJIF'.
    ls_data-prognm = '수입입고'.
    ls_data-viewnm = '발주정보'.
    ls_data-viewob = '1'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Bukrs|Zterm|Ekorg|Inco1|Ekgrp|Inco2|Lifnr|Netwr|Remak'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'IG'.

    INSERT zasimt0000c FROM @ls_data.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'IG01'.
    ls_data-viewid = 'IMIF'.
    ls_data-prognm = '수입입고'.
    ls_data-viewnm = '수입정보'.
    ls_data-viewob = '2'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Reqno|Lifre|Reqdt|Zcdno3|Reqyr|Colif|Acdat|Zcdno1|Filif|Conrt|Zcdno2|Cont1|Cont2|Zcdno4|Rqche|Remak'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'IG'.

    INSERT zasimt0000c FROM @ls_data.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'IG01'.
    ls_data-viewid = 'BLIF'.
    ls_data-prognm = '수입입고'.
    ls_data-viewnm = 'B/L정보'.
    ls_data-viewob = '3'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Blino|Bleno|Rqetd|Brgew|Ebeln|Bldat|Rqeta|Negew|Eccgb|Acdat|Bletd|Mosno|Blche|Lgnum|Bleta|Blamt|Blitx|Bldat2'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'IG'.

    INSERT zasimt0000c FROM @ls_data.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'IG01'.
    ls_data-viewid = 'CCIF'.
    ls_data-prognm = '수입입고'.
    ls_data-viewnm = '통관정보'.
    ls_data-viewob = '4'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Cclno|Decno|Cclif|Ccper|Ccldt|Decdt|Ccdat1|Ccdat2|Ccdat|Cclgort|Cclog|Ccmos|Ccamt|Ccwae|Ccrsf|Ccvat1|Ccvat2|Hwbas|Ccltx|Ccamtk|Ccwaek'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'IG'.

    INSERT zasimt0000c FROM @ls_data.


    TRY.
    lv_uuid = system_uuid->create_uuid_x16( ).
  CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'IG01'.
    ls_data-viewid = 'IGIF'.
    ls_data-prognm = '수입입고'.
    ls_data-viewnm = '입고정보'.
    ls_data-viewob = '5'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Mblnr|BelnrGr|BudatGr|Bktxt'.
    ls_data-fieldcre = 'BudatGr|Bktxt'.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'IG'.

    INSERT zasimt0000c FROM @ls_data.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'IG01'.
    ls_data-viewid = 'IMIT'.
    ls_data-prognm = '수입입고'.
    ls_data-viewnm = '품목정보'.
    ls_data-viewob = '6'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'G'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Matnr|Maktx|Grmng|Grmns|Werks|Werkst|Lgort|Lgortt|Charg|Hsdat|Maxlz|Vfdat'.
    ls_data-fieldcre = 'Grmng|Charg|Hsdat|Maxlz|Lgort'.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = 'Charg|Hsdat|Lgort'.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'IG'.

    INSERT zasimt0000c FROM @ls_data.


********************************부대비생성(수입계약참조)*************************************************

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'EX01'.
    ls_data-viewid = 'BJIF'.
    ls_data-prognm = '부대비생성(수입계약참조)'.
    ls_data-viewnm = '발주정보'.
    ls_data-viewob = '1'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Bukrs|Zterm|Ekorg|Inco1|Ekgrp|Inco2|Lifnr|Netwr|Remak'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'EX'.

    INSERT zasimt0000c FROM @ls_data.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'EX01'.
    ls_data-viewid = 'IMIF'.
    ls_data-prognm = '부대비생성(수입계약참조)'.
    ls_data-viewnm = '수입정보'.
    ls_data-viewob = '2'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Reqno|Lifre|Reqdt|Zcdno3|Reqyr|Colif|Acdat|Zcdno1|Filif|Conrt|Zcdno2|Cont1|Cont2|Zcdno4|Rqche|Remak'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'EX'.

    INSERT zasimt0000c FROM @ls_data.



    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'EX01'.
    ls_data-viewid = 'GSIF'.
    ls_data-prognm = '부대비생성(수입계약참조)'.
    ls_data-viewnm = '개설정보'.
    ls_data-viewob = '3'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Pterm|Opnum|Oplif|Zbd1t|Opbnk|Opwrs|Opdat|Pedat|Rqrsf|Opamt|Pdate|Sdate|Edate'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'EX'.

    INSERT zasimt0000c FROM @ls_data.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'EX01'.
    ls_data-viewid = 'FIIF'.
    ls_data-prognm = '부대비생성(수입계약참조)'.
    ls_data-viewnm = '전표정보'.
    ls_data-viewob = '4'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Belnr|BelnrFi|BelnrAp|BelnrTr'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'EX'.

    INSERT zasimt0000c FROM @ls_data.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'EX01'.
    ls_data-viewid = 'BDIF'.
    ls_data-prognm = '부대비생성(수입계약참조)'.
    ls_data-viewnm = '부대비정보'.
    ls_data-viewob = '5'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Feeno|Zcdno|Feegb|ZtermFees|Gbno|Mwskz|Zbd1tFees|Postgb|LifreFees|BudatFees|Kursf|Zterm|Zlsch|Zfbdt|Fbedt|IvamtFees|Wmwst1Fees|RmwwrFees|Bktxt'.
    ls_data-fieldcre = 'Zcdno|LifreFees|BudatFees|Kursf|Zterm|ZtermFees|Zlsch|Zfbdt|Fbedt|Mwskz|Zbd1tFees|IvamtFees|Wmwst1Fees|RmwwrFees|Bktxt'.
    ls_data-fieldupd = 'LifreFees|BudatFees|Kursf|Zterm|ZtermFees|Zlsch|Zfbdt|Fbedt|Mwskz|Zbd1tFees|IvamtFees|Wmwst1Fees|RmwwrFees|Bktxt'.
    ls_data-fieldnum = 'Egrdt|Eccdt|Ccldt|Cclgort|Cclog|Eccmrn|Ecctrn|Lgort'.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = 'Lifre_fees|Budat_fees|Zterm_fees|Zlsch|Zfbdt|Ivamt_fees|Mwskz|Wmwst1_fees|Kursf|Bktxt|Trlif_fees'.
    ls_data-roleid = 'EX'.

    INSERT zasimt0000c FROM @ls_data.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'EX01'.
    ls_data-viewid = 'IMIT'.
    ls_data-prognm = '부대비생성(수입계약참조)'.
    ls_data-viewnm = '품목정보'.
    ls_data-viewob = '6'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'G'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Itmno|Matnr|Maktx|MengeFees|MeinsFees|NetwrFees|WaersFees|Werks|Werkst|Reqno|Ebeln'.
    ls_data-fieldcre = 'NetwrFees'.
    ls_data-fieldupd = 'NetwrFees'.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'EX'.

    INSERT zasimt0000c FROM @ls_data.


********************************부대비생성(B/L참조)*************************************************

      TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'EX02'.
    ls_data-viewid = 'BJIF'.
    ls_data-prognm = '부대비생성(B/L참조)생성'.
    ls_data-viewnm = '발주정보'.
    ls_data-viewob = '1'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Bukrs|Zterm|Ekorg|Inco1|Ekgrp|Inco2|Lifnr|Netwr|Remak'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'EX'.

    INSERT zasimt0000c FROM @ls_data.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'EX02'.
    ls_data-viewid = 'IMIF'.
    ls_data-prognm = '부대비생성(B/L참조)생성'.
    ls_data-viewnm = '수입정보'.
    ls_data-viewob = '2'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Reqno|Lifre|Reqdt|Zcdno3|Reqyr|Colif|Acdat|Zcdno1|Filif|Conrt|Zcdno2|Cont1|Cont2|Zcdno4|Rqche|Remak'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'EX'.

    INSERT zasimt0000c FROM @ls_data.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'EX02'.
    ls_data-viewid = 'BLIF'.
    ls_data-prognm = '부대비생성(B/L참조)'.
    ls_data-viewnm = 'B/L정보'.
    ls_data-viewob = '3'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Blino|Bleno|Rqetd|Brgew|Ebeln|Bldat|Rqeta|Negew|Eccgb|Acdat|Bletd|Mosno|Blche|Lgnum|Bleta|Blamt|Blitx|Bldat2'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'EX'.

    INSERT zasimt0000c FROM @ls_data.


    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'EX02'.
    ls_data-viewid = 'FIIF'.
    ls_data-prognm = '부대비생성(B/L참조)'.
    ls_data-viewnm = '전표정보'.
    ls_data-viewob = '4'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Belnr|BelnrFi|BelnrAp|BelnrTr'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'EX'.

    INSERT zasimt0000c FROM @ls_data.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'EX02'.
    ls_data-viewid = 'BDIF'.
    ls_data-prognm = '부대비생성(B/L참조)'.
    ls_data-viewnm = '부대비정보'.
    ls_data-viewob = '5'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Feeno|Zcdno|Feegb|ZtermFees|Gbno|Mwskz|Zbd1tFees|Postgb|LifreFees|BudatFees|Kursf|Zterm|Zlsch|Zfbdt|Fbedt|IvamtFees|Wmwst1Fees|RmwwrFees|Bktxt'.
    ls_data-fieldcre = 'Zcdno|LifreFees|BudatFees|Kursf|Zterm|ZtermFees|Zlsch|Zfbdt|Fbedt|Mwskz|Zbd1tFees|IvamtFees|Wmwst1Fees|RmwwrFees|Bktxt'.
    ls_data-fieldupd = 'LifreFees|BudatFees|Kursf|Zterm|ZtermFees|Zlsch|Zfbdt|Fbedt|Mwskz|Zbd1tFees|IvamtFees|Wmwst1Fees|RmwwrFees|Bktxt'.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'EX'.

    INSERT zasimt0000c FROM @ls_data.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'EX02'.
    ls_data-viewid = 'IMIT'.
    ls_data-prognm = '부대비생성(B/L참조)'.
    ls_data-viewnm = '품목정보'.
    ls_data-viewob = '6'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'G'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Blinp|Matnr|Maktx|MengeFees|MeinsFees|NetwrFees|WaersFees|Werks|Werkst|Reqno|Ebeln|Blino'.
    ls_data-fieldcre = 'NetwrFees'.
    ls_data-fieldupd = 'NetwrFees'.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'EX'.

    INSERT zasimt0000c FROM @ls_data.

********************************부대비생성(통관 참조)*************************************************

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'EX03'.
    ls_data-viewid = 'BJIF'.
    ls_data-prognm = '부대비생성(통관)'.
    ls_data-viewnm = '발주정보'.
    ls_data-viewob = '1'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Bukrs|Zterm|Ekorg|Inco1|Ekgrp|Inco2|Lifnr|Netwr|Remak'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'EX'.

    INSERT zasimt0000c FROM @ls_data.



    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'EX03'.
    ls_data-viewid = 'IMIF'.
    ls_data-prognm = '부대비생성(통관)'.
    ls_data-viewnm = '수입정보'.
    ls_data-viewob = '2'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Reqno|Lifre|Reqdt|Zcdno3|Reqyr|Colif|Acdat|Zcdno1|Filif|Conrt|Zcdno2|Cont1|Cont2|Zcdno4|Rqche|Remak'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'EX'.

    INSERT zasimt0000c FROM @ls_data.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'EX03'.
    ls_data-viewid = 'CCIF'.
    ls_data-prognm = '부대비생성(통관)'.
    ls_data-viewnm = '통관정보'.
    ls_data-viewob = '3'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Cclno|Decno|Cclif|Ccper|Decdt|Ccldt|Ccdat1|Ccdat2|Ccdat|Cclgort|Cclog|Ccmos|Ccamt|Ccwae|Ccrsf|Ccvat1|Ccvat2|Hwbas|Ccltx|Ccamtk|Ccwaek'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'EX'.

    INSERT zasimt0000c FROM @ls_data.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'EX03'.
    ls_data-viewid = 'FIIF'.
    ls_data-prognm = '부대비생성(통관)'.
    ls_data-viewnm = '전표정보'.
    ls_data-viewob = '4'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Belnr|BelnrFi|BelnrAp|BelnrTr'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'EX'.

    INSERT zasimt0000c FROM @ls_data.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'EX03'.
    ls_data-viewid = 'BDIF'.
    ls_data-prognm = '부대비생성(통관)'.
    ls_data-viewnm = '부대비정보'.
    ls_data-viewob = '5'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Feeno|Zcdno|Feegb|ZtermFees|Gbno|Mwskz|Zbd1tFees|Postgb|LifreFees|BudatFees|Kursf|Zterm|Zlsch|Zfbdt|Fbedt|IvamtFees|Wmwst1Fees|Bktxt|RmwwrFees|WaersFees'.
    ls_data-fieldcre = 'Zcdno|LifreFees|BudatFees|Kursf|Zterm|ZtermFees|Zlsch|Zfbdt|Mwskz|Zbd1tFees|Fbedt|Wmwst1Fees|Bktxt|RmwwrFees|IvamtFees'.
    ls_data-fieldupd = 'LifreFees|BudatFees|Kursf|Zterm|ZtermFees|Zlsch|Zfbdt|Fbedt|Mwskz|Zbd1tFees|IvamtFees|Wmwst1Fees|RmwwrFees|Bktxt'.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'EX'.

    INSERT zasimt0000c FROM @ls_data.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'EX03'.
    ls_data-viewid = 'IMIT'.
    ls_data-prognm = '부대비생성(통관)'.
    ls_data-viewnm = '품목정보'.
    ls_data-viewob = '6'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'G'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Cclnp|Matnr|Maktx|MengeFees|MeinsFees|NetwrFees|WaersFees|Werks|Werkst|Reqno|Ebeln|Blino|Cclno'.
    ls_data-fieldcre = 'NetwrFees'.
    ls_data-fieldupd = 'NetwrFees'.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'EX'.

    INSERT zasimt0000c FROM @ls_data.

********************************부대비생성(입고 참조)*************************************************

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'EX04'.
    ls_data-viewid = 'BJIF'.
    ls_data-prognm = '부대비생성(입고)'.
    ls_data-viewnm = '발주정보'.
    ls_data-viewob = '1'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Bukrs|Zterm|Ekorg|Inco1|Ekgrp|Inco2|Lifnr|Netwr|Remak'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'EX'.

    INSERT zasimt0000c FROM @ls_data.



    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'EX04'.
    ls_data-viewid = 'IMIF'.
    ls_data-prognm = '부대비생성(입고)'.
    ls_data-viewnm = '수입정보'.
    ls_data-viewob = '2'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Reqno|Lifre|Reqdt|Zcdno3|Reqyr|Colif|Acdat|Zcdno1|Filif|Conrt|Zcdno2|Cont1|Cont2|Zcdno4|Rqche|Remak'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'EX'.

    INSERT zasimt0000c FROM @ls_data.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'EX04'.
    ls_data-viewid = 'CCIF'.
    ls_data-prognm = '부대비생성(입고)'.
    ls_data-viewnm = '통관정보'.
    ls_data-viewob = '3'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Cclno|Decno|Cclif|Ccper|Decdt|Ccldt|Ccdat1|Ccdat2|Ccdat|Cclgort|Cclog|Ccmos|Ccamt|Ccwae|Ccrsf|Ccvat1|Ccvat2|Hwbas|Ccltx|Ccamtk|Ccwaek'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'EX'.

    INSERT zasimt0000c FROM @ls_data.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'EX04'.
    ls_data-viewid = 'IGIF'.
    ls_data-prognm = '부대비생성(입고)'.
    ls_data-viewnm = '입고정보'.
    ls_data-viewob = '4'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Mblnr|BelnrGr|BudatGr|Bktxt'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'EX'.

    INSERT zasimt0000c FROM @ls_data.


    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'EX04'.
    ls_data-viewid = 'FIIF'.
    ls_data-prognm = '부대비생성(입고)'.
    ls_data-viewnm = '전표정보'.
    ls_data-viewob = '5'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Belnr|BelnrFi|BelnrAp|BelnrTr'.
    ls_data-fieldcre = ''.
    ls_data-fieldupd = ''.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'EX'.

    INSERT zasimt0000c FROM @ls_data.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'EX04'.
    ls_data-viewid = 'BDIF'.
    ls_data-prognm = '부대비생성(입고)'.
    ls_data-viewnm = '부대비정보'.
    ls_data-viewob = '6'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'B'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Feeno|Zcdno|Feegb|ZtermFees|Gbno|Mwskz|Zbd1tFees|Postgb|LifreFees|BudatFees|Kursf|Zterm|Zlsch|Zfbdt|Fbedt|IvamtFees|Wmwst1Fees|Bktxt|RmwwrFees|WaersFees'.
    ls_data-fieldcre = 'Zcdno|LifreFees|BudatFees|Kursf|Zterm|ZtermFees|Zlsch|Zfbdt|Mwskz|Zbd1tFees|Wmwst1Fees|Bktxt|RmwwrFees'.
    ls_data-fieldupd = 'LifreFees|BudatFees|Kursf|Zterm|ZtermFees|Zlsch|Zfbdt|Fbedt|Mwskz|Zbd1tFees|IvamtFees|Wmwst1Fees|RmwwrFees|Bktxt'.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'EX'.

    INSERT zasimt0000c FROM @ls_data.

    TRY.
        lv_uuid = system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
    ENDTRY.

    ls_data-client = '080'.
    ls_data-uuid = lv_uuid.
    ls_data-progid = 'EX04'.
    ls_data-viewid = 'IMIT'.
    ls_data-prognm = '부대비생성(입고)'.
    ls_data-viewnm = '품목정보'.
    ls_data-viewob = '7'.
    ls_data-viewat = ''.
    ls_data-viewtp = 'G'.
    ls_data-usediv = 'Y'.
    ls_data-fieldall = 'Zeile|Matnr|Maktx|MengeFees|MeinsFees|NetwrFees|WaersFees|Werks|Werkst|Reqno|Ebeln|Blino|Cclno|Mblnr'.
    ls_data-fieldcre = 'NetwrFees'.
    ls_data-fieldupd = 'NetwrFees'.
    ls_data-fieldnum = ''.
    ls_data-fielddat = ''.
    ls_data-fieldkey = ''.
    ls_data-fieldseq = ''.
    ls_data-roleid = 'EX'.

    INSERT zasimt0000c FROM @ls_data.

  ENDMETHOD.
ENDCLASS.

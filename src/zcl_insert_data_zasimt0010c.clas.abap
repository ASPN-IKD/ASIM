CLASS zcl_insert_data_zasimt0010c DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_INSERT_DATA_ZASIMT0010C IMPLEMENTATION.


    METHOD if_oo_adt_classrun~main.

    DATA: ls_data0 TYPE zasimt0010c.
    DATA: ls_data1 TYPE zasimt0011c.
    DATA: lv_uuid0 TYPE sysuuid_x16.
    DATA: lv_uuid1 TYPE sysuuid_x16.

    DATA: system_uuid TYPE REF TO if_system_uuid,
          uuid        TYPE sysuuid_c32.

    DO 1 TIMES.
    system_uuid = cl_uuid_factory=>create_system_uuid( ).
    ENDDO.

    DELETE FROM zasimt0010c.
    DELETE FROM zasimt0011c.

* 수입계약

    TRY.
      lv_uuid0 = system_uuid->create_uuid_x16( ).
      ls_data0-client = '080'.
      ls_data0-uuid = lv_uuid0.
      ls_data0-bukrs = '4310'.
      ls_data0-ekorg = '4310'.
      ls_data0-roleid = 'IM'.
      ls_data0-rolenm = '수입계약'.
      ls_data0-hiddenid = 'im01_1Btn|im01_2Btn|im01_3Btn'.
      ls_data0-remark = '생성|수입이력|부대비생성'.
      INSERT zasimt0010c FROM @ls_data0.

      lv_uuid1 = system_uuid->create_uuid_x16( ).
      ls_data1-client = '080'.
      ls_data1-parentuuid = lv_uuid0.
      ls_data1-uuid = lv_uuid1.
      ls_data1-roletype = 'M'.
      ls_data1-userid = 'CB9980000015'.
      ls_data1-usernm = '이정수'.
      ls_data1-userdp = ''.
      ls_data1-hiddenid = ''.
      ls_data1-remark = ''.
      INSERT zasimt0011c FROM @ls_data1.

      lv_uuid1 = system_uuid->create_uuid_x16( ).
      ls_data1-client = '080'.
      ls_data1-parentuuid = lv_uuid0.
      ls_data1-uuid = lv_uuid1.
      ls_data1-roletype = 'M'.
      ls_data1-userid = 'CB9980000011'.
      ls_data1-usernm = '육성규'.
      ls_data1-userdp = ''.
      ls_data1-hiddenid = ''.
      ls_data1-remark = ''.
      INSERT zasimt0011c FROM @ls_data1.

      lv_uuid1 = system_uuid->create_uuid_x16( ).
      ls_data1-client = '080'.
      ls_data1-parentuuid = lv_uuid0.
      ls_data1-uuid = lv_uuid1.
      ls_data1-roletype = 'M'.
      ls_data1-userid = 'CB9980000001'.
      ls_data1-usernm = '이연성'.
      ls_data1-userdp = ''.
      ls_data1-hiddenid = ''.
      ls_data1-remark = ''.
      INSERT zasimt0011c FROM @ls_data1.

      lv_uuid1 = system_uuid->create_uuid_x16( ).
      ls_data1-client = '080'.
      ls_data1-parentuuid = lv_uuid0.
      ls_data1-uuid = lv_uuid1.
      ls_data1-roletype = 'M'.
      ls_data1-userid = 'DEFAULT_USER'.
      ls_data1-usernm = 'Default User'.
      ls_data1-userdp = ''.
      ls_data1-hiddenid = ''.
      ls_data1-remark = ''.
      INSERT zasimt0011c FROM @ls_data1.

      lv_uuid1 = system_uuid->create_uuid_x16( ).
      ls_data1-client = '080'.
      ls_data1-parentuuid = lv_uuid0.
      ls_data1-uuid = lv_uuid1.
      ls_data1-roletype = 'M'.
      ls_data1-userid = 'CB9980000010'.
      ls_data1-usernm = '김서현'.
      ls_data1-userdp = ''.
      ls_data1-hiddenid = ''.
      ls_data1-remark = ''.
      INSERT zasimt0011c FROM @ls_data1.

    CATCH cx_uuid_error.
    ENDTRY.

* BL생성

    TRY.
      lv_uuid0 = system_uuid->create_uuid_x16( ).
      ls_data0-client = '080'.
      ls_data0-uuid = lv_uuid0.
      ls_data0-bukrs = '4310'.
      ls_data0-ekorg = '4310'.
      ls_data0-roleid = 'BL'.
      ls_data0-rolenm = 'BL생성'.
      ls_data0-hiddenid = 'im01_1Btn|im01_2Btn|im01_3Btn'.
      ls_data0-remark = '생성|수입이력|부대비생성'.
      INSERT zasimt0010c FROM @ls_data0.

      lv_uuid1 = system_uuid->create_uuid_x16( ).
      ls_data1-client = '080'.
      ls_data1-parentuuid = lv_uuid0.
      ls_data1-uuid = lv_uuid1.
      ls_data1-roletype = 'M'.
      ls_data1-userid = 'CB9980000015'.
      ls_data1-usernm = '이정수'.
      ls_data1-userdp = ''.
      ls_data1-hiddenid = ''.
      ls_data1-remark = ''.
      INSERT zasimt0011c FROM @ls_data1.

      lv_uuid1 = system_uuid->create_uuid_x16( ).
      ls_data1-client = '080'.
      ls_data1-parentuuid = lv_uuid0.
      ls_data1-uuid = lv_uuid1.
      ls_data1-roletype = 'M'.
      ls_data1-userid = 'CB9980000011'.
      ls_data1-usernm = '육성규'.
      ls_data1-userdp = ''.
      ls_data1-hiddenid = ''.
      ls_data1-remark = ''.
      INSERT zasimt0011c FROM @ls_data1.

      lv_uuid1 = system_uuid->create_uuid_x16( ).
      ls_data1-client = '080'.
      ls_data1-parentuuid = lv_uuid0.
      ls_data1-uuid = lv_uuid1.
      ls_data1-roletype = 'M'.
      ls_data1-userid = 'CB9980000001'.
      ls_data1-usernm = '이연성'.
      ls_data1-userdp = ''.
      ls_data1-hiddenid = ''.
      ls_data1-remark = ''.
      INSERT zasimt0011c FROM @ls_data1.

      lv_uuid1 = system_uuid->create_uuid_x16( ).
      ls_data1-client = '080'.
      ls_data1-parentuuid = lv_uuid0.
      ls_data1-uuid = lv_uuid1.
      ls_data1-roletype = 'M'.
      ls_data1-userid = 'DEFAULT_USER'.
      ls_data1-usernm = 'Default User'.
      ls_data1-userdp = ''.
      ls_data1-hiddenid = ''.
      ls_data1-remark = ''.
      INSERT zasimt0011c FROM @ls_data1.

      lv_uuid1 = system_uuid->create_uuid_x16( ).
      ls_data1-client = '080'.
      ls_data1-parentuuid = lv_uuid0.
      ls_data1-uuid = lv_uuid1.
      ls_data1-roletype = 'M'.
      ls_data1-userid = 'CB9980000010'.
      ls_data1-usernm = '김서현'.
      ls_data1-userdp = ''.
      ls_data1-hiddenid = ''.
      ls_data1-remark = ''.
      INSERT zasimt0011c FROM @ls_data1.

    CATCH cx_uuid_error.
    ENDTRY.

* IV생성

    TRY.
      lv_uuid0 = system_uuid->create_uuid_x16( ).
      ls_data0-client = '080'.
      ls_data0-uuid = lv_uuid0.
      ls_data0-bukrs = '4310'.
      ls_data0-ekorg = '4310'.
      ls_data0-roleid = 'IV'.
      ls_data0-rolenm = 'IV생성'.
      ls_data0-hiddenid = 'im01_1Btn|im01_2Btn|im01_3Btn'.
      ls_data0-remark = '생성|수입이력|부대비생성'.
      INSERT zasimt0010c FROM @ls_data0.

      lv_uuid1 = system_uuid->create_uuid_x16( ).
      ls_data1-client = '080'.
      ls_data1-parentuuid = lv_uuid0.
      ls_data1-uuid = lv_uuid1.
      ls_data1-roletype = 'M'.
      ls_data1-userid = 'CB9980000015'.
      ls_data1-usernm = '이정수'.
      ls_data1-userdp = ''.
      ls_data1-hiddenid = ''.
      ls_data1-remark = ''.
      INSERT zasimt0011c FROM @ls_data1.

      lv_uuid1 = system_uuid->create_uuid_x16( ).
      ls_data1-client = '080'.
      ls_data1-parentuuid = lv_uuid0.
      ls_data1-uuid = lv_uuid1.
      ls_data1-roletype = 'M'.
      ls_data1-userid = 'CB9980000011'.
      ls_data1-usernm = '육성규'.
      ls_data1-userdp = ''.
      ls_data1-hiddenid = ''.
      ls_data1-remark = ''.
      INSERT zasimt0011c FROM @ls_data1.

      lv_uuid1 = system_uuid->create_uuid_x16( ).
      ls_data1-client = '080'.
      ls_data1-parentuuid = lv_uuid0.
      ls_data1-uuid = lv_uuid1.
      ls_data1-roletype = 'M'.
      ls_data1-userid = 'CB9980000001'.
      ls_data1-usernm = '이연성'.
      ls_data1-userdp = ''.
      ls_data1-hiddenid = ''.
      ls_data1-remark = ''.
      INSERT zasimt0011c FROM @ls_data1.

      lv_uuid1 = system_uuid->create_uuid_x16( ).
      ls_data1-client = '080'.
      ls_data1-parentuuid = lv_uuid0.
      ls_data1-uuid = lv_uuid1.
      ls_data1-roletype = 'M'.
      ls_data1-userid = 'DEFAULT_USER'.
      ls_data1-usernm = 'Default User'.
      ls_data1-userdp = ''.
      ls_data1-hiddenid = ''.
      ls_data1-remark = ''.
      INSERT zasimt0011c FROM @ls_data1.

      lv_uuid1 = system_uuid->create_uuid_x16( ).
      ls_data1-client = '080'.
      ls_data1-parentuuid = lv_uuid0.
      ls_data1-uuid = lv_uuid1.
      ls_data1-roletype = 'M'.
      ls_data1-userid = 'CB9980000010'.
      ls_data1-usernm = '김서현'.
      ls_data1-userdp = ''.
      ls_data1-hiddenid = ''.
      ls_data1-remark = ''.
      INSERT zasimt0011c FROM @ls_data1.

    CATCH cx_uuid_error.
    ENDTRY.

* 통관예정생성

    TRY.
      lv_uuid0 = system_uuid->create_uuid_x16( ).
      ls_data0-client = '080'.
      ls_data0-uuid = lv_uuid0.
      ls_data0-bukrs = '4310'.
      ls_data0-ekorg = '4310'.
      ls_data0-roleid = 'EC'.
      ls_data0-rolenm = '통관예정생성'.
      ls_data0-hiddenid = 'im01_1Btn|im01_2Btn|im01_3Btn'.
      ls_data0-remark = '생성|수입이력|부대비생성'.
      INSERT zasimt0010c FROM @ls_data0.

      lv_uuid1 = system_uuid->create_uuid_x16( ).
      ls_data1-client = '080'.
      ls_data1-parentuuid = lv_uuid0.
      ls_data1-uuid = lv_uuid1.
      ls_data1-roletype = 'M'.
      ls_data1-userid = 'CB9980000015'.
      ls_data1-usernm = '이정수'.
      ls_data1-userdp = ''.
      ls_data1-hiddenid = ''.
      ls_data1-remark = ''.
      INSERT zasimt0011c FROM @ls_data1.

      lv_uuid1 = system_uuid->create_uuid_x16( ).
      ls_data1-client = '080'.
      ls_data1-parentuuid = lv_uuid0.
      ls_data1-uuid = lv_uuid1.
      ls_data1-roletype = 'M'.
      ls_data1-userid = 'CB9980000011'.
      ls_data1-usernm = '육성규'.
      ls_data1-userdp = ''.
      ls_data1-hiddenid = ''.
      ls_data1-remark = ''.
      INSERT zasimt0011c FROM @ls_data1.

      lv_uuid1 = system_uuid->create_uuid_x16( ).
      ls_data1-client = '080'.
      ls_data1-parentuuid = lv_uuid0.
      ls_data1-uuid = lv_uuid1.
      ls_data1-roletype = 'M'.
      ls_data1-userid = 'CB9980000001'.
      ls_data1-usernm = '이연성'.
      ls_data1-userdp = ''.
      ls_data1-hiddenid = ''.
      ls_data1-remark = ''.
      INSERT zasimt0011c FROM @ls_data1.

      lv_uuid1 = system_uuid->create_uuid_x16( ).
      ls_data1-client = '080'.
      ls_data1-parentuuid = lv_uuid0.
      ls_data1-uuid = lv_uuid1.
      ls_data1-roletype = 'M'.
      ls_data1-userid = 'DEFAULT_USER'.
      ls_data1-usernm = 'Default User'.
      ls_data1-userdp = ''.
      ls_data1-hiddenid = ''.
      ls_data1-remark = ''.
      INSERT zasimt0011c FROM @ls_data1.

      lv_uuid1 = system_uuid->create_uuid_x16( ).
      ls_data1-client = '080'.
      ls_data1-parentuuid = lv_uuid0.
      ls_data1-uuid = lv_uuid1.
      ls_data1-roletype = 'M'.
      ls_data1-userid = 'CB9980000010'.
      ls_data1-usernm = '김서현'.
      ls_data1-userdp = ''.
      ls_data1-hiddenid = ''.
      ls_data1-remark = ''.
      INSERT zasimt0011c FROM @ls_data1.

    CATCH cx_uuid_error.
    ENDTRY.

* 통관생성

    TRY.
      lv_uuid0 = system_uuid->create_uuid_x16( ).
      ls_data0-client = '080'.
      ls_data0-uuid = lv_uuid0.
      ls_data0-bukrs = '4310'.
      ls_data0-ekorg = '4310'.
      ls_data0-roleid = 'CC'.
      ls_data0-rolenm = '통관생성'.
      ls_data0-hiddenid = 'im01_1Btn|im01_2Btn|im01_3Btn'.
      ls_data0-remark = '생성|수입이력|부대비생성'.
      INSERT zasimt0010c FROM @ls_data0.

      lv_uuid1 = system_uuid->create_uuid_x16( ).
      ls_data1-client = '080'.
      ls_data1-parentuuid = lv_uuid0.
      ls_data1-uuid = lv_uuid1.
      ls_data1-roletype = 'M'.
      ls_data1-userid = 'CB9980000015'.
      ls_data1-usernm = '이정수'.
      ls_data1-userdp = ''.
      ls_data1-hiddenid = ''.
      ls_data1-remark = ''.
      INSERT zasimt0011c FROM @ls_data1.

      lv_uuid1 = system_uuid->create_uuid_x16( ).
      ls_data1-client = '080'.
      ls_data1-parentuuid = lv_uuid0.
      ls_data1-uuid = lv_uuid1.
      ls_data1-roletype = 'M'.
      ls_data1-userid = 'CB9980000011'.
      ls_data1-usernm = '육성규'.
      ls_data1-userdp = ''.
      ls_data1-hiddenid = ''.
      ls_data1-remark = ''.
      INSERT zasimt0011c FROM @ls_data1.

      lv_uuid1 = system_uuid->create_uuid_x16( ).
      ls_data1-client = '080'.
      ls_data1-parentuuid = lv_uuid0.
      ls_data1-uuid = lv_uuid1.
      ls_data1-roletype = 'M'.
      ls_data1-userid = 'CB9980000001'.
      ls_data1-usernm = '이연성'.
      ls_data1-userdp = ''.
      ls_data1-hiddenid = ''.
      ls_data1-remark = ''.
      INSERT zasimt0011c FROM @ls_data1.

      lv_uuid1 = system_uuid->create_uuid_x16( ).
      ls_data1-client = '080'.
      ls_data1-parentuuid = lv_uuid0.
      ls_data1-uuid = lv_uuid1.
      ls_data1-roletype = 'M'.
      ls_data1-userid = 'DEFAULT_USER'.
      ls_data1-usernm = 'Default User'.
      ls_data1-userdp = ''.
      ls_data1-hiddenid = ''.
      ls_data1-remark = ''.
      INSERT zasimt0011c FROM @ls_data1.

      lv_uuid1 = system_uuid->create_uuid_x16( ).
      ls_data1-client = '080'.
      ls_data1-parentuuid = lv_uuid0.
      ls_data1-uuid = lv_uuid1.
      ls_data1-roletype = 'M'.
      ls_data1-userid = 'CB9980000010'.
      ls_data1-usernm = '김서현'.
      ls_data1-userdp = ''.
      ls_data1-hiddenid = ''.
      ls_data1-remark = ''.
      INSERT zasimt0011c FROM @ls_data1.

    CATCH cx_uuid_error.
    ENDTRY.

* 수입입고

    TRY.
      lv_uuid0 = system_uuid->create_uuid_x16( ).
      ls_data0-client = '080'.
      ls_data0-uuid = lv_uuid0.
      ls_data0-bukrs = '4310'.
      ls_data0-ekorg = '4310'.
      ls_data0-roleid = 'IG'.
      ls_data0-rolenm = '수입입고'.
      ls_data0-hiddenid = 'im01_1Btn|im01_2Btn|im01_3Btn'.
      ls_data0-remark = '생성|수입이력|부대비생성'.
      INSERT zasimt0010c FROM @ls_data0.

      lv_uuid1 = system_uuid->create_uuid_x16( ).
      ls_data1-client = '080'.
      ls_data1-parentuuid = lv_uuid0.
      ls_data1-uuid = lv_uuid1.
      ls_data1-roletype = 'M'.
      ls_data1-userid = 'CB9980000015'.
      ls_data1-usernm = '이정수'.
      ls_data1-userdp = ''.
      ls_data1-hiddenid = ''.
      ls_data1-remark = ''.
      INSERT zasimt0011c FROM @ls_data1.

      lv_uuid1 = system_uuid->create_uuid_x16( ).
      ls_data1-client = '080'.
      ls_data1-parentuuid = lv_uuid0.
      ls_data1-uuid = lv_uuid1.
      ls_data1-roletype = 'M'.
      ls_data1-userid = 'CB9980000011'.
      ls_data1-usernm = '육성규'.
      ls_data1-userdp = ''.
      ls_data1-hiddenid = ''.
      ls_data1-remark = ''.
      INSERT zasimt0011c FROM @ls_data1.

      lv_uuid1 = system_uuid->create_uuid_x16( ).
      ls_data1-client = '080'.
      ls_data1-parentuuid = lv_uuid0.
      ls_data1-uuid = lv_uuid1.
      ls_data1-roletype = 'M'.
      ls_data1-userid = 'CB9980000001'.
      ls_data1-usernm = '이연성'.
      ls_data1-userdp = ''.
      ls_data1-hiddenid = ''.
      ls_data1-remark = ''.
      INSERT zasimt0011c FROM @ls_data1.

      lv_uuid1 = system_uuid->create_uuid_x16( ).
      ls_data1-client = '080'.
      ls_data1-parentuuid = lv_uuid0.
      ls_data1-uuid = lv_uuid1.
      ls_data1-roletype = 'M'.
      ls_data1-userid = 'DEFAULT_USER'.
      ls_data1-usernm = 'Default User'.
      ls_data1-userdp = ''.
      ls_data1-hiddenid = ''.
      ls_data1-remark = ''.
      INSERT zasimt0011c FROM @ls_data1.

      lv_uuid1 = system_uuid->create_uuid_x16( ).
      ls_data1-client = '080'.
      ls_data1-parentuuid = lv_uuid0.
      ls_data1-uuid = lv_uuid1.
      ls_data1-roletype = 'M'.
      ls_data1-userid = 'CB9980000010'.
      ls_data1-usernm = '김서현'.
      ls_data1-userdp = ''.
      ls_data1-hiddenid = ''.
      ls_data1-remark = ''.
      INSERT zasimt0011c FROM @ls_data1.

    CATCH cx_uuid_error.
    ENDTRY.

* 수입마감

    TRY.
      lv_uuid0 = system_uuid->create_uuid_x16( ).
      ls_data0-client = '080'.
      ls_data0-uuid = lv_uuid0.
      ls_data0-bukrs = '4310'.
      ls_data0-ekorg = '4310'.
      ls_data0-roleid = 'MG'.
      ls_data0-rolenm = '수입입고'.
      ls_data0-hiddenid = 'im01_1Btn|im01_2Btn|im01_3Btn'.
      ls_data0-remark = '생성|수입이력|부대비생성'.
      INSERT zasimt0010c FROM @ls_data0.

      lv_uuid1 = system_uuid->create_uuid_x16( ).
      ls_data1-client = '080'.
      ls_data1-parentuuid = lv_uuid0.
      ls_data1-uuid = lv_uuid1.
      ls_data1-roletype = 'M'.
      ls_data1-userid = 'CB9980000015'.
      ls_data1-usernm = '이정수'.
      ls_data1-userdp = ''.
      ls_data1-hiddenid = ''.
      ls_data1-remark = ''.
      INSERT zasimt0011c FROM @ls_data1.

      lv_uuid1 = system_uuid->create_uuid_x16( ).
      ls_data1-client = '080'.
      ls_data1-parentuuid = lv_uuid0.
      ls_data1-uuid = lv_uuid1.
      ls_data1-roletype = 'M'.
      ls_data1-userid = 'CB9980000011'.
      ls_data1-usernm = '육성규'.
      ls_data1-userdp = ''.
      ls_data1-hiddenid = ''.
      ls_data1-remark = ''.
      INSERT zasimt0011c FROM @ls_data1.

      lv_uuid1 = system_uuid->create_uuid_x16( ).
      ls_data1-client = '080'.
      ls_data1-parentuuid = lv_uuid0.
      ls_data1-uuid = lv_uuid1.
      ls_data1-roletype = 'M'.
      ls_data1-userid = 'CB9980000001'.
      ls_data1-usernm = '이연성'.
      ls_data1-userdp = ''.
      ls_data1-hiddenid = ''.
      ls_data1-remark = ''.
      INSERT zasimt0011c FROM @ls_data1.

      lv_uuid1 = system_uuid->create_uuid_x16( ).
      ls_data1-client = '080'.
      ls_data1-parentuuid = lv_uuid0.
      ls_data1-uuid = lv_uuid1.
      ls_data1-roletype = 'M'.
      ls_data1-userid = 'DEFAULT_USER'.
      ls_data1-usernm = 'Default User'.
      ls_data1-userdp = ''.
      ls_data1-hiddenid = ''.
      ls_data1-remark = ''.
      INSERT zasimt0011c FROM @ls_data1.

      lv_uuid1 = system_uuid->create_uuid_x16( ).
      ls_data1-client = '080'.
      ls_data1-parentuuid = lv_uuid0.
      ls_data1-uuid = lv_uuid1.
      ls_data1-roletype = 'M'.
      ls_data1-userid = 'CB9980000010'.
      ls_data1-usernm = '김서현'.
      ls_data1-userdp = ''.
      ls_data1-hiddenid = ''.
      ls_data1-remark = ''.
      INSERT zasimt0011c FROM @ls_data1.

    CATCH cx_uuid_error.
    ENDTRY.

* 부대비생성

    TRY.
      lv_uuid0 = system_uuid->create_uuid_x16( ).
      ls_data0-client = '080'.
      ls_data0-uuid = lv_uuid0.
      ls_data0-bukrs = '4310'.
      ls_data0-ekorg = '4310'.
      ls_data0-roleid = 'EX'.
      ls_data0-rolenm = '부대비생성'.
      ls_data0-hiddenid = 'im01_1Btn|im01_2Btn|im01_3Btn'.
      ls_data0-remark = '생성|수입이력|부대비생성'.
      INSERT zasimt0010c FROM @ls_data0.

      lv_uuid1 = system_uuid->create_uuid_x16( ).
      ls_data1-client = '080'.
      ls_data1-parentuuid = lv_uuid0.
      ls_data1-uuid = lv_uuid1.
      ls_data1-roletype = 'M'.
      ls_data1-userid = 'CB9980000015'.
      ls_data1-usernm = '이정수'.
      ls_data1-userdp = ''.
      ls_data1-hiddenid = ''.
      ls_data1-remark = ''.
      INSERT zasimt0011c FROM @ls_data1.

      lv_uuid1 = system_uuid->create_uuid_x16( ).
      ls_data1-client = '080'.
      ls_data1-parentuuid = lv_uuid0.
      ls_data1-uuid = lv_uuid1.
      ls_data1-roletype = 'M'.
      ls_data1-userid = 'CB9980000011'.
      ls_data1-usernm = '육성규'.
      ls_data1-userdp = ''.
      ls_data1-hiddenid = ''.
      ls_data1-remark = ''.
      INSERT zasimt0011c FROM @ls_data1.

      lv_uuid1 = system_uuid->create_uuid_x16( ).
      ls_data1-client = '080'.
      ls_data1-parentuuid = lv_uuid0.
      ls_data1-uuid = lv_uuid1.
      ls_data1-roletype = 'M'.
      ls_data1-userid = 'CB9980000001'.
      ls_data1-usernm = '이연성'.
      ls_data1-userdp = ''.
      ls_data1-hiddenid = ''.
      ls_data1-remark = ''.
      INSERT zasimt0011c FROM @ls_data1.

      lv_uuid1 = system_uuid->create_uuid_x16( ).
      ls_data1-client = '080'.
      ls_data1-parentuuid = lv_uuid0.
      ls_data1-uuid = lv_uuid1.
      ls_data1-roletype = 'M'.
      ls_data1-userid = 'DEFAULT_USER'.
      ls_data1-usernm = 'Default User'.
      ls_data1-userdp = ''.
      ls_data1-hiddenid = ''.
      ls_data1-remark = ''.
      INSERT zasimt0011c FROM @ls_data1.

      lv_uuid1 = system_uuid->create_uuid_x16( ).
      ls_data1-client = '080'.
      ls_data1-parentuuid = lv_uuid0.
      ls_data1-uuid = lv_uuid1.
      ls_data1-roletype = 'M'.
      ls_data1-userid = 'CB9980000010'.
      ls_data1-usernm = '김서현'.
      ls_data1-userdp = ''.
      ls_data1-hiddenid = ''.
      ls_data1-remark = ''.
      INSERT zasimt0011c FROM @ls_data1.

    CATCH cx_uuid_error.
    ENDTRY.


    ENDMETHOD.
ENDCLASS.

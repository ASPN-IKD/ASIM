CLASS zcl_insert_data_zasimt0001n DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

protected section.
private section.
ENDCLASS.



CLASS ZCL_INSERT_DATA_ZASIMT0001N IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA: ls_data TYPE zasimtdummy.
    DATA: lv_uuid TYPE sysuuid_x16.

    DATA: system_uuid TYPE REF TO if_system_uuid,
          uuid        TYPE sysuuid_c32.
  DO 1 TIMES.

      system_uuid = cl_uuid_factory=>create_system_uuid( ).

      TRY.
          lv_uuid = system_uuid->create_uuid_x16( ).
        CATCH cx_uuid_error.

      ENDTRY.


*      ls_data-client = '100'.
*      ls_data-parentuuid = '3EB149C0E3D11EEE8CD3DDD473D74497'.
*      ls_data-uuid = lv_uuid.
*      ls_data-zcode = '0.POSTNO'.
*      ls_data-zcdno = '01'.
*      ls_data-zvalu1 = '11100600'.
*      ls_data-zvalu2 = 'A'.
*      ls_data-zvalu3 = 'H'.
*      ls_data-zvalu4 = 'H'.
*      ls_data-zvalu5 = 'KR'.
*      ls_data-zvalu6 = ''.
*      ls_data-zvalu7 = ''.
*      ls_data-ztext = '선급금'.

      TRY.
          INSERT zasimtdummy FROM @ls_data.
*           DELETE  FROM ZASIMT0001N .
      ENDTRY.



  ENDDO.
  ENDMETHOD.
ENDCLASS.

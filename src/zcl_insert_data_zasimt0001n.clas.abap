CLASS zcl_insert_data_zasimt0001n DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_INSERT_DATA_ZASIMT0001N IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA: ls_data TYPE zasimt0001n.
    DATA: lv_uuid TYPE sysuuid_x16.

    DATA: system_uuid TYPE REF TO if_system_uuid,
          uuid        TYPE sysuuid_c32.



      ls_data-client = '100'.
      ls_data-zcode = 'A04.ZTERM'.
      ls_data-zcdno = 'U900'.
      ls_data-zvalu1 = ''.
      ls_data-zvalu2 = ''.
      ls_data-zvalu3 = ''.
      ls_data-zvalu4 = ''.
      ls_data-zvalu5 = ''.
      ls_data-zvalu6 = ''.
      ls_data-zvalu7 = ''.
      ls_data-ztext = '유산스-만기일지정'.

      TRY.
          INSERT zasimt0001n FROM @ls_data.
      ENDTRY.

      ls_data-client = '100'.
      ls_data-zcode = 'A17.OPBNK'.
      ls_data-zcdno = 'B01'.
      ls_data-zvalu1 = ''.
      ls_data-zvalu2 = ''.
      ls_data-zvalu3 = ''.
      ls_data-zvalu4 = ''.
      ls_data-zvalu5 = ''.
      ls_data-zvalu6 = ''.
      ls_data-zvalu7 = ''.
      ls_data-ztext = '우리은행'.

      TRY.
          INSERT zasimt0001n FROM @ls_data.
      ENDTRY.

      ls_data-client = '100'.
      ls_data-zcode = 'A10.CONRT'.
      ls_data-zcdno = 'A'.
      ls_data-zvalu1 = ''.
      ls_data-zvalu2 = ''.
      ls_data-zvalu3 = ''.
      ls_data-zvalu4 = ''.
      ls_data-zvalu5 = ''.
      ls_data-zvalu6 = ''.
      ls_data-zvalu7 = ''.
      ls_data-ztext = '정기계약'.

      TRY.
          INSERT zasimt0001n FROM @ls_data.
      ENDTRY.


  ENDMETHOD.
ENDCLASS.

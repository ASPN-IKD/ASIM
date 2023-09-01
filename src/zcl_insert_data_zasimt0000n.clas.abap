class ZCL_INSERT_DATA_ZASIMT0000N definition
  public
  create private .

public section.
protected section.
private section.
ENDCLASS.



CLASS ZCL_INSERT_DATA_ZASIMT0000N IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA: ls_data TYPE zasimt0000n.
    DATA: lv_uuid TYPE sysuuid_x16.

    DATA: system_uuid TYPE REF TO if_system_uuid,
          uuid        TYPE sysuuid_c32.

    DO 1 TIMES.

      system_uuid = cl_uuid_factory=>create_system_uuid( ).

      TRY.
          lv_uuid = system_uuid->create_uuid_x16( ).
        CATCH cx_uuid_error.

      ENDTRY.


      ls_data-uuid = lv_uuid.
      ls_data-client = '100'.
      ls_data-zcode = '0.POSTNO'.
      ls_data-zvalu1t = ''.
      ls_data-zvalu2t = ''.
      ls_data-zvalu3t = ''.
      ls_data-zvalu4t = ''.
      ls_data-zvalu5t = ''.
      ls_data-zvalu6t = ''.
      ls_data-zvalu7t = ''.
      ls_data-ztext = '[설정]부대비처리 순서(필수입력)'.
      TRY.
          INSERT zasimt0000n FROM @ls_data.
      ENDTRY.
    ENDDO.
  ENDMETHOD.
ENDCLASS.

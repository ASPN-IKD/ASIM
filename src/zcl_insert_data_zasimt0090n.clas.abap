CLASS zcl_insert_data_zasimt0090n DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_insert_data_zasimt0090n IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA : ls_data TYPE zasimt0090n,
           lv_uuid TYPE sysuuid_x16.

    DATA : system_uuid TYPE REF TO if_system_uuid.

    DO 1 TIMES.

      system_uuid = cl_uuid_factory=>create_system_uuid( ).

      TRY.
          lv_uuid = system_uuid->create_uuid_x16( ).
        CATCH cx_uuid_error.

      ENDTRY.

      ls_data-uuid = lv_uuid.
      ls_data-reqmu = '2023000003'.
      ls_data-reqNO = '1000000003'.
      ls_data-reqYR = '2023'.

      TRY.
          INSERT zasimt0090n FROM @ls_data.
      ENDTRY.

    ENDDO.
  ENDMETHOD.







ENDCLASS.

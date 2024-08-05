CLASS zcl_insert_data_znr_10_no DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_INSERT_DATA_ZNR_10_NO IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA: lv_object   TYPE cl_numberrange_objects=>nr_attributes-object,
        lt_interval TYPE cl_numberrange_intervals=>nr_interval,
        ls_interval TYPE cl_numberrange_intervals=>nr_nriv_line.

    lv_object = 'ZNR_10_NO'.
    "lv_object = 'ZNR_30_NO'.
    "lv_object = 'ZNR_70_NO'.
    "lv_object = 'ZNR_190_NO'.

*   intervals
*    ls_interval-nrrangenr  = '01'.
*    ls_interval-fromnumber = '1000000001'.
*    ls_interval-tonumber   = '1999999999'.
*    APPEND ls_interval TO lt_interval.
*
*    ls_interval-nrrangenr  = '02'.
*    ls_interval-fromnumber = '2000000001'.
*    ls_interval-tonumber   = '2999999999'.
*    APPEND ls_interval TO lt_interval.

    "3~ : 수입통관예정
    ls_interval-nrrangenr  = '03'.
    ls_interval-fromnumber = '3000000001'.
    ls_interval-tonumber   = '3999999999'.
    APPEND ls_interval TO lt_interval.

    "4~ : 수입통관
    ls_interval-nrrangenr  = '04'.
    ls_interval-fromnumber = '4000000001'.
    ls_interval-tonumber   = '4999999999'.
    APPEND ls_interval TO lt_interval.

    "6~ : 수입부대비
    ls_interval-nrrangenr  = '06'.
    ls_interval-fromnumber = '6000000001'.
    ls_interval-tonumber   = '6999999999'.
    APPEND ls_interval TO lt_interval.

*   create intervals
    TRY.

        out->write( |Create Intervals for Object: { lv_object } | ).

        CALL METHOD cl_numberrange_intervals=>create
          EXPORTING
            interval  = lt_interval
            object    = lv_object
            subobject = ' '
          IMPORTING
            error     = DATA(lv_error)
            error_inf = DATA(ls_error)
            error_iv  = DATA(lt_error_iv)
            warning   = DATA(lv_warning).

        CATCH cx_root INTO DATA(error).
            out->write( error ).
    ENDTRY.

  ENDMETHOD.
ENDCLASS.

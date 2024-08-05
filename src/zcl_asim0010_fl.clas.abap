CLASS zcl_asim0010_fl DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_sadl_exit_calc_element_read.
    DATA request_view TYPE c LENGTH 50.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_ASIM0010_FL IMPLEMENTATION.


  METHOD if_sadl_exit_calc_element_read~calculate.

    TYPES: BEGIN OF ty_30n,
             uuid  TYPE yi_asim0030n-uuid,
             reqno TYPE yi_asim0030n-reqno,
           END OF ty_30n.

    TYPES: BEGIN OF ty_50n,
             uuid  TYPE yi_asim0050n-uuid,
             blino TYPE yi_asim0050n-blino,
           END OF ty_50n.

    TYPES: BEGIN OF ty_70n,
             uuid  TYPE yi_asim0070n-uuid,
             blino TYPE yi_asim0070n-blino,
             eccno TYPE yi_asim0070n-eccno,
             cclno TYPE yi_asim0070n-cclno,
           END OF ty_70n.

    TYPES: BEGIN OF ty_90n,
             uuid  TYPE yi_asim0090n-uuid,
             cclno TYPE yi_asim0090n-cclno,
           END OF ty_90n.

    TYPES: BEGIN OF ty_130n,
             uuid  TYPE yi_asim0130n-uuid,
             reqno TYPE yi_asim0130n-reqno,
             blino TYPE yi_asim0130n-blino,
             cclno TYPE yi_asim0130n-cclno,
             feegb TYPE yi_asim0130n-feegb,
           END OF ty_130n.

    TYPES: BEGIN OF ty_190n,
             uuid  TYPE yi_asim0190n-uuid,
             blino TYPE yi_asim0190n-blino,
           END OF ty_190n.


    DATA lt_0030n   TYPE SORTED TABLE OF ty_30n WITH UNIQUE KEY uuid.
    DATA lt_0050n   TYPE SORTED TABLE OF ty_50n WITH UNIQUE KEY uuid.
    DATA lt_0070n   TYPE SORTED TABLE OF ty_70n WITH UNIQUE KEY uuid.
    DATA lt_0090n   TYPE SORTED TABLE OF ty_90n WITH UNIQUE KEY uuid.
    DATA lt_0130n   TYPE SORTED TABLE OF ty_130n WITH UNIQUE KEY uuid.
    DATA lt_0190n   TYPE SORTED TABLE OF ty_190n WITH UNIQUE KEY uuid.

    DATA lt_asim0010n_data TYPE STANDARD TABLE OF yi_asim0010n WITH DEFAULT KEY.
    DATA lt_asim0030n_data TYPE STANDARD TABLE OF yi_asim0030n WITH DEFAULT KEY.
    DATA lt_asim0070n_data TYPE STANDARD TABLE OF yi_asim0070n WITH DEFAULT KEY.
    DATA lt_asim0190n_data TYPE STANDARD TABLE OF yi_asim0190n WITH DEFAULT KEY.


    CASE request_view.
        "계약 후속문서 유무 확인
      WHEN 'YI_ASIM0010N'.


        IF it_original_data IS INITIAL.
          SELECT * FROM yi_asim0010n INTO CORRESPONDING FIELDS OF TABLE @lt_asim0010n_data.
        ELSE.
          lt_asim0010n_data = CORRESPONDING #( it_original_data ).
        ENDIF.

        SELECT uuid, reqno FROM yi_asim0030n
        WHERE 0 = 0
        AND loekz = ''
        INTO CORRESPONDING FIELDS OF TABLE @lt_0030n.

        SELECT uuid, reqno FROM yi_asim0130n
        WHERE 0 = 0
        AND feegb = 'A'
        AND loekz = ''
        INTO CORRESPONDING FIELDS OF TABLE @lt_0130n.

        LOOP AT lt_asim0010n_data ASSIGNING FIELD-SYMBOL(<fs_asim0010n_data>).
          CLEAR <fs_asim0010n_data>-chkfollow.
          IF    line_exists( lt_0030n[ reqno = <fs_asim0010n_data>-reqno ] )
             OR line_exists( lt_0130n[ reqno = <fs_asim0010n_data>-reqno ] ).
            <fs_asim0010n_data>-chkfollow = 'X'.
          ENDIF.
        ENDLOOP.

        ct_calculated_data = CORRESPONDING #( lt_asim0010n_data ).

        "BL 후속문서 유무 확인
      WHEN 'YI_ASIM0030N'.

        IF it_original_data IS INITIAL.
          SELECT * FROM yi_asim0030n INTO CORRESPONDING FIELDS OF TABLE @lt_asim0030n_data.
        ELSE.
          lt_asim0030n_data = CORRESPONDING #( it_original_data ).
        ENDIF.

        SELECT uuid, blino FROM yi_asim0190n
        WHERE 0 = 0
        AND loekz = ''
        INTO CORRESPONDING FIELDS OF TABLE @lt_0190n.

        SELECT uuid, blino FROM yi_asim0070n
        WHERE 0 = 0
        AND loekz = ''
        INTO CORRESPONDING FIELDS OF TABLE @lt_0070n.

        SELECT uuid, blino FROM yi_asim0050n
        WHERE 0 = 0
        AND loekz = ''
        INTO CORRESPONDING FIELDS OF TABLE @lt_0050n.

        SELECT uuid, blino FROM yi_asim0130n
        WHERE 0 = 0
        AND loekz = ''
        AND feegb = 'B'
        INTO CORRESPONDING FIELDS OF TABLE @lt_0130n.

        LOOP AT lt_asim0030n_data ASSIGNING FIELD-SYMBOL(<fs_asim0030n_data>).

          CLEAR <fs_asim0030n_data>-chkfollow.
          DATA(lv_eccgb) = <fs_asim0030n_data>-eccgb.
          DATA(lv_blino) = <fs_asim0030n_data>-blino.

          IF ( lv_eccgb = 'X' AND line_exists( lt_0190n[ blino = lv_blino ] ) ) OR
             ( lv_eccgb = '' AND line_exists( lt_0070n[ blino = lv_blino ] ) ) OR
             line_exists( lt_0050n[ blino = lv_blino ] ) OR
             line_exists( lt_0130n[ blino = lv_blino ] ).
            <fs_asim0030n_data>-chkfollow = 'X'.
          ENDIF.

        ENDLOOP.

        ct_calculated_data = CORRESPONDING #( lt_asim0030n_data ).


        "통관예정 후속문서 유무 확인
      WHEN 'YI_ASIM0190N'.
        IF it_original_data IS INITIAL.
          SELECT * FROM yi_asim0190n INTO CORRESPONDING FIELDS OF TABLE @lt_asim0190n_data.
        ELSE.
          lt_asim0190n_data = CORRESPONDING #( it_original_data ).
        ENDIF.
        LOOP AT lt_asim0190n_data ASSIGNING FIELD-SYMBOL(<fs_asim0190n_data>).
          CLEAR <fs_asim0190n_data>-chkfollow.
          DATA(lv_eccno) = <fs_asim0190n_data>-eccno.

          SELECT uuid, eccno FROM yi_asim0070n
          WHERE 0 = 0
          AND loekz = ''
          INTO CORRESPONDING FIELDS OF TABLE @lt_0070n.

          IF ( line_exists( lt_0070n[ eccno = lv_blino ] ) ).
            <fs_asim0190n_data>-chkfollow = 'X'.
          ENDIF.
        ENDLOOP.
        ct_calculated_data = CORRESPONDING #( lt_asim0190n_data ).

        "통관 후속문서 유무 확인
      WHEN 'YI_ASIM0070N'.
        IF it_original_data IS INITIAL.
          SELECT * FROM yi_asim0070n INTO CORRESPONDING FIELDS OF TABLE @lt_asim0070n_data.
        ELSE.
          lt_asim0070n_data = CORRESPONDING #( it_original_data ).
        ENDIF.
        LOOP AT lt_asim0070n_data ASSIGNING FIELD-SYMBOL(<fs_asim0070n_data>).
          CLEAR <fs_asim0070n_data>-chkfollow.
          DATA(lv_cclno) = <fs_asim0070n_data>-cclno.

          SELECT uuid, cclno FROM yi_asim0090n
          WHERE 0 = 0
          AND loekz = ''
          INTO CORRESPONDING FIELDS OF TABLE @lt_0090n.

          SELECT uuid, cclno FROM yi_asim0130n
          WHERE 0 = 0
          AND loekz = ''
          AND feegb = 'C'
          INTO CORRESPONDING FIELDS OF TABLE @lt_0130n.

          IF ( line_exists( lt_0090n[ cclno = lv_cclno ] ) ) OR
            ( line_exists( lt_0130n[ cclno = lv_cclno ] ) ).
            <fs_asim0070n_data>-chkfollow = 'X'.
          ENDIF.
        ENDLOOP.
        ct_calculated_data = CORRESPONDING #( lt_asim0070n_data ).

    ENDCASE.

  ENDMETHOD.


  METHOD if_sadl_exit_calc_element_read~get_calculation_info.
    request_view = iv_entity.

    LOOP AT it_requested_calc_elements

          ASSIGNING FIELD-SYMBOL(<fs_calc_element>).

*      CASE <fs_calc_element>.
*        WHEN 'ChkFollow'.
*          APPEND 'X' TO et_requested_orig_elements.
*        WHEN OTHERS.
*      ENDCASE.

    ENDLOOP.
  ENDMETHOD.
ENDCLASS.

CLASS lhc_YI_ASIM0200N DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR yi_asim0200n RESULT result.

    METHODS calc_value FOR DETERMINE ON SAVE
      IMPORTING keys FOR yi_asim0200n~calc_value.

    METHODS d_calc_total FOR DETERMINE ON SAVE
      IMPORTING keys FOR yi_asim0200n~d_calc_total.

    DATA : success TYPE c LENGTH 1 VALUE 'X'.

ENDCLASS.

CLASS lhc_YI_ASIM0200N IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD calc_value.

    DATA : asim0200s TYPE TABLE FOR UPDATE yi_asim0200n,
           asim0200  TYPE STRUCTURE FOR UPDATE yi_asim0200n.

    TRY.
        IF success EQ 'X'.
            "CBO Read
            READ ENTITIES OF yi_asim0200n IN LOCAL MODE
            ENTITY yi_asim0200n
            ALL FIELDS
                WITH CORRESPONDING #( keys )
            RESULT DATA(lt_item)
            FAILED    DATA(lt_item_failed)
            REPORTED  DATA(lt_item_reported).

            DATA(parentUUID) = lt_item[ 1 ]-ParentUUID.

            "Item이 가지고 있는 부모의 uuid로 header 조회
            READ ENTITIES OF yi_asim0190n
            ENTITY yi_asim0190n
            ALL FIELDS
                WITH VALUE #( (  Uuid = parentUUID ) )
            RESULT DATA(lt_header)
            FAILED    DATA(lt_header_failed)
            REPORTED  DATA(lt_header_reported).

            DATA(ls_header) = lt_header[ 1 ].

            "해당 Item의 최대 eccnp값 조회
            SELECT MAX( eccnp ) FROM yi_asim0200n WHERE ParentUUID = @parentUUID INTO @DATA(lv_max_eccnp).

            "Item 필드 값 수정
            LOOP AT lt_item INTO DATA(ls_item).
                asim0200 = CORRESPONDING #( ls_item ).

                "통관예정연도, 통관연도 = Header값으로 매핑
                asim0200-Eccno = ls_header-Eccno.
                asim0200-Eccyr = ls_header-Eccyr.

                "Item No = 최대값 + 10.
                IF asim0200-Eccnp IS INITIAL.
                    asim0200-Eccnp = lv_max_eccnp + 10.
                ENDIF.
                lv_max_eccnp = asim0200-Eccnp.

                APPEND asim0200 TO asim0200s.
                CLEAR : asim0200.
            ENDLOOP.

            "CBO Update
            MODIFY ENTITIES OF yi_asim0200n IN LOCAL MODE
            ENTITY yi_asim0200n UPDATE SET FIELDS WITH asim0200s
            MAPPED   DATA(ls_mapped_modify)
            FAILED   DATA(lt_failed_modify)
            REPORTED DATA(lt_reported_modify).

            "성공이면
            IF lt_failed_modify IS INITIAL.
                success = ''.
            ENDIF.
        ENDIF.
    ENDTRY.

  ENDMETHOD.

  METHOD d_calc_total.
  ENDMETHOD.

ENDCLASS.

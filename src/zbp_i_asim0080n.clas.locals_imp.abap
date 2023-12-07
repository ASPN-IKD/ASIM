CLASS lhc_YI_ASIM0080N DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR yi_asim0080n RESULT result.

    METHODS calc_value FOR DETERMINE ON SAVE
      IMPORTING keys FOR yi_asim0080n~calc_value.

    DATA : success TYPE c LENGTH 1 VALUE 'X'.

ENDCLASS.

CLASS lhc_YI_ASIM0080N IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD calc_value.

    DATA : asim0080s TYPE TABLE FOR UPDATE yi_asim0080n,
           asim0080  TYPE STRUCTURE FOR UPDATE yi_asim0080n.

    TRY.
        IF success EQ 'X'.
            "CBO Read
            READ ENTITIES OF yi_asim0080n IN LOCAL MODE
            ENTITY yi_asim0080n
            ALL FIELDS
                WITH CORRESPONDING #( keys )
            RESULT DATA(lt_item)
            FAILED    DATA(lt_item_failed)
            REPORTED  DATA(lt_item_reported).

            DATA(parentUUID) = lt_item[ 1 ]-ParentUUID.

            "Item이 가지고 있는 부모의 uuid로 header 조회
            READ ENTITIES OF yi_asim0070n
            ENTITY yi_asim0070n
            ALL FIELDS
                WITH VALUE #( (  Uuid = parentUUID ) )
            RESULT DATA(lt_header)
            FAILED    DATA(lt_header_failed)
            REPORTED  DATA(lt_header_reported).

            DATA(ls_header) = lt_header[ 1 ].

            "해당 Item의 최대 eccnp값 조회
            SELECT MAX( Cclnp ) FROM yi_asim0080n WHERE ParentUUID = @parentUUID INTO @DATA(lv_max_cclnp).

            "Item 필드 값 수정
            LOOP AT lt_item INTO DATA(ls_item).

                asim0080 = CORRESPONDING #( ls_item ).

                "통관번호 = Header값으로 매핑
                asim0080-Cclno = ls_header-Cclno.
                asim0080-Cclyr = ls_header-Cclyr.

                "Item No = 최대값 + 10.
                IF asim0080-Cclnp IS INITIAL.
                    asim0080-Cclnp = lv_max_cclnp + 10.
                ENDIF.

                lv_max_cclnp = asim0080-Cclnp.

                APPEND asim0080 TO asim0080s.
                CLEAR : asim0080.
            ENDLOOP.

            "CBO Update
            MODIFY ENTITIES OF yi_asim0080n IN LOCAL MODE
            ENTITY yi_asim0080n UPDATE SET FIELDS WITH asim0080s
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

ENDCLASS.

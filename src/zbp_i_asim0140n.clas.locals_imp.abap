CLASS lhc_YI_ASIM0140N DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR yi_asim0140n RESULT result.

    METHODS calc_value FOR DETERMINE ON SAVE
      IMPORTING keys FOR yi_asim0140n~calc_value.
*    METHODS post_action FOR MODIFY
*      IMPORTING keys FOR ACTION yi_asim0140n~post_action RESULT result.

    TYPES:
      "스탠다드 API Response Information
      BEGIN OF post_result,
        post_body   TYPE string,
        post_status TYPE string,
      END OF post_result.

    "API 통신을 위해 생성한 함수
    METHODS:
      get_connection
        IMPORTING url           TYPE string
        RETURNING VALUE(result) TYPE REF TO if_web_http_client
        RAISING   cx_static_check.
*
*        CREATE_INV
*            IMPORTING params TYPE sysuuid_x16
*            RETURNING VALUE(result)   TYPE post_result
*            RAISING   cx_static_check.
    DATA : success TYPE c LENGTH 1 VALUE 'X'.
    "상수
*    CONSTANTS:
*      content_type TYPE string VALUE 'Content-type',
*      json_content TYPE string VALUE 'application/json; charset=UTF-8'.

ENDCLASS.

CLASS lhc_YI_ASIM0140N IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  "HTTP 통신을 위한 셋팅
  METHOD get_connection.
    DATA(dest) = cl_http_destination_provider=>create_by_url( url ).
    result = cl_web_http_client_manager=>create_by_http_destination( dest ).
  ENDMETHOD.

  METHOD calc_value.


    DATA : asim0140s TYPE TABLE FOR UPDATE yi_asim0140n,
           asim0140  TYPE STRUCTURE FOR UPDATE yi_asim0140n.

    TRY.
        IF success EQ 'X'.
          "CBO Read
          READ ENTITIES OF yi_asim0140n IN LOCAL MODE
          ENTITY yi_asim0140n
          ALL FIELDS
              WITH CORRESPONDING #( keys )
          RESULT DATA(lt_item)
          FAILED    DATA(lt_item_failed)
          REPORTED  DATA(lt_item_reported).

          DATA(parentUUID) = lt_item[ 1 ]-ParentUUID.

          "Item이 가지고 있는 부모의 uuid로 header 조회
          READ ENTITIES OF yi_asim0130n
          ENTITY yi_asim0130n
          ALL FIELDS
              WITH VALUE #( (  Uuid = parentUUID ) )
          RESULT DATA(lt_header)
          FAILED    DATA(lt_header_failed)
          REPORTED  DATA(lt_header_reported).

          DATA(ls_header) = lt_header[ 1 ].

          "해당 Item의 최대 eccnp값 조회
          SELECT MAX( Feenp ) FROM yi_asim0140n WHERE ParentUUID = @parentUUID INTO @DATA(lv_max_Feenp). "ENDSELECT.

          "Item 필드 값 수정
          LOOP AT lt_item INTO DATA(ls_item).
            asim0140 = CORRESPONDING #( ls_item ).

            "통관예정연도, 통관연도 = Header값으로 매핑
            asim0140-Feeno = ls_header-Feeno.
            asim0140-Feeyr = ls_header-Feeyr.

            "Item No = 최대값 + 1.
            IF asim0140-Feenp IS INITIAL.
                asim0140-Feenp = lv_max_Feenp + 1.
            ENDIF.

            lv_max_Feenp = asim0140-Feenp.

            APPEND asim0140 TO asim0140s.
            CLEAR : asim0140.
          ENDLOOP.

          "CBO Update
          MODIFY ENTITIES OF yi_asim0140n IN LOCAL MODE
          ENTITY yi_asim0140n UPDATE SET FIELDS WITH asim0140s
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
*
*  METHOD post_action.
*  DATA(req_user) = sy-uname.
*    DATA(param_01) = keys[ 1 ]-%param-uuid.
*
*  ENDMETHOD.

ENDCLASS.

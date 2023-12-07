CLASS lhc__Header DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR _Header RESULT result.


    METHODS calculate_order_id FOR DETERMINE ON SAVE
      IMPORTING keys FOR _Header~calculate_order_id.


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
        RAISING   cx_static_check,

      create_order
        IMPORTING params        TYPE sysuuid_x16
        RETURNING VALUE(result) TYPE post_result
        RAISING   cx_static_check.

    "상수
    CONSTANTS:
      content_type TYPE string VALUE 'Content-type',
      json_content TYPE string VALUE 'application/json; charset=UTF-8'.

ENDCLASS.

CLASS lhc__Header IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD calculate_order_id.

  ENDMETHOD.

  METHOD create_order.

  ENDMETHOD.

  METHOD get_connection.

  ENDMETHOD.

ENDCLASS.

CLASS lsc_YR_IM_PO_HEADER DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS save_modified REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_YR_IM_PO_HEADER IMPLEMENTATION.

  METHOD save_modified.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.

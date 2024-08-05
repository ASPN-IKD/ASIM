CLASS zcl_if_common_001 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES: BEGIN OF token_cookies,
            token TYPE string,
            cookies TYPE if_web_http_request=>cookies,
           END OF token_cookies.

    METHODS: constructor IMPORTING  i_scenario TYPE string
                                    i_service  TYPE string
                         EXCEPTIONS no_arrangement.

    METHODS: get_token_cookies RETURNING VALUE(token_cookies) TYPE token_cookies.

    METHODS: get IMPORTING uri        TYPE string
                 RETURNING VALUE(res) TYPE string,

            "공급업체 송장 취소시 uri에 cancel추가하여 post하는 case가 있어 importing에 uri 옵션으로 추가함. 24-01-04-김서현
            post IMPORTING json   TYPE string OPTIONAL
                           uri    TYPE string OPTIONAL
                 EXPORTING body   TYPE string
                           status TYPE i,

          delete IMPORTING uri    TYPE string
                 EXPORTING body   TYPE string
                           status TYPE i,

           patch IMPORTING uri    TYPE string
                           json   TYPE string
                 EXPORTING body   TYPE string
                           status TYPE i.
    "통신을 위한 header값
    DATA: token   TYPE string,
          cookies TYPE if_web_http_request=>cookies.

  PROTECTED SECTION.
  PRIVATE SECTION.
    "통신규약 존재 확인
    DATA: scenario TYPE if_com_management=>ty_cscn_id,
          service  TYPE if_com_management=>ty_cscn_outb_srv_id,
          ca       TYPE REF TO if_com_arrangement.

    CONSTANTS:
      c_content_type TYPE string VALUE 'Content-type',
      c_json_content TYPE string VALUE 'application/json; charset=UTF-8'.
ENDCLASS.



CLASS ZCL_IF_COMMON_001 IMPLEMENTATION.


    METHOD constructor.

        me->scenario = i_scenario.
        me->service = i_service.

        "시나리오 이름으로 통신이 존재하는지 확인
        DATA: lr_cscn TYPE if_com_scenario_factory=>ty_query-cscn_id_range.
        lr_cscn = VALUE #( ( sign = 'I' option = 'EQ' low = me->scenario ) ).

        DATA(lo_factory) = cl_com_arrangement_factory=>create_instance( ).
        lo_factory->query_ca(
              EXPORTING
                is_query           = VALUE #( cscn_id_range = lr_cscn )
              IMPORTING
                et_com_arrangement = DATA(lt_ca)
            ).

        IF lt_ca IS NOT INITIAL.
          me->ca = lt_ca[ 1 ].
          me->ca->get_comm_system_id( ).
        ELSE.
          RAISE no_arrangement.
        ENDIF.

    ENDMETHOD.


    METHOD delete.
        TRY.
            DATA(lo_dest) = cl_http_destination_provider=>create_by_comm_arrangement(
                comm_scenario  = me->scenario
                service_id     = me->service
                comm_system_id = me->ca->get_comm_system_id( ) ).
            DATA(lo_http_client) = cl_web_http_client_manager=>create_by_http_destination( lo_dest ).

            DATA(lo_request) = lo_http_client->get_http_request( ).

            lo_request->set_uri_path( EXPORTING i_uri_path = uri ).

            LOOP AT me->cookies INTO DATA(cookie).
              lo_request->set_cookie( i_name = cookie-name i_value = cookie-value ).
            ENDLOOP.

            lo_request->set_header_field( i_name = me->c_content_type   i_value = me->c_json_content ).
            lo_request->set_header_field( i_name = 'Accept' i_value = 'application/json' ).
            lo_request->set_header_field( i_name = 'x-csrf-token' i_value = me->token ).
            DATA(lo_response) = lo_http_client->execute( if_web_http_client=>delete ).

            body   = lo_response->get_text( ).
            status = lo_response->get_status( )-code.

          CATCH cx_http_dest_provider_error.
            " handle exception here

          CATCH cx_web_http_client_error.
            " handle exception here
        ENDTRY.
    ENDMETHOD.


    METHOD get.
        TRY.
            DATA(lo_dest) = cl_http_destination_provider=>create_by_comm_arrangement(
                comm_scenario  = me->scenario
                service_id     = me->service
                comm_system_id = me->ca->get_comm_system_id( ) ).
            DATA(lo_http_client) = cl_web_http_client_manager=>create_by_http_destination( lo_dest ).

            DATA(lo_request) = lo_http_client->get_http_request( ).
            lo_request->set_uri_path( EXPORTING i_uri_path = '?' && uri ).

            DATA(lo_response) = lo_http_client->execute( if_web_http_client=>get ).
            res   = lo_response->get_text( ).

          CATCH cx_http_dest_provider_error INTO DATA(err).
            DATA(a) = 1.
            " handle exception here

          CATCH cx_web_http_client_error.
            " handle exception here
        ENDTRY.
    ENDMETHOD.


    METHOD get_token_cookies.
        TRY.
            DATA(lo_dest) = cl_http_destination_provider=>create_by_comm_arrangement(
                comm_scenario  = me->scenario
                service_id     = me->service
                comm_system_id = me->ca->get_comm_system_id( ) ).
            DATA(lo_http_client) = cl_web_http_client_manager=>create_by_http_destination( lo_dest ).

            DATA(lo_request) = lo_http_client->get_http_request( ).
            lo_request->set_uri_path( EXPORTING i_uri_path = '?$top=1' ).
            lo_request->set_header_field( i_name = 'x-csrf-token' i_value = 'fetch' ).
            DATA(lo_response) = lo_http_client->execute( if_web_http_client=>get ).

            me->token   = token_cookies-token   = lo_response->get_header_field( i_name = 'x-csrf-token' ).
            me->cookies = token_cookies-cookies = lo_response->get_cookies( ).
            DATA(cookie1) = lo_response->get_cookies( ).
            DATA(header) = lo_response->get_header_fields( ).
            DATA(status) = lo_response->get_status( ).
            DATA(text) = lo_response->get_text( ).

          CATCH cx_http_dest_provider_error.
            " handle exception here

          CATCH cx_web_http_client_error.
            " handle exception here
        ENDTRY.
    ENDMETHOD.


    METHOD patch.
        TRY.
            DATA(lo_dest) = cl_http_destination_provider=>create_by_comm_arrangement(
                comm_scenario  = me->scenario
                service_id     = me->service
                comm_system_id = me->ca->get_comm_system_id( ) ).
            DATA(lo_http_client) = cl_web_http_client_manager=>create_by_http_destination( lo_dest ).

            DATA(lo_request) = lo_http_client->get_http_request( ).

            lo_request->set_text( json ).
            lo_request->set_uri_path( EXPORTING i_uri_path = uri ).

            LOOP AT me->cookies INTO DATA(cookie).
              lo_request->set_cookie( i_name = cookie-name i_value = cookie-value ).
            ENDLOOP.

            lo_request->set_header_field( i_name = me->c_content_type   i_value = me->c_json_content ).
            lo_request->set_header_field( i_name = 'Accept' i_value = 'application/json' ).
            lo_request->set_header_field( i_name = 'x-csrf-token' i_value = me->token ).
            DATA(lo_response) = lo_http_client->execute( if_web_http_client=>patch ).

            body   = lo_response->get_text( ).
            status = lo_response->get_status( )-code.

          CATCH cx_http_dest_provider_error.
            " handle exception here

          CATCH cx_web_http_client_error.
            " handle exception here
        ENDTRY.
    ENDMETHOD.


    METHOD post.
        TRY.
            DATA(lo_dest) = cl_http_destination_provider=>create_by_comm_arrangement(
                comm_scenario  = me->scenario
                service_id     = me->service
                comm_system_id = me->ca->get_comm_system_id( ) ).
            DATA(lo_http_client) = cl_web_http_client_manager=>create_by_http_destination( lo_dest ).

            DATA(lo_request) = lo_http_client->get_http_request( ).

            IF json IS NOT INITIAL.
                lo_request->set_text( json ).
            ENDIF.

            IF uri IS NOT INITIAL.
                lo_request->set_uri_path( EXPORTING i_uri_path = uri ).
            ENDIF.

            LOOP AT me->cookies INTO DATA(cookie).
              lo_request->set_cookie( i_name = cookie-name i_value = cookie-value ).
            ENDLOOP.

            lo_request->set_header_field( i_name = me->c_content_type   i_value = me->c_json_content ).
            lo_request->set_header_field( i_name = 'Accept' i_value = 'application/json' ).
            lo_request->set_header_field( i_name = 'x-csrf-token' i_value = me->token ).
            DATA(lo_response) = lo_http_client->execute( if_web_http_client=>post ).

            body   = lo_response->get_text( ).
            status = lo_response->get_status( )-code.

          CATCH cx_http_dest_provider_error.
            " handle exception here

          CATCH cx_web_http_client_error.
            " handle exception here
        ENDTRY.
    ENDMETHOD.
ENDCLASS.

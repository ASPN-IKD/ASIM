CLASS lhc_header DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR header RESULT result.

    METHODS get_po FOR MODIFY
      IMPORTING keys FOR ACTION header~get_po RESULT result.

    DATA : header TYPE yi_pogetheader_001.

    TYPES:
      "스탠다드 API Response Information
      BEGIN OF post_result,
        post_body   TYPE string,
        post_status TYPE string,
      END OF post_result,

*        BEGIN OF ty_purchase_order_item,
*            PurchaseOrderItem TYPE string,
*            PurchasingDocumentDeletionCode TYPE string,
*        END OF ty_purchase_order_item,

*        BEGIN OF ty_purchase_order,
*         "   results TYPE yi_pogetheader_001 BOXED,
*            "to_PurchaseOrderItem TYPE TABLE OF yi_pogetitem_001 WITH DEFAULT KEY,
*       END OF ty_purchase_order,
*
*       BEGIN OF ty_results,
*         "results TYPE TABLE OF ty_purchase_order WITH EMPTY KEY,
*        results TYPE yi_pogetheader_001 BOXED,
*       END OF ty_results,
*
*        BEGIN OF ty_data,
*         d TYPE ty_results ,
*       END OF ty_data.

*        BEGIN OF header,
*          results TYPE STANDARD TABLE OF yi_pogetheader_001 WITH DEFAULT KEY,
*        END OF header,
*
*        BEGIN OF item,
*            results TYPE STANDARD TABLE OF header WITH DEFAULT KEY,
*            item TYPE STANDARD TABLE OF yi_pogetitem_001 WITH DEFAULT KEY,
*        END OF item,
*
*        BEGIN OF ty_data,
*            BEGIN OF d,
*                results TYPE item,
*            END OF d,
*        END OF ty_data.

*        BEGIN OF ty_data,
*            BEGIN OF d,
*                 ty_object_list TYPE STANDARD TABLE OF yi_pogetheader_001 WITH EMPTY KEY,
*                 BEGIN OF ty_item,
*                    object_list    TYPE ty_object_list,
*                    item_list      TYPE STANDARD TABLE OF yi_pogetitem_001 WITH EMPTY KEY,
*                END OF ty_item,
*            END OF d,
*        END OF ty_object,
*
*       ty_object_list TYPE STANDARD TABLE OF ty_object WITH EMPTY KEY,
*       BEGIN OF ty_item,
*         item_name             TYPE string, " will contain "1489402"
*         category              TYPE string,
*         object_list           TYPE ty_object_list,
*         current_status        TYPE string,
*         primary_sap_component TYPE string,
*         released_on           TYPE string,
*       END OF ty_item.

*       BEGIN OF t_struc1,
*         comp1 TYPE c LENGTH 100,
*         comp2 TYPE n LENGTH 100,
*       END OF t_struc1,

*       BEGIN OF ty_data,
*         results type yi_pogetheader_001 ,
*         to_item type yi_pogetheader_001 ASSOCIATION,
*       END OF ty_data.

      BEGIN OF results,
        purchaseorder           TYPE string,
        companycode             TYPE string,
        purchaseordertype       TYPE string,
        createdbyuser           TYPE string,
        creationdate            TYPE datn,
        supplier                TYPE string,
        paymentterms            TYPE string,
        purchasingorganization  TYPE string,
        purchasinggroup         TYPE string,
        documentcurrency        TYPE string,
        incotermsclassification TYPE string,
        incotermslocation1      TYPE string,
        BEGIN OF to_purchaseorderitem,
          results TYPE TABLE OF yi_pogetitem_001 WITH DEFAULT KEY,
        END OF to_purchaseorderitem,
      END OF results,

      BEGIN OF ty_data,
        BEGIN OF d,
          results TYPE TABLE OF results WITH DEFAULT KEY,
        END OF d,
      END OF ty_data.

    "API 통신을 위해 생성한 함수
    METHODS:
      get_connection
        IMPORTING url           TYPE string
        RETURNING VALUE(result) TYPE REF TO if_web_http_client
        RAISING   cx_static_check,

      get_std_po
        IMPORTING params        TYPE zst_po_param_001-purchaseorder
        RETURNING VALUE(result) TYPE post_result
        RAISING   cx_static_check.
    "상수
    CONSTANTS:
      content_type TYPE string VALUE 'Content-type',
      json_content TYPE string VALUE 'application/json; charset=UTF-8'.

ENDCLASS.

CLASS lhc_header IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  "HTTP 통신을 위한 셋팅
  METHOD get_connection.
    DATA(dest) = cl_http_destination_provider=>create_by_url( url ).
    result = cl_web_http_client_manager=>create_by_http_destination( dest ).
  ENDMETHOD.

  "POST
  METHOD get_std_po.

    "시나리오 이름으로 통신이 존재하는지 확인
    DATA: lr_cscn TYPE if_com_scenario_factory=>ty_query-cscn_id_range.
    lr_cscn = VALUE #( ( sign = 'I' option = 'EQ' low = 'ZCS_PO_001' ) ).

    DATA(lo_factory) = cl_com_arrangement_factory=>create_instance( ).
    lo_factory->query_ca(
          EXPORTING
            is_query           = VALUE #( cscn_id_range = lr_cscn )
          IMPORTING
            et_com_arrangement = DATA(lt_ca)
        ).

    "해당 시나리오가 존재 하지 않으면 종료
    IF lt_ca IS INITIAL.
      EXIT.
    ENDIF.

    "조회 한 값 중 1번째 값
    DATA(lo_ca) = lt_ca[ 1 ].

    "GET
    TRY.
        DATA(lo_dest) = cl_http_destination_provider=>create_by_comm_arrangement(
            comm_scenario  = 'ZCS_PO_001'
            service_id     = 'ZSTD_PO_001_REST'
            comm_system_id = lo_ca->get_comm_system_id( ) ).
        DATA(lo_http_client) = cl_web_http_client_manager=>create_by_http_destination( lo_dest ).

        DATA(lo_request) = lo_http_client->get_http_request( ).
        lo_request->set_uri_path( EXPORTING i_uri_path = '?$format=json' ).
        "https://my407000-api.s4hana.cloud.sap/sap/opu/odata/sap/API_PURCHASEORDER_PROCESS_SRV/A_PurchaseOrder?$filter=PurchaseOrder eq '4500000002'&$expand=to_PurchaseOrderItem
        IF params NE '0000000000'.
            lo_request->set_form_field( i_name = '$filter' i_value = 'PurchaseOrder eq ' && '''' && params && '''').
        ENDIF.
        lo_request->set_form_field( i_name = '$expand' i_value = 'to_PurchaseOrderItem' ).
        "lo_request->set_form_field( i_name = 'Purchaseorder' i_value = params ).
        DATA(lo_response) = lo_http_client->execute( if_web_http_client=>get ).
        DATA(url) = lo_http_client->get_http_request( ).

        DATA(body)   = lo_response->get_text( ).
        DATA(status) = lo_response->get_status( )-code.

      CATCH cx_http_dest_provider_error.
        " handle exception here

      CATCH cx_web_http_client_error.
        " handle exception here
    ENDTRY.

    result-post_body    = body.
    result-post_status  = status.

  ENDMETHOD.

  METHOD get_po.

    DATA(req_user) = sy-uname.
    DATA(param_01) = keys[ 1 ]-%param-Purchaseorder.

    DATA : lt_data  TYPE ty_data,
           ls_final TYPE zpogettheader001,
           lt_final TYPE TABLE OF zpogettheader001.

    FIELD-SYMBOLS: <l_postab_ref> TYPE any,
                   <lt_postab>    TYPE ANY TABLE,
                   <lt_postitem>  TYPE ANY TABLE,
                   <l_postheader> TYPE any,
                   <field>        TYPE any.

    DATA(po_result) = get_std_po( param_01 ).

    DATA : ls_create TYPE STRUCTURE FOR CREATE yi_pogetheader_001,
           lt_create TYPE TABLE FOR CREATE yi_pogetheader_001,

           lt_item   TYPE TABLE FOR CREATE yi_pogetheader_001\_item,
           ls_item   LIKE LINE OF lt_item,

           lt_item_001  TYPE TABLE of yi_pogetitem_001,
           ls_item_001  LIKE LINE OF lt_item_001,

           lt_target LIKE ls_item-%target.

    TRY.
        "성공 result parsing to json
        CALL METHOD /ui2/cl_json=>deserialize
          EXPORTING
            json        = po_result-post_body
            pretty_name = /ui2/cl_json=>pretty_mode-camel_case
          CHANGING
            data        = lt_data.

        DATA: system_uuid TYPE REF TO if_system_uuid,
              uuid        TYPE sysuuid_x16.
        system_uuid = cl_uuid_factory=>create_system_uuid( ).

        "parsing 한 데이터 LOOP 돌리기 위해 필요한 데이터 파싱
        ASSIGN COMPONENT 'd' OF STRUCTURE lt_data TO <l_postab_ref>.
        ASSIGN COMPONENT 'results' OF STRUCTURE <l_postab_ref> TO <lt_postab>.

        DATA : cid TYPE i VALUE 1.

        "Loop돌면서 필드 값 읽어서 table에 넣음.
        LOOP AT <lt_postab> ASSIGNING FIELD-SYMBOL(<l_posref>).
          ls_create = CORRESPONDING #( <l_posref> ).
          ls_create-RequestUser = req_user.

          TRY.
              uuid = system_uuid->create_uuid_x16( ).
              ls_create-uuid = uuid.
            CATCH cx_uuid_error.
          ENDTRY.

          ls_create-%cid = 'Header' && cid.

          ASSIGN COMPONENT 'to_purchaseorderitem' OF STRUCTURE <l_posref> TO <l_postheader>.
          ASSIGN COMPONENT 'results' OF STRUCTURE <l_postheader> TO <lt_postitem>.
          DATA : cid_item TYPE i VALUE 1.

          LOOP AT <lt_postitem> ASSIGNING FIELD-SYMBOL(<l_poitem>).
            ls_item_001 = CORRESPONDING #( <l_poitem> ).

            DATA(create_uuid) = system_uuid->create_uuid_x16( ).
            lt_target = VALUE #( ( %cid = 'item' && cid_item
                                   Accountassignmentcategory = ls_item_001-Accountassignmentcategory
                                   HeaderUuid = uuid
                                   Material = ls_item_001-Material
                                   Netpriceamount = ls_item_001-Netpriceamount
                                   Netpricequantity = ls_item_001-Netpricequantity
                                   Orderquantity = ls_item_001-Orderquantity
                                   Plant = ls_item_001-Plant
                                   Purchaseorder = ls_item_001-Purchaseorder
                                   Purchaseorderitem = ls_item_001-Purchaseorderitem
                                   Purchaseorderitemtext = ls_item_001-Purchaseorderitemtext
                                   Purchaseorderquantityunit = ls_item_001-Purchaseorderquantityunit
                                   Storagelocation = ls_item_001-Storagelocation
                                   Uuid =  create_uuid ) ).

            ls_item = VALUE #( %cid_ref = ls_create-%cid Uuid = system_uuid->create_uuid_x16( ) %target = lt_target ).
            APPEND ls_item TO lt_item.
            cid_item = cid_item + 1.
          ENDLOOP.
          APPEND ls_create TO lt_create.
          cid = cid + 1.
        ENDLOOP.
    ENDTRY.

    DATA : lt_delete TYPE TABLE FOR DELETE yi_pogetheader_001,
           ls_delete TYPE STRUCTURE FOR DELETE yi_pogetheader_001.

    SELECT uuid FROM zpogettheader001 WHERE request_user = @req_user INTO TABLE @DATA(lt_header).

    LOOP AT lt_header INTO DATA(ls_header).
      ls_delete-uuid = ls_header-uuid.

      APPEND ls_delete TO lt_delete.
      CLEAR : ls_delete.
    ENDLOOP.

    MODIFY ENTITIES OF yi_pogetheader_001 IN LOCAL MODE
    ENTITY header DELETE FROM lt_delete
    FAILED   DATA(lt_failed_delete)
    REPORTED DATA(lt_reported_delete).

    MODIFY ENTITIES OF yi_pogetheader_001 IN LOCAL MODE
    ENTITY header CREATE SET FIELDS WITH lt_create
    CREATE BY \_Item SET FIELDS WITH lt_item
    MAPPED   DATA(ls_mapped_modify)
    FAILED   DATA(lt_failed_modify)
    REPORTED DATA(lt_reported_modify).

  ENDMETHOD.

ENDCLASS.

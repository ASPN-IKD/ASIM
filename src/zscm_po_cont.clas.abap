"! <p class="shorttext synchronized">Consumption model for client proxy - generated</p>
"! This class has been generated based on the metadata with namespace
"! <em>API_PURCHASECONTRACT_PROCESS_SRV</em>
CLASS zscm_po_cont DEFINITION
  PUBLIC
  INHERITING FROM /iwbep/cl_v4_abs_pm_model_prov
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES:
      "! <p class="shorttext synchronized">Types for "OData Primitive Types"</p>
      BEGIN OF tys_types_for_prim_types,
        "! Used for primitive type PURCHASE_CONTRACT
        purchase_contract   TYPE c LENGTH 10,
        "! Used for primitive type PURCHASE_CONTRACT_2
        purchase_contract_2 TYPE c LENGTH 10,
        "! Used for primitive type PURCHASE_CONTRACT_3
        purchase_contract_3 TYPE c LENGTH 10,
      END OF tys_types_for_prim_types.

    TYPES:
      "! <p class="shorttext synchronized">Messages</p>
      BEGIN OF tys_messages,
        "! Type
        type    TYPE c LENGTH 1,
        "! Message
        message TYPE c LENGTH 220,
      END OF tys_messages,
      "! <p class="shorttext synchronized">List of Messages</p>
      tyt_messages TYPE STANDARD TABLE OF tys_messages WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Parameters of function ApproveDocument</p>
      "! <em>with the internal name</em> APPROVE_DOCUMENT
      BEGIN OF tys_parameters_1,
        "! PurchaseContract
        purchase_contract TYPE c LENGTH 10,
      END OF tys_parameters_1,
      "! <p class="shorttext synchronized">List of TYS_PARAMETERS_1</p>
      tyt_parameters_1 TYPE STANDARD TABLE OF tys_parameters_1 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Parameters of function RejectDocument</p>
      "! <em>with the internal name</em> REJECT_DOCUMENT
      BEGIN OF tys_parameters_2,
        "! PurchaseContract
        purchase_contract TYPE c LENGTH 10,
      END OF tys_parameters_2,
      "! <p class="shorttext synchronized">List of TYS_PARAMETERS_2</p>
      tyt_parameters_2 TYPE STANDARD TABLE OF tys_parameters_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Parameters of function WithdrawFromApproval</p>
      "! <em>with the internal name</em> WITHDRAW_FROM_APPROVAL
      BEGIN OF tys_parameters_3,
        "! PurchaseContract
        purchase_contract TYPE c LENGTH 10,
      END OF tys_parameters_3,
      "! <p class="shorttext synchronized">List of TYS_PARAMETERS_3</p>
      tyt_parameters_3 TYPE STANDARD TABLE OF tys_parameters_3 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_PurchaseContractItemNotesType</p>
      BEGIN OF tys_a_purchase_contract_item_2,
        "! <em>Key property</em> Language
        language                   TYPE c LENGTH 2,
        "! <em>Key property</em> TextObjectType
        text_object_type           TYPE c LENGTH 4,
        "! <em>Key property</em> ArchitecturalObjectNumber
        architectural_object_numbe TYPE c LENGTH 70,
        "! <em>Key property</em> TechnicalObjectType
        technical_object_type      TYPE c LENGTH 10,
        "! <em>Key property</em> PurchaseContractItem
        purchase_contract_item     TYPE c LENGTH 5,
        "! <em>Key property</em> PurchaseContract
        purchase_contract          TYPE c LENGTH 10,
        "! NoteDescription
        note_description           TYPE string,
        "! FixedIndicator
        fixed_indicator            TYPE c LENGTH 1,
      END OF tys_a_purchase_contract_item_2,
      "! <p class="shorttext synchronized">List of A_PurchaseContractItemNotesType</p>
      tyt_a_purchase_contract_item_2 TYPE STANDARD TABLE OF tys_a_purchase_contract_item_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_PurchaseContractItemType</p>
      BEGIN OF tys_a_purchase_contract_item_t,
        "! <em>Key property</em> PurchaseContract
        purchase_contract          TYPE c LENGTH 10,
        "! <em>Key property</em> PurchaseContractItem
        purchase_contract_item     TYPE c LENGTH 5,
        "! PurchasingContractDeletionCode
        purchasing_contract_deleti TYPE c LENGTH 1,
        "! PurchaseContractItemText
        purchase_contract_item_tex TYPE c LENGTH 40,
        "! CompanyCode
        company_code               TYPE c LENGTH 4,
        "! Plant
        plant                      TYPE c LENGTH 4,
        "! StorageLocation
        storage_location           TYPE c LENGTH 4,
        "! RequirementTracking
        requirement_tracking       TYPE c LENGTH 10,
        "! MaterialGroup
        material_group             TYPE c LENGTH 9,
        "! SupplierMaterialNumber
        supplier_material_number   TYPE c LENGTH 35,
        "! OrderQuantityUnit
        order_quantity_unit        TYPE c LENGTH 3,
        "! OrderQuantityUnitISOCode
        order_quantity_unit_isocod TYPE c LENGTH 3,
        "! TargetQuantity
        target_quantity            TYPE p LENGTH 7 DECIMALS 3,
        "! PurgDocReleaseOrderQuantity
        purg_doc_release_order_qua TYPE p LENGTH 7 DECIMALS 3,
        "! OrderPriceUnit
        order_price_unit           TYPE c LENGTH 3,
        "! OrderPriceUnitISOCode
        order_price_unit_isocode   TYPE c LENGTH 3,
        "! OrderPriceUnitToOrderUnitNmrtr
        order_price_unit_to_order  TYPE p LENGTH 3 DECIMALS 0,
        "! OrdPriceUnitToOrderUnitDnmntr
        ord_price_unit_to_order_un TYPE p LENGTH 3 DECIMALS 0,
        "! ContractNetPriceAmount
        contract_net_price_amount  TYPE p LENGTH 6 DECIMALS 3,
        "! DocumentCurrency
        document_currency          TYPE c LENGTH 5,
        "! NetPriceQuantity
        net_price_quantity         TYPE p LENGTH 3 DECIMALS 0,
        "! TaxCode
        tax_code                   TYPE c LENGTH 2,
        "! TaxCountry
        tax_country                TYPE c LENGTH 3,
        "! TaxDeterminationDate
        tax_determination_date     TYPE datn,
        "! StockType
        stock_type                 TYPE c LENGTH 1,
        "! PurchasingInfoRecordUpdateCode
        purchasing_info_record_upd TYPE c LENGTH 1,
        "! PriceIsToBePrinted
        price_is_to_be_printed     TYPE abap_bool,
        "! PurchasingPriceIsEstimated
        purchasing_price_is_estima TYPE abap_bool,
        "! NoDaysReminder1
        no_days_reminder_1         TYPE p LENGTH 2 DECIMALS 0,
        "! NoDaysReminder2
        no_days_reminder_2         TYPE p LENGTH 2 DECIMALS 0,
        "! NoDaysReminder3
        no_days_reminder_3         TYPE p LENGTH 2 DECIMALS 0,
        "! PlannedDeliveryDurationInDays
        planned_delivery_duration  TYPE p LENGTH 2 DECIMALS 0,
        "! OverdelivTolrtdLmtRatioInPct
        overdeliv_tolrtd_lmt_ratio TYPE p LENGTH 2 DECIMALS 1,
        "! UnlimitedOverdeliveryIsAllowed
        unlimited_overdelivery_is  TYPE abap_bool,
        "! UnderdelivTolrtdLmtRatioInPct
        underdeliv_tolrtd_lmt_rati TYPE p LENGTH 2 DECIMALS 1,
        "! PurchasingDocumentItemCategory
        purchasing_document_item_c TYPE c LENGTH 1,
        "! AccountAssignmentCategory
        account_assignment_categor TYPE c LENGTH 1,
        "! MultipleAcctAssgmtDistribution
        multiple_acct_assgmt_distr TYPE c LENGTH 1,
        "! GoodsReceiptIsExpected
        goods_receipt_is_expected  TYPE abap_bool,
        "! GoodsReceiptIsNonValuated
        goods_receipt_is_non_valua TYPE abap_bool,
        "! InvoiceIsExpected
        invoice_is_expected        TYPE abap_bool,
        "! InvoiceIsGoodsReceiptBased
        invoice_is_goods_receipt_b TYPE abap_bool,
        "! IsOrderAcknRqd
        is_order_ackn_rqd          TYPE abap_bool,
        "! PurgDocOrderAcknNumber
        purg_doc_order_ackn_number TYPE c LENGTH 20,
        "! ShippingInstruction
        shipping_instruction       TYPE c LENGTH 2,
        "! ManualDeliveryAddressID
        manual_delivery_address_id TYPE c LENGTH 10,
        "! VolumeUnit
        volume_unit                TYPE c LENGTH 3,
        "! PurContrVolumeUnitISOCode
        pur_contr_volume_unit_isoc TYPE c LENGTH 3,
        "! IncotermsClassification
        incoterms_classification   TYPE c LENGTH 3,
        "! Subcontractor
        subcontractor              TYPE c LENGTH 10,
        "! EvaldRcptSettlmtIsAllowed
        evald_rcpt_settlmt_is_allo TYPE abap_bool,
        "! IncotermsLocation1
        incoterms_location_1       TYPE c LENGTH 70,
        "! IncotermsLocation2
        incoterms_location_2       TYPE c LENGTH 70,
        "! IncotermsLocation1Identifier
        incoterms_location_1_ident TYPE c LENGTH 20,
        "! IncotermsLocation2Identifier
        incoterms_location_2_ident TYPE c LENGTH 20,
        "! Material
        material                   TYPE c LENGTH 40,
        "! ServicePerformer
        service_performer          TYPE c LENGTH 10,
        "! ProductTypeCode
        product_type_code          TYPE c LENGTH 2,
        "! MaterialType
        material_type              TYPE c LENGTH 4,
        "! PurContractItmReplnmtElmntType
        pur_contract_itm_replnmt_e TYPE c LENGTH 1,
        "! PurContrAcceptedAtOriginCode
        pur_contr_accepted_at_orig TYPE c LENGTH 1,
        "! PurgProdCmplncSupplierStatus
        purg_prod_cmplnc_supplier  TYPE c LENGTH 1,
        "! PurchaseContractItemFormatted
        purchase_contract_item_for TYPE c LENGTH 15,
        "! PurchasingParentItem
        purchasing_parent_item     TYPE c LENGTH 5,
        "! PurgDocItemCatalogRelevance
        purg_doc_item_catalog_rele TYPE c LENGTH 1,
        "! ContractConsumptionInPct
        contract_consumption_in_pc TYPE p LENGTH 10 DECIMALS 3,
      END OF tys_a_purchase_contract_item_t,
      "! <p class="shorttext synchronized">List of A_PurchaseContractItemType</p>
      tyt_a_purchase_contract_item_t TYPE STANDARD TABLE OF tys_a_purchase_contract_item_t WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_PurchaseContractNotesType</p>
      BEGIN OF tys_a_purchase_contract_note_2,
        "! <em>Key property</em> Language
        language                   TYPE c LENGTH 2,
        "! <em>Key property</em> TextObjectType
        text_object_type           TYPE c LENGTH 4,
        "! <em>Key property</em> TechnicalObjectType
        technical_object_type      TYPE c LENGTH 10,
        "! <em>Key property</em> ArchitecturalObjectNumber
        architectural_object_numbe TYPE c LENGTH 70,
        "! <em>Key property</em> PurchaseContract
        purchase_contract          TYPE c LENGTH 10,
        "! NoteDescription
        note_description           TYPE string,
      END OF tys_a_purchase_contract_note_2,
      "! <p class="shorttext synchronized">List of A_PurchaseContractNotesType</p>
      tyt_a_purchase_contract_note_2 TYPE STANDARD TABLE OF tys_a_purchase_contract_note_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_PurchaseContractType</p>
      BEGIN OF tys_a_purchase_contract_type,
        "! <em>Key property</em> PurchaseContract
        purchase_contract          TYPE c LENGTH 10,
        "! PurchaseContractType
        purchase_contract_type     TYPE c LENGTH 4,
        "! CompanyCode
        company_code               TYPE c LENGTH 4,
        "! PurchasingDocumentDeletionCode
        purchasing_document_deleti TYPE c LENGTH 1,
        "! CreationDate
        creation_date              TYPE datn,
        "! CreatedByUser
        created_by_user            TYPE c LENGTH 12,
        "! Supplier
        supplier                   TYPE c LENGTH 10,
        "! PurchasingOrganization
        purchasing_organization    TYPE c LENGTH 4,
        "! PurchasingGroup
        purchasing_group           TYPE c LENGTH 3,
        "! PaymentTerms
        payment_terms              TYPE c LENGTH 4,
        "! CashDiscount1Days
        cash_discount_1_days       TYPE p LENGTH 2 DECIMALS 0,
        "! CashDiscount2Days
        cash_discount_2_days       TYPE p LENGTH 2 DECIMALS 0,
        "! NetPaymentDays
        net_payment_days           TYPE p LENGTH 2 DECIMALS 0,
        "! CashDiscount1Percent
        cash_discount_1_percent    TYPE p LENGTH 3 DECIMALS 3,
        "! CashDiscount2Percent
        cash_discount_2_percent    TYPE p LENGTH 3 DECIMALS 3,
        "! DocumentCurrency
        document_currency          TYPE c LENGTH 5,
        "! ExchangeRate
        exchange_rate              TYPE p LENGTH 5 DECIMALS 5,
        "! ExchangeRateIsFixed
        exchange_rate_is_fixed     TYPE abap_bool,
        "! ValidityStartDate
        validity_start_date        TYPE datn,
        "! ValidityEndDate
        validity_end_date          TYPE datn,
        "! QuotationSubmissionDate
        quotation_submission_date  TYPE datn,
        "! CorrespncExternalReference
        correspnc_external_referen TYPE c LENGTH 12,
        "! SupplierQuotation
        supplier_quotation         TYPE c LENGTH 10,
        "! SupplierRespSalesPersonName
        supplier_resp_sales_person TYPE c LENGTH 30,
        "! SupplierPhoneNumber
        supplier_phone_number      TYPE c LENGTH 16,
        "! SupplyingSupplier
        supplying_supplier         TYPE c LENGTH 10,
        "! IncotermsClassification
        incoterms_classification   TYPE c LENGTH 3,
        "! IncotermsTransferLocation
        incoterms_transfer_locatio TYPE c LENGTH 28,
        "! PurchaseContractTargetAmount
        purchase_contract_target_a TYPE p LENGTH 8 DECIMALS 3,
        "! InvoicingParty
        invoicing_party            TYPE c LENGTH 10,
        "! CorrespncInternalReference
        correspnc_internal_referen TYPE c LENGTH 12,
        "! ReleaseCode
        release_code               TYPE c LENGTH 1,
        "! IncotermsVersion
        incoterms_version          TYPE c LENGTH 4,
        "! IncotermsLocation1
        incoterms_location_1       TYPE c LENGTH 70,
        "! IncotermsLocation2
        incoterms_location_2       TYPE c LENGTH 70,
        "! IncotermsLocation1Identifier
        incoterms_location_1_ident TYPE c LENGTH 20,
        "! IncotermsLocation2Identifier
        incoterms_location_2_ident TYPE c LENGTH 20,
        "! IsEndOfPurposeBlocked
        is_end_of_purpose_blocked  TYPE c LENGTH 1,
        "! LastChangeDateTime
        last_change_date_time      TYPE timestampl,
        "! PurchasingProcessingStatus
        purchasing_processing_stat TYPE c LENGTH 2,
        "! PurgAggrgdProdCmplncSuplrSts
        purg_aggrgd_prod_cmplnc_su TYPE c LENGTH 1,
        "! PurchasingProcessingStatusName
        purchasing_processing_st_2 TYPE c LENGTH 60,
        "! PurgContractIsInPreparation
        purg_contract_is_in_prepar TYPE abap_bool,
        "! PurgDocExternalReference
        purg_doc_external_referenc TYPE c LENGTH 70,
        "! PurchasingDocumentName
        purchasing_document_name   TYPE c LENGTH 40,
        "! PurgDocCatalogItemRelevance
        purg_doc_catalog_item_rele TYPE c LENGTH 1,
        "! PurContrAttentionRequiredText
        pur_contr_attention_requir TYPE c LENGTH 60,
        "! ContractConsumptionInPct
        contract_consumption_in_pc TYPE p LENGTH 10 DECIMALS 3,
        "! VersionIsEnabled
        version_is_enabled         TYPE c LENGTH 1,
      END OF tys_a_purchase_contract_type,
      "! <p class="shorttext synchronized">List of A_PurchaseContractType</p>
      tyt_a_purchase_contract_type TYPE STANDARD TABLE OF tys_a_purchase_contract_type WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_PurContrHdrCndnAmountType</p>
      BEGIN OF tys_a_pur_contr_hdr_cndn_amo_2,
        "! <em>Key property</em> PurchaseContract
        purchase_contract          TYPE c LENGTH 10,
        "! <em>Key property</em> ConditionRecord
        condition_record           TYPE c LENGTH 10,
        "! <em>Key property</em> ConditionValidityEndDate
        condition_validity_end_dat TYPE datn,
        "! <em>Key property</em> ConditionSequentialNumber
        condition_sequential_numbe TYPE c LENGTH 2,
        "! ConditionValidityStartDate
        condition_validity_start_d TYPE datn,
        "! ConditionType
        condition_type             TYPE c LENGTH 4,
        "! ConditionTextID
        condition_text_id          TYPE c LENGTH 10,
        "! ConditionCalculationType
        condition_calculation_type TYPE c LENGTH 1,
        "! ConditionRateRatioUnit
        condition_rate_ratio_unit  TYPE c LENGTH 3,
        "! PurContrCndnRateRatioUntISOCd
        pur_contr_cndn_rate_ratio  TYPE c LENGTH 5,
        "! ConditionRateRatio
        condition_rate_ratio       TYPE p LENGTH 13 DECIMALS 9,
        "! ConditionCurrency
        condition_currency         TYPE c LENGTH 5,
        "! ConditionRateAmount
        condition_rate_amount      TYPE p LENGTH 13 DECIMALS 9,
        "! ConditionRateValue
        condition_rate_value       TYPE p LENGTH 6 DECIMALS 3,
        "! ConditionRateValueUnit
        condition_rate_value_unit  TYPE c LENGTH 5,
        "! ConditionQuantity
        condition_quantity         TYPE p LENGTH 3 DECIMALS 0,
        "! ConditionQuantityUnit
        condition_quantity_unit    TYPE c LENGTH 3,
        "! PurContrCndnQtyUnitISOCode
        pur_contr_cndn_qty_unit_is TYPE c LENGTH 3,
        "! ConditionToBaseQtyNmrtr
        condition_to_base_qty_nmrt TYPE p LENGTH 3 DECIMALS 0,
        "! ConditionToBaseQtyDnmntr
        condition_to_base_qty_dnmn TYPE p LENGTH 3 DECIMALS 0,
        "! BaseUnit
        base_unit                  TYPE c LENGTH 3,
        "! PurContrBaseUnitISOCode
        pur_contr_base_unit_isocod TYPE c LENGTH 3,
        "! ConditionLowerLimitAmount
        condition_lower_limit_amou TYPE p LENGTH 13 DECIMALS 9,
        "! ConditionLowerLimitRatio
        condition_lower_limit_rati TYPE p LENGTH 13 DECIMALS 9,
        "! ConditionUpperLimitAmount
        condition_upper_limit_amou TYPE p LENGTH 13 DECIMALS 9,
        "! ConditionUpperLimitRatio
        condition_upper_limit_rati TYPE p LENGTH 13 DECIMALS 9,
        "! ConditionAlternativeCurrency
        condition_alternative_curr TYPE c LENGTH 5,
        "! ConditionExclusion
        condition_exclusion        TYPE c LENGTH 1,
        "! ConditionIsDeleted
        condition_is_deleted       TYPE abap_bool,
        "! AdditionalValueDays
        additional_value_days      TYPE c LENGTH 2,
        "! FixedValueDate
        fixed_value_date           TYPE datn,
        "! PaymentTerms
        payment_terms              TYPE c LENGTH 4,
        "! CndnMaxNumberOfSalesOrders
        cndn_max_number_of_sales_o TYPE c LENGTH 2,
        "! MinimumConditionBasisValue
        minimum_condition_basis_va TYPE p LENGTH 8 DECIMALS 3,
        "! MaximumConditionBasisValue
        maximum_condition_basis_va TYPE p LENGTH 8 DECIMALS 3,
        "! MaximumConditionAmount
        maximum_condition_amount   TYPE p LENGTH 7 DECIMALS 3,
        "! ConditionReleaseStatus
        condition_release_status   TYPE c LENGTH 1,
        "! ConditionChangeReason
        condition_change_reason    TYPE c LENGTH 3,
        "! PricingScaleType
        pricing_scale_type         TYPE c LENGTH 1,
        "! PricingScaleBasis
        pricing_scale_basis        TYPE c LENGTH 1,
        "! PricingScaleLine
        pricing_scale_line         TYPE c LENGTH 4,
        "! ConditionHasScales
        condition_has_scales       TYPE abap_bool,
        "! PricingScaleCheckingRule
        pricing_scale_checking_rul TYPE c LENGTH 1,
      END OF tys_a_pur_contr_hdr_cndn_amo_2,
      "! <p class="shorttext synchronized">List of A_PurContrHdrCndnAmountType</p>
      tyt_a_pur_contr_hdr_cndn_amo_2 TYPE STANDARD TABLE OF tys_a_pur_contr_hdr_cndn_amo_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_PurContrHdrCndnScaleType</p>
      BEGIN OF tys_a_pur_contr_hdr_cndn_sca_2,
        "! <em>Key property</em> PurchaseContract
        purchase_contract          TYPE c LENGTH 10,
        "! <em>Key property</em> ConditionRecord
        condition_record           TYPE c LENGTH 10,
        "! <em>Key property</em> ConditionSequentialNumber
        condition_sequential_numbe TYPE c LENGTH 2,
        "! <em>Key property</em> ConditionValidityEndDate
        condition_validity_end_dat TYPE datn,
        "! <em>Key property</em> ConditionScaleLine
        condition_scale_line       TYPE c LENGTH 4,
        "! ConditionScaleQuantity
        condition_scale_quantity   TYPE p LENGTH 8 DECIMALS 3,
        "! ConditionScaleQuantityUnit
        condition_scale_quantity_u TYPE c LENGTH 3,
        "! PurContrCndnScQtyUnitISOCode
        pur_contr_cndn_sc_qty_unit TYPE c LENGTH 3,
        "! ConditionScaleAmount
        condition_scale_amount     TYPE p LENGTH 8 DECIMALS 3,
        "! ConditionScaleAmountCurrency
        condition_scale_amount_cur TYPE c LENGTH 5,
        "! ConditionRateValue
        condition_rate_value       TYPE p LENGTH 6 DECIMALS 3,
        "! ConditionRateValueUnit
        condition_rate_value_unit  TYPE c LENGTH 5,
        "! ConditionRateRatio
        condition_rate_ratio       TYPE p LENGTH 13 DECIMALS 9,
        "! ConditionRateRatioUnit
        condition_rate_ratio_unit  TYPE c LENGTH 3,
        "! PurContrCndnRateRatioUntISOCd
        pur_contr_cndn_rate_ratio  TYPE c LENGTH 5,
        "! ConditionRateAmount
        condition_rate_amount      TYPE p LENGTH 13 DECIMALS 9,
        "! ConditionCurrency
        condition_currency         TYPE c LENGTH 5,
        "! ConditionScaleIsDeleted
        condition_scale_is_deleted TYPE abap_bool,
        "! PricingScaleType
        pricing_scale_type         TYPE c LENGTH 1,
        "! ConditionQuantity
        condition_quantity         TYPE p LENGTH 3 DECIMALS 0,
        "! ConditionQuantityUnit
        condition_quantity_unit    TYPE c LENGTH 3,
        "! PurContrCndnQtyUnitISOCode
        pur_contr_cndn_qty_unit_is TYPE c LENGTH 3,
      END OF tys_a_pur_contr_hdr_cndn_sca_2,
      "! <p class="shorttext synchronized">List of A_PurContrHdrCndnScaleType</p>
      tyt_a_pur_contr_hdr_cndn_sca_2 TYPE STANDARD TABLE OF tys_a_pur_contr_hdr_cndn_sca_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_PurContrHdrCndnValdtyType</p>
      BEGIN OF tys_a_pur_contr_hdr_cndn_val_2,
        "! <em>Key property</em> PurchaseContract
        purchase_contract          TYPE c LENGTH 10,
        "! <em>Key property</em> ConditionRecord
        condition_record           TYPE c LENGTH 10,
        "! <em>Key property</em> ConditionValidityEndDate
        condition_validity_end_dat TYPE datn,
        "! ConditionApplication
        condition_application      TYPE c LENGTH 2,
        "! ConditionType
        condition_type             TYPE c LENGTH 4,
        "! ConditionIsDeleted
        condition_is_deleted       TYPE abap_bool,
        "! ConditionValidityStartDate
        condition_validity_start_d TYPE datn,
      END OF tys_a_pur_contr_hdr_cndn_val_2,
      "! <p class="shorttext synchronized">List of A_PurContrHdrCndnValdtyType</p>
      tyt_a_pur_contr_hdr_cndn_val_2 TYPE STANDARD TABLE OF tys_a_pur_contr_hdr_cndn_val_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_PurContrItmCndnAmountType</p>
      BEGIN OF tys_a_pur_contr_itm_cndn_amo_2,
        "! <em>Key property</em> PurchaseContract
        purchase_contract          TYPE c LENGTH 10,
        "! <em>Key property</em> PurchaseContractItem
        purchase_contract_item     TYPE c LENGTH 5,
        "! <em>Key property</em> ConditionRecord
        condition_record           TYPE c LENGTH 10,
        "! <em>Key property</em> ConditionValidityEndDate
        condition_validity_end_dat TYPE datn,
        "! <em>Key property</em> ConditionSequentialNumber
        condition_sequential_numbe TYPE c LENGTH 2,
        "! ConditionValidityStartDate
        condition_validity_start_d TYPE datn,
        "! Plant
        plant                      TYPE c LENGTH 4,
        "! ConditionType
        condition_type             TYPE c LENGTH 4,
        "! ConditionTextID
        condition_text_id          TYPE c LENGTH 10,
        "! ConditionCalculationType
        condition_calculation_type TYPE c LENGTH 1,
        "! ConditionRateRatioUnit
        condition_rate_ratio_unit  TYPE c LENGTH 3,
        "! PurContrCndnRateRatioUntISOCd
        pur_contr_cndn_rate_ratio  TYPE c LENGTH 3,
        "! ConditionRateRatio
        condition_rate_ratio       TYPE p LENGTH 13 DECIMALS 9,
        "! ConditionCurrency
        condition_currency         TYPE c LENGTH 5,
        "! ConditionRateAmount
        condition_rate_amount      TYPE p LENGTH 13 DECIMALS 9,
        "! ConditionRateValue
        condition_rate_value       TYPE p LENGTH 6 DECIMALS 3,
        "! ConditionRateValueUnit
        condition_rate_value_unit  TYPE c LENGTH 5,
        "! ConditionQuantity
        condition_quantity         TYPE p LENGTH 3 DECIMALS 0,
        "! ConditionQuantityUnit
        condition_quantity_unit    TYPE c LENGTH 3,
        "! PurContrCndnQtyUnitISOCode
        pur_contr_cndn_qty_unit_is TYPE c LENGTH 3,
        "! ConditionToBaseQtyNmrtr
        condition_to_base_qty_nmrt TYPE p LENGTH 3 DECIMALS 0,
        "! ConditionToBaseQtyDnmntr
        condition_to_base_qty_dnmn TYPE p LENGTH 3 DECIMALS 0,
        "! BaseUnit
        base_unit                  TYPE c LENGTH 3,
        "! PurContrBaseUnitISOCode
        pur_contr_base_unit_isocod TYPE c LENGTH 3,
        "! ConditionLowerLimitAmount
        condition_lower_limit_amou TYPE p LENGTH 13 DECIMALS 9,
        "! ConditionLowerLimitRatio
        condition_lower_limit_rati TYPE p LENGTH 13 DECIMALS 9,
        "! ConditionUpperLimitAmount
        condition_upper_limit_amou TYPE p LENGTH 13 DECIMALS 9,
        "! ConditionUpperLimitRatio
        condition_upper_limit_rati TYPE p LENGTH 13 DECIMALS 9,
        "! ConditionAlternativeCurrency
        condition_alternative_curr TYPE c LENGTH 5,
        "! ConditionExclusion
        condition_exclusion        TYPE c LENGTH 1,
        "! ConditionIsDeleted
        condition_is_deleted       TYPE abap_bool,
        "! AdditionalValueDays
        additional_value_days      TYPE c LENGTH 2,
        "! FixedValueDate
        fixed_value_date           TYPE datn,
        "! PaymentTerms
        payment_terms              TYPE c LENGTH 4,
        "! CndnMaxNumberOfSalesOrders
        cndn_max_number_of_sales_o TYPE c LENGTH 2,
        "! MinimumConditionBasisValue
        minimum_condition_basis_va TYPE p LENGTH 8 DECIMALS 3,
        "! MaximumConditionBasisValue
        maximum_condition_basis_va TYPE p LENGTH 8 DECIMALS 3,
        "! MaximumConditionAmount
        maximum_condition_amount   TYPE p LENGTH 7 DECIMALS 3,
        "! ConditionReleaseStatus
        condition_release_status   TYPE c LENGTH 1,
        "! ConditionChangeReason
        condition_change_reason    TYPE c LENGTH 3,
        "! PricingScaleType
        pricing_scale_type         TYPE c LENGTH 1,
        "! PricingScaleBasis
        pricing_scale_basis        TYPE c LENGTH 1,
        "! PricingScaleLine
        pricing_scale_line         TYPE c LENGTH 4,
        "! ConditionHasScales
        condition_has_scales       TYPE abap_bool,
        "! PricingScaleCheckingRule
        pricing_scale_checking_rul TYPE c LENGTH 1,
      END OF tys_a_pur_contr_itm_cndn_amo_2,
      "! <p class="shorttext synchronized">List of A_PurContrItmCndnAmountType</p>
      tyt_a_pur_contr_itm_cndn_amo_2 TYPE STANDARD TABLE OF tys_a_pur_contr_itm_cndn_amo_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_PurContrItmCndnScalesType</p>
      BEGIN OF tys_a_pur_contr_itm_cndn_sca_2,
        "! <em>Key property</em> PurchaseContract
        purchase_contract          TYPE c LENGTH 10,
        "! <em>Key property</em> PurchaseContractItem
        purchase_contract_item     TYPE c LENGTH 5,
        "! <em>Key property</em> ConditionRecord
        condition_record           TYPE c LENGTH 10,
        "! <em>Key property</em> ConditionSequentialNumber
        condition_sequential_numbe TYPE c LENGTH 2,
        "! <em>Key property</em> ConditionValidityEndDate
        condition_validity_end_dat TYPE datn,
        "! <em>Key property</em> ConditionScaleLine
        condition_scale_line       TYPE c LENGTH 4,
        "! ConditionScaleQuantity
        condition_scale_quantity   TYPE p LENGTH 8 DECIMALS 3,
        "! ConditionScaleQuantityUnit
        condition_scale_quantity_u TYPE c LENGTH 3,
        "! PurContrCndnScQtyUnitISOCode
        pur_contr_cndn_sc_qty_unit TYPE c LENGTH 3,
        "! ConditionScaleAmount
        condition_scale_amount     TYPE p LENGTH 8 DECIMALS 3,
        "! ConditionScaleAmountCurrency
        condition_scale_amount_cur TYPE c LENGTH 5,
        "! ConditionRateValue
        condition_rate_value       TYPE p LENGTH 6 DECIMALS 3,
        "! ConditionRateValueUnit
        condition_rate_value_unit  TYPE c LENGTH 5,
        "! ConditionRateRatio
        condition_rate_ratio       TYPE p LENGTH 13 DECIMALS 9,
        "! ConditionRateRatioUnit
        condition_rate_ratio_unit  TYPE c LENGTH 3,
        "! PurContrCndnRateRatioUntISOCd
        pur_contr_cndn_rate_ratio  TYPE c LENGTH 3,
        "! ConditionRateAmount
        condition_rate_amount      TYPE p LENGTH 13 DECIMALS 9,
        "! ConditionCurrency
        condition_currency         TYPE c LENGTH 5,
        "! ConditionScaleIsDeleted
        condition_scale_is_deleted TYPE abap_bool,
        "! PricingScaleType
        pricing_scale_type         TYPE c LENGTH 1,
        "! ConditionQuantity
        condition_quantity         TYPE p LENGTH 3 DECIMALS 0,
        "! ConditionQuantityUnit
        condition_quantity_unit    TYPE c LENGTH 3,
        "! PurContrCndnQtyUnitISOCode
        pur_contr_cndn_qty_unit_is TYPE c LENGTH 3,
      END OF tys_a_pur_contr_itm_cndn_sca_2,
      "! <p class="shorttext synchronized">List of A_PurContrItmCndnScalesType</p>
      tyt_a_pur_contr_itm_cndn_sca_2 TYPE STANDARD TABLE OF tys_a_pur_contr_itm_cndn_sca_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_PurContrItmCndnValdtyType</p>
      BEGIN OF tys_a_pur_contr_itm_cndn_val_2,
        "! <em>Key property</em> PurchaseContract
        purchase_contract          TYPE c LENGTH 10,
        "! <em>Key property</em> PurchaseContractItem
        purchase_contract_item     TYPE c LENGTH 5,
        "! <em>Key property</em> ConditionRecord
        condition_record           TYPE c LENGTH 10,
        "! <em>Key property</em> ConditionValidityEndDate
        condition_validity_end_dat TYPE datn,
        "! ConditionApplication
        condition_application      TYPE c LENGTH 2,
        "! ConditionType
        condition_type             TYPE c LENGTH 4,
        "! ConditionIsDeleted
        condition_is_deleted       TYPE abap_bool,
        "! Plant
        plant                      TYPE c LENGTH 4,
        "! ConditionValidityStartDate
        condition_validity_start_d TYPE datn,
      END OF tys_a_pur_contr_itm_cndn_val_2,
      "! <p class="shorttext synchronized">List of A_PurContrItmCndnValdtyType</p>
      tyt_a_pur_contr_itm_cndn_val_2 TYPE STANDARD TABLE OF tys_a_pur_contr_itm_cndn_val_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_PurCtrAccountType</p>
      BEGIN OF tys_a_pur_ctr_account_type,
        "! <em>Key property</em> AccountAssignment
        account_assignment         TYPE c LENGTH 30,
        "! <em>Key property</em> PurchaseContractItem
        purchase_contract_item     TYPE c LENGTH 5,
        "! <em>Key property</em> PurchaseContract
        purchase_contract          TYPE c LENGTH 10,
        "! IsDeleted
        is_deleted                 TYPE abap_bool,
        "! Quantity
        quantity                   TYPE p LENGTH 7 DECIMALS 3,
        "! OrderQuantityUnit
        order_quantity_unit        TYPE c LENGTH 3,
        "! OrderQuantityUnitISOCode
        order_quantity_unit_isocod TYPE c LENGTH 3,
        "! MultipleAcctAssgmtDistrPercent
        multiple_acct_assgmt_distr TYPE p LENGTH 2 DECIMALS 1,
        "! PurgDocNetAmount
        purg_doc_net_amount        TYPE p LENGTH 7 DECIMALS 3,
        "! DocumentCurrency
        document_currency          TYPE c LENGTH 5,
        "! GLAccount
        glaccount                  TYPE c LENGTH 10,
        "! BusinessArea
        business_area              TYPE c LENGTH 4,
        "! CostCenter
        cost_center                TYPE c LENGTH 10,
        "! SalesOrder
        sales_order                TYPE c LENGTH 10,
        "! SalesOrderItem
        sales_order_item           TYPE c LENGTH 6,
        "! SalesOrderScheduleLine
        sales_order_schedule_line  TYPE c LENGTH 4,
        "! MasterFixedAsset
        master_fixed_asset         TYPE c LENGTH 12,
        "! FixedAsset
        fixed_asset                TYPE c LENGTH 4,
        "! OrderID
        order_id                   TYPE c LENGTH 12,
        "! GoodsRecipientName
        goods_recipient_name       TYPE c LENGTH 12,
        "! UnloadingPointName
        unloading_point_name       TYPE c LENGTH 25,
        "! ControllingArea
        controlling_area           TYPE c LENGTH 4,
        "! CostObject
        cost_object                TYPE c LENGTH 12,
        "! ProfitCenter
        profit_center              TYPE c LENGTH 10,
        "! ProjectNetwork
        project_network            TYPE c LENGTH 12,
        "! RealEstateObject
        real_estate_object         TYPE c LENGTH 8,
        "! PartnerAccountNumber
        partner_account_number     TYPE c LENGTH 10,
        "! CommitmentItem
        commitment_item            TYPE c LENGTH 24,
        "! JointVentureRecoveryCode
        joint_venture_recovery_cod TYPE c LENGTH 2,
        "! FundsCenter
        funds_center               TYPE c LENGTH 16,
        "! FunctionalArea
        functional_area            TYPE c LENGTH 16,
        "! SettlementReferenceDate
        settlement_reference_date  TYPE datn,
        "! TaxCode
        tax_code                   TYPE c LENGTH 2,
        "! TaxJurisdiction
        tax_jurisdiction           TYPE c LENGTH 15,
        "! NonDeductibleInputTaxAmount
        non_deductible_input_tax_a TYPE p LENGTH 7 DECIMALS 3,
        "! CostCtrActivityType
        cost_ctr_activity_type     TYPE c LENGTH 6,
        "! BusinessProcess
        business_process           TYPE c LENGTH 12,
        "! EarmarkedFundsDocument
        earmarked_funds_document   TYPE c LENGTH 10,
        "! GrantID
        grant_id                   TYPE c LENGTH 20,
        "! BudgetPeriod
        budget_period              TYPE c LENGTH 10,
        "! WBSElementExternalID
        wbselement_external_id     TYPE c LENGTH 24,
      END OF tys_a_pur_ctr_account_type,
      "! <p class="shorttext synchronized">List of A_PurCtrAccountType</p>
      tyt_a_pur_ctr_account_type TYPE STANDARD TABLE OF tys_a_pur_ctr_account_type WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_PurCtrAddressType</p>
      BEGIN OF tys_a_pur_ctr_address_type,
        "! <em>Key property</em> PurchaseContract
        purchase_contract          TYPE c LENGTH 10,
        "! <em>Key property</em> AddressID
        address_id                 TYPE c LENGTH 10,
        "! <em>Key property</em> PurchaseContractItem
        purchase_contract_item     TYPE c LENGTH 5,
        "! FormOfAddress
        form_of_address            TYPE c LENGTH 4,
        "! FullName
        full_name                  TYPE c LENGTH 80,
        "! ConsigneeName3
        consignee_name_3           TYPE c LENGTH 40,
        "! ConsigneeName4
        consignee_name_4           TYPE c LENGTH 40,
        "! CareOfName
        care_of_name               TYPE c LENGTH 40,
        "! CityName
        city_name                  TYPE c LENGTH 40,
        "! District
        district                   TYPE c LENGTH 35,
        "! CityCode
        city_code                  TYPE c LENGTH 4,
        "! PostalCode
        postal_code                TYPE c LENGTH 10,
        "! POBoxPostalCode
        pobox_postal_code          TYPE c LENGTH 10,
        "! CompanyPostalCode
        company_postal_code        TYPE c LENGTH 10,
        "! POBox
        pobox                      TYPE c LENGTH 10,
        "! POBoxDeviatingCityName
        pobox_deviating_city_name  TYPE c LENGTH 40,
        "! StreetName
        street_name                TYPE c LENGTH 60,
        "! HouseNumber
        house_number               TYPE c LENGTH 10,
        "! StreetPrefixName
        street_prefix_name         TYPE c LENGTH 40,
        "! AdditionalStreetPrefixName
        additional_street_prefix_n TYPE c LENGTH 40,
        "! AdditionalStreetSuffixName
        additional_street_suffix_n TYPE c LENGTH 40,
        "! Building
        building                   TYPE c LENGTH 20,
        "! Floor
        floor                      TYPE c LENGTH 10,
        "! RoomNumber
        room_number                TYPE c LENGTH 10,
        "! Country
        country                    TYPE c LENGTH 3,
        "! CorrespondenceLanguage
        correspondence_language    TYPE c LENGTH 2,
        "! Region
        region                     TYPE c LENGTH 3,
        "! AddressTimeZone
        address_time_zone          TYPE c LENGTH 6,
        "! TaxJurisdiction
        tax_jurisdiction           TYPE c LENGTH 15,
        "! PrfrdCommMediumType
        prfrd_comm_medium_type     TYPE c LENGTH 3,
        "! PhoneNumber
        phone_number               TYPE c LENGTH 30,
        "! FaxNumber
        fax_number                 TYPE c LENGTH 31,
        "! TransportZone
        transport_zone             TYPE c LENGTH 10,
        "! HouseNumberSupplementText
        house_number_supplement_te TYPE c LENGTH 10,
        "! StreetSuffixName
        street_suffix_name         TYPE c LENGTH 40,
      END OF tys_a_pur_ctr_address_type,
      "! <p class="shorttext synchronized">List of A_PurCtrAddressType</p>
      tyt_a_pur_ctr_address_type TYPE STANDARD TABLE OF tys_a_pur_ctr_address_type WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_PurCtrPartnersType</p>
      BEGIN OF tys_a_pur_ctr_partners_type,
        "! <em>Key property</em> PurchaseContract
        purchase_contract       TYPE c LENGTH 10,
        "! <em>Key property</em> PurchaseContractItem
        purchase_contract_item  TYPE c LENGTH 5,
        "! <em>Key property</em> PurchasingOrganization
        purchasing_organization TYPE c LENGTH 4,
        "! <em>Key property</em> PartnerFunction
        partner_function        TYPE c LENGTH 2,
        "! <em>Key property</em> Plant
        plant                   TYPE c LENGTH 4,
        "! <em>Key property</em> SupplierSubrange
        supplier_subrange       TYPE c LENGTH 6,
        "! <em>Key property</em> PartnerCounter
        partner_counter         TYPE c LENGTH 3,
        "! Supplier
        supplier                TYPE c LENGTH 10,
        "! DefaultPartner
        default_partner         TYPE abap_bool,
      END OF tys_a_pur_ctr_partners_type,
      "! <p class="shorttext synchronized">List of A_PurCtrPartnersType</p>
      tyt_a_pur_ctr_partners_type TYPE STANDARD TABLE OF tys_a_pur_ctr_partners_type WITH DEFAULT KEY.


    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the entity sets</p>
      BEGIN OF gcs_entity_set,
        "! A_PurchaseContract
        "! <br/> Collection of type 'A_PurchaseContractType'
        a_purchase_contract        TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_PURCHASE_CONTRACT',
        "! A_PurchaseContractItem
        "! <br/> Collection of type 'A_PurchaseContractItemType'
        a_purchase_contract_item   TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_PURCHASE_CONTRACT_ITEM',
        "! A_PurchaseContractItemNotes
        "! <br/> Collection of type 'A_PurchaseContractItemNotesType'
        a_purchase_contract_item_n TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_PURCHASE_CONTRACT_ITEM_N',
        "! A_PurchaseContractNotes
        "! <br/> Collection of type 'A_PurchaseContractNotesType'
        a_purchase_contract_notes  TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_PURCHASE_CONTRACT_NOTES',
        "! A_PurContrHdrCndnAmount
        "! <br/> Collection of type 'A_PurContrHdrCndnAmountType'
        a_pur_contr_hdr_cndn_amoun TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_PUR_CONTR_HDR_CNDN_AMOUN',
        "! A_PurContrHdrCndnScale
        "! <br/> Collection of type 'A_PurContrHdrCndnScaleType'
        a_pur_contr_hdr_cndn_scale TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_PUR_CONTR_HDR_CNDN_SCALE',
        "! A_PurContrHdrCndnValdty
        "! <br/> Collection of type 'A_PurContrHdrCndnValdtyType'
        a_pur_contr_hdr_cndn_valdt TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_PUR_CONTR_HDR_CNDN_VALDT',
        "! A_PurContrItmCndnAmount
        "! <br/> Collection of type 'A_PurContrItmCndnAmountType'
        a_pur_contr_itm_cndn_amoun TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_PUR_CONTR_ITM_CNDN_AMOUN',
        "! A_PurContrItmCndnScales
        "! <br/> Collection of type 'A_PurContrItmCndnScalesType'
        a_pur_contr_itm_cndn_scale TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_PUR_CONTR_ITM_CNDN_SCALE',
        "! A_PurContrItmCndnValdty
        "! <br/> Collection of type 'A_PurContrItmCndnValdtyType'
        a_pur_contr_itm_cndn_valdt TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_PUR_CONTR_ITM_CNDN_VALDT',
        "! A_PurCtrAccount
        "! <br/> Collection of type 'A_PurCtrAccountType'
        a_pur_ctr_account          TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_PUR_CTR_ACCOUNT',
        "! A_PurCtrAddress
        "! <br/> Collection of type 'A_PurCtrAddressType'
        a_pur_ctr_address          TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_PUR_CTR_ADDRESS',
        "! A_PurCtrPartners
        "! <br/> Collection of type 'A_PurCtrPartnersType'
        a_pur_ctr_partners         TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_PUR_CTR_PARTNERS',
      END OF gcs_entity_set .

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the function imports</p>
      BEGIN OF gcs_function_import,
        "! ApproveDocument
        "! <br/> See structure type {@link ..tys_parameters_1} for the parameters
        approve_document       TYPE /iwbep/if_cp_runtime_types=>ty_operation_name VALUE 'APPROVE_DOCUMENT',
        "! RejectDocument
        "! <br/> See structure type {@link ..tys_parameters_2} for the parameters
        reject_document        TYPE /iwbep/if_cp_runtime_types=>ty_operation_name VALUE 'REJECT_DOCUMENT',
        "! WithdrawFromApproval
        "! <br/> See structure type {@link ..tys_parameters_3} for the parameters
        withdraw_from_approval TYPE /iwbep/if_cp_runtime_types=>ty_operation_name VALUE 'WITHDRAW_FROM_APPROVAL',
      END OF gcs_function_import.

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the bound functions</p>
      BEGIN OF gcs_bound_function,
         "! Dummy field - Structure must not be empty
         dummy TYPE int1 VALUE 0,
      END OF gcs_bound_function.

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for complex types</p>
      BEGIN OF gcs_complex_type,
        "! <p class="shorttext synchronized">Internal names for Messages</p>
        "! See also structure type {@link ..tys_messages}
        BEGIN OF messages,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF messages,
      END OF gcs_complex_type.

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for entity types</p>
      BEGIN OF gcs_entity_type,
        "! <p class="shorttext synchronized">Internal names for A_PurchaseContractItemNotesType</p>
        "! See also structure type {@link ..tys_a_purchase_contract_item_2}
        BEGIN OF a_purchase_contract_item_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_purchase_contract_item_2,
        "! <p class="shorttext synchronized">Internal names for A_PurchaseContractItemType</p>
        "! See also structure type {@link ..tys_a_purchase_contract_item_t}
        BEGIN OF a_purchase_contract_item_t,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! to_PurchaseContract
            to_purchase_contract       TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_PURCHASE_CONTRACT',
            "! to_PurContrItemCndnValdty
            to_pur_contr_item_cndn_val TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_PUR_CONTR_ITEM_CNDN_VAL',
            "! to_PurCtrAccount
            to_pur_ctr_account         TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_PUR_CTR_ACCOUNT',
            "! to_PurCtrAddress
            to_pur_ctr_address         TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_PUR_CTR_ADDRESS',
            "! to_PurCtrItemNotes
            to_pur_ctr_item_notes      TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_PUR_CTR_ITEM_NOTES',
          END OF navigation,
        END OF a_purchase_contract_item_t,
        "! <p class="shorttext synchronized">Internal names for A_PurchaseContractNotesType</p>
        "! See also structure type {@link ..tys_a_purchase_contract_note_2}
        BEGIN OF a_purchase_contract_note_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_purchase_contract_note_2,
        "! <p class="shorttext synchronized">Internal names for A_PurchaseContractType</p>
        "! See also structure type {@link ..tys_a_purchase_contract_type}
        BEGIN OF a_purchase_contract_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! to_PurchaseContractItem
            to_purchase_contract_item  TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_PURCHASE_CONTRACT_ITEM',
            "! to_Purctrnotes
            to_purctrnotes             TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_PURCTRNOTES',
            "! to_PurContrHdrCndnValdty
            to_pur_contr_hdr_cndn_vald TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_PUR_CONTR_HDR_CNDN_VALD',
            "! to_PurCtrPartners
            to_pur_ctr_partners        TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_PUR_CTR_PARTNERS',
          END OF navigation,
        END OF a_purchase_contract_type,
        "! <p class="shorttext synchronized">Internal names for A_PurContrHdrCndnAmountType</p>
        "! See also structure type {@link ..tys_a_pur_contr_hdr_cndn_amo_2}
        BEGIN OF a_pur_contr_hdr_cndn_amo_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! to_PurchaseContract
            to_purchase_contract       TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_PURCHASE_CONTRACT',
            "! to_PurContrHdrCndnScale
            to_pur_contr_hdr_cndn_scal TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_PUR_CONTR_HDR_CNDN_SCAL',
            "! to_PurContrHdrCndnValdty
            to_pur_contr_hdr_cndn_vald TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_PUR_CONTR_HDR_CNDN_VALD',
          END OF navigation,
        END OF a_pur_contr_hdr_cndn_amo_2,
        "! <p class="shorttext synchronized">Internal names for A_PurContrHdrCndnScaleType</p>
        "! See also structure type {@link ..tys_a_pur_contr_hdr_cndn_sca_2}
        BEGIN OF a_pur_contr_hdr_cndn_sca_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! to_PurchaseContract
            to_purchase_contract       TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_PURCHASE_CONTRACT',
            "! to_PurContrHdrCndnAmount
            to_pur_contr_hdr_cndn_amou TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_PUR_CONTR_HDR_CNDN_AMOU',
          END OF navigation,
        END OF a_pur_contr_hdr_cndn_sca_2,
        "! <p class="shorttext synchronized">Internal names for A_PurContrHdrCndnValdtyType</p>
        "! See also structure type {@link ..tys_a_pur_contr_hdr_cndn_val_2}
        BEGIN OF a_pur_contr_hdr_cndn_val_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! to_PurchaseContract
            to_purchase_contract       TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_PURCHASE_CONTRACT',
            "! to_PurContrHdrCndnAmount
            to_pur_contr_hdr_cndn_amou TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_PUR_CONTR_HDR_CNDN_AMOU',
          END OF navigation,
        END OF a_pur_contr_hdr_cndn_val_2,
        "! <p class="shorttext synchronized">Internal names for A_PurContrItmCndnAmountType</p>
        "! See also structure type {@link ..tys_a_pur_contr_itm_cndn_amo_2}
        BEGIN OF a_pur_contr_itm_cndn_amo_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! to_PurchaseContract
            to_purchase_contract       TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_PURCHASE_CONTRACT',
            "! to_PurContrItmCndnScales
            to_pur_contr_itm_cndn_scal TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_PUR_CONTR_ITM_CNDN_SCAL',
            "! to_PurContrItmCndnValdty
            to_pur_contr_itm_cndn_vald TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_PUR_CONTR_ITM_CNDN_VALD',
          END OF navigation,
        END OF a_pur_contr_itm_cndn_amo_2,
        "! <p class="shorttext synchronized">Internal names for A_PurContrItmCndnScalesType</p>
        "! See also structure type {@link ..tys_a_pur_contr_itm_cndn_sca_2}
        BEGIN OF a_pur_contr_itm_cndn_sca_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! to_PurchaseContract
            to_purchase_contract       TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_PURCHASE_CONTRACT',
            "! to_PurContrItmCndnAmount
            to_pur_contr_itm_cndn_amou TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_PUR_CONTR_ITM_CNDN_AMOU',
          END OF navigation,
        END OF a_pur_contr_itm_cndn_sca_2,
        "! <p class="shorttext synchronized">Internal names for A_PurContrItmCndnValdtyType</p>
        "! See also structure type {@link ..tys_a_pur_contr_itm_cndn_val_2}
        BEGIN OF a_pur_contr_itm_cndn_val_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! to_PurchaseContract
            to_purchase_contract       TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_PURCHASE_CONTRACT',
            "! to_PurchaseContractItem
            to_purchase_contract_item  TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_PURCHASE_CONTRACT_ITEM',
            "! to_PurContrItmCndnAmount
            to_pur_contr_itm_cndn_amou TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_PUR_CONTR_ITM_CNDN_AMOU',
          END OF navigation,
        END OF a_pur_contr_itm_cndn_val_2,
        "! <p class="shorttext synchronized">Internal names for A_PurCtrAccountType</p>
        "! See also structure type {@link ..tys_a_pur_ctr_account_type}
        BEGIN OF a_pur_ctr_account_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_pur_ctr_account_type,
        "! <p class="shorttext synchronized">Internal names for A_PurCtrAddressType</p>
        "! See also structure type {@link ..tys_a_pur_ctr_address_type}
        BEGIN OF a_pur_ctr_address_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_pur_ctr_address_type,
        "! <p class="shorttext synchronized">Internal names for A_PurCtrPartnersType</p>
        "! See also structure type {@link ..tys_a_pur_ctr_partners_type}
        BEGIN OF a_pur_ctr_partners_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_pur_ctr_partners_type,
      END OF gcs_entity_type.


    METHODS /iwbep/if_v4_mp_basic_pm~define REDEFINITION.


  PRIVATE SECTION.

    "! <p class="shorttext synchronized">Model</p>
    DATA mo_model TYPE REF TO /iwbep/if_v4_pm_model.


    "! <p class="shorttext synchronized">Define Messages</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_messages RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define A_PurchaseContractItemNotesType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_a_purchase_contract_item_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define A_PurchaseContractItemType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_a_purchase_contract_item_t RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define A_PurchaseContractNotesType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_a_purchase_contract_note_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define A_PurchaseContractType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_a_purchase_contract_type RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define A_PurContrHdrCndnAmountType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_a_pur_contr_hdr_cndn_amo_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define A_PurContrHdrCndnScaleType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_a_pur_contr_hdr_cndn_sca_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define A_PurContrHdrCndnValdtyType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_a_pur_contr_hdr_cndn_val_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define A_PurContrItmCndnAmountType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_a_pur_contr_itm_cndn_amo_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define A_PurContrItmCndnScalesType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_a_pur_contr_itm_cndn_sca_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define A_PurContrItmCndnValdtyType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_a_pur_contr_itm_cndn_val_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define A_PurCtrAccountType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_a_pur_ctr_account_type RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define A_PurCtrAddressType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_a_pur_ctr_address_type RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define A_PurCtrPartnersType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_a_pur_ctr_partners_type RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define ApproveDocument</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_approve_document RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define RejectDocument</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_reject_document RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define WithdrawFromApproval</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_withdraw_from_approval RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define all primitive types</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS define_primitive_types RAISING /iwbep/cx_gateway.

ENDCLASS.



CLASS ZSCM_PO_CONT IMPLEMENTATION.


  METHOD /iwbep/if_v4_mp_basic_pm~define.

    mo_model = io_model.
    mo_model->set_schema_namespace( 'API_PURCHASECONTRACT_PROCESS_SRV' ).

    def_messages( ).
    def_a_purchase_contract_item_2( ).
    def_a_purchase_contract_item_t( ).
    def_a_purchase_contract_note_2( ).
    def_a_purchase_contract_type( ).
    def_a_pur_contr_hdr_cndn_amo_2( ).
    def_a_pur_contr_hdr_cndn_sca_2( ).
    def_a_pur_contr_hdr_cndn_val_2( ).
    def_a_pur_contr_itm_cndn_amo_2( ).
    def_a_pur_contr_itm_cndn_sca_2( ).
    def_a_pur_contr_itm_cndn_val_2( ).
    def_a_pur_ctr_account_type( ).
    def_a_pur_ctr_address_type( ).
    def_a_pur_ctr_partners_type( ).
    def_approve_document( ).
    def_reject_document( ).
    def_withdraw_from_approval( ).
    define_primitive_types( ).

  ENDMETHOD.


  METHOD define_primitive_types.

    DATA lo_primitive_type TYPE REF TO /iwbep/if_v4_pm_prim_type.


    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'PURCHASE_CONTRACT'
                            iv_element             = VALUE tys_types_for_prim_types-purchase_contract( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'PURCHASE_CONTRACT_2'
                            iv_element             = VALUE tys_types_for_prim_types-purchase_contract_2( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'PURCHASE_CONTRACT_3'
                            iv_element             = VALUE tys_types_for_prim_types-purchase_contract_3( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

  ENDMETHOD.


  METHOD def_approve_document.

    DATA:
      lo_function        TYPE REF TO /iwbep/if_v4_pm_function,
      lo_function_import TYPE REF TO /iwbep/if_v4_pm_func_imp,
      lo_parameter       TYPE REF TO /iwbep/if_v4_pm_func_param,
      lo_return          TYPE REF TO /iwbep/if_v4_pm_func_return.


    lo_function = mo_model->create_function( 'APPROVE_DOCUMENT' ).
    lo_function->set_edm_name( 'ApproveDocument' ) ##NO_TEXT.

    lo_function_import = lo_function->create_function_import( 'APPROVE_DOCUMENT' ).
    lo_function_import->set_edm_name( 'ApproveDocument' ) ##NO_TEXT.


    lo_parameter = lo_function->create_parameter( 'PURCHASE_CONTRACT' ).
    lo_parameter->set_edm_name( 'PurchaseContract' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'PURCHASE_CONTRACT' ).
    lo_parameter->set_is_nullable( ).

    lo_return = lo_function->create_return( ).
    lo_return->set_complex_type( 'MESSAGES' ).
    lo_return->set_is_collection( ).

  ENDMETHOD.


  METHOD def_a_purchase_contract_item_2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'A_PURCHASE_CONTRACT_ITEM_2'
                                    is_structure              = VALUE tys_a_purchase_contract_item_2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'A_PurchaseContractItemNotesType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'A_PURCHASE_CONTRACT_ITEM_N' ).
    lo_entity_set->set_edm_name( 'A_PurchaseContractItemNotes' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'LANGUAGE' ).
    lo_primitive_property->set_edm_name( 'Language' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TEXT_OBJECT_TYPE' ).
    lo_primitive_property->set_edm_name( 'TextObjectType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ARCHITECTURAL_OBJECT_NUMBE' ).
    lo_primitive_property->set_edm_name( 'ArchitecturalObjectNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 70 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TECHNICAL_OBJECT_TYPE' ).
    lo_primitive_property->set_edm_name( 'TechnicalObjectType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_CONTRACT_ITEM' ).
    lo_primitive_property->set_edm_name( 'PurchaseContractItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_CONTRACT' ).
    lo_primitive_property->set_edm_name( 'PurchaseContract' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NOTE_DESCRIPTION' ).
    lo_primitive_property->set_edm_name( 'NoteDescription' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FIXED_INDICATOR' ).
    lo_primitive_property->set_edm_name( 'FixedIndicator' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_a_purchase_contract_item_t.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'A_PURCHASE_CONTRACT_ITEM_T'
                                    is_structure              = VALUE tys_a_purchase_contract_item_t( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'A_PurchaseContractItemType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'A_PURCHASE_CONTRACT_ITEM' ).
    lo_entity_set->set_edm_name( 'A_PurchaseContractItem' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_CONTRACT' ).
    lo_primitive_property->set_edm_name( 'PurchaseContract' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_CONTRACT_ITEM' ).
    lo_primitive_property->set_edm_name( 'PurchaseContractItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_CONTRACT_DELETI' ).
    lo_primitive_property->set_edm_name( 'PurchasingContractDeletionCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_CONTRACT_ITEM_TEX' ).
    lo_primitive_property->set_edm_name( 'PurchaseContractItemText' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMPANY_CODE' ).
    lo_primitive_property->set_edm_name( 'CompanyCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLANT' ).
    lo_primitive_property->set_edm_name( 'Plant' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STORAGE_LOCATION' ).
    lo_primitive_property->set_edm_name( 'StorageLocation' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REQUIREMENT_TRACKING' ).
    lo_primitive_property->set_edm_name( 'RequirementTracking' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATERIAL_GROUP' ).
    lo_primitive_property->set_edm_name( 'MaterialGroup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 9 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_MATERIAL_NUMBER' ).
    lo_primitive_property->set_edm_name( 'SupplierMaterialNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORDER_QUANTITY_UNIT' ).
    lo_primitive_property->set_edm_name( 'OrderQuantityUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORDER_QUANTITY_UNIT_ISOCOD' ).
    lo_primitive_property->set_edm_name( 'OrderQuantityUnitISOCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TARGET_QUANTITY' ).
    lo_primitive_property->set_edm_name( 'TargetQuantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ).
    lo_primitive_property->set_scale( 3 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURG_DOC_RELEASE_ORDER_QUA' ).
    lo_primitive_property->set_edm_name( 'PurgDocReleaseOrderQuantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ).
    lo_primitive_property->set_scale( 3 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORDER_PRICE_UNIT' ).
    lo_primitive_property->set_edm_name( 'OrderPriceUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORDER_PRICE_UNIT_ISOCODE' ).
    lo_primitive_property->set_edm_name( 'OrderPriceUnitISOCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORDER_PRICE_UNIT_TO_ORDER' ).
    lo_primitive_property->set_edm_name( 'OrderPriceUnitToOrderUnitNmrtr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORD_PRICE_UNIT_TO_ORDER_UN' ).
    lo_primitive_property->set_edm_name( 'OrdPriceUnitToOrderUnitDnmntr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONTRACT_NET_PRICE_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'ContractNetPriceAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 11 ).
    lo_primitive_property->set_scale( 3 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCUMENT_CURRENCY' ).
    lo_primitive_property->set_edm_name( 'DocumentCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NET_PRICE_QUANTITY' ).
    lo_primitive_property->set_edm_name( 'NetPriceQuantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_CODE' ).
    lo_primitive_property->set_edm_name( 'TaxCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_COUNTRY' ).
    lo_primitive_property->set_edm_name( 'TaxCountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_DETERMINATION_DATE' ).
    lo_primitive_property->set_edm_name( 'TaxDeterminationDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STOCK_TYPE' ).
    lo_primitive_property->set_edm_name( 'StockType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_INFO_RECORD_UPD' ).
    lo_primitive_property->set_edm_name( 'PurchasingInfoRecordUpdateCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICE_IS_TO_BE_PRINTED' ).
    lo_primitive_property->set_edm_name( 'PriceIsToBePrinted' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_PRICE_IS_ESTIMA' ).
    lo_primitive_property->set_edm_name( 'PurchasingPriceIsEstimated' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NO_DAYS_REMINDER_1' ).
    lo_primitive_property->set_edm_name( 'NoDaysReminder1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NO_DAYS_REMINDER_2' ).
    lo_primitive_property->set_edm_name( 'NoDaysReminder2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NO_DAYS_REMINDER_3' ).
    lo_primitive_property->set_edm_name( 'NoDaysReminder3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLANNED_DELIVERY_DURATION' ).
    lo_primitive_property->set_edm_name( 'PlannedDeliveryDurationInDays' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OVERDELIV_TOLRTD_LMT_RATIO' ).
    lo_primitive_property->set_edm_name( 'OverdelivTolrtdLmtRatioInPct' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ).
    lo_primitive_property->set_scale( 1 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UNLIMITED_OVERDELIVERY_IS' ).
    lo_primitive_property->set_edm_name( 'UnlimitedOverdeliveryIsAllowed' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UNDERDELIV_TOLRTD_LMT_RATI' ).
    lo_primitive_property->set_edm_name( 'UnderdelivTolrtdLmtRatioInPct' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ).
    lo_primitive_property->set_scale( 1 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_DOCUMENT_ITEM_C' ).
    lo_primitive_property->set_edm_name( 'PurchasingDocumentItemCategory' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACCOUNT_ASSIGNMENT_CATEGOR' ).
    lo_primitive_property->set_edm_name( 'AccountAssignmentCategory' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MULTIPLE_ACCT_ASSGMT_DISTR' ).
    lo_primitive_property->set_edm_name( 'MultipleAcctAssgmtDistribution' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GOODS_RECEIPT_IS_EXPECTED' ).
    lo_primitive_property->set_edm_name( 'GoodsReceiptIsExpected' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GOODS_RECEIPT_IS_NON_VALUA' ).
    lo_primitive_property->set_edm_name( 'GoodsReceiptIsNonValuated' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INVOICE_IS_EXPECTED' ).
    lo_primitive_property->set_edm_name( 'InvoiceIsExpected' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INVOICE_IS_GOODS_RECEIPT_B' ).
    lo_primitive_property->set_edm_name( 'InvoiceIsGoodsReceiptBased' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_ORDER_ACKN_RQD' ).
    lo_primitive_property->set_edm_name( 'IsOrderAcknRqd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURG_DOC_ORDER_ACKN_NUMBER' ).
    lo_primitive_property->set_edm_name( 'PurgDocOrderAcknNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SHIPPING_INSTRUCTION' ).
    lo_primitive_property->set_edm_name( 'ShippingInstruction' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MANUAL_DELIVERY_ADDRESS_ID' ).
    lo_primitive_property->set_edm_name( 'ManualDeliveryAddressID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VOLUME_UNIT' ).
    lo_primitive_property->set_edm_name( 'VolumeUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PUR_CONTR_VOLUME_UNIT_ISOC' ).
    lo_primitive_property->set_edm_name( 'PurContrVolumeUnitISOCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_CLASSIFICATION' ).
    lo_primitive_property->set_edm_name( 'IncotermsClassification' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUBCONTRACTOR' ).
    lo_primitive_property->set_edm_name( 'Subcontractor' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EVALD_RCPT_SETTLMT_IS_ALLO' ).
    lo_primitive_property->set_edm_name( 'EvaldRcptSettlmtIsAllowed' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_LOCATION_1' ).
    lo_primitive_property->set_edm_name( 'IncotermsLocation1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 70 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_LOCATION_2' ).
    lo_primitive_property->set_edm_name( 'IncotermsLocation2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 70 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_LOCATION_1_IDENT' ).
    lo_primitive_property->set_edm_name( 'IncotermsLocation1Identifier' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_LOCATION_2_IDENT' ).
    lo_primitive_property->set_edm_name( 'IncotermsLocation2Identifier' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATERIAL' ).
    lo_primitive_property->set_edm_name( 'Material' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SERVICE_PERFORMER' ).
    lo_primitive_property->set_edm_name( 'ServicePerformer' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRODUCT_TYPE_CODE' ).
    lo_primitive_property->set_edm_name( 'ProductTypeCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATERIAL_TYPE' ).
    lo_primitive_property->set_edm_name( 'MaterialType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PUR_CONTRACT_ITM_REPLNMT_E' ).
    lo_primitive_property->set_edm_name( 'PurContractItmReplnmtElmntType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PUR_CONTR_ACCEPTED_AT_ORIG' ).
    lo_primitive_property->set_edm_name( 'PurContrAcceptedAtOriginCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURG_PROD_CMPLNC_SUPPLIER' ).
    lo_primitive_property->set_edm_name( 'PurgProdCmplncSupplierStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_CONTRACT_ITEM_FOR' ).
    lo_primitive_property->set_edm_name( 'PurchaseContractItemFormatted' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_PARENT_ITEM' ).
    lo_primitive_property->set_edm_name( 'PurchasingParentItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURG_DOC_ITEM_CATALOG_RELE' ).
    lo_primitive_property->set_edm_name( 'PurgDocItemCatalogRelevance' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONTRACT_CONSUMPTION_IN_PC' ).
    lo_primitive_property->set_edm_name( 'ContractConsumptionInPct' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 18 ).
    lo_primitive_property->set_scale( 3 ).
    lo_primitive_property->set_is_nullable( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_PURCHASE_CONTRACT' ).
    lo_navigation_property->set_edm_name( 'to_PurchaseContract' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_PURCHASE_CONTRACT_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_PUR_CONTR_ITEM_CNDN_VAL' ).
    lo_navigation_property->set_edm_name( 'to_PurContrItemCndnValdty' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_PUR_CONTR_ITM_CNDN_VAL_2' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_PUR_CTR_ACCOUNT' ).
    lo_navigation_property->set_edm_name( 'to_PurCtrAccount' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_PUR_CTR_ACCOUNT_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_PUR_CTR_ADDRESS' ).
    lo_navigation_property->set_edm_name( 'to_PurCtrAddress' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_PUR_CTR_ADDRESS_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_PUR_CTR_ITEM_NOTES' ).
    lo_navigation_property->set_edm_name( 'to_PurCtrItemNotes' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_PURCHASE_CONTRACT_ITEM_2' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

  ENDMETHOD.


  METHOD def_a_purchase_contract_note_2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'A_PURCHASE_CONTRACT_NOTE_2'
                                    is_structure              = VALUE tys_a_purchase_contract_note_2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'A_PurchaseContractNotesType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'A_PURCHASE_CONTRACT_NOTES' ).
    lo_entity_set->set_edm_name( 'A_PurchaseContractNotes' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'LANGUAGE' ).
    lo_primitive_property->set_edm_name( 'Language' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TEXT_OBJECT_TYPE' ).
    lo_primitive_property->set_edm_name( 'TextObjectType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TECHNICAL_OBJECT_TYPE' ).
    lo_primitive_property->set_edm_name( 'TechnicalObjectType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ARCHITECTURAL_OBJECT_NUMBE' ).
    lo_primitive_property->set_edm_name( 'ArchitecturalObjectNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 70 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_CONTRACT' ).
    lo_primitive_property->set_edm_name( 'PurchaseContract' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NOTE_DESCRIPTION' ).
    lo_primitive_property->set_edm_name( 'NoteDescription' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_a_purchase_contract_type.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'A_PURCHASE_CONTRACT_TYPE'
                                    is_structure              = VALUE tys_a_purchase_contract_type( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'A_PurchaseContractType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'A_PURCHASE_CONTRACT' ).
    lo_entity_set->set_edm_name( 'A_PurchaseContract' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_CONTRACT' ).
    lo_primitive_property->set_edm_name( 'PurchaseContract' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_CONTRACT_TYPE' ).
    lo_primitive_property->set_edm_name( 'PurchaseContractType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMPANY_CODE' ).
    lo_primitive_property->set_edm_name( 'CompanyCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_DOCUMENT_DELETI' ).
    lo_primitive_property->set_edm_name( 'PurchasingDocumentDeletionCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATION_DATE' ).
    lo_primitive_property->set_edm_name( 'CreationDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATED_BY_USER' ).
    lo_primitive_property->set_edm_name( 'CreatedByUser' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER' ).
    lo_primitive_property->set_edm_name( 'Supplier' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_ORGANIZATION' ).
    lo_primitive_property->set_edm_name( 'PurchasingOrganization' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_GROUP' ).
    lo_primitive_property->set_edm_name( 'PurchasingGroup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PAYMENT_TERMS' ).
    lo_primitive_property->set_edm_name( 'PaymentTerms' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CASH_DISCOUNT_1_DAYS' ).
    lo_primitive_property->set_edm_name( 'CashDiscount1Days' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CASH_DISCOUNT_2_DAYS' ).
    lo_primitive_property->set_edm_name( 'CashDiscount2Days' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NET_PAYMENT_DAYS' ).
    lo_primitive_property->set_edm_name( 'NetPaymentDays' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CASH_DISCOUNT_1_PERCENT' ).
    lo_primitive_property->set_edm_name( 'CashDiscount1Percent' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ).
    lo_primitive_property->set_scale( 3 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CASH_DISCOUNT_2_PERCENT' ).
    lo_primitive_property->set_edm_name( 'CashDiscount2Percent' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ).
    lo_primitive_property->set_scale( 3 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCUMENT_CURRENCY' ).
    lo_primitive_property->set_edm_name( 'DocumentCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXCHANGE_RATE' ).
    lo_primitive_property->set_edm_name( 'ExchangeRate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 9 ).
    lo_primitive_property->set_scale( 5 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EXCHANGE_RATE_IS_FIXED' ).
    lo_primitive_property->set_edm_name( 'ExchangeRateIsFixed' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VALIDITY_START_DATE' ).
    lo_primitive_property->set_edm_name( 'ValidityStartDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VALIDITY_END_DATE' ).
    lo_primitive_property->set_edm_name( 'ValidityEndDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'QUOTATION_SUBMISSION_DATE' ).
    lo_primitive_property->set_edm_name( 'QuotationSubmissionDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CORRESPNC_EXTERNAL_REFEREN' ).
    lo_primitive_property->set_edm_name( 'CorrespncExternalReference' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_QUOTATION' ).
    lo_primitive_property->set_edm_name( 'SupplierQuotation' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_RESP_SALES_PERSON' ).
    lo_primitive_property->set_edm_name( 'SupplierRespSalesPersonName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_PHONE_NUMBER' ).
    lo_primitive_property->set_edm_name( 'SupplierPhoneNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLYING_SUPPLIER' ).
    lo_primitive_property->set_edm_name( 'SupplyingSupplier' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_CLASSIFICATION' ).
    lo_primitive_property->set_edm_name( 'IncotermsClassification' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_TRANSFER_LOCATIO' ).
    lo_primitive_property->set_edm_name( 'IncotermsTransferLocation' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 28 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_CONTRACT_TARGET_A' ).
    lo_primitive_property->set_edm_name( 'PurchaseContractTargetAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ).
    lo_primitive_property->set_scale( 3 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INVOICING_PARTY' ).
    lo_primitive_property->set_edm_name( 'InvoicingParty' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CORRESPNC_INTERNAL_REFEREN' ).
    lo_primitive_property->set_edm_name( 'CorrespncInternalReference' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RELEASE_CODE' ).
    lo_primitive_property->set_edm_name( 'ReleaseCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_VERSION' ).
    lo_primitive_property->set_edm_name( 'IncotermsVersion' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_LOCATION_1' ).
    lo_primitive_property->set_edm_name( 'IncotermsLocation1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 70 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_LOCATION_2' ).
    lo_primitive_property->set_edm_name( 'IncotermsLocation2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 70 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_LOCATION_1_IDENT' ).
    lo_primitive_property->set_edm_name( 'IncotermsLocation1Identifier' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_LOCATION_2_IDENT' ).
    lo_primitive_property->set_edm_name( 'IncotermsLocation2Identifier' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_END_OF_PURPOSE_BLOCKED' ).
    lo_primitive_property->set_edm_name( 'IsEndOfPurposeBlocked' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LAST_CHANGE_DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'LastChangeDateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_PROCESSING_STAT' ).
    lo_primitive_property->set_edm_name( 'PurchasingProcessingStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURG_AGGRGD_PROD_CMPLNC_SU' ).
    lo_primitive_property->set_edm_name( 'PurgAggrgdProdCmplncSuplrSts' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_PROCESSING_ST_2' ).
    lo_primitive_property->set_edm_name( 'PurchasingProcessingStatusName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURG_CONTRACT_IS_IN_PREPAR' ).
    lo_primitive_property->set_edm_name( 'PurgContractIsInPreparation' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURG_DOC_EXTERNAL_REFERENC' ).
    lo_primitive_property->set_edm_name( 'PurgDocExternalReference' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 70 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_DOCUMENT_NAME' ).
    lo_primitive_property->set_edm_name( 'PurchasingDocumentName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURG_DOC_CATALOG_ITEM_RELE' ).
    lo_primitive_property->set_edm_name( 'PurgDocCatalogItemRelevance' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PUR_CONTR_ATTENTION_REQUIR' ).
    lo_primitive_property->set_edm_name( 'PurContrAttentionRequiredText' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONTRACT_CONSUMPTION_IN_PC' ).
    lo_primitive_property->set_edm_name( 'ContractConsumptionInPct' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 18 ).
    lo_primitive_property->set_scale( 3 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VERSION_IS_ENABLED' ).
    lo_primitive_property->set_edm_name( 'VersionIsEnabled' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_PURCHASE_CONTRACT_ITEM' ).
    lo_navigation_property->set_edm_name( 'to_PurchaseContractItem' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_PURCHASE_CONTRACT_ITEM_T' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_PURCTRNOTES' ).
    lo_navigation_property->set_edm_name( 'to_Purctrnotes' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_PURCHASE_CONTRACT_NOTE_2' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_PUR_CONTR_HDR_CNDN_VALD' ).
    lo_navigation_property->set_edm_name( 'to_PurContrHdrCndnValdty' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_PUR_CONTR_HDR_CNDN_VAL_2' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_PUR_CTR_PARTNERS' ).
    lo_navigation_property->set_edm_name( 'to_PurCtrPartners' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_PUR_CTR_PARTNERS_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

  ENDMETHOD.


  METHOD def_a_pur_contr_hdr_cndn_amo_2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'A_PUR_CONTR_HDR_CNDN_AMO_2'
                                    is_structure              = VALUE tys_a_pur_contr_hdr_cndn_amo_2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'A_PurContrHdrCndnAmountType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'A_PUR_CONTR_HDR_CNDN_AMOUN' ).
    lo_entity_set->set_edm_name( 'A_PurContrHdrCndnAmount' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_CONTRACT' ).
    lo_primitive_property->set_edm_name( 'PurchaseContract' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RECORD' ).
    lo_primitive_property->set_edm_name( 'ConditionRecord' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_VALIDITY_END_DAT' ).
    lo_primitive_property->set_edm_name( 'ConditionValidityEndDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_SEQUENTIAL_NUMBE' ).
    lo_primitive_property->set_edm_name( 'ConditionSequentialNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_VALIDITY_START_D' ).
    lo_primitive_property->set_edm_name( 'ConditionValidityStartDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_TYPE' ).
    lo_primitive_property->set_edm_name( 'ConditionType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_TEXT_ID' ).
    lo_primitive_property->set_edm_name( 'ConditionTextID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_CALCULATION_TYPE' ).
    lo_primitive_property->set_edm_name( 'ConditionCalculationType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RATE_RATIO_UNIT' ).
    lo_primitive_property->set_edm_name( 'ConditionRateRatioUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PUR_CONTR_CNDN_RATE_RATIO' ).
    lo_primitive_property->set_edm_name( 'PurContrCndnRateRatioUntISOCd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RATE_RATIO' ).
    lo_primitive_property->set_edm_name( 'ConditionRateRatio' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 24 ).
    lo_primitive_property->set_scale( 9 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_CURRENCY' ).
    lo_primitive_property->set_edm_name( 'ConditionCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RATE_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'ConditionRateAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 24 ).
    lo_primitive_property->set_scale( 9 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RATE_VALUE' ).
    lo_primitive_property->set_edm_name( 'ConditionRateValue' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 11 ).
    lo_primitive_property->set_scale( 3 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RATE_VALUE_UNIT' ).
    lo_primitive_property->set_edm_name( 'ConditionRateValueUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_QUANTITY' ).
    lo_primitive_property->set_edm_name( 'ConditionQuantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_QUANTITY_UNIT' ).
    lo_primitive_property->set_edm_name( 'ConditionQuantityUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PUR_CONTR_CNDN_QTY_UNIT_IS' ).
    lo_primitive_property->set_edm_name( 'PurContrCndnQtyUnitISOCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_TO_BASE_QTY_NMRT' ).
    lo_primitive_property->set_edm_name( 'ConditionToBaseQtyNmrtr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_TO_BASE_QTY_DNMN' ).
    lo_primitive_property->set_edm_name( 'ConditionToBaseQtyDnmntr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BASE_UNIT' ).
    lo_primitive_property->set_edm_name( 'BaseUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PUR_CONTR_BASE_UNIT_ISOCOD' ).
    lo_primitive_property->set_edm_name( 'PurContrBaseUnitISOCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_LOWER_LIMIT_AMOU' ).
    lo_primitive_property->set_edm_name( 'ConditionLowerLimitAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 24 ).
    lo_primitive_property->set_scale( 9 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_LOWER_LIMIT_RATI' ).
    lo_primitive_property->set_edm_name( 'ConditionLowerLimitRatio' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 24 ).
    lo_primitive_property->set_scale( 9 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_UPPER_LIMIT_AMOU' ).
    lo_primitive_property->set_edm_name( 'ConditionUpperLimitAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 24 ).
    lo_primitive_property->set_scale( 9 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_UPPER_LIMIT_RATI' ).
    lo_primitive_property->set_edm_name( 'ConditionUpperLimitRatio' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 24 ).
    lo_primitive_property->set_scale( 9 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_ALTERNATIVE_CURR' ).
    lo_primitive_property->set_edm_name( 'ConditionAlternativeCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_EXCLUSION' ).
    lo_primitive_property->set_edm_name( 'ConditionExclusion' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_IS_DELETED' ).
    lo_primitive_property->set_edm_name( 'ConditionIsDeleted' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDITIONAL_VALUE_DAYS' ).
    lo_primitive_property->set_edm_name( 'AdditionalValueDays' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FIXED_VALUE_DATE' ).
    lo_primitive_property->set_edm_name( 'FixedValueDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PAYMENT_TERMS' ).
    lo_primitive_property->set_edm_name( 'PaymentTerms' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CNDN_MAX_NUMBER_OF_SALES_O' ).
    lo_primitive_property->set_edm_name( 'CndnMaxNumberOfSalesOrders' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MINIMUM_CONDITION_BASIS_VA' ).
    lo_primitive_property->set_edm_name( 'MinimumConditionBasisValue' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ).
    lo_primitive_property->set_scale( 3 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MAXIMUM_CONDITION_BASIS_VA' ).
    lo_primitive_property->set_edm_name( 'MaximumConditionBasisValue' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ).
    lo_primitive_property->set_scale( 3 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MAXIMUM_CONDITION_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'MaximumConditionAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ).
    lo_primitive_property->set_scale( 3 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RELEASE_STATUS' ).
    lo_primitive_property->set_edm_name( 'ConditionReleaseStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_CHANGE_REASON' ).
    lo_primitive_property->set_edm_name( 'ConditionChangeReason' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICING_SCALE_TYPE' ).
    lo_primitive_property->set_edm_name( 'PricingScaleType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICING_SCALE_BASIS' ).
    lo_primitive_property->set_edm_name( 'PricingScaleBasis' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICING_SCALE_LINE' ).
    lo_primitive_property->set_edm_name( 'PricingScaleLine' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_HAS_SCALES' ).
    lo_primitive_property->set_edm_name( 'ConditionHasScales' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICING_SCALE_CHECKING_RUL' ).
    lo_primitive_property->set_edm_name( 'PricingScaleCheckingRule' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_PURCHASE_CONTRACT' ).
    lo_navigation_property->set_edm_name( 'to_PurchaseContract' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_PURCHASE_CONTRACT_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_PUR_CONTR_HDR_CNDN_SCAL' ).
    lo_navigation_property->set_edm_name( 'to_PurContrHdrCndnScale' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_PUR_CONTR_HDR_CNDN_SCA_2' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_PUR_CONTR_HDR_CNDN_VALD' ).
    lo_navigation_property->set_edm_name( 'to_PurContrHdrCndnValdty' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_PUR_CONTR_HDR_CNDN_VAL_2' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

  ENDMETHOD.


  METHOD def_a_pur_contr_hdr_cndn_sca_2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'A_PUR_CONTR_HDR_CNDN_SCA_2'
                                    is_structure              = VALUE tys_a_pur_contr_hdr_cndn_sca_2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'A_PurContrHdrCndnScaleType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'A_PUR_CONTR_HDR_CNDN_SCALE' ).
    lo_entity_set->set_edm_name( 'A_PurContrHdrCndnScale' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_CONTRACT' ).
    lo_primitive_property->set_edm_name( 'PurchaseContract' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RECORD' ).
    lo_primitive_property->set_edm_name( 'ConditionRecord' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_SEQUENTIAL_NUMBE' ).
    lo_primitive_property->set_edm_name( 'ConditionSequentialNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_VALIDITY_END_DAT' ).
    lo_primitive_property->set_edm_name( 'ConditionValidityEndDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_SCALE_LINE' ).
    lo_primitive_property->set_edm_name( 'ConditionScaleLine' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_SCALE_QUANTITY' ).
    lo_primitive_property->set_edm_name( 'ConditionScaleQuantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ).
    lo_primitive_property->set_scale( 3 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_SCALE_QUANTITY_U' ).
    lo_primitive_property->set_edm_name( 'ConditionScaleQuantityUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PUR_CONTR_CNDN_SC_QTY_UNIT' ).
    lo_primitive_property->set_edm_name( 'PurContrCndnScQtyUnitISOCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_SCALE_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'ConditionScaleAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ).
    lo_primitive_property->set_scale( 3 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_SCALE_AMOUNT_CUR' ).
    lo_primitive_property->set_edm_name( 'ConditionScaleAmountCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RATE_VALUE' ).
    lo_primitive_property->set_edm_name( 'ConditionRateValue' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 11 ).
    lo_primitive_property->set_scale( 3 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RATE_VALUE_UNIT' ).
    lo_primitive_property->set_edm_name( 'ConditionRateValueUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RATE_RATIO' ).
    lo_primitive_property->set_edm_name( 'ConditionRateRatio' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 24 ).
    lo_primitive_property->set_scale( 9 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RATE_RATIO_UNIT' ).
    lo_primitive_property->set_edm_name( 'ConditionRateRatioUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PUR_CONTR_CNDN_RATE_RATIO' ).
    lo_primitive_property->set_edm_name( 'PurContrCndnRateRatioUntISOCd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RATE_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'ConditionRateAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 24 ).
    lo_primitive_property->set_scale( 9 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_CURRENCY' ).
    lo_primitive_property->set_edm_name( 'ConditionCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_SCALE_IS_DELETED' ).
    lo_primitive_property->set_edm_name( 'ConditionScaleIsDeleted' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICING_SCALE_TYPE' ).
    lo_primitive_property->set_edm_name( 'PricingScaleType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_QUANTITY' ).
    lo_primitive_property->set_edm_name( 'ConditionQuantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_QUANTITY_UNIT' ).
    lo_primitive_property->set_edm_name( 'ConditionQuantityUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PUR_CONTR_CNDN_QTY_UNIT_IS' ).
    lo_primitive_property->set_edm_name( 'PurContrCndnQtyUnitISOCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_PURCHASE_CONTRACT' ).
    lo_navigation_property->set_edm_name( 'to_PurchaseContract' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_PURCHASE_CONTRACT_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_PUR_CONTR_HDR_CNDN_AMOU' ).
    lo_navigation_property->set_edm_name( 'to_PurContrHdrCndnAmount' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_PUR_CONTR_HDR_CNDN_AMO_2' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

  ENDMETHOD.


  METHOD def_a_pur_contr_hdr_cndn_val_2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'A_PUR_CONTR_HDR_CNDN_VAL_2'
                                    is_structure              = VALUE tys_a_pur_contr_hdr_cndn_val_2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'A_PurContrHdrCndnValdtyType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'A_PUR_CONTR_HDR_CNDN_VALDT' ).
    lo_entity_set->set_edm_name( 'A_PurContrHdrCndnValdty' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_CONTRACT' ).
    lo_primitive_property->set_edm_name( 'PurchaseContract' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RECORD' ).
    lo_primitive_property->set_edm_name( 'ConditionRecord' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_VALIDITY_END_DAT' ).
    lo_primitive_property->set_edm_name( 'ConditionValidityEndDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_APPLICATION' ).
    lo_primitive_property->set_edm_name( 'ConditionApplication' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_TYPE' ).
    lo_primitive_property->set_edm_name( 'ConditionType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_IS_DELETED' ).
    lo_primitive_property->set_edm_name( 'ConditionIsDeleted' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_VALIDITY_START_D' ).
    lo_primitive_property->set_edm_name( 'ConditionValidityStartDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_PURCHASE_CONTRACT' ).
    lo_navigation_property->set_edm_name( 'to_PurchaseContract' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_PURCHASE_CONTRACT_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_PUR_CONTR_HDR_CNDN_AMOU' ).
    lo_navigation_property->set_edm_name( 'to_PurContrHdrCndnAmount' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_PUR_CONTR_HDR_CNDN_AMO_2' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

  ENDMETHOD.


  METHOD def_a_pur_contr_itm_cndn_amo_2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'A_PUR_CONTR_ITM_CNDN_AMO_2'
                                    is_structure              = VALUE tys_a_pur_contr_itm_cndn_amo_2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'A_PurContrItmCndnAmountType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'A_PUR_CONTR_ITM_CNDN_AMOUN' ).
    lo_entity_set->set_edm_name( 'A_PurContrItmCndnAmount' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_CONTRACT' ).
    lo_primitive_property->set_edm_name( 'PurchaseContract' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_CONTRACT_ITEM' ).
    lo_primitive_property->set_edm_name( 'PurchaseContractItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RECORD' ).
    lo_primitive_property->set_edm_name( 'ConditionRecord' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_VALIDITY_END_DAT' ).
    lo_primitive_property->set_edm_name( 'ConditionValidityEndDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_SEQUENTIAL_NUMBE' ).
    lo_primitive_property->set_edm_name( 'ConditionSequentialNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_VALIDITY_START_D' ).
    lo_primitive_property->set_edm_name( 'ConditionValidityStartDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLANT' ).
    lo_primitive_property->set_edm_name( 'Plant' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_TYPE' ).
    lo_primitive_property->set_edm_name( 'ConditionType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_TEXT_ID' ).
    lo_primitive_property->set_edm_name( 'ConditionTextID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_CALCULATION_TYPE' ).
    lo_primitive_property->set_edm_name( 'ConditionCalculationType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RATE_RATIO_UNIT' ).
    lo_primitive_property->set_edm_name( 'ConditionRateRatioUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PUR_CONTR_CNDN_RATE_RATIO' ).
    lo_primitive_property->set_edm_name( 'PurContrCndnRateRatioUntISOCd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RATE_RATIO' ).
    lo_primitive_property->set_edm_name( 'ConditionRateRatio' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 24 ).
    lo_primitive_property->set_scale( 9 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_CURRENCY' ).
    lo_primitive_property->set_edm_name( 'ConditionCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RATE_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'ConditionRateAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 24 ).
    lo_primitive_property->set_scale( 9 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RATE_VALUE' ).
    lo_primitive_property->set_edm_name( 'ConditionRateValue' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 11 ).
    lo_primitive_property->set_scale( 3 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RATE_VALUE_UNIT' ).
    lo_primitive_property->set_edm_name( 'ConditionRateValueUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_QUANTITY' ).
    lo_primitive_property->set_edm_name( 'ConditionQuantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_QUANTITY_UNIT' ).
    lo_primitive_property->set_edm_name( 'ConditionQuantityUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PUR_CONTR_CNDN_QTY_UNIT_IS' ).
    lo_primitive_property->set_edm_name( 'PurContrCndnQtyUnitISOCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_TO_BASE_QTY_NMRT' ).
    lo_primitive_property->set_edm_name( 'ConditionToBaseQtyNmrtr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_TO_BASE_QTY_DNMN' ).
    lo_primitive_property->set_edm_name( 'ConditionToBaseQtyDnmntr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BASE_UNIT' ).
    lo_primitive_property->set_edm_name( 'BaseUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PUR_CONTR_BASE_UNIT_ISOCOD' ).
    lo_primitive_property->set_edm_name( 'PurContrBaseUnitISOCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_LOWER_LIMIT_AMOU' ).
    lo_primitive_property->set_edm_name( 'ConditionLowerLimitAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 24 ).
    lo_primitive_property->set_scale( 9 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_LOWER_LIMIT_RATI' ).
    lo_primitive_property->set_edm_name( 'ConditionLowerLimitRatio' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 24 ).
    lo_primitive_property->set_scale( 9 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_UPPER_LIMIT_AMOU' ).
    lo_primitive_property->set_edm_name( 'ConditionUpperLimitAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 24 ).
    lo_primitive_property->set_scale( 9 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_UPPER_LIMIT_RATI' ).
    lo_primitive_property->set_edm_name( 'ConditionUpperLimitRatio' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 24 ).
    lo_primitive_property->set_scale( 9 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_ALTERNATIVE_CURR' ).
    lo_primitive_property->set_edm_name( 'ConditionAlternativeCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_EXCLUSION' ).
    lo_primitive_property->set_edm_name( 'ConditionExclusion' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_IS_DELETED' ).
    lo_primitive_property->set_edm_name( 'ConditionIsDeleted' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDITIONAL_VALUE_DAYS' ).
    lo_primitive_property->set_edm_name( 'AdditionalValueDays' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FIXED_VALUE_DATE' ).
    lo_primitive_property->set_edm_name( 'FixedValueDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PAYMENT_TERMS' ).
    lo_primitive_property->set_edm_name( 'PaymentTerms' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CNDN_MAX_NUMBER_OF_SALES_O' ).
    lo_primitive_property->set_edm_name( 'CndnMaxNumberOfSalesOrders' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MINIMUM_CONDITION_BASIS_VA' ).
    lo_primitive_property->set_edm_name( 'MinimumConditionBasisValue' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ).
    lo_primitive_property->set_scale( 3 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MAXIMUM_CONDITION_BASIS_VA' ).
    lo_primitive_property->set_edm_name( 'MaximumConditionBasisValue' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ).
    lo_primitive_property->set_scale( 3 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MAXIMUM_CONDITION_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'MaximumConditionAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ).
    lo_primitive_property->set_scale( 3 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RELEASE_STATUS' ).
    lo_primitive_property->set_edm_name( 'ConditionReleaseStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_CHANGE_REASON' ).
    lo_primitive_property->set_edm_name( 'ConditionChangeReason' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICING_SCALE_TYPE' ).
    lo_primitive_property->set_edm_name( 'PricingScaleType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICING_SCALE_BASIS' ).
    lo_primitive_property->set_edm_name( 'PricingScaleBasis' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICING_SCALE_LINE' ).
    lo_primitive_property->set_edm_name( 'PricingScaleLine' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_HAS_SCALES' ).
    lo_primitive_property->set_edm_name( 'ConditionHasScales' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICING_SCALE_CHECKING_RUL' ).
    lo_primitive_property->set_edm_name( 'PricingScaleCheckingRule' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_PURCHASE_CONTRACT' ).
    lo_navigation_property->set_edm_name( 'to_PurchaseContract' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_PURCHASE_CONTRACT_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_PUR_CONTR_ITM_CNDN_SCAL' ).
    lo_navigation_property->set_edm_name( 'to_PurContrItmCndnScales' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_PUR_CONTR_ITM_CNDN_SCA_2' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_PUR_CONTR_ITM_CNDN_VALD' ).
    lo_navigation_property->set_edm_name( 'to_PurContrItmCndnValdty' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_PUR_CONTR_ITM_CNDN_VAL_2' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

  ENDMETHOD.


  METHOD def_a_pur_contr_itm_cndn_sca_2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'A_PUR_CONTR_ITM_CNDN_SCA_2'
                                    is_structure              = VALUE tys_a_pur_contr_itm_cndn_sca_2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'A_PurContrItmCndnScalesType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'A_PUR_CONTR_ITM_CNDN_SCALE' ).
    lo_entity_set->set_edm_name( 'A_PurContrItmCndnScales' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_CONTRACT' ).
    lo_primitive_property->set_edm_name( 'PurchaseContract' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_CONTRACT_ITEM' ).
    lo_primitive_property->set_edm_name( 'PurchaseContractItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RECORD' ).
    lo_primitive_property->set_edm_name( 'ConditionRecord' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_SEQUENTIAL_NUMBE' ).
    lo_primitive_property->set_edm_name( 'ConditionSequentialNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_VALIDITY_END_DAT' ).
    lo_primitive_property->set_edm_name( 'ConditionValidityEndDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_SCALE_LINE' ).
    lo_primitive_property->set_edm_name( 'ConditionScaleLine' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_SCALE_QUANTITY' ).
    lo_primitive_property->set_edm_name( 'ConditionScaleQuantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ).
    lo_primitive_property->set_scale( 3 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_SCALE_QUANTITY_U' ).
    lo_primitive_property->set_edm_name( 'ConditionScaleQuantityUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PUR_CONTR_CNDN_SC_QTY_UNIT' ).
    lo_primitive_property->set_edm_name( 'PurContrCndnScQtyUnitISOCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_SCALE_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'ConditionScaleAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ).
    lo_primitive_property->set_scale( 3 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_SCALE_AMOUNT_CUR' ).
    lo_primitive_property->set_edm_name( 'ConditionScaleAmountCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RATE_VALUE' ).
    lo_primitive_property->set_edm_name( 'ConditionRateValue' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 11 ).
    lo_primitive_property->set_scale( 3 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RATE_VALUE_UNIT' ).
    lo_primitive_property->set_edm_name( 'ConditionRateValueUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RATE_RATIO' ).
    lo_primitive_property->set_edm_name( 'ConditionRateRatio' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 24 ).
    lo_primitive_property->set_scale( 9 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RATE_RATIO_UNIT' ).
    lo_primitive_property->set_edm_name( 'ConditionRateRatioUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PUR_CONTR_CNDN_RATE_RATIO' ).
    lo_primitive_property->set_edm_name( 'PurContrCndnRateRatioUntISOCd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RATE_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'ConditionRateAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 24 ).
    lo_primitive_property->set_scale( 9 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_CURRENCY' ).
    lo_primitive_property->set_edm_name( 'ConditionCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_SCALE_IS_DELETED' ).
    lo_primitive_property->set_edm_name( 'ConditionScaleIsDeleted' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICING_SCALE_TYPE' ).
    lo_primitive_property->set_edm_name( 'PricingScaleType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_QUANTITY' ).
    lo_primitive_property->set_edm_name( 'ConditionQuantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_QUANTITY_UNIT' ).
    lo_primitive_property->set_edm_name( 'ConditionQuantityUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PUR_CONTR_CNDN_QTY_UNIT_IS' ).
    lo_primitive_property->set_edm_name( 'PurContrCndnQtyUnitISOCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_PURCHASE_CONTRACT' ).
    lo_navigation_property->set_edm_name( 'to_PurchaseContract' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_PURCHASE_CONTRACT_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_PUR_CONTR_ITM_CNDN_AMOU' ).
    lo_navigation_property->set_edm_name( 'to_PurContrItmCndnAmount' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_PUR_CONTR_ITM_CNDN_AMO_2' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

  ENDMETHOD.


  METHOD def_a_pur_contr_itm_cndn_val_2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'A_PUR_CONTR_ITM_CNDN_VAL_2'
                                    is_structure              = VALUE tys_a_pur_contr_itm_cndn_val_2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'A_PurContrItmCndnValdtyType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'A_PUR_CONTR_ITM_CNDN_VALDT' ).
    lo_entity_set->set_edm_name( 'A_PurContrItmCndnValdty' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_CONTRACT' ).
    lo_primitive_property->set_edm_name( 'PurchaseContract' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_CONTRACT_ITEM' ).
    lo_primitive_property->set_edm_name( 'PurchaseContractItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RECORD' ).
    lo_primitive_property->set_edm_name( 'ConditionRecord' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_VALIDITY_END_DAT' ).
    lo_primitive_property->set_edm_name( 'ConditionValidityEndDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_APPLICATION' ).
    lo_primitive_property->set_edm_name( 'ConditionApplication' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_TYPE' ).
    lo_primitive_property->set_edm_name( 'ConditionType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_IS_DELETED' ).
    lo_primitive_property->set_edm_name( 'ConditionIsDeleted' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLANT' ).
    lo_primitive_property->set_edm_name( 'Plant' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_VALIDITY_START_D' ).
    lo_primitive_property->set_edm_name( 'ConditionValidityStartDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_PURCHASE_CONTRACT' ).
    lo_navigation_property->set_edm_name( 'to_PurchaseContract' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_PURCHASE_CONTRACT_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_PURCHASE_CONTRACT_ITEM' ).
    lo_navigation_property->set_edm_name( 'to_PurchaseContractItem' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_PURCHASE_CONTRACT_ITEM_T' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_PUR_CONTR_ITM_CNDN_AMOU' ).
    lo_navigation_property->set_edm_name( 'to_PurContrItmCndnAmount' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_PUR_CONTR_ITM_CNDN_AMO_2' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

  ENDMETHOD.


  METHOD def_a_pur_ctr_account_type.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'A_PUR_CTR_ACCOUNT_TYPE'
                                    is_structure              = VALUE tys_a_pur_ctr_account_type( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'A_PurCtrAccountType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'A_PUR_CTR_ACCOUNT' ).
    lo_entity_set->set_edm_name( 'A_PurCtrAccount' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACCOUNT_ASSIGNMENT' ).
    lo_primitive_property->set_edm_name( 'AccountAssignment' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_CONTRACT_ITEM' ).
    lo_primitive_property->set_edm_name( 'PurchaseContractItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_CONTRACT' ).
    lo_primitive_property->set_edm_name( 'PurchaseContract' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_DELETED' ).
    lo_primitive_property->set_edm_name( 'IsDeleted' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'QUANTITY' ).
    lo_primitive_property->set_edm_name( 'Quantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ).
    lo_primitive_property->set_scale( 3 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORDER_QUANTITY_UNIT' ).
    lo_primitive_property->set_edm_name( 'OrderQuantityUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORDER_QUANTITY_UNIT_ISOCOD' ).
    lo_primitive_property->set_edm_name( 'OrderQuantityUnitISOCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MULTIPLE_ACCT_ASSGMT_DISTR' ).
    lo_primitive_property->set_edm_name( 'MultipleAcctAssgmtDistrPercent' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ).
    lo_primitive_property->set_scale( 1 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURG_DOC_NET_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'PurgDocNetAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ).
    lo_primitive_property->set_scale( 3 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCUMENT_CURRENCY' ).
    lo_primitive_property->set_edm_name( 'DocumentCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLACCOUNT' ).
    lo_primitive_property->set_edm_name( 'GLAccount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUSINESS_AREA' ).
    lo_primitive_property->set_edm_name( 'BusinessArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COST_CENTER' ).
    lo_primitive_property->set_edm_name( 'CostCenter' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER' ).
    lo_primitive_property->set_edm_name( 'SalesOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER_ITEM' ).
    lo_primitive_property->set_edm_name( 'SalesOrderItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER_SCHEDULE_LINE' ).
    lo_primitive_property->set_edm_name( 'SalesOrderScheduleLine' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MASTER_FIXED_ASSET' ).
    lo_primitive_property->set_edm_name( 'MasterFixedAsset' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FIXED_ASSET' ).
    lo_primitive_property->set_edm_name( 'FixedAsset' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORDER_ID' ).
    lo_primitive_property->set_edm_name( 'OrderID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GOODS_RECIPIENT_NAME' ).
    lo_primitive_property->set_edm_name( 'GoodsRecipientName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UNLOADING_POINT_NAME' ).
    lo_primitive_property->set_edm_name( 'UnloadingPointName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONTROLLING_AREA' ).
    lo_primitive_property->set_edm_name( 'ControllingArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COST_OBJECT' ).
    lo_primitive_property->set_edm_name( 'CostObject' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROFIT_CENTER' ).
    lo_primitive_property->set_edm_name( 'ProfitCenter' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROJECT_NETWORK' ).
    lo_primitive_property->set_edm_name( 'ProjectNetwork' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REAL_ESTATE_OBJECT' ).
    lo_primitive_property->set_edm_name( 'RealEstateObject' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARTNER_ACCOUNT_NUMBER' ).
    lo_primitive_property->set_edm_name( 'PartnerAccountNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMMITMENT_ITEM' ).
    lo_primitive_property->set_edm_name( 'CommitmentItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 24 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'JOINT_VENTURE_RECOVERY_COD' ).
    lo_primitive_property->set_edm_name( 'JointVentureRecoveryCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUNDS_CENTER' ).
    lo_primitive_property->set_edm_name( 'FundsCenter' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUNCTIONAL_AREA' ).
    lo_primitive_property->set_edm_name( 'FunctionalArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SETTLEMENT_REFERENCE_DATE' ).
    lo_primitive_property->set_edm_name( 'SettlementReferenceDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_CODE' ).
    lo_primitive_property->set_edm_name( 'TaxCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_JURISDICTION' ).
    lo_primitive_property->set_edm_name( 'TaxJurisdiction' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NON_DEDUCTIBLE_INPUT_TAX_A' ).
    lo_primitive_property->set_edm_name( 'NonDeductibleInputTaxAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ).
    lo_primitive_property->set_scale( 3 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COST_CTR_ACTIVITY_TYPE' ).
    lo_primitive_property->set_edm_name( 'CostCtrActivityType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUSINESS_PROCESS' ).
    lo_primitive_property->set_edm_name( 'BusinessProcess' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EARMARKED_FUNDS_DOCUMENT' ).
    lo_primitive_property->set_edm_name( 'EarmarkedFundsDocument' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GRANT_ID' ).
    lo_primitive_property->set_edm_name( 'GrantID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUDGET_PERIOD' ).
    lo_primitive_property->set_edm_name( 'BudgetPeriod' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WBSELEMENT_EXTERNAL_ID' ).
    lo_primitive_property->set_edm_name( 'WBSElementExternalID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 24 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_a_pur_ctr_address_type.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'A_PUR_CTR_ADDRESS_TYPE'
                                    is_structure              = VALUE tys_a_pur_ctr_address_type( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'A_PurCtrAddressType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'A_PUR_CTR_ADDRESS' ).
    lo_entity_set->set_edm_name( 'A_PurCtrAddress' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_CONTRACT' ).
    lo_primitive_property->set_edm_name( 'PurchaseContract' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDRESS_ID' ).
    lo_primitive_property->set_edm_name( 'AddressID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_CONTRACT_ITEM' ).
    lo_primitive_property->set_edm_name( 'PurchaseContractItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FORM_OF_ADDRESS' ).
    lo_primitive_property->set_edm_name( 'FormOfAddress' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FULL_NAME' ).
    lo_primitive_property->set_edm_name( 'FullName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 80 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONSIGNEE_NAME_3' ).
    lo_primitive_property->set_edm_name( 'ConsigneeName3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONSIGNEE_NAME_4' ).
    lo_primitive_property->set_edm_name( 'ConsigneeName4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CARE_OF_NAME' ).
    lo_primitive_property->set_edm_name( 'CareOfName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CITY_NAME' ).
    lo_primitive_property->set_edm_name( 'CityName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DISTRICT' ).
    lo_primitive_property->set_edm_name( 'District' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CITY_CODE' ).
    lo_primitive_property->set_edm_name( 'CityCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POSTAL_CODE' ).
    lo_primitive_property->set_edm_name( 'PostalCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POBOX_POSTAL_CODE' ).
    lo_primitive_property->set_edm_name( 'POBoxPostalCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMPANY_POSTAL_CODE' ).
    lo_primitive_property->set_edm_name( 'CompanyPostalCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POBOX' ).
    lo_primitive_property->set_edm_name( 'POBox' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POBOX_DEVIATING_CITY_NAME' ).
    lo_primitive_property->set_edm_name( 'POBoxDeviatingCityName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STREET_NAME' ).
    lo_primitive_property->set_edm_name( 'StreetName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HOUSE_NUMBER' ).
    lo_primitive_property->set_edm_name( 'HouseNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STREET_PREFIX_NAME' ).
    lo_primitive_property->set_edm_name( 'StreetPrefixName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDITIONAL_STREET_PREFIX_N' ).
    lo_primitive_property->set_edm_name( 'AdditionalStreetPrefixName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDITIONAL_STREET_SUFFIX_N' ).
    lo_primitive_property->set_edm_name( 'AdditionalStreetSuffixName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUILDING' ).
    lo_primitive_property->set_edm_name( 'Building' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FLOOR' ).
    lo_primitive_property->set_edm_name( 'Floor' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ROOM_NUMBER' ).
    lo_primitive_property->set_edm_name( 'RoomNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COUNTRY' ).
    lo_primitive_property->set_edm_name( 'Country' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CORRESPONDENCE_LANGUAGE' ).
    lo_primitive_property->set_edm_name( 'CorrespondenceLanguage' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REGION' ).
    lo_primitive_property->set_edm_name( 'Region' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDRESS_TIME_ZONE' ).
    lo_primitive_property->set_edm_name( 'AddressTimeZone' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_JURISDICTION' ).
    lo_primitive_property->set_edm_name( 'TaxJurisdiction' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRFRD_COMM_MEDIUM_TYPE' ).
    lo_primitive_property->set_edm_name( 'PrfrdCommMediumType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PHONE_NUMBER' ).
    lo_primitive_property->set_edm_name( 'PhoneNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FAX_NUMBER' ).
    lo_primitive_property->set_edm_name( 'FaxNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 31 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRANSPORT_ZONE' ).
    lo_primitive_property->set_edm_name( 'TransportZone' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HOUSE_NUMBER_SUPPLEMENT_TE' ).
    lo_primitive_property->set_edm_name( 'HouseNumberSupplementText' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STREET_SUFFIX_NAME' ).
    lo_primitive_property->set_edm_name( 'StreetSuffixName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_a_pur_ctr_partners_type.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'A_PUR_CTR_PARTNERS_TYPE'
                                    is_structure              = VALUE tys_a_pur_ctr_partners_type( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'A_PurCtrPartnersType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'A_PUR_CTR_PARTNERS' ).
    lo_entity_set->set_edm_name( 'A_PurCtrPartners' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_CONTRACT' ).
    lo_primitive_property->set_edm_name( 'PurchaseContract' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_CONTRACT_ITEM' ).
    lo_primitive_property->set_edm_name( 'PurchaseContractItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_ORGANIZATION' ).
    lo_primitive_property->set_edm_name( 'PurchasingOrganization' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARTNER_FUNCTION' ).
    lo_primitive_property->set_edm_name( 'PartnerFunction' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLANT' ).
    lo_primitive_property->set_edm_name( 'Plant' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_SUBRANGE' ).
    lo_primitive_property->set_edm_name( 'SupplierSubrange' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARTNER_COUNTER' ).
    lo_primitive_property->set_edm_name( 'PartnerCounter' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER' ).
    lo_primitive_property->set_edm_name( 'Supplier' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DEFAULT_PARTNER' ).
    lo_primitive_property->set_edm_name( 'DefaultPartner' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_messages.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_complex_type        TYPE REF TO /iwbep/if_v4_pm_cplx_type,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_complex_type = mo_model->create_complex_type_by_struct(
                                    iv_complex_type_name      = 'MESSAGES'
                                    is_structure              = VALUE tys_messages( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_complex_type->set_edm_name( 'Messages' ) ##NO_TEXT.


    lo_primitive_property = lo_complex_type->get_primitive_property( 'TYPE' ).
    lo_primitive_property->set_edm_name( 'Type' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ).
    lo_primitive_property->set_scale_floating( ).

    lo_primitive_property = lo_complex_type->get_primitive_property( 'MESSAGE' ).
    lo_primitive_property->set_edm_name( 'Message' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 220 ).
    lo_primitive_property->set_scale_floating( ).

  ENDMETHOD.


  METHOD def_reject_document.

    DATA:
      lo_function        TYPE REF TO /iwbep/if_v4_pm_function,
      lo_function_import TYPE REF TO /iwbep/if_v4_pm_func_imp,
      lo_parameter       TYPE REF TO /iwbep/if_v4_pm_func_param,
      lo_return          TYPE REF TO /iwbep/if_v4_pm_func_return.


    lo_function = mo_model->create_function( 'REJECT_DOCUMENT' ).
    lo_function->set_edm_name( 'RejectDocument' ) ##NO_TEXT.

    lo_function_import = lo_function->create_function_import( 'REJECT_DOCUMENT' ).
    lo_function_import->set_edm_name( 'RejectDocument' ) ##NO_TEXT.


    lo_parameter = lo_function->create_parameter( 'PURCHASE_CONTRACT' ).
    lo_parameter->set_edm_name( 'PurchaseContract' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'PURCHASE_CONTRACT_2' ).
    lo_parameter->set_is_nullable( ).

    lo_return = lo_function->create_return( ).
    lo_return->set_complex_type( 'MESSAGES' ).
    lo_return->set_is_collection( ).

  ENDMETHOD.


  METHOD def_withdraw_from_approval.

    DATA:
      lo_function        TYPE REF TO /iwbep/if_v4_pm_function,
      lo_function_import TYPE REF TO /iwbep/if_v4_pm_func_imp,
      lo_parameter       TYPE REF TO /iwbep/if_v4_pm_func_param,
      lo_return          TYPE REF TO /iwbep/if_v4_pm_func_return.


    lo_function = mo_model->create_function( 'WITHDRAW_FROM_APPROVAL' ).
    lo_function->set_edm_name( 'WithdrawFromApproval' ) ##NO_TEXT.

    lo_function_import = lo_function->create_function_import( 'WITHDRAW_FROM_APPROVAL' ).
    lo_function_import->set_edm_name( 'WithdrawFromApproval' ) ##NO_TEXT.


    lo_parameter = lo_function->create_parameter( 'PURCHASE_CONTRACT' ).
    lo_parameter->set_edm_name( 'PurchaseContract' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'PURCHASE_CONTRACT_3' ).
    lo_parameter->set_is_nullable( ).

    lo_return = lo_function->create_return( ).
    lo_return->set_complex_type( 'MESSAGES' ).
    lo_return->set_is_collection( ).

  ENDMETHOD.
ENDCLASS.

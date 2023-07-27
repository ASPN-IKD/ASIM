@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입 구매오더 헤더/아이템 인터페이스 뷰'
define view entity YI_ASIM0011N
  as select from    I_PurchaseOrderItemAPI01      as _item
    join            I_PurchaseOrderAPI01          as _header     on _item.PurchaseOrder = _header.PurchaseOrder
  //    join            YI_ASIM0001N                  as _payment    on  _header.PaymentTerms =    _payment.Zcdno
  //                                                                 and _payment.Zvalu1      =    'X'
  //                                                                 and _payment.Zcode       like '%ZTERM'
    left outer join YI_ASIM0010N_CREATED_PO_FINAL as _created_po on  _item.PurchaseOrder     = _created_po.Ebeln
                                                                 and _item.PurchaseOrderItem = _created_po.Ebelp
  association [1..1] to I_SupplierPurchasingOrg        as _supplier                    on  _header.Supplier               = _supplier.Supplier
                                                                                       and _header.PurchasingOrganization = _supplier.PurchasingOrganization
  association [0..1] to I_PurOrdAccountAssignmentAPI01 as _acc                         on  _item.PurchaseOrder          = _acc.PurchaseOrder
                                                                                       and _item.PurchaseOrderItem      = _acc.PurchaseOrderItem
                                                                                       and _acc.AccountAssignmentNumber = '01'
  association [1..1] to I_PurOrdScheduleLineAPI01      as _sch                         on  _item.PurchaseOrder            = _sch.PurchaseOrder
                                                                                       and _item.PurchaseOrderItem        = _sch.PurchaseOrderItem
                                                                                       and _sch.PurchaseOrderScheduleLine = '0001'
  association [0..1] to I_PurOrdItmPricingElementAPI01 as _Zdc1                        on  $projection.Ebeln   = _Zdc1.PurchaseOrder
                                                                                       and $projection.Ebelp   = _Zdc1.PurchaseOrderItem
                                                                                       and _Zdc1.ConditionType = 'DRN1' //'ZDC1'
  //  association [0..1] to I_PurOrdItmPricingElementAPI01 as _Zdc2                        on  $projection.Ebeln   = _Zdc2.PurchaseOrder
  //                                                                                       and $projection.Ebelp   = _Zdc2.PurchaseOrderItem
  //                                                                                       and _Zdc2.ConditionType = 'ZDC2'
  association [1..1] to I_CompanyCode                  as _CompanyCode                 on  $projection.Bukrs = _CompanyCode.CompanyCode
  association [1..1] to I_PurchasingOrganization       as _PurchasingOrganization      on  $projection.Ekorg = _PurchasingOrganization.PurchasingOrganization
  association [1..1] to I_PurchasingGroup              as _PurchasingGroup             on  $projection.Ekgrp = _PurchasingGroup.PurchasingGroup
  association [1..1] to I_BusinessPartner              as _BusinessPartner             on  $projection.Lifnr = _BusinessPartner.BusinessPartner
  association [1..1] to I_IncotermsClassificationText  as _IncotermsClassificationText on  $projection.Inco1                     = _IncotermsClassificationText.IncotermsClassification
                                                                                       and _IncotermsClassificationText.Language = '3'
  association [1..1] to I_ProductText                  as _productText                 on  $projection.Matnr     = _productText.Product
                                                                                       and _productText.Language = '3'
  association [1..1] to I_Plant                        as _plant                       on  $projection.Werks = _plant.Plant
  association [0..1] to I_StorageLocation              as _storageLocation             on  $projection.Werks = _storageLocation.Plant
                                                                                       and $projection.Lgort = _storageLocation.StorageLocation


{
      @EndUserText.label: '구매문서번호'
  key _item.PurchaseOrder                                      as Ebeln,

      @EndUserText.label: '구매문서품목번호'
  key _item.PurchaseOrderItem                                  as Ebelp,

      @EndUserText.label: '구매문서유형'
      _header.PurchaseOrderType                                as Bsart,

      @EndUserText.label: '생성일'
      _header.CreationDate                                     as Aedat,
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_BUKRS', element: 'Bukrs'} }]
      @ObjectModel.text.element: ['Bukrst']
      @EndUserText.label: '회사코드'
      _header.CompanyCode                                      as Bukrs,

      @EndUserText.label: '회사코드명'
      _CompanyCode.CompanyCodeName                             as Bukrst,

      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_EKORG', element: 'Ekorg'} }]
      @ObjectModel.text.element: ['Ekorgt']
      @EndUserText.label: '구매조직'
      _header.PurchasingOrganization                           as Ekorg,

      @EndUserText.label: '구매조직명'
      _PurchasingOrganization.PurchasingOrganizationName       as Ekorgt,

      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_EKGRP', element: 'Ekgrp'} }]
      @ObjectModel.text.element: ['Ekgrpt']
      @EndUserText.label: '구매그룹'
      _header.PurchasingGroup                                  as Ekgrp,

      @EndUserText.label: '구매그룹명'
      _PurchasingGroup.PurchasingGroupName                     as Ekgrpt,

      @ObjectModel.text.element: ['Lifnrt']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_LIFNR', element: 'Lifnr' }}
      ]
      @EndUserText.label: '공급업체'
      _header.Supplier                                         as Lifnr,

      @EndUserText.label: '공급업체명'
      _BusinessPartner.BusinessPartnerName                     as Lifnrt,

      @ObjectModel.text.element: ['Inco1t']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_INCO1', element: 'inco1' }}
      ]
      @EndUserText.label: '인도조건'
      _header.IncotermsClassification                          as Inco1,

      @EndUserText.label: '인도조건명'
      _IncotermsClassificationText.IncotermsClassificationName as Inco1t,

      @EndUserText.label: '인도처'
      _header.IncotermsLocation1                               as Inco2,

      //      @ObjectModel.text.element: ['Ztermt']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_ZTERM', element: 'Cdno' }}
      ]
      @EndUserText.label: '지급조건'
      _header.PaymentTerms                                     as Zterm,

      //      @EndUserText.label: '지급조건명'
      //      _payment.Ztext                                                                                         as Ztermt,

      @EndUserText.label: '계정지정범주'
      _item.AccountAssignmentCategory                          as Knttp,

      @EndUserText.label: '자재번호'
      _item.Material                                           as Matnr,

      @EndUserText.label: '자재명'
      _productText.ProductName                                 as Maktx,

      @EndUserText.label: '플랜트'
      _item.Plant                                              as Werks,

      @EndUserText.label: '플랜트명'
      _plant.PlantName                                         as Werkst,

      @EndUserText.label: '저장위치'
      _item.StorageLocation                                    as Lgort,

      @EndUserText.label: '저장위치명'
      _storageLocation.StorageLocationName                     as Lgortt,

      @Semantics.quantity.unitOfMeasure: 'Meins'
      @EndUserText.label: '오더수량'
      _item.OrderQuantity                                      as Menge,

      @EndUserText.label: '오더단위'
      _item.PurchaseOrderQuantityUnit                          as Meins,

      @Semantics.amount.currencyCode : 'Waers'
      @EndUserText.label: '오더단가'
      _item.NetPriceAmount                                     as Netpr,

      @Semantics.amount.currencyCode : 'Waers'
      @EndUserText.label: '오더금액'
      _item.NetAmount                                          as Netwr,

      @EndUserText.label: '가격단위'
      _item.NetPriceQuantity                                   as Peinh,

      @EndUserText.label: '통화키'
      _header.DocumentCurrency                                 as Waers,

      @EndUserText.label: 'G/L계정'
      _acc.GLAccount                                           as Sakto,

      @EndUserText.label: '자산번호'
      _acc.MasterFixedAsset                                    as Anln1,

      @EndUserText.label: '코스트센터'
      _acc.CostCenter                                          as Kostl,

      @EndUserText.label: '관세율'
      _Zdc1.ConditionRateValue                                 as Zdc1_p,

      //      @EndUserText.label: '부대비율'
      //      _Zdc2.ConditionRateValue                                                                               as Zdc2_p,

      @EndUserText.label: '납품일'
      _sch.ScheduleLineDeliveryDate                            as Eindt,

      @Semantics.amount.currencyCode : 'Waers'
      @EndUserText.label: '관세액'
      _Zdc1.ConditionAmount                                    as Zdc1_n,

      //@Semantics.amount.currencyCode : 'Waers'
      //@EndUserText.label: '부대비액'
      //_Zdc2.ConditionAmount                                    as Zdc2_n,

      /*수입PO 기생성여부 확인 chk = 'X'이면 생성완료 수입계약PO참조 생성 시 제외처리 */
      _created_po.chk                                          as chk,

      /*수입po 기생성여부 확인 chk = ''이면 잔량으로 확인함 */
      @Semantics.quantity.unitOfMeasure: 'Reqms'
      @EndUserText.label: '오더잔량'
      cast(_created_po.Modmg as abap.quan(13,3))               as Modmg,
      _created_po.Reqms                                        as Reqms
}

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입계약 아이템 인터페이스 뷰'
define view entity YI_ASIM0021N
  as select from    zasimt0020n

  association        to parent YI_ASIM0010N            as _Head                    on  _Head.Uuid = $projection.ParentUUID
  association [1..1] to I_ProductText                  as _productText             on  $projection.Matnr     = _productText.Product
                                                                                   and _productText.Language = '3'
  association [1..1] to I_Plant                        as _plant                   on  $projection.Werks = _plant.Plant
  association [0..1] to I_StorageLocation              as _storageLocation         on  $projection.Werks = _storageLocation.Plant
                                                                                   and $projection.Lgort = _storageLocation.StorageLocation
  association [1..1] to I_CurrencyStdVH                as _Currency                on  $projection.Waers = _Currency.Currency
  association [0..1] to I_PurchaseOrderItemAPI01       as _PurchaseOrderItem       on  $projection.Ebeln = _PurchaseOrderItem.PurchaseOrder
                                                                                   and $projection.Ebelp = _PurchaseOrderItem.PurchaseOrderItem
  association [0..1] to I_PurOrdAccountAssignmentAPI01 as _PurOrdAccountAssignment on  $projection.Ebeln                                = _PurOrdAccountAssignment.PurchaseOrder
                                                                                   and $projection.Ebelp                                = _PurOrdAccountAssignment.PurchaseOrderItem
                                                                                   and _PurOrdAccountAssignment.AccountAssignmentNumber = '01'
  association [0..1] to I_PurOrdItmPricingElementAPI01 as _Zdc1                    on  $projection.Ebeln   = _Zdc1.PurchaseOrder
                                                                                   and $projection.Ebelp   = _Zdc1.PurchaseOrderItem
                                                                                   and _Zdc1.ConditionType = 'ZDC1'
  association [0..1] to I_PurOrdItmPricingElementAPI01 as _Zdc2                    on  $projection.Ebeln   = _Zdc2.PurchaseOrder
                                                                                   and $projection.Ebelp   = _Zdc2.PurchaseOrderItem
                                                                                   and _Zdc2.ConditionType = 'ZDC2'
{

  key      zasimt0020n.uuid                             as Uuid,

           zasimt0020n.parentuuid                       as ParentUUID,

           @EndUserText.label: '계약연도'
           zasimt0020n.reqyr                            as Reqyr,
           @EndUserText.label: '계약내부번호'

           zasimt0020n.reqno                            as Reqno,
           @EndUserText.label: '계약품목'
           zasimt0020n.itmno                            as Itmno,
           @EndUserText.label: '삭제지시자'
           zasimt0020n.loekz                            as Loekz,
           @EndUserText.label: '구매문서번호'
           zasimt0020n.ebeln                            as Ebeln,
           @EndUserText.label: '구매문서품목번호'
           zasimt0020n.ebelp                            as Ebelp,
           @EndUserText.label: '플랜트'
           @Consumption.valueHelpDefinition: [{ entity : { element: 'Werks', name: 'ZASIMV_WERKS' } }]
           zasimt0020n.werks                            as Werks,
           @EndUserText.label: '플랜트명'
           _plant.PlantName                             as Werkst,
           @EndUserText.label: '자재번호'
           @Consumption.valueHelpDefinition: [{ entity : { element: 'Matnr', name: 'ZASIMV_MATNR' } }]
           zasimt0020n.matnr                            as Matnr,
           @EndUserText.label: '자재명'
           _productText.ProductName                     as Maktx,
           @EndUserText.label: '저장위치'
           @Consumption.valueHelpDefinition: [{ entity : { element: 'Lgort', name: 'ZASIMV_LGORT' } }]
           zasimt0020n.lgort                            as Lgort,
           @EndUserText.label: '저장위치명'
           _storageLocation.StorageLocationName         as Lgortt,
           @EndUserText.label: '계약수량'
           @Semantics.quantity.unitOfMeasure: 'Reqms'
           zasimt0020n.reqmg                            as Reqmg,
           @EndUserText.label: '계약단위'
           zasimt0020n.reqms                            as Reqms,
           @EndUserText.label: '계약단가'
           @Semantics.amount.currencyCode: 'Waers'
           zasimt0020n.reqnr                            as Reqnr,
           @EndUserText.label: '계약금액'
           @Semantics.amount.currencyCode: 'Waers'
           zasimt0020n.reqwr                            as Reqwr,
           @EndUserText.label: '통화 단위'
           @Consumption.valueHelpDefinition: [{ entity : { element: 'Waers', name: 'ZASIMV_WAERS' } } ]
           zasimt0020n.waers                            as Waers,
           @EndUserText.label: '가격단위'
           zasimt0020n.peinh                            as Peinh,
           @EndUserText.label: '대체단위수량'
           @Semantics.quantity.unitOfMeasure: 'Reqms1'
           zasimt0020n.reqmg1                           as Reqmg1,
           @EndUserText.label: '대체단위'
           zasimt0020n.reqms1                           as Reqms1,
           @EndUserText.label: '판매관리문서번호'
           zasimt0020n.vbeln                            as Vbeln,
           @EndUserText.label: '임시오더번호'
           zasimt0020n.zebeln                           as Zebeln,
           @EndUserText.label: '임시오더품목'
           zasimt0020n.zebelp                           as Zebelp,
           @EndUserText.label: 'Remark'
           zasimt0020n.remak                            as Remak,

           @EndUserText.label: '계정지정범주'
           _PurchaseOrderItem.AccountAssignmentCategory as Knttp,

           @EndUserText.label: 'G/L계정'
           _PurOrdAccountAssignment.GLAccount           as Sakto,

           @EndUserText.label: '자산번호'
           _PurOrdAccountAssignment.MasterFixedAsset    as Anln1,

           @EndUserText.label: '코스트센터'
           _PurOrdAccountAssignment.CostCenter          as Kostl,

           @EndUserText.label: '관세율'
           _Zdc1.ConditionRateValue                     as Zdc1_p,

           @EndUserText.label: '부대비율'
           _Zdc2.ConditionRateValue                     as Zdc2_p,

//           zasimt0020n.crtnm                            as Crtnm,
//           zasimt0020n.crtbu                            as Crtbu,
//           zasimt0020n.crtdt                            as Crtdt,
//           zasimt0020n.crttm                            as Crttm,
//           zasimt0020n.chgnm                            as Chgnm,
//           zasimt0020n.chgbu                            as Chgbu,
      //     zasimt0020n.chgdt                            as Chgdt,
//           zasimt0020n.chgtm                            as Chgtm,
//           @Semantics.systemDateTime.localInstanceLastChangedAt: true
//           zasimt0020n.local_last_changed_at            as LocalLastChangedAt,
//           @Semantics.systemDateTime.lastChangedAt: true
//           zasimt0020n.last_changed_at                  as LastChangedAt,

         
           cast(zasimt0020n.reqnr as abap.dec(20,2))    as Modpr,
           /* association */
           _Head,
           _Currency
}


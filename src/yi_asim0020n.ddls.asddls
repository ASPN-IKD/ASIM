@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입계약 아이템 인터페이스 뷰'
define view entity YI_ASIM0020N
  as select from zasimt0020n
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

  key      uuid                                         as Uuid,

  key      parentuuid                                   as ParentUUID,

           @EndUserText.label: '계약연도'
           reqyr                                        as Reqyr,
           @EndUserText.label: '계약내부번호'

           reqno                                        as Reqno,
           @EndUserText.label: '계약품목'
           itmno                                        as Itmno,
           @EndUserText.label: '삭제지시자'
           loekz                                        as Loekz,
           @EndUserText.label: '구매문서번호'
           ebeln                                        as Ebeln,
           @EndUserText.label: '구매문서품목번호'
           ebelp                                        as Ebelp,
           @EndUserText.label: '플랜트'
           werks                                        as Werks,
           @EndUserText.label: '플랜트명'
           _plant.PlantName                             as Werkst,
           @EndUserText.label: '자재번호'
           matnr                                        as Matnr,
           @EndUserText.label: '자재명'
           _productText.ProductName                     as Maktx,
           @EndUserText.label: '저장위치'
           lgort                                        as Lgort,
           @EndUserText.label: '저장위치명'
           _storageLocation.StorageLocationName         as Lgortt,
           @EndUserText.label: '계약수량'
           @Semantics.quantity.unitOfMeasure: 'Reqms'
           reqmg                                        as Reqmg,
           @EndUserText.label: '계약단위'
           reqms                                        as Reqms,
           @EndUserText.label: '계약단가'
           @Semantics.amount.currencyCode: 'Waers'
           reqnr                                        as Reqnr,
           @EndUserText.label: '계약금액'
           @Semantics.amount.currencyCode: 'Waers'
           reqwr                                        as Reqwr,
           @EndUserText.label: '통화 단위'
           @Consumption.valueHelpDefinition: [{ entity : { element: 'Currency', name: 'I_CurrencyStdVH' } } ]
           waers                                        as Waers,
           @EndUserText.label: '가격단위'
           peinh                                        as Peinh,
           @EndUserText.label: '대체단위수량'
           @Semantics.quantity.unitOfMeasure: 'Reqms1'
           reqmg1                                       as Reqmg1,
           @EndUserText.label: '대체단위'
           reqms1                                       as Reqms1,
           @EndUserText.label: '판매관리문서번호'
           vbeln                                        as Vbeln,
           @EndUserText.label: '임시오더번호'
           zebeln                                       as Zebeln,
           @EndUserText.label: '임시오더품목'
           zebelp                                       as Zebelp,
           @EndUserText.label: 'Remark'
           remak                                        as Remak,

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

           crtnm                                        as Crtnm,
           crtbu                                        as Crtbu,
           crtdt                                        as Crtdt,
           crttm                                        as Crttm,
           chgnm                                        as Chgnm,
           chgbu                                        as Chgbu,
           chgdt                                        as Chgdt,
           chgtm                                        as Chgtm,
           @Semantics.systemDateTime.localInstanceLastChangedAt: true
           local_last_changed_at                        as LocalLastChangedAt,
           @Semantics.systemDateTime.lastChangedAt: true
           last_changed_at                              as LastChangedAt,

           /* association */
           _Head,
           _Currency
}

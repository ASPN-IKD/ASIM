@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입계약 아이템 인터페이스 뷰'
define view entity YI_ASIM0040N
  as select from    zasimt0040n
    left outer join YI_ASIM0050N_CREATED_FINAL as _created_iv  on  zasimt0040n.blino = _created_iv.Blino
                                                               and zasimt0040n.bliyr = _created_iv.Bliyr
                                                               and zasimt0040n.blinp = _created_iv.Blinp
                                                               and _created_iv.Ivgb  = 'B'
    left outer join YI_ASIM0190N_CREATED_FINAL as _created_ecc on  zasimt0040n.blino = _created_ecc.Blino
                                                               and zasimt0040n.bliyr = _created_ecc.Bliyr
                                                               and zasimt0040n.blinp = _created_ecc.Blinp
    left outer join YI_ASIM0070N_CREATED_FINAL as _created_cc  on  zasimt0040n.blino = _created_cc.Blino
                                                               and zasimt0040n.bliyr = _created_cc.Bliyr
                                                               and zasimt0040n.blinp = _created_cc.Blinp
                                                               and _created_cc.Eccgb  = ''                                                           
  association        to parent YI_ASIM0030N            as _Head                    on  _Head.Uuid = $projection.ParentUUID
  association [1..1] to I_ProductText                  as _productText             on  $projection.Matnr     = _productText.Product
                                                                                   and _productText.Language = '3'
  association [1..1] to I_Plant                        as _plant                   on  $projection.Werks = _plant.Plant
  association [0..1] to I_StorageLocation              as _storageLocation         on  $projection.Werks = _storageLocation.Plant
                                                                                   and $projection.Lgort = _storageLocation.StorageLocation
  association [1..1] to I_CurrencyStdVH                as _Currency                on  $projection.Waers = _Currency.Currency
  association [1..1] to I_PurchaseOrderItemAPI01       as _PurchaseOrderItem       on  $projection.Ebeln = _PurchaseOrderItem.PurchaseOrder
                                                                                   and $projection.Ebelp = _PurchaseOrderItem.PurchaseOrderItem
  association [0..1] to I_PurOrdAccountAssignmentAPI01 as _PurOrdAccountAssignment on  $projection.Ebeln                                = _PurOrdAccountAssignment.PurchaseOrder
                                                                                   and $projection.Ebelp                                = _PurOrdAccountAssignment.PurchaseOrderItem
                                                                                   and _PurOrdAccountAssignment.AccountAssignmentNumber = '01'
{

  key      zasimt0040n.uuid                             as Uuid,

  key      zasimt0040n.parentuuid                       as ParentUUID,
           @EndUserText.label: 'B/L연도'
           zasimt0040n.bliyr                            as Bliyr,
           @EndUserText.label: 'B/L내부번호'
           zasimt0040n.blino                            as Blino,
           @EndUserText.label: 'B/L품목'
           zasimt0040n.blinp                            as Blinp,
           @EndUserText.label: '계약연도'
           zasimt0040n.reqyr                            as Reqyr,
           @EndUserText.label: '계약내부번호'

           zasimt0040n.reqno                            as Reqno,
           @EndUserText.label: '계약품목'
           zasimt0040n.itmno                            as Itmno,
           @EndUserText.label: '삭제지시자'
           zasimt0040n.loekz                            as Loekz,
           @EndUserText.label: '구매문서번호'
           zasimt0040n.ebeln                            as Ebeln,
           @EndUserText.label: '구매문서품목번호'
           zasimt0040n.ebelp                            as Ebelp,
           @EndUserText.label: '플랜트'
           zasimt0040n.werks                            as Werks,
           @EndUserText.label: '플랜트명'
           _plant.PlantName                             as Werkst,
           @EndUserText.label: '자재번호'
           zasimt0040n.matnr                            as Matnr,
           @EndUserText.label: '자재명'
           _productText.ProductName                     as Maktx,
           @EndUserText.label: '저장위치'
           zasimt0040n.lgort                            as Lgort,
           @EndUserText.label: '저장위치명'
           _storageLocation.StorageLocationName         as Lgortt,
           @EndUserText.label: 'B/L수량'
           @Semantics.quantity.unitOfMeasure: 'Blmns'
           zasimt0040n.blmng                            as Blmng,
           @EndUserText.label: 'B/L단위'
           zasimt0040n.blmns                            as Blmns,
           @EndUserText.label: 'B/L단가'
           @Semantics.amount.currencyCode: 'Waers'
           zasimt0040n.blmpr                            as Blmpr,
           @EndUserText.label: 'B/L금액'
           @Semantics.amount.currencyCode: 'Waers'
           zasimt0040n.blmwr                            as Blmwr,
           @EndUserText.label: '통화키'
           @Consumption.valueHelpDefinition: [{ entity : { element: 'Currency', name: 'I_CurrencyStdVH' } } ]
           zasimt0040n.waers                            as Waers,
           @EndUserText.label: '가격단위'
           zasimt0040n.blpnh                            as Blpnh,
           @EndUserText.label: 'B/L대체수량'
           @Semantics.quantity.unitOfMeasure: 'Blmns1'
           zasimt0040n.blmng1                           as Blmng1,
           @EndUserText.label: 'B/L대체단위'
           zasimt0040n.blmns1                           as Blmns1,

           @EndUserText.label: '납품일'
           zasimt0040n.eindt                            as Eindt,

           @EndUserText.label: '관세율'
           zasimt0040n.zdc1_p                           as Zdc1_p,

           @EndUserText.label: '관세액'
           @Semantics.amount.currencyCode: 'Waers'
           zasimt0040n.zdc1_n                           as Zdc1_n,

           @EndUserText.label: '부대비율'
           zasimt0040n.zdc2_p                           as Zdc2_p,

           @EndUserText.label: '부대비액'
           @Semantics.amount.currencyCode: 'Waers'
           zasimt0040n.zdc2_n                           as Zdc2_n,

           @EndUserText.label: '제조일'
           zasimt0040n.hsdat                            as Hsdat,

           @EndUserText.label: '계정지정범주'
           _PurchaseOrderItem.AccountAssignmentCategory as Knttp,

           @EndUserText.label: 'G/L계정'
           _PurOrdAccountAssignment.GLAccount           as Sakto,

           @EndUserText.label: '자산번호'
           _PurOrdAccountAssignment.MasterFixedAsset    as Anln1,

           @EndUserText.label: '코스트센터'
           _PurOrdAccountAssignment.CostCenter          as Kostl,

           @EndUserText.label: '구매요청번호'
           zasimt0040n.zebeln                           as Zebeln,
           @EndUserText.label: '구매요청품목'
           zasimt0040n.zebelp                           as Zebelp,
           zasimt0040n.crtnm                            as Crtnm,
           zasimt0040n.crtbu                            as Crtbu,
           zasimt0040n.crtdt                            as Crtdt,
           zasimt0040n.crttm                            as Crttm,
           zasimt0040n.chgnm                            as Chgnm,
           zasimt0040n.chgbu                            as Chgbu,
           zasimt0040n.chgdt                            as Chgdt,
           zasimt0040n.chgtm                            as Chgtm,
           @Semantics.systemDateTime.localInstanceLastChangedAt: true
           zasimt0040n.local_last_changed_at            as LocalLastChangedAt,
           @Semantics.systemDateTime.lastChangedAt: true
           zasimt0040n.last_changed_at                  as LastChangedAt,

           /*수입B/L 기생성여부 확인 chk = 'X'이면 생성완료 I/V생성 시 제외처리 */
           _created_iv.chk                              as Chk_iv,

           /*수입B/L 기생성여부 확인 chk = ''이면 잔량으로 확인함 */
           @Semantics.quantity.unitOfMeasure: 'Blmns'
           @EndUserText.label: '수입B/L잔량(I/V)'
           cast(_created_iv.Modmg as abap.quan(13,3))   as Modmg_iv,


           /*수입B/L 기생성여부 확인 chk = 'X'이면 생성완료 통관예정 생성 시 제외처리 */
           _created_ecc.chk                             as Chk_ecc,

           /*수입B/L 기생성여부 확인 chk = ''이면 잔량으로 확인함 */
           @Semantics.quantity.unitOfMeasure: 'Blmns'
           @EndUserText.label: '수입B/L잔량(통관예정)'
           cast(_created_ecc.Modmg as abap.quan(13,3))  as Modmg_ecc,

           /*수입B/L 기생성여부 확인 chk = 'X'이면 생성완료 통관 생성 시 제외처리 */
           _created_cc.chk                             as Chk_cc,

           /*수입B/L 기생성여부 확인 chk = ''이면 잔량으로 확인함 */
           @Semantics.quantity.unitOfMeasure: 'Blmns'
           @EndUserText.label: '수입B/L잔량(통관)'
           cast(_created_cc.Modmg as abap.quan(13,3))  as Modmg_cc,

           cast(zasimt0040n.blmpr as abap.dec(20,2))    as Modpr,
           /* association */
           _Head
}

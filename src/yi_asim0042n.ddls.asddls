@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입계약 - BL 아이템 참조 뷰'
define root view entity YI_ASIM0042N
  as select from    zasimt0020n

    left outer join YI_ASIM0030N_CREATED_FINAL as _created_req on  zasimt0020n.reqno = _created_req.Reqno
                                                               and zasimt0020n.reqyr = _created_req.Reqyr
                                                               and zasimt0020n.itmno = _created_req.Itmno

  association [1..1] to I_ProductText                  as _productText     on  $projection.Matnr     = _productText.Product
                                                                           and _productText.Language = '3'
  association [1..1] to I_Plant                        as _plant           on  $projection.Werks = _plant.Plant
  association [0..1] to I_StorageLocation              as _storageLocation on  $projection.Werks = _storageLocation.Plant
                                                                           and $projection.Lgort = _storageLocation.StorageLocation
  association [1..1] to I_CurrencyStdVH                as _Currency        on  $projection.Waers = _Currency.Currency
  association [0..1] to I_PurOrdItmPricingElementAPI01 as _Zdc1            on  $projection.Ebeln   = _Zdc1.PurchaseOrder
                                                                           and $projection.Ebelp   = _Zdc1.PurchaseOrderItem
                                                                           and _Zdc1.ConditionType = 'ZDC1'
  association [0..1] to I_PurOrdItmPricingElementAPI01 as _Zdc2            on  $projection.Ebeln   = _Zdc2.PurchaseOrder
                                                                           and $projection.Ebelp   = _Zdc2.PurchaseOrderItem
                                                                           and _Zdc2.ConditionType = 'ZDC2'

  association [1..1] to I_PurOrdScheduleLineAPI01      as _sch             on  $projection.Ebeln              = _sch.PurchaseOrder
                                                                           and $projection.Ebelp              = _sch.PurchaseOrderItem
                                                                           and _sch.PurchaseOrderScheduleLine = '0001'
{

  key      zasimt0020n.uuid                     as Uuid,
           zasimt0020n.parentuuid               as ParentUUID,
           cast('' as abap.numc(4))             as bliyr,
           cast('' as abap.char(10))            as blino,
           cast('' as abap.numc(4))             as blinp,
           @EndUserText.label: '계약연도'
           zasimt0020n.reqyr                    as Reqyr,
           @EndUserText.label: '계약내부번호'
           zasimt0020n.reqno                    as Reqno,
           @EndUserText.label: '계약품목'
           zasimt0020n.itmno                    as Itmno,
           @EndUserText.label: '삭제지시자'
           zasimt0020n.loekz                    as Loekz,
           @EndUserText.label: '구매문서번호'
           zasimt0020n.ebeln                    as Ebeln,
           @EndUserText.label: '구매문서품목번호'
           zasimt0020n.ebelp                    as Ebelp,
           @EndUserText.label: '플랜트'
           @Consumption.valueHelpDefinition: [{ entity : { element: 'Werks', name: 'ZASIMV_WERKS' } }]
           zasimt0020n.werks                    as Werks,
           @EndUserText.label: '플랜트명'
           _plant.PlantName                     as Werkst,
           @EndUserText.label: '자재번호'
           @Consumption.valueHelpDefinition: [{ entity : { element: 'Matnr', name: 'ZASIMV_MATNR' },
                                                additionalBinding: [   {localElement: 'Blmng', element: 'Meins'},
                                                                       {localElement: 'Maktx', element: 'Maktx'}] }]
           zasimt0020n.matnr                    as Matnr,
           @EndUserText.label: '자재명'
           _productText.ProductName             as Maktx,
           @EndUserText.label: '저장위치'
           @Consumption.valueHelpDefinition: [{ entity : { element: 'Lgort', name: 'ZASIMV_LGORT' } }]
           zasimt0020n.lgort                    as Lgort,
           @EndUserText.label: '저장위치명'
           _storageLocation.StorageLocationName as Lgortt,

           @EndUserText.label: 'B/L수량'
           @Semantics.quantity.unitOfMeasure: 'Blmns'
           //[2023-11-02;분할 생성 수량인 Modmg가 존재하는 경우 해당 값으로 Item 수량 지정;김서현]
           cast(case when _created_req.Modmg > 0 then _created_req.Modmg
                else zasimt0020n.reqmg
                end as abap.quan(13,3))         as Blmng,

           //zasimt0020n.reqmg                            as Blmng,
           @EndUserText.label: 'B/L단위'
           zasimt0020n.reqms                    as Blmns,
           @EndUserText.label: 'B/L단가'
           @Semantics.amount.currencyCode: 'Waers'
           zasimt0020n.reqnr                    as Blmpr,
           @EndUserText.label: 'B/L금액'
           @Semantics.amount.currencyCode: 'Waers'
           //[2023-11-02;분할 생성 수량인 Modmg가 존재하는 경우 해당 값으로 Item 수량*단가 지정;김서현]
           cast(case when _created_req.Modmg > 0
                then cast( _created_req.Modmg as abap.fltp) * cast( zasimt0020n.reqnr as abap.fltp)
                else cast( zasimt0020n.reqwr as abap.fltp)
                end as abap.curr(17,2))         as Blmwr,
           @EndUserText.label: '통화 단위'
           @Consumption.valueHelpDefinition: [{ entity : { element: 'Waers', name: 'ZASIMV_WAERS' } } ]
           zasimt0020n.waers                    as Waers,
           @EndUserText.label: '가격단위'
           zasimt0020n.peinh                    as Blpnh,
           @EndUserText.label: '대체단위수량'
           @Semantics.quantity.unitOfMeasure: 'Blmns1'
           zasimt0020n.reqmg1                   as Blmng1,
           @EndUserText.label: '대체단위'
           zasimt0020n.reqms1                   as Blmns1,
           @EndUserText.label: '납품일'
           _sch.ScheduleLineDeliveryDate        as Eindt,
           @EndUserText.label: '관세율'
           _Zdc1.ConditionRateValue             as Zdc1_p,
           @EndUserText.label: '관세액'
           @Semantics.amount.currencyCode: 'Waers'
           cast(case when  _created_req.Modmg > 0
                then ((cast( _created_req.Modmg as abap.fltp) * cast( zasimt0020n.reqnr as abap.fltp)) * cast(_Zdc1.ConditionRateValue as abap.fltp)) * 0.01
                else (cast( zasimt0020n.reqwr as abap.fltp) *  cast(_Zdc1.ConditionRateValue as abap.fltp))  * 0.01
                end as abap.curr(16,2))         as Zdc1_n,

           //           cast(0 as abap.curr(16,2))           as Zdc1_n,
           @EndUserText.label: '부대비율'
           _Zdc2.ConditionRateValue             as Zdc2_p,
           @EndUserText.label: '부대비액'
           @Semantics.amount.currencyCode: 'Waers'
           cast(case when  _created_req.Modmg > 0
               then ((cast( _created_req.Modmg as abap.fltp) * cast( zasimt0020n.reqnr as abap.fltp)) * cast(_Zdc2.ConditionRateValue as abap.fltp)) * 0.01
               else (cast( zasimt0020n.reqwr as abap.fltp) *  cast(_Zdc2.ConditionRateValue as abap.fltp))  * 0.01
               end as abap.curr(16,2))          as Zdc2_n,
           //           cast(0 as abap.curr(16,2))           as Zdc2_n,
           @EndUserText.label: '제조일'
           cast('' as abap.dats)                as Hsdat,
           @EndUserText.label: '구매계약번호'
           zasimt0020n.zebeln                   as Zebeln,
           @EndUserText.label: '구매계약품목'
           zasimt0020n.zebelp                   as Zebelp,

           _Currency
}

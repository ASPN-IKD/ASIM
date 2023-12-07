@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입계약 - IV 아이템 참조 뷰'
define root view entity YI_ASIM0062N as select from zasimt0020n

  association [1..1] to I_ProductText                  as _productText             on  $projection.Matnr     = _productText.Product
                                                                                   and _productText.Language = '3'
  association [1..1] to I_Plant                        as _plant                   on  $projection.Werks = _plant.Plant
  association [1..1] to I_CurrencyStdVH                as _Currency                on  $projection.Waers = _Currency.Currency
{

  key      zasimt0020n.uuid                             as Uuid,
           zasimt0020n.parentuuid                       as ParentUUID,
           cast('' as re_belnr)                         as belnr,
           cast('' as gjahr)                            as gjahr,
           cast('' as abap.numc(6))                     as buzei,
           @EndUserText.label: '계약연도'
           zasimt0020n.reqyr                            as Reqyr,
           @EndUserText.label: '계약내부번호'
           zasimt0020n.reqno                            as Reqno,
           @EndUserText.label: '계약품목'
           zasimt0020n.itmno                            as Itmno,
           cast('' as abap.numc(4))                     as bliyr,
           cast('' as abap.char(10))                    as blino,
           cast('' as abap.numc(4))                     as blinp,
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
           @Consumption.valueHelpDefinition: [{ entity : { element: 'Matnr', name: 'ZASIMV_MATNR' }, 
                                                additionalBinding: [   {localElement: 'Ivmng', element: 'Meins'},
                                                                       {localElement: 'Maktx', element: 'Maktx'}] }]
           zasimt0020n.matnr                            as Matnr,
           @EndUserText.label: '자재명'
           _productText.ProductName                     as Maktx,
           @EndUserText.label: 'I/V수량'
           @Semantics.quantity.unitOfMeasure: 'Meins'
           cast(zasimt0020n.reqmg as menge_d)                           as Ivmng, 
           @EndUserText.label: '계약단가'
           @Semantics.amount.currencyCode: 'Waers'
           zasimt0020n.reqnr                                            as UnitPrice,
           @EndUserText.label: '기본단위'
           cast(zasimt0020n.reqms as meins)                            as Meins,
           @EndUserText.label: 'I/V대체수량'
           @Semantics.quantity.unitOfMeasure: 'Meins1'
           cast(zasimt0020n.reqmg1 as menge_d)                           as Ivmng1, 
           @EndUserText.label: '대체단위'
           cast(zasimt0020n.reqms1 as meins)                            as Meins1,
           @EndUserText.label: 'I/V금액'
           @Semantics.amount.currencyCode: 'Waers'
           cast(zasimt0020n.reqwr as abap.curr(17,2))                    as Ivwra,
           @EndUserText.label: '세액'
           @Semantics.amount.currencyCode: 'Waers'
           cast(0 as abap.curr(15,2))                   as Ivwmw,
           @EndUserText.label: '통화 단위'
           @Consumption.valueHelpDefinition: [{ entity : { element: 'Waers', name: 'ZASIMV_WAERS' } } ]
           zasimt0020n.waers                            as Waers,
           
           _Currency
}

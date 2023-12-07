@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입I/V 생성가능 정보 인터페이스 뷰(수입B/L)'
define root view entity YI_ASIM0063N
  as select from YI_ASIM0040N as _Asim0040n

  association [1..1] to YI_ASIM0030N as _Asim0030n    on  _Asim0030n.Uuid    = _Asim0040n.ParentUUID
  association [1..1] to I_CurrencyStdVH as _Currency  on  _Asim0040n.Waers = _Currency.Currency
                                                   
{
  key _Asim0040n.Uuid                                                                         as Uuid,
      _Asim0030n.Uuid                                                                         as ParentUUID,
      
      cast('' as re_belnr)                         as belnr,
      cast('' as gjahr)                            as gjahr,
      cast('' as abap.numc(6))                     as buzei,
      @EndUserText.label: '계약연도'
      _Asim0040n.Reqyr as  Reqyr,
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_REQNO', element: 'Reqno' }}]
      @EndUserText.label: '계약내부번호'
      _Asim0040n.Reqno as  Reqno,
      @EndUserText.label: '계약품목'
      _Asim0040n.Itmno as  Itmno,
      @EndUserText.label: 'B/L연도'
      _Asim0040n.Bliyr as  Bliyr,
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_BLINO', element: 'Blino' }}]
      @EndUserText.label: 'B/L내부번호'
      _Asim0040n.Blino                                                                        as Blino,
      @EndUserText.label: 'B/L품목번호'
      _Asim0040n.Blinp                                                                        as Blinp,
      @EndUserText.label: '삭제지시자'
      _Asim0040n.Loekz as  Loekz,
      @EndUserText.label: '구매문서번호'
      _Asim0040n.Ebeln as  Ebeln,
      @EndUserText.label: '구매문서품목번호'
      _Asim0040n.Ebelp as  Ebelp,
      @ObjectModel.text.element: ['Werkst']
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_WERKS', element: 'Werks' }}]
      @EndUserText.label: '플랜트'
      _Asim0040n.Werks                                                                        as Werks,

      @EndUserText.label: '플랜트명'
      _Asim0040n.Werkst                                                                       as Werkst,
      @ObjectModel.text.element: ['Maktx']
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_MATNR', element: 'Matnr' }}]
      @EndUserText.label: '자재번호'
      _Asim0040n.Matnr                                                                        as Matnr,

      @EndUserText.label: '자재명'
      _Asim0040n.Maktx                                                                        as Maktx,

      @EndUserText.label: 'I/V수량'
      @Semantics.quantity.unitOfMeasure: 'Meins'
      case when _Asim0040n.Modmg_iv > 0 then _Asim0040n.Modmg_iv
      else _Asim0040n.Blmng end as Ivmng,
      @EndUserText.label: 'B/L단가'
      @Semantics.amount.currencyCode: 'Waers'
      _Asim0040n.Blmpr                            as UnitPrice,
      @EndUserText.label: '기본단위'
      _Asim0040n.Blmns                           as Meins,
      @EndUserText.label: 'I/V대체수량'
      @Semantics.quantity.unitOfMeasure: 'Meins1'
      _Asim0040n.Blmng1                           as Ivmng1, 
      @EndUserText.label: '대체단위'
      _Asim0040n.Blmns1                            as Meins1,
      @EndUserText.label: 'I/V금액'
      @Semantics.amount.currencyCode: 'Waers'
      cast( case when _Asim0040n.Modmg_iv > 0 then cast( _Asim0040n.Modmg_iv as abap.fltp) * cast( _Asim0040n.Blmpr as abap.fltp)
      else cast( _Asim0040n.Blmwr as abap.fltp) end as abap.curr(17,2)) as Ivwra,
      @EndUserText.label: '세액'
      @Semantics.amount.currencyCode: 'Waers'
      cast(0 as abap.curr(15,2))                   as Ivwmw,
      @EndUserText.label: '통화 단위'
      @Consumption.valueHelpDefinition: [{ entity : { element: 'Waers', name: 'ZASIMV_WAERS' } } ]
      _Asim0040n.Waers                            as Waers,
      
      _Currency
           
}

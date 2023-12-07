@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BL - CC 아이템 참조 뷰'
define root view entity YI_ASIM0083N as select from YI_ASIM0040N as _Asim0040n
  association [1..1] to YI_ASIM0030N as _Asim0030n    on  _Asim0030n.Uuid    = _Asim0040n.ParentUUID
  association [1..1] to I_CurrencyStdVH as _Currency  on  _Asim0040n.Waers = _Currency.Currency
{

  key _Asim0040n.Uuid                                                                         as Uuid,
      _Asim0030n.Uuid                                                                         as ParentUUID,
      
      @EndUserText.label: '통관번호'
      cast('' as abap.char(10))                         as Cclno,
      @EndUserText.label: '통관연도'
      cast('' as abap.numc(4))                            as Cclyr,
      @EndUserText.label: '통관품목'
      cast('' as abap.numc(4))                     as Cclnp,
      @EndUserText.label: '삭제지시자'
      _Asim0040n.Loekz as  Loekz,
      @EndUserText.label: '통관예정번호'
      cast('' as abap.char(10))                         as Eccno,
      @EndUserText.label: '통관예정년도'
      cast('' as abap.numc(4))                            as Eccyr,
      @EndUserText.label: '통관예정품목'
      cast('' as abap.numc(4))                     as Eccnp,
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_BLINO', element: 'Blino' }}]
      @EndUserText.label: 'B/L내부번호'
      _Asim0040n.Blino                                                                        as Blino,      
      @EndUserText.label: 'B/L연도'
      _Asim0040n.Bliyr as  Bliyr,
      @EndUserText.label: 'B/L품목번호'
      _Asim0040n.Blinp                                                                        as Blinp,
      @EndUserText.label: '구매문서번호'
      _Asim0040n.Ebeln as  Ebeln,
      @EndUserText.label: '구매문서품목번호'
      _Asim0040n.Ebelp as  Ebelp,
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_REQNO', element: 'Reqno' }}]
      @EndUserText.label: '계약내부번호'
      _Asim0040n.Reqno as  Reqno,
      @EndUserText.label: '계약연도'
      _Asim0040n.Reqyr as  Reqyr,
   //   @EndUserText.label: '계약일'
   //   _Asim0030n.Reqdt as  Reqdt,
      @EndUserText.label: '계약품목'
      _Asim0040n.Itmno as  Itmno,
      @ObjectModel.text.element: ['Maktx']
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_MATNR', element: 'Matnr' }}]
      @EndUserText.label: '자재번호'
      _Asim0040n.Matnr                                                                        as Matnr,
      @EndUserText.label: '자재명'
      _Asim0040n.Maktx                                                                        as Maktx,
      @ObjectModel.text.element: ['Werkst']
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_WERKS', element: 'Werks' }}]
      @EndUserText.label: '플랜트'
      _Asim0040n.Werks                                                                        as Werks,
      @EndUserText.label: '플랜트명'
      _Asim0040n.Werkst                                                                       as Werkst,
      @EndUserText.label: '저장위치'
      _Asim0040n.Lgort                                                                       as Lgort,
      @EndUserText.label: '저장위치명'
      _Asim0040n.Lgortt                                                                       as Lgortt,
      @EndUserText.label: '통관수량'
      @Semantics.quantity.unitOfMeasure: 'Cclmns'
      _Asim0040n.Blmng                           as Cclmng, 
      @EndUserText.label: '통관단위'
      _Asim0040n.Blmns                           as Cclmns,
      @EndUserText.label: '통관대체수량'
      @Semantics.quantity.unitOfMeasure: 'Cclmns1'
      _Asim0040n.Blmng1                           as Cclmng1, 
      @EndUserText.label: '통관대체단위'
      _Asim0040n.Blmns1                            as Cclmns1,
      @EndUserText.label: '통화 단위'
      @Consumption.valueHelpDefinition: [{ entity : { element: 'Waers', name: 'ZASIMV_WAERS' } } ]
      _Asim0040n.Waers                            as Waers,
      
      _Currency
           
}

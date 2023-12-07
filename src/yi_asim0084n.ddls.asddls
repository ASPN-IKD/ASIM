@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'EC - CC 아이템 참조 뷰'
define root view entity YI_ASIM0084N
  as select from YI_ASIM0200N as _Asim0200n

  association [1..1] to YI_ASIM0190N    as _Asim0190n on _Asim0190n.Uuid = _Asim0200n.ParentUUID
  association [1..1] to I_CurrencyStdVH as _Currency  on _Asim0200n.Waers = _Currency.Currency
{

  key _Asim0200n.Uuid           as Uuid,
      _Asim0190n.Uuid           as ParentUUID,

      @EndUserText.label: '통관번호'
      cast('' as abap.char(10)) as Cclno,
      @EndUserText.label: '통관연도'
      cast('' as abap.numc(4))  as Cclyr,
      @EndUserText.label: '통관품목'
      cast('' as abap.numc(4))  as Cclnp,
      @EndUserText.label: '삭제지시자'
      _Asim0200n.Loekz          as Loekz,
      @EndUserText.label: '통관예정번호'
      _Asim0200n.Eccno          as Eccno,
      @EndUserText.label: '통관예정년도'
      _Asim0200n.Eccyr          as Eccyr,
      @EndUserText.label: '통관예정품목'
      _Asim0200n.Eccnp          as Eccnp,
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_BLINO', element: 'Blino' }}]
      @EndUserText.label: 'B/L내부번호'
      _Asim0200n.Blino          as Blino,
      @EndUserText.label: 'B/L연도'
      _Asim0200n.Bliyr          as Bliyr,
      @EndUserText.label: 'B/L품목번호'
      _Asim0200n.Blinp          as Blinp,
      @EndUserText.label: '구매문서번호'
      _Asim0200n.Ebeln          as Ebeln,
      @EndUserText.label: '구매문서품목번호'
      _Asim0200n.Ebelp          as Ebelp,
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_REQNO', element: 'Reqno' }}]
      @EndUserText.label: '계약내부번호'
      _Asim0200n.Reqno          as Reqno,
      @EndUserText.label: '계약연도'
      _Asim0200n.Reqyr          as Reqyr,
      @EndUserText.label: '계약품목'
      _Asim0200n.Itmno          as Itmno,
      @ObjectModel.text.element: ['Maktx']
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_MATNR', element: 'Matnr' }}]
      @EndUserText.label: '자재번호'
      _Asim0200n.Matnr          as Matnr,
      @EndUserText.label: '자재명'
      _Asim0200n.Maktx          as Maktx,
      @ObjectModel.text.element: ['Werkst']
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_WERKS', element: 'Werks' }}]
      @EndUserText.label: '플랜트'
      _Asim0200n.Werks          as Werks,
      @EndUserText.label: '플랜트명'
      _Asim0200n.Werkst         as Werkst,
      @EndUserText.label: '저장위치'
      _Asim0200n.Lgort          as Lgort,
      @EndUserText.label: '저장위치명'
      _Asim0200n.Lgortt         as Lgortt,
      @EndUserText.label: '통관수량'
      @Semantics.quantity.unitOfMeasure: 'Cclmns'
      _Asim0200n.Eccmng         as Cclmng,
      @EndUserText.label: '통관단위'
      _Asim0200n.Eccmns         as Cclmns,
      @EndUserText.label: '통관대체수량'
      @Semantics.quantity.unitOfMeasure: 'Cclmns1'
      _Asim0200n.Eccmng1        as Cclmng1,
      @EndUserText.label: '통관대체단위'
      _Asim0200n.Eccmns1        as Cclmns1,
      @EndUserText.label: '통화 단위'
      @Consumption.valueHelpDefinition: [{ entity : { element: 'Waers', name: 'ZASIMV_WAERS' } } ]
      _Asim0200n.Waers          as Waers,
      @EndUserText.label: '검역일'
      _Asim0200n.Quadt          as Quadt,
      @Semantics.quantity.unitOfMeasure : 'Cclmns'
      @EndUserText.label: '불합격수량'
      _Asim0200n.Failmng        as Failmng,
      @Semantics.quantity.unitOfMeasure : 'Cclmns'
      @EndUserText.label: '샘플수량'
      _Asim0200n.Sampmng        as Sampmng,


      _Currency

}

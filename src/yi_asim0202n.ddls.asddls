@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BL - EC 아이템 참조 뷰'
define root view entity YI_ASIM0202N as select from YI_ASIM0040N as _Asim0040n

  association [1..1] to YI_ASIM0030N as _Asim0030n    on  _Asim0030n.Uuid    = _Asim0040n.ParentUUID
  association [1..1] to I_CurrencyStdVH as _Currency  on  _Asim0040n.Waers = _Currency.Currency
                                                   
{
  key _Asim0040n.Uuid                                                                         as Uuid,
      _Asim0030n.Uuid                                                                         as ParentUUID,
      
      @EndUserText.label: '통관예정번호'
      cast('' as abap.char(10))                    as Eccno,
      @EndUserText.label: '통관예정년도'
      cast('' as abap.numc(4))                     as Eccyr,
      @EndUserText.label: '통관예정품목'
      cast('' as abap.numc(4))                     as Eccnp,
      @EndUserText.label: '삭제지시자'
      cast('' as abap.char(1))                     as Loekz,
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
      cast('' as abap.char(4))                    as Lgort,                                                            
      @EndUserText.label: '통관예정수량'
      @Semantics.quantity.unitOfMeasure: 'eccmns'
      _Asim0040n.Blmng                           as Eccmng, 
      @EndUserText.label: '통관예정단위'
      _Asim0040n.Blmns                           as Eccmns,
      @EndUserText.label: '통관예정 대체수량'
      @Semantics.quantity.unitOfMeasure: 'eccmns1'
      _Asim0040n.Blmng1                           as Eccmng1, 
      @EndUserText.label: '통관예정 대체단위'
      _Asim0040n.Blmns1                            as Eccmns1,
      @EndUserText.label: '검역상태'
      cast('' as abap.char(10))                    as Quacd,
      @EndUserText.label: '검역결과'
      cast('' as abap.char(10))                    as Quars,
      @EndUserText.label: '검역상태명'
      cast('' as abap.char(10))                    as Quacdt,
      @EndUserText.label: '검역결과명'
      cast('' as abap.char(10))                    as Quarst,
      @EndUserText.label: '검역일'
      cast('' as abap.dats)                        as Quadt,
      @EndUserText.label: '불합격수량'
      @Semantics.quantity.unitOfMeasure : 'Eccmns'
      cast(0 as abap.quan(13,3))                    as Failmng,
      @EndUserText.label: '불합격 대체수량'
      @Semantics.quantity.unitOfMeasure : 'Eccmns1'
      cast(0 as abap.quan(13,3))                    as Failmng1,
      @EndUserText.label: '샘플수량'
      @Semantics.quantity.unitOfMeasure : 'Eccmns'
      cast(0 as abap.quan(13,3))                    as Sampmng,
      @EndUserText.label: '샘플 대체수량'
      @Semantics.quantity.unitOfMeasure : 'Eccmns1'
      cast(0 as abap.quan(13,3))                    as Sampmng1,
      @EndUserText.label: '비고'
      cast('' as abap.char(10))                    as Eccremak,
      @EndUserText.label: '통화 단위'
      @Consumption.valueHelpDefinition: [{ entity : { element: 'Waers', name: 'ZASIMV_WAERS' } } ]
      _Asim0040n.Waers                            as Waers,
    
      _Currency
           
}

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'IG - EX 아이템 참조 뷰'
define root view entity YI_ASIM0145N
  as select from YI_ASIM0100N
  association [1..1] to YI_ASIM0090N as _Head on _Head.Uuid = $projection.ParentUUID

{

      @ObjectModel.filter.enabled: false
  key Uuid                        as Uuid,

      @ObjectModel.filter.enabled: false
  key ParentUUID                  as ParentUUID,

      @EndUserText.label: '부대비번호'
      cast('' as abap.char(10))   as Feeno,

      @EndUserText.label: '부대비연도'
      cast('' as abap.numc(4))    as Feeyr,

      @EndUserText.label: '부대비품목'
      cast('' as abap.numc(6))    as Feenp,

      @EndUserText.label: '부대비항목'
      cast('' as abap.char(12))   as Zcdno,

      @ObjectModel.filter.enabled: false
      @EndUserText.label: '삭제 지시자'
      Loekz                       as Loekz,

      @EndUserText.label: '연결부대비번호'
      cast('' as abap.char(12))   as Feeno1,

      @EndUserText.label: '참조문서구분'
      cast('' as abap.char(12))   as Feegb,

      @EndUserText.label: '참조문서번호'
      Mblnr                       as Gbno,

      @EndUserText.label: '참조문서품목'
      cast('' as abap.numc(4))    as Gbnp,

      @EndUserText.label: '구매문서번호'
      Ebeln                       as Ebeln,

      @EndUserText.label: '구매문서품목번호'
      Ebelp                       as Ebelp,

      @EndUserText.label: '자재번호'
      Matnr                       as Matnr,

      @EndUserText.label: '자재명'
      Maktx                       as Maktx,

      @EndUserText.label: '플랜트'
      Werks                       as Werks,

      @EndUserText.label: '플랜트명'
      Werkst                      as Werkst,

      @Semantics.quantity.unitOfMeasure : 'MeinsFees'
      @EndUserText.label: '부대비수량'
      Grmng                       as MengeFees,

      @EndUserText.label: '부대비단위'
      Grmns                       as MeinsFees,

      @Semantics.amount.currencyCode : 'Waers'
      @EndUserText.label: '참조금액'
      cast( 0 as abap.curr(17,2)) as Netwr,

      @EndUserText.label: '통화 단위'
      @Consumption.valueHelpDefinition: [{ entity : { element: 'Waers', name: 'ZASIMV_WAERS' } } ]
      V2wae                       as Waers,

      @Semantics.amount.currencyCode : 'Waers'
      @EndUserText.label: '부대비금액'
      cast( 0 as abap.curr(17,2)) as NetwrFees,

      @Semantics.amount.currencyCode : 'Waers'
      @EndUserText.label: '부대비세액'
      cast( 0 as abap.curr(15,2)) as WmwstFees,

      @EndUserText.label: '부대비통화'
      cast( '' as waers )         as WaersFees,

      @EndUserText.label: '관세율'
      cast( 0 as abap.dec(16,2) ) as Zdc1_p,

      @EndUserText.label: '입고문서번호'
      cast( '' as abap.char(10) ) as Mblnr,

      @EndUserText.label: '입고연도'
      cast( '' as abap.numc(4) )  as Mjahr,

      @EndUserText.label: '입고품목'
      cast( '' as abap.numc(4) )  as Zelie,

      @EndUserText.label: '통관내부번호'
      Cclno                       as Cclno,

      @EndUserText.label: '통관연도'
      Cclyr                       as Cclyr,

      @EndUserText.label: '통관품목'
      Cclnp                       as Cclnp,

      @EndUserText.label: 'B/L내부번호'
      Blino                       as Blino,

      @EndUserText.label: 'B/L연도'
      Bliyr                       as Bliyr,

      @EndUserText.label: 'B/L품목'
      Blinp                       as Blinp,

      @EndUserText.label: '계약내부번호'
      Reqno                       as Reqno,

      @EndUserText.label: '계약연도'
      Reqyr                       as Reqyr,

      @EndUserText.label: '계약품목'
      Itmno                       as Itmno,

      @Semantics.amount.currencyCode: 'Waers'
      Blmpr                       as UnitPrice,
      
      @EndUserText.label: '가격단위'
      Blpnh as Peinh




}

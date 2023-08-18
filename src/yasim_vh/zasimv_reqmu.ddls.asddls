@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '요청정보제공 도움말 뷰'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
// 미완성뷰 LFA1 인터페이스 미구현
define view entity ZASIMV_REQMU
  as select from zasimt0010n_c as A
  //  INNER JOIN LFA1 AS B ON A.client = B.client
  //  AND A.lifnr = B.LIFNR

{
  reqyr,
  reqno,
  reqmu,
  lifnr,
  //NAME1,
  cont1,
  cont2,
  reqdt,
  lifre,
  inco1,
  inco2,
  zterm,
  @Semantics.amount.currencyCode: 'WAERS'
  netwr,
  waers,
  opdat,
  opnum,
  opbnk,
  @Semantics.amount.currencyCode: 'OPWRS'
  opamt,
  opwrs,
  bbdat,
  bbno
  //REMAK
}
where
  loekz like ''

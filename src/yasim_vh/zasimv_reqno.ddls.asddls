@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입계약내부번호 도움말 뷰'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZASIMV_REQNO
  as select from zasimt0010n_c as A
  //  INNER JOIN LFA1 AS B ON A.LIFNR = B.LIFNR
{
reqno,
reqyr,
reqmu,
cont1,
cont2,
reqdt,
ekgrp,
lifnr,
//NAME1,
lifre,
inco1,
inco2,
zterm,
@Semantics.amount.currencyCode: 'WAERS'
netwr,
waers,
zcdno1,
zcdno2,
zcdno3,
zcdno4,
opdat,
opnum,
opbnk,
@Semantics.amount.currencyCode: 'OPWRS'
opamt,
opwrs,
pterm,
oplif,
acdat,
bbno,
//REMAK,
crtnm,
crtdt
}
where
  loekz like ''

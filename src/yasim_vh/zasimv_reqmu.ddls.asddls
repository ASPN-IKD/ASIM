@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '요청정보제공 도움말 뷰'
@Metadata.ignorePropagatedAnnotations: true


define view entity ZASIMV_REQMU
  as select from YI_ASIM0010N

  association [1..1] to ZASIMV_LIFNR                  as _lifnr                       on  $projection.Lifnr = _lifnr.Lifnr
  association [0..1] to I_IncotermsClassificationText as _IncotermsClassificationText on  $projection.Inco1                     = _IncotermsClassificationText.IncotermsClassification
                                                                                      and _IncotermsClassificationText.Language = '3'
  association [0..1] to YI_ASIM0001N                  as _zterm                       on  $projection.Zterm =    _zterm.Zcdno
                                                                                      and _zterm.Zcode      like '%ZTERM'
                                                                                      and _zterm.Zcdno      <>   '00'
  association [0..1] to YI_ASIM0001N                  as _opbnk                       on  $projection.Opbnk =    _opbnk.Zcdno
                                                                                      and _opbnk.Zcode      like '%OPBNK'
                                                                                      and _opbnk.Zcdno      <>   '00'
  association [0..1] to YI_ASIM0001N                  as _Pterm                       on  $projection.Pterm =    _Pterm.Zcdno
                                                                                      and _Pterm.Zcode      like '%PTERM'
                                                                                      and _Pterm.Zcdno      <>   '00'
  association [0..1] to YI_ASIM0001N                  as _lifre                       on  $projection.Lifre =    _lifre.Zcdno
                                                                                      and _lifre.Zcode      like '%LIFRE'
                                                                                      and _lifre.Zcdno      <>   '00'
{
@UI.hidden: true
 key Uuid,
  Reqyr,
  Reqno,
  Reqmu,
  Lifnr,
  _lifnr.Lifnrt                                            as Lifnrt,
  Cont1,
  Cont2,
  Reqdt,
  Lifre,
  _lifre.Ztext                                             as Lifret,
  Inco1,
  _IncotermsClassificationText.IncotermsClassificationName as Inco1t,
  Inco2,
  Zterm,
  _zterm.Ztext                                             as Ztermt,
  @Semantics.amount.currencyCode: 'WAERS'
  Netwr,
  Waers,
  Opdat,
  Pterm,
  _Pterm.Ztext                                             as Ptermt,
  Opnum,
  Opbnk,
  _opbnk.Ztext                                             as Opbnkt,
  @Semantics.amount.currencyCode: 'OPWRS'
  Opamt,
  Opwrs,
  Bbdat,
  Bbno
  //REMAK
}
where
  Loekz like ''

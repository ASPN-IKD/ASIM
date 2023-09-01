@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입계약내부번호 도움말 뷰'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZASIMV_REQNO
   
  as select from YI_ASIM0010N
  association [1..1] to I_CompanyCode                 as _CompanyCode                 on  $projection.Bukrs = _CompanyCode.CompanyCode
  association [1..1] to I_PurchasingOrganization      as _PurchasingOrganization      on  $projection.Ekorg = _PurchasingOrganization.PurchasingOrganization
  association [0..1] to I_PurchasingGroup             as _PurchasingGroup             on  $projection.Ekgrp = _PurchasingGroup.PurchasingGroup
  association [1..1] to ZASIMV_LIFNR                  as _lifnr                       on  $projection.Lifnr = _lifnr.Lifnr
  association [0..1] to I_IncotermsClassificationText as _IncotermsClassificationText on  $projection.Inco1                     = _IncotermsClassificationText.IncotermsClassification
                                                                                      and _IncotermsClassificationText.Language = '3'
  association [0..1] to YI_ASIM0001N                  as _zterm                       on  $projection.Zterm =    _zterm.Zcdno
                                                                                      and _zterm.Zcode      like '%ZTERM'
                                                                                      and _zterm.Zcdno      <>   '00'
  association [0..1] to YI_ASIM0001N                  as _lifre                       on  $projection.Lifre =    _lifre.Zcdno
                                                                                      and _lifre.Zcode      like '%LIFRE'
                                                                                      and _lifre.Zcdno      <>   '00'
  association [0..1] to YI_ASIM0001N                  as _zcdno1                      on  $projection.Zcdno1 =    _zcdno1.Zcdno
                                                                                      and _zcdno1.Zcode      like '%ZCDNO1'
                                                                                      and _zcdno1.Zcdno      <>   '00'
  association [0..1] to YI_ASIM0001N                  as _zcdno2                      on  $projection.Zcdno2 =    _zcdno2.Zcdno
                                                                                      and _zcdno2.Zcode      like '%ZCDNO2'
                                                                                      and _zcdno2.Zcdno      <>   '00'
  association [0..1] to YI_ASIM0001N                  as _zcdno3                      on  $projection.Zcdno3 =    _zcdno3.Zcdno
                                                                                      and _zcdno3.Zcode      like '%ZCDNO3'
                                                                                      and _zcdno3.Zcdno      <>   '00'
  association [0..1] to YI_ASIM0001N                  as _zcdno4                      on  $projection.Zcdno4 =    _zcdno4.Zcdno
                                                                                      and _zcdno4.Zcode      like '%ZCDNO4'
                                                                                      and _zcdno4.Zcdno      <>   '00'
  association [0..1] to YI_ASIM0001N                  as _opbnk                       on  $projection.Opbnk =    _opbnk.Zcdno
                                                                                      and _opbnk.Zcode      like '%OPBNK'
                                                                                      and _opbnk.Zcdno      <>   '00'
  association [0..1] to YI_ASIM0001N                  as _Pterm                       on  $projection.Pterm =    _Pterm.Zcdno
                                                                                      and _Pterm.Zcode      like '%PTERM'
                                                                                      and _Pterm.Zcdno      <>   '00'
  association [0..1] to YI_ASIM0001N                  as _oplif                       on  $projection.Oplif =    _oplif.Zcdno
                                                                                      and _oplif.Zcode      like '%OPLIF'
                                                                                      and _oplif.Zcdno      <>   '00'

{
@UI.hidden: true
key Uuid,
  Reqno,
  Reqyr,
  Reqmu,
  Cont1,
  Cont2,
  Reqdt,
  Bukrs,
  _CompanyCode.CompanyCodeName                             as Bukrst,
  Ekorg,
  _PurchasingOrganization.PurchasingOrganizationName       as Ekorgt,
  Ekgrp,
  _PurchasingGroup.PurchasingGroupName                     as Ekgrpt,
  Lifnr,
  _lifnr.Lifnrt                                            as Lifnrt,
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
  Zcdno1,
  _zcdno1.Ztext                                            as Zcdno1t,
  Zcdno2,
  _zcdno2.Ztext                                            as Zcdno2t,
  Zcdno3,
  _zcdno3.Ztext                                            as Zcdno3t,
  Zcdno4,
  _zcdno4.Ztext                                            as Zcdno4t,
  Opdat,
  Opnum,
  Opbnk,
  _opbnk.Ztext                                             as Opbnkt,
  @Semantics.amount.currencyCode: 'OPWRS'
  Opamt,
  Opwrs,
  Pterm,
  _Pterm.Ztext                                             as Ptermt,
  Oplif,
  _oplif.Ztext                                             as Oplift,
  Acdat,
  Bbno,
  //REMAK,
  Crtnm,
  Crtdt,
    
  case _CompanyCode.CompanyCodeName
    when 'ASPN' then 'X'
    else ''
    end as del         

}
where
  Loekz like ''
  and
  case Bukrst
    when 'ASPN' then 'X'
    else ''
    end = 'X'
  

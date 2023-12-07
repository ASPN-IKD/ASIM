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

   
      @EndUserText.label: '계약내부번호'
      Reqno,

      @EndUserText.label: '계약연도'
      Reqyr,

  
      @EndUserText.label: '관리번호'
      Reqmu,

      @EndUserText.label: '계약번호1'
      Cont1,

      @EndUserText.label: '계약번호2'
      Cont2,

      @EndUserText.label: '요청일'
      Reqdt,

      @EndUserText.label: '회사코드'
      Bukrs,

      @EndUserText.label: '회사코드명'
      _CompanyCode.CompanyCodeName                             as Bukrst,

      @EndUserText.label: '구매조직'
      Ekorg,

      @EndUserText.label: '구매조직명'
      _PurchasingOrganization.PurchasingOrganizationName       as Ekorgt,

      @ObjectModel.text.element: ['Ekgrpt']
      @EndUserText.label: '구매그룹'
      Ekgrp,

      @EndUserText.label: '구매그룹명'
      _PurchasingGroup.PurchasingGroupName                     as Ekgrpt,

      @ObjectModel.text.element: ['Lifnrt']
      @EndUserText.label: '공급업체'
      Lifnr,

      @EndUserText.label: '공급업체명'
      _lifnr.Lifnrt                                            as Lifnrt,

      @ObjectModel.text.element: ['Lifret']
      @EndUserText.label: '공급처'
      Lifre,

      @EndUserText.label: '공급처명'
      _lifre.Ztext                                             as Lifret,

      @ObjectModel.text.element: ['Inco1t']
      @EndUserText.label: '인도조건'
      Inco1,

      @EndUserText.label: '인도조건명'
      _IncotermsClassificationText.IncotermsClassificationName as Inco1t,

      @EndUserText.label: '인도처'
      Inco2,

      @ObjectModel.text.element: ['Ztermt']
      @EndUserText.label: '지급조건'
      Zterm,

      @EndUserText.label: '지급조건명'
      _zterm.Ztext                                             as Ztermt,

      @EndUserText.label: '계약총금액'
      @Semantics.amount.currencyCode: 'WAERS'
      Netwr,

      @EndUserText.label: '통화'
      Waers,

      @ObjectModel.text.element: ['Zcdno1t']
      @EndUserText.label: '도착지'
      Zcdno1,

      @EndUserText.label: '도착지명'
      _zcdno1.Ztext                                            as Zcdno1t,

      @ObjectModel.text.element: ['Zcdno2t']
      @EndUserText.label: '운송수단'
      Zcdno2,

      @EndUserText.label: '운송수단명'
      _zcdno2.Ztext                                            as Zcdno2t,

      @ObjectModel.text.element: ['Zcdno3t']
      @EndUserText.label: '선적지'
      Zcdno3,

      @EndUserText.label: '선적지명'
      _zcdno3.Ztext                                            as Zcdno3t,

      @ObjectModel.text.element: ['Zcdno4t']
      @EndUserText.label: '운송형태'
      Zcdno4,

      @EndUserText.label: '운송형태명'
      _zcdno4.Ztext                                            as Zcdno4t,
      
      @EndUserText.label: 'L/C오픈일'
      Opdat,
      
      @EndUserText.label: 'L/C번호'
      Opnum,
      
      @ObjectModel.text.element: ['Opbnkt']
      @EndUserText.label: '개설은행'
      Opbnk,
      
      @EndUserText.label: '개설은행명'
      _opbnk.Ztext                                             as Opbnkt,
      
      @EndUserText.label: 'L/C오픈금액'
      @Semantics.amount.currencyCode: 'OPWRS'
      Opamt,
      
      @EndUserText.label: '개설통화'
      Opwrs,
      
      @ObjectModel.text.element: ['Ptermt']
      @EndUserText.label: '결제조건'
      Pterm,
      
      @EndUserText.label: '결제조건명'
      _Pterm.Ztext                                             as Ptermt,
      
      @ObjectModel.text.element: ['Oplift']
      @EndUserText.label: '오픈처'
      Oplif,
      
      @EndUserText.label: '오픈처명'
      _oplif.Ztext                                             as Oplift,
      
      @EndUserText.label: '접수일'
      Acdat,
      
      @EndUserText.label: '보험증권번호'
      Bbno,
      //REMAK,
      //  Crtnm,
      //  Crtdt,

      case _CompanyCode.CompanyCodeName
        when 'ASPN' then 'X'
        else ''
        end                                                    as del

}
where
      Loekz like ''
  and case Bukrst
        when 'ASPN' then 'X'
        else ''
        end =    'X'

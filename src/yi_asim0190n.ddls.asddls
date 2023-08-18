@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입 통관예정 헤더 인터페이스 뷰'
define root view entity YI_ASIM0190N as select from zasimt0190n as _Asim0190n
composition [1..*] of YI_ASIM0200N                  as _Item

association [1..1] to YI_ASIM0030N as _Asim0030n on  _Asim0030n.Blino = _Asim0190n.blino
                                                   and _Asim0030n.Bliyr = _Asim0190n.bliyr
  //  association [1..1] to I_CompanyCode                 as _CompanyCode                 on  $projection.Bukrs = _CompanyCode.CompanyCode
  //  association [1..1] to I_PurchasingOrganization      as _PurchasingOrganization      on  $projection.Ekorg = _PurchasingOrganization.PurchasingOrganization                                                  
  //  association [0..1] to YI_ASIM0001N as _Cclgort     on  $projection.Cclgort =    _Cclgort.Zcdno
  //                                                   and _Cclgort.Zcode      like '%CCLGORT'
  //                                                   and _Cclgort.Zcdno      <>   '00'

{
    @ObjectModel.filter.enabled: false
    key _Asim0190n.uuid as Uuid,
    
    @EndUserText.label: '통관예정번호'
    _Asim0190n.eccno as Eccno,
    
    @EndUserText.label: '통관예정년도'
    _Asim0190n.eccyr as Eccyr,
    
      //      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_REQMU', element: 'Reqmu' }}]    
    @EndUserText.label: '관리번호'
    _Asim0190n.reqmu as Reqmu,
    
    //      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_REQNO', element: 'Reqno' }}]
    @EndUserText.label: '계약내부번호'
    _Asim0190n.reqno as Reqno,
    
    @EndUserText.label: '계약연도'
    _Asim0190n.reqyr as Reqyr,

      //      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_BLINO', element: 'Blino' }}]    
    @EndUserText.label: 'B/L내부번호'
    _Asim0190n.blino as Blino,
    
    @EndUserText.label: 'B/L연도'
    _Asim0190n.bliyr as Bliyr,
    
      //      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_BUKRS', element: 'Bukrs'} }]
      //      @ObjectModel.text.element: ['Bukrst']    
    @EndUserText.label: '회사 코드'
    _Asim0190n.bukrs as Bukrs,

      //      @EndUserText.label: '회사코드명'
      //      _CompanyCode.CompanyCodeName as Bukrst

      //      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_EKORG', element: 'Ekorg'} }]
      //      @ObjectModel.text.element: ['Ekorgt']    
    @EndUserText.label: '구매 조직'
    _Asim0190n.ekorg as Ekorg,
    
    @EndUserText.label: '통관예정일'
    _Asim0190n.eccdt as Eccdt,
    
    @EndUserText.label: '입고예정일'
    _Asim0190n.egrdt as Egrdt,
    
    @EndUserText.label: '화물관리번호'
    _Asim0190n.eccmrn as Eccmrn,
    
    @EndUserText.label: '보세운송번호'
    _Asim0190n.ecctrn as Ecctrn,
    
    @EndUserText.label: '장치위치정보'
    _Asim0190n.eccwmn as Eccwmn,
    
    @EndUserText.label: '반입일'
    _Asim0190n.ccldt as Ccldt,
    
    @EndUserText.label: '보세창고'
    _Asim0190n.cclgort as Cclgort,
    
//    @EndUserText.label: '보세창고명'
//    _Cclgort.Ztext as Cclgortt,
    
    @EndUserText.label: '검사(반입)장소'
    _Asim0190n.cclog as Cclog,
    
    
    
    crtnm                 as Crtnm,
      crtbu                 as Crtbu,

      @Semantics.systemDateTime.createdAt: true
      @EndUserText.label: 'Create Date'
      crtdt                 as Crtdt,

      crttm                 as Crttm,
      chgnm                 as Chgnm,
      chgbu                 as Chgbu,

      @ObjectModel.filter.enabled: false
      @EndUserText.label: 'Change Date'
      chgdt                 as Chgdt,

      chgtm                 as Chgtm,

      @ObjectModel.filter.enabled: false
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      @ObjectModel.filter.enabled: false
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,


      @ObjectModel.filter.enabled: false
      @EndUserText.label: '삭제 지시자'
      _Asim0190n.loekz                 as Loekz,

//      @ObjectModel.text.element: ['Ekgrpt']
//      @Consumption.valueHelpDefinition: [
//      {entity: {name: 'ZASIMV_EKGRP', element: 'Ekgrp' }}
//      ]
      @EndUserText.label: '구매그룹'
      _Asim0030n.Ekgrp                 as Ekgrp,

//      @EndUserText.label: '구매그룹명'
//      _Asim0030n.Ekgrpt     as Ekgrpt,

//      @ObjectModel.text.element: ['Lifnrt']
//      @Consumption.valueHelpDefinition: [
//      {entity: {name: 'ZASIMV_LIFNR', element: 'Lifnr' }}
//      ]
      @EndUserText.label: '공급업체'
      _Asim0030n.Lifnr                 as Lifnr,

//      @EndUserText.label: '공급업체명'
//      _Asim0030n.Lifnrt     as Lifnrt,

      @EndUserText.label: 'B/L번호'
      _Asim0030n.Bleno                 as Bleno,

      @EndUserText.label: 'B/L발행일'
      _Asim0030n.Bldat                 as Bldat,

      @EndUserText.label: '입항일'
      _Asim0030n.Bleta                 as Bleta,

      @EndUserText.label: '선적일'
      _Asim0030n.Bletd                 as Bletd,

      @EndUserText.label: 'ETD'
      _Asim0030n.Rqetd                 as Rqetd,

      @EndUserText.label: 'ETA'
      _Asim0030n.Rqeta                 as Rqeta,

      @EndUserText.label: '만기일수'
      _Asim0030n.Bld1t                 as Bld1t,

      @EndUserText.label: '인수만기일'
      _Asim0030n.Bledt                 as Bledt,

      @EndUserText.label: '선적서류접수일'
      _Asim0030n.Bldat2                as Bldat2,

      @EndUserText.label: '입고예정일'
      _Asim0030n.Blgrd                 as Blgrd,

      @EndUserText.label: '총중량'
      _Asim0030n.Brgew                 as Brgew,
      @EndUserText.label: '순중량'
      _Asim0030n.Negew                 as Negew,
      @EndUserText.label: '중량단위'
      _Asim0030n.Gewei                 as Gewei,

      @EndUserText.label: 'L/G번호'
      _Asim0030n.Lgnum                 as Lgnum,

      @EndUserText.label: '컨테이너번호'
      _Asim0030n.Cntno                 as Cntno,

//      @ObjectModel.text.element: ['Mosno']
//      @Consumption.valueHelpDefinition: [
//      {entity: {name: 'ZASIMV_MOSNO', element: 'Cdno' }}
//      ]
      @EndUserText.label: '모선번호'
      _Asim0030n.Mosno                 as Mosno,

//      @EndUserText.label: '모선번호명'
//      _Asim0030n.mosnot                 as Mosnot,

      @EndUserText.label: 'B/L총금액'
      @Semantics.amount.currencyCode : 'Waers'
      _Asim0030n.Blamt                 as Blamt,

      @EndUserText.label: '통화키'
      _Asim0030n.Waers                 as Waers,

      @EndUserText.label: 'B/L Text'
      _Asim0030n.Blitx                 as Blitx,

      @EndUserText.label: '납품완료체크'
      _Asim0030n.Blche                 as Blche,

      @EndUserText.label: '검역여부'
      _Asim0030n.Eccgb                 as Eccgb,

//      @ObjectModel.text.element: ['Lifret']
//      @Consumption.valueHelpDefinition: [
//      {entity: {name: 'ZASIMV_LIFRE', element: 'Cdno' }}
//      ]
      @EndUserText.label: '공급처'
      _Asim0030n.Lifre      as Lifre,

//      @EndUserText.label: '공급처명'
//      _Asim0030n.Lifret     as Lifret,

//      @ObjectModel.text.element: ['Inco1t']
      @EndUserText.label: '인도조건'
      _Asim0030n.Inco1      as Inco1,

//      @EndUserText.label: '인도조건명'
//      _Asim0030n.Inco1t     as Inco1t,

      @EndUserText.label: '인도처'
      _Asim0030n.Inco2      as Inco2,

//      @ObjectModel.text.element: ['Ztermt']
//      @Consumption.valueHelpDefinition: [
//      {entity: {name: 'ZASIMV_ZTERM', element: 'Cdno' }}
//      ]
      @EndUserText.label: '지급조건'
      _Asim0030n.Zterm      as Zterm,

//      @EndUserText.label: '지급조건명'
//      _Asim0030n.Ztermt     as Ztermt,

//      @ObjectModel.text.element: ['Zcdno1t']
      @EndUserText.label: '도착지'
//      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO1', element: 'Cdno' }}]
      _Asim0030n.Zcdno1     as Zcdno1,

//      @EndUserText.label: '도착지명'
//      _Asim0030n.Zcdno1t    as Zcdno1t,

//      @ObjectModel.text.element: ['Zcdno2t']
      @EndUserText.label: '운송수단'
//      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO2', element: 'Cdno' }}]
      _Asim0030n.Zcdno2     as Zcdno2,

//      @EndUserText.label: '운송수단명'
//      _Asim0030n.Zcdno2t    as Zcdno2t,

//      @ObjectModel.text.element: ['Zcdno3t']
      @EndUserText.label: '선적지'
//      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO3', element: 'Cdno' }}]
      _Asim0030n.Zcdno3     as Zcdno3,

//      @EndUserText.label: '선적지명'
//      _Asim0030n.Zcdno3t    as Zcdno3t,

//      @ObjectModel.text.element: ['Zcdno4t']
      @EndUserText.label: '운송형태'
//      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO4', element: 'Cdno' }}]
      _Asim0030n.Zcdno4     as Zcdno4,

//      @EndUserText.label: '운송형태명'
//      _Asim0030n.Zcdno4t    as Zcdno4t,

      @EndUserText.label: '총금액'
      @Semantics.amount.currencyCode : 'Waers'
      _Asim0030n.Netwr      as Netwr,

      @EndUserText.label: 'L/C오픈일'
      _Asim0030n.Opdat      as Opdat,

//      @ObjectModel.text.element: ['Opbnkt']
      @EndUserText.label: '개설은행'
//      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_OPBNK', element: 'Cdno' }}]
      _Asim0030n.Opbnk      as Opbnk,

//      @EndUserText.label: '개설은행명'
//      _Asim0030n.Opbnkt     as Opbnkt,

      @EndUserText.label: 'L/C번호'
      _Asim0030n.Opnum      as Opnum,

      @EndUserText.label: 'L/C오픈금액'
      @Semantics.amount.currencyCode : 'Opwrs'
      _Asim0030n.Opamt      as Opamt,

      @EndUserText.label: '통화 키'
//      @Consumption.valueHelpDefinition: [{entity: {name: 'I_CurrencyStdVH', element: 'Currency' }}]
      _Asim0030n.Opwrs      as Opwrs,

//      @ObjectModel.text.element: ['Ptermt']
      @EndUserText.label: '결제조건'
      _Asim0030n.Pterm      as Pterm,

//      @EndUserText.label: '결제조건명'
//      _Asim0030n.Ptermt     as Ptermt,

      @EndUserText.label: '결제조건일수'
      _Asim0030n.Zbd1t      as Zbd1t,

      @EndUserText.label: '결제예정일'
      _Asim0030n.Pedat      as Pedat,

      @EndUserText.label: '결제일'
      _Asim0030n.Pdate      as Pdate,

      @EndUserText.label: '오픈예정일'
      _Asim0030n.Oedat      as Oedat,

//      @ObjectModel.text.element: ['Oplift']
      @EndUserText.label: '오픈처'
//      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_OPLIF', element: 'Cdno' }}]
      _Asim0030n.Oplif      as Oplif,

//      @EndUserText.label: '오픈처명'
//      _Asim0030n.Oplift     as Oplift,

      @EndUserText.label: 'Sdate'
      _Asim0030n.Sdate      as Sdate,

      @EndUserText.label: 'Edate'
      _Asim0030n.Edate      as Edate,

//      @ObjectModel.text.element: ['Colift']
      @EndUserText.label: '실계약처'
//      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_COLIF', element: 'Cdno' }}]
      _Asim0030n.Colif      as Colif,

//      @EndUserText.label: '실계약처명'
//      _Asim0030n.Colift     as Colift,

//      @ObjectModel.text.element: ['Filift']
      @EndUserText.label: '파이낸스'
      _Asim0030n.Filif      as Filif,

//      @EndUserText.label: '파이낸스명'
//      _Asim0030n.Filift     as Filift,

      @EndUserText.label: '계약번호1'
      //@Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_CONT1', element: 'Cdno' }}]
      _Asim0030n.Cont1      as Cont1,

      @EndUserText.label: '계약번호2'
      _Asim0030n.Cont2      as Cont2,

      @EndUserText.label: '접수일'
      _Asim0030n.Acdat      as Acdat,

      @EndUserText.label: 'BOOKING No.'
      _Asim0030n.Bokno      as Bokno,

//      @ObjectModel.text.element: ['Conrtt']
      @EndUserText.label: '계약유형'
//      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_CONRT', element: 'Cdno' }}]
      _Asim0030n.Conrt      as Conrt,

//      @EndUserText.label: '계약유형명'
//      _Asim0030n.Conrt      as Conrtt,

      @EndUserText.label: '양도일(수입대행)'
      _Asim0030n.Trdat      as Trdat,

      @EndUserText.label: 'B/L번호(수입대행)'
      _Asim0030n.Trbln      as Trbln,

      @EndUserText.label: '개설환율'
      _Asim0030n.Rqrsf      as Rqrsf,

      @EndUserText.label: '부보환율'
      _Asim0030n.Bbrsf      as Bbrsf,

      @EndUserText.label: '부보대상금액'
      @Semantics.amount.currencyCode : 'Bbwrs'
      _Asim0030n.Bbamt      as Bbamt,

      @ObjectModel.filter.enabled: false
      @EndUserText.label: '통화 키'
//      @Consumption.valueHelpDefinition: [{entity: {name: 'I_CurrencyStdVH', element: 'Currency' }}]
      _Asim0030n.Bbwrs      as Bbwrs,

      @EndUserText.label: '부보일'
      _Asim0030n.Bbdat      as Bbdat,

//      @ObjectModel.text.element: ['Bbgbt']
      @EndUserText.label: '보험조건'
//      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_BBGB', element: 'Cdno' }}]
      _Asim0030n.Bbgb       as Bbgb,

//      @EndUserText.label: '보험조건명'
//      _Asim0030n.Bbgbt      as Bbgbt,

      @EndUserText.label: '계약완료'
      _Asim0030n.Rqche      as Rqche,

      @EndUserText.label: '인수일'
      _Asim0030n.Isdat      as Isdat,

      @EndUserText.label: '주차(오퍼)'
      _Asim0030n.Rqweek     as Rqweek,

      @EndUserText.label: '보험증권번호'
      _Asim0030n.Bbno       as Bbno,

//      @ObjectModel.text.element: ['Bblift']
      @EndUserText.label: '보험회사'
//      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_BBLIF', element: 'Cdno' }}]
      _Asim0030n.Bblif      as Bblif,

//      @EndUserText.label: '보험회사명'
//      _Asim0030n.Bblift     as Bblift,

      @ObjectModel.filter.enabled: false
      @EndUserText.label: '부보 Basic Rate'
      _Asim0030n.Bbrate     as Bbrate,

      @ObjectModel.filter.enabled: false
      @EndUserText.label: 'Remark'
      _Asim0030n.Remak      as Remak,
      
      _Item
}
where
  _Asim0190n.loekz = ''

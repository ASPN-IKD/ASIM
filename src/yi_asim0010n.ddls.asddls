@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입계약 헤더 인터페이스 뷰'
define root view entity YI_ASIM0010N
  as select from zasimt0010n
  composition [1..*] of YI_ASIM0021N                  as _Item
  association [1..1] to I_CompanyCode                 as _CompanyCode                 on  $projection.Bukrs = _CompanyCode.CompanyCode
  association [1..1] to I_PurchasingOrganization      as _PurchasingOrganization      on  $projection.Ekorg = _PurchasingOrganization.PurchasingOrganization
  association [0..1] to I_PurchasingGroup             as _PurchasingGroup             on  $projection.Ekgrp = _PurchasingGroup.PurchasingGroup
  association [1..1] to I_BusinessPartner             as _BusinessPartner             on  $projection.Lifnr = _BusinessPartner.BusinessPartner
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
  association [0..1] to YI_ASIM0001N                  as _colif                       on  $projection.Colif =    _colif.Zcdno
                                                                                      and _colif.Zcode      like '%COLIF'
                                                                                      and _colif.Zcdno      <>   '00'
  association [0..1] to YI_ASIM0001N                  as _filif                       on  $projection.Filif =    _filif.Zcdno
                                                                                      and _filif.Zcode      like '%FILIF'
                                                                                      and _filif.Zcdno      <>   '00'
  association [0..1] to YI_ASIM0001N                  as _conrt                       on  $projection.Conrt =    _conrt.Zcdno
                                                                                      and _conrt.Zcode      like '%CONRT'
                                                                                      and _conrt.Zcdno      <>   '00'
  association [0..1] to YI_ASIM0001N                  as _bbgb                        on  $projection.Bbgb =    _bbgb.Zcdno
                                                                                      and _bbgb.Zcode      like '%BBGB'
                                                                                      and _bbgb.Zcdno      <>   '00'
  association [0..1] to YI_ASIM0001N                  as _bblif                       on  $projection.Bblif =    _bblif.Zcdno
                                                                                      and _bblif.Zcode      like '%BBLIF'
                                                                                      and _bblif.Zcdno      <>   '00'


{
      @ObjectModel.filter.enabled: false
  key uuid                                                     as Uuid,

      @UI:{ lineItem: [{ position: 10 }],
            selectionField: [{ position: 10 }] }
      @EndUserText.label: '계약연도'
      reqyr                                                    as Reqyr,
      @UI:{lineItem: [{ position: 20 }],
      selectionField: [{position: 20}] }
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_REQNO', element: 'Reqno' }}]
      @EndUserText.label: '계약내부번호'
      reqno                                                    as Reqno,

      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_REQMU', element: 'Reqmu' }}]
      @EndUserText.label: '관리번호'
      reqmu                                                    as Reqmu,

      @EndUserText.label: '요청일'
      reqdt                                                    as Reqdt,

      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_BUKRS', element: 'Bukrs'} }]
      @ObjectModel.text.element: ['Bukrst']
      @EndUserText.label: '회사코드'
      bukrs                                                    as Bukrs,

      @EndUserText.label: '회사코드명'
      _CompanyCode.CompanyCodeName                             as Bukrst,

      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_EKORG', element: 'Ekorg'} }]
      @ObjectModel.text.element: ['Ekorgt']
      @EndUserText.label: '구매조직'
      ekorg                                                    as Ekorg,

      @EndUserText.label: '구매조직명'
      _PurchasingOrganization.PurchasingOrganizationName       as Ekorgt,

      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_EKGRP', element: 'Ekgrp'} }]
      @ObjectModel.text.element: ['Ekgrpt']
      @EndUserText.label: '구매그룹'
      ekgrp                                                    as Ekgrp,

      @EndUserText.label: '구매그룹명'
      _PurchasingGroup.PurchasingGroupName                     as Ekgrpt,

      @ObjectModel.text.element: ['Lifnrt']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_LIFNR', element: 'Lifnr' }}
      ]
      @EndUserText.label: '공급업체'
      lifnr                                                    as Lifnr,

      @EndUserText.label: '공급업체명'
      _BusinessPartner.BusinessPartnerName                     as Lifnrt,

      @EndUserText.label: '삭제지시자'
      loekz                                                    as Loekz,

      @ObjectModel.text.element: ['Lifret']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_LIFRE', element: 'Cdno' }}
      ]
      @EndUserText.label: '공급처'
      lifre                                                    as Lifre,

      @EndUserText.label: '공급처명'
      _lifre.Ztext                                             as Lifret,

      @ObjectModel.text.element: ['Inco1t']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_INCO1', element: 'inco1' }}
      ]
      @EndUserText.label: '인도조건'
      inco1                                                    as Inco1,

      @EndUserText.label: '인도조건명'
      _IncotermsClassificationText.IncotermsClassificationName as Inco1t,

      @EndUserText.label: '인도처'
      inco2                                                    as Inco2,

      @ObjectModel.text.element: ['Ztermt']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_ZTERM', element: 'Cdno' }}
      ]
      @EndUserText.label: '지급조건'
      zterm                                                    as Zterm,

      @EndUserText.label: '지급조건명'
      _zterm.Ztext                                             as Ztermt,

      @ObjectModel.text.element: ['Zcdno1t']
      @EndUserText.label: '도착지'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO1', element: 'Cdno' }}]
      zcdno1                                                   as Zcdno1,

      @EndUserText.label: '도착지명'
      _zcdno1.Ztext                                            as Zcdno1t,

      @ObjectModel.text.element: ['Zcdno2t']
      @EndUserText.label: '운송수단'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO2', element: 'Cdno' }}]
      zcdno2                                                   as Zcdno2,

      @EndUserText.label: '운송수단명'
      _zcdno2.Ztext                                            as Zcdno2t,

      @ObjectModel.text.element: ['Zcdno3t']
      @EndUserText.label: '선적지'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO3', element: 'Cdno' }}]
      zcdno3                                                   as Zcdno3,

      @EndUserText.label: '선적지명'
      _zcdno3.Ztext                                            as Zcdno3t,

      @ObjectModel.text.element: ['Zcdno4t']
      @EndUserText.label: '운송형태'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO4', element: 'Cdno' }}]
      zcdno4                                                   as Zcdno4,

      @EndUserText.label: '운송형태명'
      _zcdno4.Ztext                                            as Zcdno4t,

      @EndUserText.label: '총금액'
      @Semantics.amount.currencyCode : 'Waers'
      netwr                                                    as Netwr,

      @EndUserText.label: '통화 키'
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'I_CurrencyStdVH', element: 'Currency' }}
      ]
      waers                                                    as Waers,

      // 변경되는 화폐 단위 저장용 필드
      @ObjectModel.filter.enabled: false
      waers                                                    as Waers2,

      @EndUserText.label: 'L/C오픈일'
      opdat                                                    as Opdat,

      @ObjectModel.text.element: ['Opbnkt']
      @EndUserText.label: '개설은행'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_OPBNK', element: 'Cdno' }}]
      opbnk                                                    as Opbnk,

      @EndUserText.label: '개설은행명'
      _opbnk.Ztext                                             as Opbnkt,

      @EndUserText.label: 'L/C번호'
      opnum                                                    as Opnum,

      @EndUserText.label: 'L/C오픈금액'
      @Semantics.amount.currencyCode : 'Opwrs'
      opamt                                                    as Opamt,

      @EndUserText.label: '통화 키'
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_CurrencyStdVH', element: 'Currency' }}]
      opwrs                                                    as Opwrs,
    
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_PTERM', element: 'Cdno' }}]
      @ObjectModel.text.element: ['Ptermt']
      @EndUserText.label: '결제조건'
      pterm                                                    as Pterm,

      @EndUserText.label: '결제조건명'
      _Pterm.Ztext                                             as Ptermt,

      @EndUserText.label: '결제조건일수'
      zbd1t                                                    as Zbd1t,

      @EndUserText.label: '결제예정일'
      pedat                                                    as Pedat,

      @EndUserText.label: '결제일'
      pdate                                                    as Pdate,

      @EndUserText.label: '오픈예정일'
      oedat                                                    as Oedat,

      @ObjectModel.text.element: ['Oplift']
      @EndUserText.label: '오픈처'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_OPLIF', element: 'Cdno' }}]
      oplif                                                    as Oplif,

      @EndUserText.label: '오픈처명'
      _oplif.Ztext                                             as Oplift,

      @EndUserText.label: 'Sdate'
      sdate                                                    as Sdate,

      @EndUserText.label: 'Edate'
      edate                                                    as Edate,

      @ObjectModel.text.element: ['Colift']
      @EndUserText.label: '실계약처'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_COLIF', element: 'Cdno' }}]
      colif                                                    as Colif,

      @EndUserText.label: '실계약처명'
      _colif.Ztext                                             as Colift,

      @ObjectModel.text.element: ['Filift']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_FILIF', element: 'Cdno' }}
      ]
      @EndUserText.label: '파이낸스'
      filif                                                    as Filif,

      @EndUserText.label: '파이낸스명'
      _filif.Ztext                                             as Filift,

      @EndUserText.label: '계약번호1'
      cont1                                                    as Cont1,

      @EndUserText.label: '계약번호2'
      cont2                                                    as Cont2,

      @EndUserText.label: '접수일'
      acdat                                                    as Acdat,

      @EndUserText.label: 'BOOKING No.'
      bokno                                                    as Bokno,

      @ObjectModel.text.element: ['Conrtt']
      @EndUserText.label: '계약유형'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_CONRT', element: 'Cdno' }}]
      conrt                                                    as Conrt,

      @EndUserText.label: '계약유형명'
      _conrt.Ztext                                             as Conrtt,

      @EndUserText.label: '양도일(수입대행)'
      trdat                                                    as Trdat,

      @EndUserText.label: 'B/L번호(수입대행)'
      trbln                                                    as Trbln,

      @EndUserText.label: '개설환율'
      rqrsf                                                    as Rqrsf,

      @EndUserText.label: '부보환율'
      bbrsf                                                    as Bbrsf,

      @EndUserText.label: '부보대상금액'
      @Semantics.amount.currencyCode : 'Bbwrs'
      bbamt                                                    as Bbamt,

      @ObjectModel.filter.enabled: false
      @EndUserText.label: '통화 키'
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_CurrencyStdVH', element: 'Currency' }}]
      bbwrs                                                    as Bbwrs,

      @EndUserText.label: '부보일'
      bbdat                                                    as Bbdat,

      @ObjectModel.text.element: ['Bbgbt']
      @EndUserText.label: '보험조건'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_BBGB', element: 'Cdno' }}]
      bbgb                                                     as Bbgb,

      @EndUserText.label: '보험조건명'
      _bbgb.Ztext                                              as Bbgbt,

      @EndUserText.label: '계약완료'
      rqche                                                    as Rqche,

      @EndUserText.label: '인수일'
      isdat                                                    as Isdat,

      @EndUserText.label: '주차(오퍼)'
      rqweek                                                   as Rqweek,

      @EndUserText.label: '보험증권번호'
      bbno                                                     as Bbno,

      @ObjectModel.text.element: ['Bblift']
      @EndUserText.label: '보험회사'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_BBLIF', element: 'Cdno' }}]
      bblif                                                    as Bblif,

      @EndUserText.label: '보험회사명'
      _bblif.Ztext                                             as Bblift,

      @ObjectModel.filter.enabled: false
      @EndUserText.label: '부보 Basic Rate'
      bbrate                                                   as Bbrate,

      @ObjectModel.filter.enabled: false
      @EndUserText.label: '비고'
      remak                                                    as Remak,

      @EndUserText.label: '생성자'
      @Semantics.user.createdBy: true
      created_by                                               as CreatedBy,
      @EndUserText.label: '생성일'
      @Semantics.systemDateTime.createdAt: true
      created_at                                               as CreatedAt,
      @EndUserText.label: '최종 변경자'
      @Semantics.user.lastChangedBy: true
      last_changed_by                                          as LastChangedBy,
      @EndUserText.label: '최종 변경일'
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at                                          as LastChangedAt,
      @EndUserText.label: '인스턴스 변경시간'
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at                                    as LocalLastChangedAt,
      
      @EndUserText.label: '부대비참조구분'
      cast('A' as abap.char(12)) as Feegb,
      
      @EndUserText.label: '참조문서구분'
      cast('수입계약참조' as abap.char(40)) as Feegbt,

      //Association
      _Item

}
where
  loekz = ''

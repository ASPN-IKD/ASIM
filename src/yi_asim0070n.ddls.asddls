@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입 통관 헤더 인터페이스 뷰'
define root view entity YI_ASIM0070N
  as select from zasimt0070n as _Asim0070n

  composition [1..*] of YI_ASIM0082N             as _Item
  association [0..1] to YI_ASIM0030N             as _Asim0030n              on  _Asim0030n.Blino = _Asim0070n.blino
                                                                            and _Asim0030n.Bliyr = _Asim0070n.bliyr
  association [0..1] to YI_ASIM0190N             as _Asim0190n              on  _Asim0190n.Blino = _Asim0070n.blino
                                                                            and _Asim0190n.Bliyr = _Asim0070n.bliyr
                                                                            and _Asim0190n.Eccno = _Asim0070n.eccno
                                                                            and _Asim0190n.Eccyr = _Asim0070n.eccyr
                                                                            and _Asim0190n.Eccgb = 'X'
  association [1..1] to I_CompanyCode            as _CompanyCode            on  $projection.Bukrs = _CompanyCode.CompanyCode
  association [1..1] to I_PurchasingOrganization as _PurchasingOrganization on  $projection.Ekorg = _PurchasingOrganization.PurchasingOrganization
  association [0..1] to YI_ASIM0001N             as _Cclif                  on  $projection.Cclif =    _Cclif.Zcdno
                                                                            and _Cclif.Zcode      like '%CCLIF'
                                                                            and _Cclif.Zcdno      <>   '00'
  association [0..1] to YI_ASIM0001N             as _Ccper                  on  $projection.Ccper =    _Ccper.Zcdno
                                                                            and _Ccper.Zcode      like '%CCPER'
                                                                            and _Ccper.Zcdno      <>   '00'
  association [0..1] to YI_ASIM0001N             as _Ccmos                  on  $projection.Ccmos =    _Ccmos.Zcdno
                                                                            and _Ccmos.Zcode      like '%MOSNO'
                                                                            and _Ccmos.Zcdno      <>   '00'
  association [0..1] to YI_ASIM0001N             as _Cclgort                on  _Asim0070n.cclgort =    _Cclgort.Zcdno
                                                                            and _Cclgort.Zcode     like '%CCLGORT'
                                                                            and _Cclgort.Zcdno     <>   '00'
{

      @ObjectModel.filter.enabled: false
  key uuid                                               as Uuid,

      @EndUserText.label: '통관번호'
      cclno                                              as Cclno,

      @EndUserText.label: '통관연도'
      cclyr                                              as Cclyr,

      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_REQMU', element: 'Reqmu' }}]
      @EndUserText.label: '관리번호'
      reqmu                                              as Reqmu,

      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_REQNO', element: 'Reqno' }}]
      @EndUserText.label: '계역내부번호'
      reqno                                              as Reqno,

      @EndUserText.label: '계약연도'
      reqyr                                              as Reqyr,

      @EndUserText.label: '계약일'
      _Asim0030n.Reqdt                                   as Reqdt,

      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_BLINO', element: 'Blino' }}]
      @EndUserText.label: 'B/L내부번호'
      blino                                              as Blino,

      @EndUserText.label: 'B/L연도'
      bliyr                                              as Bliyr,

      @EndUserText.label: '구매문서번호'
      _Asim0030n.Ebeln                                   as Ebeln,

      @EndUserText.label: '통관예정번호'
      eccno                                              as Eccno,

      @EndUserText.label: '통관예정년도'
      eccyr                                              as Eccyr,

      @EndUserText.label: '수입신고번호'
      decno                                              as Decno,

      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_BUKRS', element: 'Bukrs'} }]
      @ObjectModel.text.element: ['Bukrst']
      @EndUserText.label: '회사코드'
      bukrs                                              as Bukrs,

      @EndUserText.label: '회사코드명'
      _CompanyCode.CompanyCodeName                       as Bukrst,

      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_EKORG', element: 'Ekorg'} }]
      @ObjectModel.text.element: ['Ekorgt']
      @EndUserText.label: '구매조직'
      ekorg                                              as Ekorg,

      @EndUserText.label: '구매조직명'
      _PurchasingOrganization.PurchasingOrganizationName as Ekorgt,

      @ObjectModel.text.element: ['Ekgrpt']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_EKGRP', element: 'Ekgrp' }}
      ]
      @EndUserText.label: '구매그룹'
      _Asim0030n.Ekgrp                                   as Ekgrp,

      @EndUserText.label: '구매그룹명'
      _Asim0030n.Ekgrpt                                  as Ekgrpt,

      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_CCLIF', element: 'Cdno'} }]
      @ObjectModel.text.element: ['Cclift']
      @EndUserText.label: '세관'
      cclif                                              as Cclif,

      @EndUserText.label: '세관명'
      _Cclif.Ztext                                       as Cclift,

      @EndUserText.label: '신고일'
      decdt                                              as Decdt,

      @EndUserText.label: '반입일'
      case when _Asim0190n.Eccgb = 'X' then _Asim0190n.Ccldt
      else _Asim0070n.ccldt
      end                                                as Ccldt,

      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_CCPER', element: 'Cdno'} }]
      @ObjectModel.text.element: ['Ccpert']
      @EndUserText.label: '신고인'
      ccper                                              as Ccper,

      @EndUserText.label: '신고인명'
      _Ccper.Ztext                                       as Ccpert,

      @Semantics.amount.currencyCode : 'Ccwae'
      @EndUserText.label: '총과세가격'
      ccamt                                              as Ccamt,

      @Semantics.amount.currencyCode : 'Ccwaek'
      @EndUserText.label: '총과세가격(현지 통화)'
      ccamtk                                             as Ccamtk,

      @Semantics.amount.currencyCode : 'Ccwaek'
      @EndUserText.label: '관세'
      ccvat1                                             as Ccvat1,

      @Semantics.amount.currencyCode : 'Ccwaek'
      @EndUserText.label: '수입부가세'
      ccvat2                                             as Ccvat2,

      @Semantics.amount.currencyCode : 'Ccwaek'
      @EndUserText.label: '과세 표준액(현지 통화)'
      hwbas                                              as Hwbas,

      @ObjectModel.filter.enabled: false
      @EndUserText.label: '통화 키'
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_CurrencyStdVH', element: 'Currency' }}]
      ccwae                                              as Ccwae,

      @EndUserText.label: '현지통화'
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_CurrencyStdVH', element: 'Currency' }} ]
      ccwaek                                             as Ccwaek,

      @EndUserText.label: '통관환율'
      ccrsf                                              as Ccrsf,

      @EndUserText.label: '접수일'
      ccdat1                                             as Ccdat1,

      @EndUserText.label: '수리일'
      ccdat2                                             as Ccdat2,

      @EndUserText.label: '검사(반입)장소'
      cclog                                              as Cclog,

      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_CCMOS', element: 'Cdno'} }]
      @ObjectModel.text.element: ['Ccmost']
      @EndUserText.label: '환적모선'
      ccmos                                              as Ccmos,

      @EndUserText.label: '환적모선명'
      _Ccmos.Ztext                                       as Ccmost,

      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_CCLGORT', element: 'Cdno'} }]
      @ObjectModel.text.element: ['Cclgortt']
      @EndUserText.label: '보세창고'
      case when _Asim0190n.Eccgb = 'X' then _Asim0190n.Cclgort
      else _Asim0070n.cclgort
      end                                                as Cclgort,

      @EndUserText.label: '보세창고명'
      case when _Asim0190n.Eccgb = 'X' then _Asim0190n.Cclgortt
      else _Cclgort.Ztext
      end                                                as Cclgortt,

      @EndUserText.label: '통관비고'
      ccltx                                              as Ccltx,

      @ObjectModel.text.element: ['Lifnrt']
      @EndUserText.label: '공급업체'
      _Asim0030n.Lifnr                                   as Lifnr,

      @EndUserText.label: '공급업체명'
      _Asim0030n.Lifnrt                                  as Lifnrt,

      @EndUserText.label: 'B/L번호'
      _Asim0030n.Bleno                                   as Bleno,

      @EndUserText.label: 'B/L발행일'
      _Asim0030n.Bldat                                   as Bldat,

      @EndUserText.label: '입항일'
      _Asim0030n.Bleta                                   as Bleta,

      @EndUserText.label: '선적일'
      _Asim0030n.Bletd                                   as Bletd,

      @EndUserText.label: 'ETD'
      _Asim0030n.Rqetd                                   as Rqetd,

      @EndUserText.label: 'ETA'
      _Asim0030n.Rqeta                                   as Rqeta,

      @EndUserText.label: '만기일수'
      _Asim0030n.Bld1t                                   as Bld1t,

      @EndUserText.label: '인수만기일'
      _Asim0030n.Bledt                                   as Bledt,

      @EndUserText.label: '선적서류접수일'
      _Asim0030n.Bldat2                                  as Bldat2,

      @EndUserText.label: '입고예정일'
      _Asim0030n.Blgrd                                   as Blgrd,

      @EndUserText.label: '총중량'
      _Asim0030n.Brgew                                   as Brgew,

      @EndUserText.label: '순중량'
      _Asim0030n.Negew                                   as Negew,

      @EndUserText.label: '중량단위'
      _Asim0030n.Gewei                                   as Gewei,

      @EndUserText.label: 'L/G번호'
      _Asim0030n.Lgnum                                   as Lgnum,

      @EndUserText.label: '컨테이너번호'
      _Asim0030n.Cntno                                   as Cntno,

      @ObjectModel.text.element: ['Mosnot']
      @EndUserText.label: '모선번호'
      _Asim0030n.Mosno                                   as Mosno,

      @EndUserText.label: '모선번호명'
      _Asim0030n.Mosnot                                  as Mosnot,

      @EndUserText.label: 'B/L총금액'
      @Semantics.amount.currencyCode : 'Waers'
      _Asim0030n.Blamt                                   as Blamt,

      @EndUserText.label: 'B/L통화키'
      _Asim0030n.Waers                                   as Waers,

      @EndUserText.label: 'B/L Text'
      _Asim0030n.Blitx                                   as Blitx,

      @EndUserText.label: '납품완료체크'
      _Asim0030n.Blche                                   as Blche,

      @EndUserText.label: '검역여부'
      _Asim0030n.Eccgb                                   as Eccgb,

      @ObjectModel.text.element: ['Lifret']
      @EndUserText.label: '공급처'
      _Asim0030n.Lifre                                   as Lifre,

      @EndUserText.label: '공급처명'
      _Asim0030n.Lifret                                  as Lifret,

      @ObjectModel.text.element: ['Inco1t']
      @EndUserText.label: '인도조건'
      _Asim0030n.Inco1                                   as Inco1,

      @EndUserText.label: '인도조건명'
      _Asim0030n.Inco1t                                  as Inco1t,

      @EndUserText.label: '인도처'
      _Asim0030n.Inco2                                   as Inco2,

      @ObjectModel.text.element: ['Ztermt']
      @EndUserText.label: '지급조건'
      _Asim0030n.Zterm                                   as Zterm,

      @EndUserText.label: '지급조건명'
      _Asim0030n.Ztermt                                  as Ztermt,

      @ObjectModel.text.element: ['Zcdno1t']
      @EndUserText.label: '도착지'
      _Asim0030n.Zcdno1                                  as Zcdno1,

      @EndUserText.label: '도착지명'
      _Asim0030n.Zcdno1t                                 as Zcdno1t,

      @ObjectModel.text.element: ['Zcdno2t']
      @EndUserText.label: '운송수단'
      _Asim0030n.Zcdno2                                  as Zcdno2,

      @EndUserText.label: '운송수단명'
      _Asim0030n.Zcdno2t                                 as Zcdno2t,

      @ObjectModel.text.element: ['Zcdno3t']
      @EndUserText.label: '선적지'
      _Asim0030n.Zcdno3                                  as Zcdno3,

      @EndUserText.label: '선적지명'
      _Asim0030n.Zcdno3t                                 as Zcdno3t,

      @ObjectModel.text.element: ['Zcdno4t']
      @EndUserText.label: '운송형태'
      _Asim0030n.Zcdno4                                  as Zcdno4,

      @EndUserText.label: '운송형태명'
      _Asim0030n.Zcdno4t                                 as Zcdno4t,

      @EndUserText.label: '총금액'
      @Semantics.amount.currencyCode : 'Waers'
      _Asim0030n.Netwr                                   as Netwr,

      @EndUserText.label: 'L/C오픈일'
      _Asim0030n.Opdat                                   as Opdat,

      @ObjectModel.text.element: ['Opbnkt']
      @EndUserText.label: '개설은행'
      _Asim0030n.Opbnk                                   as Opbnk,

      @EndUserText.label: '개설은행명'
      _Asim0030n.Opbnkt                                  as Opbnkt,

      @EndUserText.label: 'L/C번호'
      _Asim0030n.Opnum                                   as Opnum,

      @EndUserText.label: 'L/C오픈금액'
      @Semantics.amount.currencyCode : 'Opwrs'
      _Asim0030n.Opamt                                   as Opamt,

      @EndUserText.label: '통화 키'
      _Asim0030n.Opwrs                                   as Opwrs,

      @ObjectModel.text.element: ['Ptermt']
      @EndUserText.label: '결제조건'
      _Asim0030n.Pterm                                   as Pterm,

      @EndUserText.label: '결제조건명'
      _Asim0030n.Ptermt                                  as Ptermt,

      @EndUserText.label: '결제조건일수'
      _Asim0030n.Zbd1t                                   as Zbd1t,

      @EndUserText.label: '결제예정일'
      _Asim0030n.Pedat                                   as Pedat,

      @EndUserText.label: '결제일'
      _Asim0030n.Pdate                                   as Pdate,

      @EndUserText.label: '오픈예정일'
      _Asim0030n.Oedat                                   as Oedat,

      @ObjectModel.text.element: ['Oplift']
      @EndUserText.label: '오픈처'
      _Asim0030n.Oplif                                   as Oplif,

      @EndUserText.label: '오픈처명'
      _Asim0030n.Oplift                                  as Oplift,

      @EndUserText.label: 'Sdate'
      _Asim0030n.Sdate                                   as Sdate,

      @EndUserText.label: 'Edate'
      _Asim0030n.Edate                                   as Edate,

      @ObjectModel.text.element: ['Colift']
      @EndUserText.label: '실계약처'
      _Asim0030n.Colif                                   as Colif,

      @EndUserText.label: '실계약처명'
      _Asim0030n.Colift                                  as Colift,

      @ObjectModel.text.element: ['Filift']
      @EndUserText.label: '파이낸스'
      _Asim0030n.Filif                                   as Filif,

      @EndUserText.label: '파이낸스명'
      _Asim0030n.Filift                                  as Filift,

      @EndUserText.label: '계약번호1'
      _Asim0030n.Cont1                                   as Cont1,

      @EndUserText.label: '계약번호2'
      _Asim0030n.Cont2                                   as Cont2,

      @EndUserText.label: '접수일'
      _Asim0030n.Acdat                                   as Acdat,

      @EndUserText.label: 'BOOKING No.'
      _Asim0030n.Bokno                                   as Bokno,

      @ObjectModel.text.element: ['Conrtt']
      @EndUserText.label: '계약유형'
      _Asim0030n.Conrt                                   as Conrt,

      @EndUserText.label: '계약유형명'
      _Asim0030n.Conrt                                   as Conrtt,

      @EndUserText.label: '양도일(수입대행)'
      _Asim0030n.Trdat                                   as Trdat,

      @EndUserText.label: 'B/L번호(수입대행)'
      _Asim0030n.Trbln                                   as Trbln,

      @EndUserText.label: '개설환율'
      _Asim0030n.Rqrsf                                   as Rqrsf,

      @EndUserText.label: '부보환율'
      _Asim0030n.Bbrsf                                   as Bbrsf,

      @EndUserText.label: '부보대상금액'
      @Semantics.amount.currencyCode : 'Bbwrs'
      _Asim0030n.Bbamt                                   as Bbamt,

      @ObjectModel.filter.enabled: false
      @EndUserText.label: '통화 키'
      _Asim0030n.Bbwrs                                   as Bbwrs,

      @EndUserText.label: '부보일'
      _Asim0030n.Bbdat                                   as Bbdat,

      @ObjectModel.text.element: ['Bbgbt']
      @EndUserText.label: '보험조건'
      _Asim0030n.Bbgb                                    as Bbgb,

      @EndUserText.label: '보험조건명'
      _Asim0030n.Bbgbt                                   as Bbgbt,

      @EndUserText.label: '계약완료'
      _Asim0030n.Rqche                                   as Rqche,

      @EndUserText.label: '인수일'
      _Asim0030n.Isdat                                   as Isdat,

      @EndUserText.label: '주차(오퍼)'
      _Asim0030n.Rqweek                                  as Rqweek,

      @EndUserText.label: '보험증권번호'
      _Asim0030n.Bbno                                    as Bbno,

      @ObjectModel.text.element: ['Bblift']
      @EndUserText.label: '보험회사'
      _Asim0030n.Bblif                                   as Bblif,

      @EndUserText.label: '보험회사명'
      _Asim0030n.Bblift                                  as Bblift,

      @ObjectModel.filter.enabled: false
      @EndUserText.label: '부보 Basic Rate'
      _Asim0030n.Bbrate                                  as Bbrate,

      @ObjectModel.filter.enabled: false
      @EndUserText.label: 'Remark'
      _Asim0030n.Remak                                   as Remak,

      @EndUserText.label: '통관예정일'
      _Asim0190n.Eccdt                                   as Eccdt,

      @EndUserText.label: '입고예정일'
      _Asim0190n.Egrdt                                   as Egrdt,

      @EndUserText.label: '화물관리번호'
      _Asim0190n.Eccmrn                                  as Eccmrn,

      @EndUserText.label: '보세운송번호'
      _Asim0190n.Ecctrn                                  as Ecctrn,

      @EndUserText.label: '장치위치정보'
      _Asim0190n.Eccwmn                                  as Eccwmn,

      @EndUserText.label: '참조구분'
      created_type                                       as CreatedType,

      @EndUserText.label: '생성자'
      @Semantics.user.createdBy: true
      created_by                                         as CreatedBy,
      @EndUserText.label: '생성일'
      @Semantics.systemDateTime.createdAt: true
      created_at                                         as CreatedAt,
      @EndUserText.label: '최종 변경자'
      @Semantics.user.lastChangedBy: true
      last_changed_by                                    as LastChangedBy,
      @EndUserText.label: '최종 변경일'
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at                                    as LastChangedAt,
      @EndUserText.label: '인스턴스 변경시간'
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at                              as LocalLastChangedAt,

      @ObjectModel.filter.enabled: false
      @EndUserText.label: '삭제 지시자'
      loekz                                              as Loekz,

      @EndUserText.label: '부대비참조구분'
      cast('C' as abap.char(12))                         as Feegb,

      @EndUserText.label: '참조문서구분'
      cast('통관참조' as abap.char(40))                      as Feegbt,
      
      @EndUserText.label: '부대비 참조문서번호'
      cclno as Gbno,

      @EndUserText.label: '후속문서구분'
      @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_ASIM0010_FL'
      cast('' as abap_boolean preserving type)           as ChkFollow,

      _Item
}
where
  loekz = ''

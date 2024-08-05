@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입입고 헤더 인터페이스 뷰'
define root view entity YI_ASIM0090N
  as select from zasimt0090n as _Grheader
  composition [1..*] of YI_ASIM0101N             as _Item

  association [0..1] to YI_ASIM0070N             as _Asim0070n              on  _Grheader.cclno = _Asim0070n.Cclno
                                                                            and _Grheader.cclyr = _Asim0070n.Cclyr

  association [1..1] to I_CompanyCode            as _CompanyCode            on  $projection.Bukrs = _CompanyCode.CompanyCode
  association [1..1] to I_PurchasingOrganization as _PurchasingOrganization on  $projection.Ekorg = _PurchasingOrganization.PurchasingOrganization
  association [1..1] to I_BusinessPartner        as _BusinessPartner        on  $projection.Lifnr = _BusinessPartner.BusinessPartner

  association [1..1] to YI_ASIM0010N             as _Reqheader              on  _Reqheader.Reqno = _Grheader.reqno
                                                                            and _Reqheader.Reqyr = _Grheader.reqyr
{
      @ObjectModel.filter.enabled: false
  key uuid                                               as Uuid,

      @EndUserText.label: '입고문서번호'
      mblnr                                              as Mblnr,

      @EndUserText.label: '자재문서연도'
      mjahr                                              as Mjahr,

      @EndUserText.label: '입고전기일'
      budat_gr                                           as BudatGr,

      @EndUserText.label: '회계문서번호'
      belnr_gr                                           as BelnrGr,

      @EndUserText.label: '회계연도'
      gjahr_gr                                           as GjahrGr,

      @EndUserText.label: '취소문서번호'
      smbln_gr                                           as SmblnGr,

      @EndUserText.label: '취소문서연도'
      sjahr_gr                                           as SjahrGr,

      @EndUserText.label: '계약연도'
      reqyr                                              as Reqyr,

      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_REQNO', element: 'Reqno' }}]
      @EndUserText.label: '계약내부번호'
      reqno                                              as Reqno,

      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_REQMU', element: 'Reqmu' }}]
      @EndUserText.label: '관리번호'
      reqmu                                              as Reqmu,

      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_BLINO', element: 'Blino' }}]
      @EndUserText.label: 'B/L내부번호'
      blino                                              as Blino,

      @EndUserText.label: 'B/L연도'
      bliyr                                              as Bliyr,

      @EndUserText.label: '통관예정번호'
      eccno                                              as Eccno,

      @EndUserText.label: '통관예정년도'
      eccyr                                              as Eccyr,

      @EndUserText.label: '통관번호'
      cclno                                              as Cclno,

      @EndUserText.label: '통관연도'
      cclyr                                              as Cclyr,

      @EndUserText.label: '계약일'
      _Reqheader.Reqdt                                   as Reqdt,

      @EndUserText.label: '구매그룹'
      _Reqheader.Ekgrp                                   as Ekgrp,

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

      @ObjectModel.text.element: ['Lifnrt']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_LIFNR', element: 'Lifnr' }}]
      @EndUserText.label: '공급업체'
      lifnr                                              as Lifnr,

      @EndUserText.label: '공급업체명'
      _BusinessPartner.BusinessPartnerName               as Lifnrt,

      @EndUserText.label: '헤더텍스트'
      bktxt                                              as Bktxt,

      @EndUserText.label: '통관기준 입고완료'
      grche                                              as Grche,

      @ObjectModel.text.element: ['Cclift']
      @EndUserText.label: '세관'
      _Asim0070n.Cclif                                   as Cclif,

      @EndUserText.label: '세관명'
      _Asim0070n.Cclift                                  as Cclift,


      @EndUserText.label: '수입신고번호'
      _Asim0070n.Decno                                   as Decno,

      @EndUserText.label: '신고일'
      _Asim0070n.Decdt                                   as Decdt,

      @EndUserText.label: '반입일'
      _Asim0070n.Ccldt                                   as Ccldt,

      @ObjectModel.text.element: ['Ccpert']
      @EndUserText.label: '신고인'
      _Asim0070n.Ccper                                   as Ccper,

      @EndUserText.label: '신고인명'
      _Asim0070n.Ccpert                                  as Ccpert,

      @Semantics.amount.currencyCode : 'Ccwae'
      @EndUserText.label: '총과세가격'
      _Asim0070n.Ccamt                                   as Ccamt,

      @Semantics.amount.currencyCode : 'Ccwaek'
      @EndUserText.label: '총과세가격(환화)'
      _Asim0070n.Ccamtk                                  as Ccamtk,

      @Semantics.amount.currencyCode : 'Ccwaek'
      @EndUserText.label: '관세'
      _Asim0070n.Ccvat1                                  as Ccvat1,

      @Semantics.amount.currencyCode : 'Ccwaek'
      @EndUserText.label: '수입부가세'
      _Asim0070n.Ccvat2                                  as Ccvat2,

      @Semantics.amount.currencyCode : 'Ccwaek'
      @EndUserText.label: '과세 표준액(현지 통화)'
      _Asim0070n.Hwbas                                   as Hwbas,


      @ObjectModel.filter.enabled: false
      @EndUserText.label: '통화 키'
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_CurrencyStdVH', element: 'Currency' }}]
      _Asim0070n.Ccwae                                   as Ccwae,

      @EndUserText.label: '현지통화'
      _Asim0070n.Ccwaek                                  as Ccwaek,

      @EndUserText.label: '통관환율'
      _Asim0070n.Ccrsf                                   as Ccrsf,

      @EndUserText.label: '접수일'
      _Asim0070n.Ccdat1                                  as Ccdat1,

      @EndUserText.label: '수리일'
      _Asim0070n.Ccdat2                                  as Ccdat2,

      @EndUserText.label: '검사(반입)장소'
      _Asim0070n.Cclog                                   as Cclog,

      @EndUserText.label: '환적모선'
      _Asim0070n.Ccmos                                   as Ccmos,

      @EndUserText.label: '환적모선명'
      _Asim0070n.Ccmost                                  as Ccmost,

      @ObjectModel.text.element: ['Cclgortt']
      @EndUserText.label: '보세창고'
      _Asim0070n.Cclgort                                 as Cclgort,

      @EndUserText.label: '보세창고명'
      _Asim0070n.Cclgortt                                as Cclgortt,

      @EndUserText.label: '통관비고'
      _Asim0070n.Ccltx                                   as Ccltx,

      @EndUserText.label: '구매문서번호'
      _Asim0070n.Ebeln                                   as Ebeln,

      @EndUserText.label: 'B/L번호'
      _Asim0070n.Bleno                                   as Bleno,

      @EndUserText.label: 'B/L발행일'
      _Asim0070n.Bldat                                   as Bldat,

      @EndUserText.label: '입항일'
      _Asim0070n.Bleta                                   as Bleta,

      @EndUserText.label: '선적일'
      _Asim0070n.Bletd                                   as Bletd,

      @EndUserText.label: 'ETD'
      _Asim0070n.Rqetd                                   as Rqetd,

      @EndUserText.label: 'ETA'
      _Asim0070n.Rqeta                                   as Rqeta,

      @EndUserText.label: '만기일수'
      _Asim0070n.Bld1t                                   as Bld1t,

      @EndUserText.label: '인수만기일'
      _Asim0070n.Bledt                                   as Bledt,

      @EndUserText.label: '선적서류접수일'
      _Asim0070n.Bldat2                                  as Bldat2,

      @EndUserText.label: '입고예정일'
      _Asim0070n.Blgrd                                   as Blgrd,

      @EndUserText.label: '총중량'
      _Asim0070n.Brgew                                   as Brgew,

      @EndUserText.label: '순중량'
      _Asim0070n.Negew                                   as Negew,

      @EndUserText.label: '중량단위'
      _Asim0070n.Gewei                                   as Gewei,

      @EndUserText.label: 'L/G번호'
      _Asim0070n.Lgnum                                   as Lgnum,

      @EndUserText.label: '컨테이너번호'
      _Asim0070n.Cntno                                   as Cntno,

      @ObjectModel.text.element: ['Mosnot']
      @EndUserText.label: '모선번호'
      _Asim0070n.Mosno                                   as Mosno,

      @EndUserText.label: '모선번호명'
      _Asim0070n.Mosnot                                  as Mosnot,

      @EndUserText.label: 'B/L총금액'
      @Semantics.amount.currencyCode : 'Waers'
      _Asim0070n.Blamt                                   as Blamt,

      @EndUserText.label: 'B/L통화키'
      _Asim0070n.Waers                                   as Waers,

      @EndUserText.label: 'B/L Text'
      _Asim0070n.Blitx                                   as Blitx,

      @EndUserText.label: '납품완료체크'
      _Asim0070n.Blche                                   as Blche,

      @EndUserText.label: '검역여부'
      _Asim0070n.Eccgb                                   as Eccgb,

      @ObjectModel.text.element: ['Lifret']
      @EndUserText.label: '공급처'
      _Asim0070n.Lifre                                   as Lifre,

      @EndUserText.label: '공급처명'
      _Asim0070n.Lifret                                  as Lifret,

      @ObjectModel.text.element: ['Inco1t']
      @EndUserText.label: '인도조건'
      _Asim0070n.Inco1                                   as Inco1,

      @EndUserText.label: '인도조건명'
      _Asim0070n.Inco1t                                  as Inco1t,

      @EndUserText.label: '인도처'
      _Asim0070n.Inco2                                   as Inco2,

      @ObjectModel.text.element: ['Ztermt']
      @EndUserText.label: '지급조건'
      _Asim0070n.Zterm                                   as Zterm,

      @EndUserText.label: '지급조건명'
      _Asim0070n.Ztermt                                  as Ztermt,

      @ObjectModel.text.element: ['Zcdno1t']
      @EndUserText.label: '도착지'
      _Asim0070n.Zcdno1                                  as Zcdno1,

      @EndUserText.label: '도착지명'
      _Asim0070n.Zcdno1t                                 as Zcdno1t,

      @ObjectModel.text.element: ['Zcdno2t']
      @EndUserText.label: '운송수단'
      _Asim0070n.Zcdno2                                  as Zcdno2,

      @EndUserText.label: '운송수단명'
      _Asim0070n.Zcdno2t                                 as Zcdno2t,

      @ObjectModel.text.element: ['Zcdno3t']
      @EndUserText.label: '선적지'
      _Asim0070n.Zcdno3                                  as Zcdno3,

      @EndUserText.label: '선적지명'
      _Asim0070n.Zcdno3t                                 as Zcdno3t,

      @ObjectModel.text.element: ['Zcdno4t']
      @EndUserText.label: '운송형태'
      _Asim0070n.Zcdno4                                  as Zcdno4,

      @EndUserText.label: '운송형태명'
      _Asim0070n.Zcdno4t                                 as Zcdno4t,

      @EndUserText.label: '총금액'
      @Semantics.amount.currencyCode : 'Waers'
      _Asim0070n.Netwr                                   as Netwr,

      @EndUserText.label: 'L/C오픈일'
      _Asim0070n.Opdat                                   as Opdat,

      @ObjectModel.text.element: ['Opbnkt']
      @EndUserText.label: '개설은행'
      _Asim0070n.Opbnk                                   as Opbnk,

      @EndUserText.label: '개설은행명'
      _Asim0070n.Opbnkt                                  as Opbnkt,

      @EndUserText.label: 'L/C번호'
      _Asim0070n.Opnum                                   as Opnum,

      @EndUserText.label: 'L/C오픈금액'
      @Semantics.amount.currencyCode : 'Opwrs'
      _Asim0070n.Opamt                                   as Opamt,

      @EndUserText.label: '통화 키'
      _Asim0070n.Opwrs                                   as Opwrs,

      @ObjectModel.text.element: ['Ptermt']
      @EndUserText.label: '결제조건'
      _Asim0070n.Pterm                                   as Pterm,

      @EndUserText.label: '결제조건명'
      _Asim0070n.Ptermt                                  as Ptermt,

      @EndUserText.label: '결제조건일수'
      _Asim0070n.Zbd1t                                   as Zbd1t,

      @EndUserText.label: '결제예정일'
      _Asim0070n.Pedat                                   as Pedat,

      @EndUserText.label: '결제일'
      _Asim0070n.Pdate                                   as Pdate,

      @EndUserText.label: '오픈예정일'
      _Asim0070n.Oedat                                   as Oedat,

      @ObjectModel.text.element: ['Oplift']
      @EndUserText.label: '오픈처'
      _Asim0070n.Oplif                                   as Oplif,

      @EndUserText.label: '오픈처명'
      _Asim0070n.Oplift                                  as Oplift,

      @EndUserText.label: 'Sdate'
      _Asim0070n.Sdate                                   as Sdate,

      @EndUserText.label: 'Edate'
      _Asim0070n.Edate                                   as Edate,

      @ObjectModel.text.element: ['Colift']
      @EndUserText.label: '실계약처'
      _Asim0070n.Colif                                   as Colif,

      @EndUserText.label: '실계약처명'
      _Asim0070n.Colift                                  as Colift,

      @ObjectModel.text.element: ['Filift']
      @EndUserText.label: '파이낸스'
      _Asim0070n.Filif                                   as Filif,

      @EndUserText.label: '파이낸스명'
      _Asim0070n.Filift                                  as Filift,

      @EndUserText.label: '계약번호1'
      _Asim0070n.Cont1                                   as Cont1,

      @EndUserText.label: '계약번호2'
      _Asim0070n.Cont2                                   as Cont2,

      @EndUserText.label: '접수일'
      _Asim0070n.Acdat                                   as Acdat,

      @EndUserText.label: 'BOOKING No.'
      _Asim0070n.Bokno                                   as Bokno,

      @ObjectModel.text.element: ['Conrtt']
      @EndUserText.label: '계약유형'
      _Asim0070n.Conrt                                   as Conrt,

      @EndUserText.label: '계약유형명'
      _Asim0070n.Conrt                                   as Conrtt,

      @EndUserText.label: '양도일(수입대행)'
      _Asim0070n.Trdat                                   as Trdat,

      @EndUserText.label: 'B/L번호(수입대행)'
      _Asim0070n.Trbln                                   as Trbln,

      @EndUserText.label: '개설환율'
      _Asim0070n.Rqrsf                                   as Rqrsf,

      @EndUserText.label: '부보환율'
      _Asim0070n.Bbrsf                                   as Bbrsf,

      @EndUserText.label: '부보대상금액'
      @Semantics.amount.currencyCode : 'Bbwrs'
      _Asim0070n.Bbamt                                   as Bbamt,

      @ObjectModel.filter.enabled: false
      @EndUserText.label: '통화 키'
      _Asim0070n.Bbwrs                                   as Bbwrs,

      @EndUserText.label: '부보일'
      _Asim0070n.Bbdat                                   as Bbdat,

      @ObjectModel.text.element: ['Bbgbt']
      @EndUserText.label: '보험조건'
      _Asim0070n.Bbgb                                    as Bbgb,

      @EndUserText.label: '보험조건명'
      _Asim0070n.Bbgbt                                   as Bbgbt,

      @EndUserText.label: '계약완료'
      _Asim0070n.Rqche                                   as Rqche,

      @EndUserText.label: '인수일'
      _Asim0070n.Isdat                                   as Isdat,

      @EndUserText.label: '주차(오퍼)'
      _Asim0070n.Rqweek                                  as Rqweek,

      @EndUserText.label: '보험증권번호'
      _Asim0070n.Bbno                                    as Bbno,

      @ObjectModel.text.element: ['Bblift']
      @EndUserText.label: '보험회사'
      _Asim0070n.Bblif                                   as Bblif,

      @EndUserText.label: '보험회사명'
      _Asim0070n.Bblift                                  as Bblift,

      @ObjectModel.filter.enabled: false
      @EndUserText.label: '부보 Basic Rate'
      _Asim0070n.Bbrate                                  as Bbrate,

      @ObjectModel.filter.enabled: false
      @EndUserText.label: 'Remark'
      _Asim0070n.Remak                                   as Remak,

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

      return_msg                                         as ReturnMsg,

      @EndUserText.label: '부대비참조구분'
      cast('D' as abap.char(12))                         as Feegb,

      @EndUserText.label: '참조문서구분'
      cast('입고참조' as abap.char(40))                      as Feegbt,
      
      @EndUserText.label: '부대비 참조문서번호'
      mblnr as Gbno,

      _Item,
      _Reqheader
}

where
  loekz = ''

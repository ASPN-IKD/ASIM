@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입B/L 헤더 인터페이스 뷰'
/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ]  } */
define root view entity YI_ASIM0030N
  as select from zasimt0030n
  composition [1..*] of YI_ASIM0041N as _Item
  association [1..1] to YI_ASIM0010N as _asim0010n on  $projection.Reqno = _asim0010n.Reqno
                                                   and $projection.Reqyr = _asim0010n.Reqyr
                                                   and $projection.Reqmu = _asim0010n.Reqmu
  association [0..1] to YI_ASIM0001N as _mosno     on  $projection.Mosno =    _mosno.Zcdno
                                                   and _mosno.Zcode      like '%MOSNO'
                                                   and _mosno.Zcdno      <>   '00'
{
      @ObjectModel.filter.enabled: false
  key uuid                                     as Uuid,

      @UI:{ lineItem: [{ position: 10 }],
            selectionField: [{ position: 10 }] }
      @EndUserText.label: 'B/L연도'
      bliyr                                    as Bliyr,

      @UI:{lineItem: [{ position: 20 }],
      selectionField: [{position: 20}] }
      @EndUserText.label: 'B/L내부번호'
      blino                                    as Blino,

      @EndUserText.label: '계약연도'
      reqyr                                    as Reqyr,

      @EndUserText.label: '계약내부번호'
      reqno                                    as Reqno,

      @EndUserText.label: '관리번호'
      reqmu                                    as Reqmu,

      @EndUserText.label: '구매문서번호'
      ebeln                                    as Ebeln,

      @ObjectModel.text.element: ['Bukrst']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_BUKRS', element: 'Bukrs' }}
      ]
      @EndUserText.label: '회사코드'
      bukrs                                    as Bukrs,

      @EndUserText.label: '회사코드명'
      _asim0010n.Bukrst                        as Bukrst,

      @EndUserText.label: '구매조직'
      ekorg                                    as Ekorg,

      @EndUserText.label: '구매조직명'
      _asim0010n.Ekorgt                        as Ekorgt,

      @ObjectModel.text.element: ['Ekgrpt']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_EKGRP', element: 'Ekgrp' }}
      ]
      @EndUserText.label: '구매그룹'
      ekgrp                                    as Ekgrp,

      @EndUserText.label: '구매그룹명'
      _asim0010n.Ekgrpt                        as Ekgrpt,

      @ObjectModel.text.element: ['Lifnrt']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_LIFNR', element: 'Lifnr' }}
      ]
      @EndUserText.label: '공급업체'
      lifnr                                    as Lifnr,

      @EndUserText.label: '공급업체명'
      _asim0010n.Lifnrt                        as Lifnrt,

      @EndUserText.label: '삭제지시자'
      loekz                                    as Loekz,

      @EndUserText.label: '요청일'
      _asim0010n.Reqdt                         as Reqdt,

      @EndUserText.label: 'B/L번호'
      bleno                                    as Bleno,

      @EndUserText.label: 'B/L발행일'
      bldat                                    as Bldat,

      @EndUserText.label: '입항일'
      bleta                                    as Bleta,

      @EndUserText.label: '선적일'
      bletd                                    as Bletd,

      @EndUserText.label: 'ETD'
      rqetd                                    as Rqetd,

      @EndUserText.label: 'ETA'
      rqeta                                    as Rqeta,

      @EndUserText.label: '만기일수'
      bld1t                                    as Bld1t,

      @EndUserText.label: '인수만기일'
      bledt                                    as Bledt,

      @EndUserText.label: '선적서류접수일'
      bldat2                                   as Bldat2,

      @EndUserText.label: '입고예정일'
      blgrd                                    as Blgrd,

      @EndUserText.label: '총중량'
      @Semantics.quantity.unitOfMeasure: 'Gewei'
      brgew                                    as Brgew,
      @EndUserText.label: '순중량'
      @Semantics.quantity.unitOfMeasure: 'Gewei'
      negew                                    as Negew,
      @EndUserText.label: '중량단위'
      gewei                                    as Gewei,

      @EndUserText.label: 'L/G번호'
      lgnum                                    as Lgnum,

      @EndUserText.label: '컨테이너번호'
      cntno                                    as Cntno,

      @ObjectModel.text.element: ['Mosnot']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_MOSNO', element: 'Cdno' }}
      ]
      @EndUserText.label: '모선번호'
      mosno                                    as Mosno,

      @EndUserText.label: '모선번호명'
      _mosno.Ztext                             as Mosnot,

      @EndUserText.label: 'B/L총금액'
      @Semantics.amount.currencyCode : 'Waers'
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_CurrencyStdVH', element: 'Currency' }}]
      blamt                                    as Blamt,

      @EndUserText.label: '통화키'
      waers                                    as Waers,

      @EndUserText.label: 'B/L Text'
      blitx                                    as Blitx,

      @EndUserText.label: '납품완료체크'
      blche                                    as Blche,

      @EndUserText.label: '검역여부'
      eccgb                                    as Eccgb,

      @ObjectModel.text.element: ['Lifret']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_LIFRE', element: 'Cdno' }}
      ]
      @EndUserText.label: '공급처'
      _asim0010n.Lifre                         as Lifre,

      @EndUserText.label: '공급처명'
      _asim0010n.Lifret                        as Lifret,

      @ObjectModel.text.element: ['Inco1t']
      @EndUserText.label: '인도조건'
      _asim0010n.Inco1                         as Inco1,

      @EndUserText.label: '인도조건명'
      _asim0010n.Inco1t                        as Inco1t,

      @EndUserText.label: '인도처'
      _asim0010n.Inco2                         as Inco2,

      @ObjectModel.text.element: ['Ztermt']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_ZTERM', element: 'Cdno' }}
      ]
      @EndUserText.label: '지급조건'
      _asim0010n.Zterm                         as Zterm,

      @EndUserText.label: '지급조건명'
      _asim0010n.Ztermt                        as Ztermt,

      @ObjectModel.text.element: ['Zcdno1t']
      @EndUserText.label: '도착지'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO1', element: 'Cdno' }}]
      _asim0010n.Zcdno1                        as Zcdno1,

      @EndUserText.label: '도착지명'
      _asim0010n.Zcdno1t                       as Zcdno1t,

      @ObjectModel.text.element: ['Zcdno2t']
      @EndUserText.label: '운송수단'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO2', element: 'Cdno' }}]
      _asim0010n.Zcdno2                        as Zcdno2,

      @EndUserText.label: '운송수단명'
      _asim0010n.Zcdno2t                       as Zcdno2t,

      @ObjectModel.text.element: ['Zcdno3t']
      @EndUserText.label: '선적지'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO3', element: 'Cdno' }}]
      _asim0010n.Zcdno3                        as Zcdno3,

      @EndUserText.label: '선적지명'
      _asim0010n.Zcdno3t                       as Zcdno3t,

      @ObjectModel.text.element: ['Zcdno4t']
      @EndUserText.label: '운송형태'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO4', element: 'Cdno' }}]
      _asim0010n.Zcdno4                        as Zcdno4,

      @EndUserText.label: '운송형태명'
      _asim0010n.Zcdno4t                       as Zcdno4t,

      @EndUserText.label: '총금액'
      @Semantics.amount.currencyCode : 'Waers'
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_CurrencyStdVH', element: 'Currency' }}]
      _asim0010n.Netwr                         as Netwr,

      @EndUserText.label: 'L/C오픈일'
      _asim0010n.Opdat                         as Opdat,

      @ObjectModel.text.element: ['Opbnkt']
      @EndUserText.label: '개설은행'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_OPBNK', element: 'Cdno' }}]
      _asim0010n.Opbnk                         as Opbnk,

      @EndUserText.label: '개설은행명'
      _asim0010n.Opbnkt                        as Opbnkt,

      @EndUserText.label: 'L/C번호'
      _asim0010n.Opnum                         as Opnum,

      @EndUserText.label: 'L/C오픈금액'
      @Semantics.amount.currencyCode : 'Opwrs'
      _asim0010n.Opamt                         as Opamt,

      @EndUserText.label: '통화 키'
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_CurrencyStdVH', element: 'Currency' }}]
      _asim0010n.Opwrs                         as Opwrs,

      @ObjectModel.text.element: ['Ptermt']
      @EndUserText.label: '결제조건'
      _asim0010n.Pterm                         as Pterm,

      @EndUserText.label: '결제조건명'
      _asim0010n.Ptermt                        as Ptermt,

      @EndUserText.label: '결제조건일수'
      _asim0010n.Zbd1t                         as Zbd1t,

      @EndUserText.label: '결제예정일'
      _asim0010n.Pedat                         as Pedat,

      @EndUserText.label: '결제일'
      _asim0010n.Pdate                         as Pdate,

      @EndUserText.label: '오픈예정일'
      _asim0010n.Oedat                         as Oedat,

      @ObjectModel.text.element: ['Oplift']
      @EndUserText.label: '오픈처'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_OPLIF', element: 'Cdno' }}]
      _asim0010n.Oplif                         as Oplif,

      @EndUserText.label: '오픈처명'
      _asim0010n.Oplift                        as Oplift,

      @EndUserText.label: 'Sdate'
      _asim0010n.Sdate                         as Sdate,

      @EndUserText.label: 'Edate'
      _asim0010n.Edate                         as Edate,

      @ObjectModel.text.element: ['Colift']
      @EndUserText.label: '실계약처'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_COLIF', element: 'Cdno' }}]
      _asim0010n.Colif                         as Colif,

      @EndUserText.label: '실계약처명'
      _asim0010n.Colift                        as Colift,

      @ObjectModel.text.element: ['Filift']
      @EndUserText.label: '파이낸스'
      _asim0010n.Filif                         as Filif,

      @EndUserText.label: '파이낸스명'
      _asim0010n.Filift                        as Filift,

      @EndUserText.label: '계약번호1'
      //@Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_CONT1', element: 'Cdno' }}]
      _asim0010n.Cont1                         as Cont1,

      @EndUserText.label: '계약번호2'
      _asim0010n.Cont2                         as Cont2,

      @EndUserText.label: '접수일'
      _asim0010n.Acdat                         as Acdat,

      @EndUserText.label: 'BOOKING No.'
      _asim0010n.Bokno                         as Bokno,

      @ObjectModel.text.element: ['Conrtt']
      @EndUserText.label: '계약유형'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_CONRT', element: 'Cdno' }}]
      _asim0010n.Conrt                         as Conrt,

      @EndUserText.label: '계약유형명'
      _asim0010n.Conrtt                        as Conrtt,

      @EndUserText.label: '양도일(수입대행)'
      _asim0010n.Trdat                         as Trdat,

      @EndUserText.label: 'B/L번호(수입대행)'
      _asim0010n.Trbln                         as Trbln,

      @EndUserText.label: '개설환율'
      _asim0010n.Rqrsf                         as Rqrsf,

      @EndUserText.label: '부보환율'
      _asim0010n.Bbrsf                         as Bbrsf,

      @EndUserText.label: '부보대상금액'
      @Semantics.amount.currencyCode : 'Bbwrs'
      _asim0010n.Bbamt                         as Bbamt,

      @ObjectModel.filter.enabled: false
      @EndUserText.label: '통화 키'
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_CurrencyStdVH', element: 'Currency' }}]
      _asim0010n.Bbwrs                         as Bbwrs,

      @EndUserText.label: '부보일'
      _asim0010n.Bbdat                         as Bbdat,

      @ObjectModel.text.element: ['Bbgbt']
      @EndUserText.label: '보험조건'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_BBGB', element: 'Cdno' }}]
      _asim0010n.Bbgb                          as Bbgb,

      @EndUserText.label: '보험조건명'
      _asim0010n.Bbgbt                         as Bbgbt,

      @EndUserText.label: '계약완료'
      _asim0010n.Rqche                         as Rqche,

      @EndUserText.label: '인수일'
      _asim0010n.Isdat                         as Isdat,

      @EndUserText.label: '주차(오퍼)'
      _asim0010n.Rqweek                        as Rqweek,

      @EndUserText.label: '보험증권번호'
      _asim0010n.Bbno                          as Bbno,

      @ObjectModel.text.element: ['Bblift']
      @EndUserText.label: '보험회사'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_BBLIF', element: 'Cdno' }}]
      _asim0010n.Bblif                         as Bblif,

      @EndUserText.label: '보험회사명'
      _asim0010n.Bblift                        as Bblift,

      @ObjectModel.filter.enabled: false
      @EndUserText.label: '부보 Basic Rate'
      _asim0010n.Bbrate                        as Bbrate,

      @ObjectModel.filter.enabled: false
      @EndUserText.label: 'Remark'
      _asim0010n.Remak                         as Remak,

      @EndUserText.label: '참조구분'
      created_type                             as CreatedType,

      @EndUserText.label: '생성자'
      @Semantics.user.createdBy: true
      created_by                               as CreatedBy,
      @EndUserText.label: '생성일'
      @Semantics.systemDateTime.createdAt: true
      created_at                               as CreatedAt,
      @EndUserText.label: '최종 변경자'
      @Semantics.user.lastChangedBy: true
      last_changed_by                          as LastChangedBy,
      @EndUserText.label: '최종 변경일'
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at                          as LastChangedAt,
      @EndUserText.label: '인스턴스 변경시간'
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at                    as LocalLastChangedAt,

      return_msg                               as ReturnMsg,

      @EndUserText.label: '부대비참조구분'
      cast('B' as abap.char(12))               as Feegb,

      @EndUserText.label: '참조문서구분'
      cast('B/L참조' as abap.char(40))           as Feegbt,
      
      @EndUserText.label: '부대비 참조문서번호'
      blino as Gbno,

      @EndUserText.label: '후속문서구분'
      @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_ASIM0010_FL'
      cast('' as abap_boolean preserving type) as ChkFollow,

      //Association
      _Item

}
where
  loekz = ''

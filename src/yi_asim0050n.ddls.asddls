@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입 I/V 헤더 인터페이스 뷰'
/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ]  } */
define root view entity YI_ASIM0050N
  as select from zasimt0050n as _Asim0050n

  composition [1..*] of YI_ASIM0061N             as _Item

  association [0..1] to YI_ASIM0030N             as _Asim0030n              on  _Asim0030n.Blino = _Asim0050n.blino
                                                                            and _Asim0030n.Bliyr = _Asim0050n.bliyr
                                                                            and _Asim0050n.ivgb  = 'B'
  association [0..1] to YI_ASIM0010N             as _Asim0010n              on  _Asim0010n.Reqno = _Asim0050n.reqno
                                                                            and _Asim0010n.Reqyr = _Asim0050n.reqyr
  //and _Asim0050n.ivgb  = 'A'
  association [1..1] to I_CompanyCode            as _CompanyCode            on  $projection.Bukrs = _CompanyCode.CompanyCode
  association [1..1] to I_PurchasingOrganization as _PurchasingOrganization on  $projection.Ekorg = _PurchasingOrganization.PurchasingOrganization
  association [0..1] to I_PurchasingGroup        as _PurchasingGroup        on  $projection.Ekgrp = _PurchasingGroup.PurchasingGroup
  association [1..1] to I_BusinessPartner        as _BusinessPartner        on  $projection.Ivlif = _BusinessPartner.BusinessPartner

  association [0..1] to YI_ASIM0001N             as _Zterm                  on  $projection.Iverm =    _Zterm.Zcdno
                                                                            and _Zterm.Zcode      like '%ZTERM'
                                                                            and _Zterm.Zcdno      <>   '00'
  association [0..1] to YI_ASIM0001N             as _Zlsch                  on  $projection.Zlsch =    _Zlsch.Zcdno
                                                                            and _Zlsch.Zcode      like '%ZLSCH'
                                                                            and _Zlsch.Zcdno      <>   '00'
  association [0..1] to YI_ASIM0001N             as _Mwskz                  on  $projection.Mwskz =    _Mwskz.Zcdno
                                                                            and _Mwskz.Zcode      like '%MWSKZ'
                                                                            and _Mwskz.Zcdno      <>   '00'
  association [0..1] to YI_ASIM0001N             as _Ivgb                   on  $projection.Ivgb =    _Ivgb.Zcdno
                                                                            and _Ivgb.Zcode      like '%IVGB'
                                                                            and _Ivgb.Zcdno      <>   '00'
{
      @ObjectModel.filter.enabled: false
  key _Asim0050n.uuid                                                                                                                                      as Uuid,

      @EndUserText.label: '송장문서번호'
      _Asim0050n.belnr                                                                                                                                     as Belnr,

      @EndUserText.label: '회계연도'
      _Asim0050n.gjahr                                                                                                                                     as Gjahr,

      @EndUserText.label: '전기일'
      _Asim0050n.budat_iv                                                                                                                                  as BudatIv,

      @EndUserText.label: '회계전표번호'
      _Asim0050n.belnr_fi                                                                                                                                  as BelnrFi,

      @EndUserText.label: '역분개문서번호'
      _Asim0050n.stblg                                                                                                                                     as Stblg,

      @EndUserText.label: '역분개회계연도'
      _Asim0050n.stjah                                                                                                                                     as Stjah,

      @EndUserText.label: '계약연도'
      _Asim0050n.reqyr                                                                                                                                     as Reqyr,


      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_REQNO', element: 'Reqno' }}]
      @EndUserText.label: '계약내부번호'
      _Asim0050n.reqno                                                                                                                                     as Reqno,

      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_REQMU', element: 'Reqmu' }}]
      @EndUserText.label: '관리번호'
      _Asim0050n.reqmu                                                                                                                                     as Reqmu,

      @EndUserText.label: 'B/L연도'
      _Asim0050n.bliyr                                                                                                                                     as Bliyr,

      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_BLINO', element: 'Blino' }}]
      @EndUserText.label: 'B/L내부번호'
      _Asim0050n.blino                                                                                                                                     as Blino,

      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_BUKRS', element: 'Bukrs'} }]
      @ObjectModel.text.element: ['Bukrst']
      @EndUserText.label: '회사코드'
      _Asim0050n.bukrs                                                                                                                                     as Bukrs,

      @EndUserText.label: '회사코드명'
      _CompanyCode.CompanyCodeName                                                                                                                         as Bukrst,

      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_EKORG', element: 'Ekorg'} }]
      @ObjectModel.text.element: ['Ekorgt']
      @EndUserText.label: '구매조직'
      _Asim0050n.ekorg                                                                                                                                     as Ekorg,

      @EndUserText.label: '구매조직명'
      _PurchasingOrganization.PurchasingOrganizationName                                                                                                   as Ekorgt,


      @ObjectModel.text.element: ['Ekgrpt']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_EKGRP', element: 'Ekgrp' }}
      ]
      @EndUserText.label: '구매그룹'
      _Asim0030n.Ekgrp                                                                                                                                     as Ekgrp,

      @EndUserText.label: '구매그룹명'
      _Asim0030n.Ekgrpt                                                                                                                                    as Ekgrpt,

      @ObjectModel.text.element: ['Lifnrt']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_LIFNR', element: 'Lifnr' }}
      ]
      @EndUserText.label: '공급업체'
      _Asim0010n.Lifnr                                                                                                                                     as Lifnr,

      @EndUserText.label: '공급업체명'
      _Asim0010n.Lifnrt                                                                                                                                    as Lifnrt,

      @ObjectModel.text.element: ['Ivlift']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_IVLIF', element: 'Ivlif' }, additionalBinding: [{ element: 'PurchaseOrderCurrency', localElement: 'Ivwae', usage: #RESULT }]}
      ]
      @EndUserText.label: '지급처'
      _Asim0050n.ivlif                                                                                                                                     as Ivlif,

      @EndUserText.label: '지급처명'
      _BusinessPartner.BusinessPartnerName                                                                                                                 as Ivlift,

      @EndUserText.label: 'B/L번호'
      _Asim0050n.bleno                                                                                                                                     as Bleno,

      @EndUserText.label: '수입신고번호'
      _Asim0050n.decno                                                                                                                                     as Decno,

      @Semantics.amount.currencyCode : 'Ivwae'
      @EndUserText.label: '공급가액'
      _Asim0050n.rmwwr                                                                                                                                     as Rmwwr,

      @Semantics.amount.currencyCode : 'Ivwae'
      @EndUserText.label: '총송장금액'
      _Asim0050n.ivamt                                                                                                                                     as Ivamt,

      @Semantics.amount.currencyCode : 'Ivwae'
      @EndUserText.label: '세액'
      _Asim0050n.wmwst1                                                                                                                                    as Wmwst1,

      @EndUserText.label: '통화키'
      _Asim0050n.ivwae                                                                                                                                     as Ivwae,

      @EndUserText.label: '환율'
      _Asim0050n.kursf                                                                                                                                     as Kursf,

      @EndUserText.label: 'Invoice No.'
      _Asim0050n.invno                                                                                                                                     as Invno,

      @ObjectModel.text.element: ['Ivermt']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_ZTERM', element: 'Cdno' }}
      ]
      @EndUserText.label: '지급조건'
      _Asim0050n.iverm                                                                                                                                     as Iverm,

      @EndUserText.label: '지급조건명'
      _Zterm.Ztext                                                                                                                                         as Ivermt,

      @ObjectModel.text.element: ['Zlscht']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_ZLSCH', element: 'Cdno' }}
      ]
      @EndUserText.label: '지급방법'
      _Asim0050n.zlsch                                                                                                                                     as Zlsch,

      @EndUserText.label: '지급방법명'
      _Zlsch.Ztext                                                                                                                                         as Zlscht,

      @EndUserText.label: '만기기준일'
      _Asim0050n.zfbdt                                                                                                                                     as Zfbdt,

      @EndUserText.label: '결제조건일수'
      _Asim0050n.zbd1t                                                                                                                                     as Zbd1t,

      @EndUserText.label: '만기일'
      //_Asim0050n.fbedt                                   as Fbedt,
      case when _Asim0050n.fbedt is null or _Asim0050n.fbedt = '00000000' then
      dats_add_days(_Asim0010n.Pdate,cast(cast(cast(_Asim0050n.zbd1t as abap.char(5)) as abap.numc(5)) as abap.int4),'INITIAL') else _Asim0050n.fbedt  end as Fbedt,

      @ObjectModel.text.element: ['Mwskzt']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_MWSKZ', element: 'Cdno' },
      additionalBinding: [{ localElement: 'TaxRate', element: 'TaxRate' , usage: #RESULT }]
      }]
      @EndUserText.label: '세금코드'
      _Asim0050n.mwskz                                                                                                                                     as Mwskz,

      @EndUserText.label: '세금코드명'
      _Mwskz.Ztext                                                                                                                                         as Mwskzt,

      cast('' as abap.char(40))                                                                                                                            as TaxRate,

      @EndUserText.label: '전표헤더텍스트'
      _Asim0050n.bktxt                                                                                                                                     as Bktxt,

      @EndUserText.label: '품목텍스트'
      _Asim0050n.sgtxt                                                                                                                                     as Sgtxt,

      @EndUserText.label: '클레임'
      _Asim0050n.clgb                                                                                                                                      as Clgb,

      //      @ObjectModel.text.element: ['Ivgbt']
      //      @Consumption.valueHelpDefinition: [
      //      {entity: {name: 'ZASIMV_IVGB', element: 'Cdno' }}
      //      ]
      @EndUserText.label: '물품대참조구분'
      _Asim0050n.ivgb                                                                                                                                      as Ivgb,

      @EndUserText.label: '물품대참조명'
      _Ivgb.Ztext                                                                                                                                          as Ivgbt,

      @EndUserText.label: 'B/L발행일'
      _Asim0030n.Bldat                                                                                                                                     as Bldat,

      @EndUserText.label: '입항일'
      _Asim0030n.Bleta                                                                                                                                     as Bleta,

      @EndUserText.label: '선적일'
      _Asim0030n.Bletd                                                                                                                                     as Bletd,

      @EndUserText.label: 'ETD'
      _Asim0030n.Rqetd                                                                                                                                     as Rqetd,

      @EndUserText.label: 'ETA'
      _Asim0030n.Rqeta                                                                                                                                     as Rqeta,

      @EndUserText.label: '만기일수'
      _Asim0030n.Bld1t                                                                                                                                     as Bld1t,

      @EndUserText.label: '인수만기일'
      _Asim0030n.Bledt                                                                                                                                     as Bledt,

      @EndUserText.label: '선적서류접수일'
      _Asim0030n.Bldat2                                                                                                                                    as Bldat2,

      @EndUserText.label: '입고예정일'
      _Asim0030n.Blgrd                                                                                                                                     as Blgrd,

      @EndUserText.label: '총중량'
      _Asim0030n.Brgew                                                                                                                                     as Brgew,

      @EndUserText.label: '순중량'
      _Asim0030n.Negew                                                                                                                                     as Negew,

      @EndUserText.label: '중량단위'
      _Asim0030n.Gewei                                                                                                                                     as Gewei,

      @EndUserText.label: 'L/G번호'
      _Asim0030n.Lgnum                                                                                                                                     as Lgnum,

      @EndUserText.label: '컨테이너번호'
      _Asim0030n.Cntno                                                                                                                                     as Cntno,

      @ObjectModel.text.element: ['Mosno']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_MOSNO', element: 'Cdno' }}
      ]
      @EndUserText.label: '모선번호'
      _Asim0030n.Mosno                                                                                                                                     as Mosno,

      @EndUserText.label: '모선번호명'
      _Asim0030n.Mosnot                                                                                                                                    as Mosnot,

      @EndUserText.label: 'B/L총금액'
      @Semantics.amount.currencyCode : 'Waers'
      _Asim0030n.Blamt                                                                                                                                     as Blamt,

      @EndUserText.label: '통화키'
      _Asim0030n.Waers                                                                                                                                     as Waers,

      @EndUserText.label: 'B/L Text'
      _Asim0030n.Blitx                                                                                                                                     as Blitx,

      @EndUserText.label: '납품완료체크'
      _Asim0030n.Blche                                                                                                                                     as Blche,

      @EndUserText.label: '납품완료체크'
      case _Asim0030n.Blche
      when 'X' then 3
      when '' then 1
      else 0
      end                                                                                                                                                  as BlcheStatus,

      @EndUserText.label: '검역여부'
      _Asim0030n.Eccgb                                                                                                                                     as Eccgb,

      @EndUserText.label: '구매문서번호'
      _Asim0030n.Ebeln                                                                                                                                     as Ebeln,

      @EndUserText.label: '요청일'
      _Asim0010n.Reqdt                                                                                                                                     as Reqdt,

      @ObjectModel.text.element: ['Lifret']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_LIFRE', element: 'Cdno' }}
      ]
      @EndUserText.label: '공급처'
      _Asim0010n.Lifre                                                                                                                                     as Lifre,

      @EndUserText.label: '공급처명'
      _Asim0010n.Lifret                                                                                                                                    as Lifret,

      @ObjectModel.text.element: ['Inco1t']
      @EndUserText.label: '인도조건'
      _Asim0010n.Inco1                                                                                                                                     as Inco1,

      @EndUserText.label: '인도조건명'
      _Asim0010n.Inco1t                                                                                                                                    as Inco1t,

      @EndUserText.label: '인도처'
      _Asim0010n.Inco2                                                                                                                                     as Inco2,

      @ObjectModel.text.element: ['Ztermt']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_ZTERM', element: 'Cdno' }}
      ]
      @EndUserText.label: '지급조건'
      _Asim0010n.Zterm                                                                                                                                     as Zterm,

      @EndUserText.label: '지급조건명'
      _Asim0010n.Ztermt                                                                                                                                    as Ztermt,

      @ObjectModel.text.element: ['Zcdno1t']
      @EndUserText.label: '도착지'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO1', element: 'Cdno' }}]
      _Asim0010n.Zcdno1                                                                                                                                    as Zcdno1,

      @EndUserText.label: '도착지명'
      _Asim0010n.Zcdno1t                                                                                                                                   as Zcdno1t,

      @ObjectModel.text.element: ['Zcdno2t']
      @EndUserText.label: '운송수단'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO2', element: 'Cdno' }}]
      _Asim0010n.Zcdno2                                                                                                                                    as Zcdno2,

      @EndUserText.label: '운송수단명'
      _Asim0010n.Zcdno2t                                                                                                                                   as Zcdno2t,

      @ObjectModel.text.element: ['Zcdno3t']
      @EndUserText.label: '선적지'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO3', element: 'Cdno' }}]
      _Asim0010n.Zcdno3                                                                                                                                    as Zcdno3,

      @EndUserText.label: '선적지명'
      _Asim0010n.Zcdno3t                                                                                                                                   as Zcdno3t,

      @ObjectModel.text.element: ['Zcdno4t']
      @EndUserText.label: '운송형태'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO4', element: 'Cdno' }}]
      _Asim0010n.Zcdno4                                                                                                                                    as Zcdno4,

      @EndUserText.label: '운송형태명'
      _Asim0010n.Zcdno4t                                                                                                                                   as Zcdno4t,

      @EndUserText.label: '총금액'
      @Semantics.amount.currencyCode : 'Waers'
      _Asim0010n.Netwr                                                                                                                                     as Netwr,

      @EndUserText.label: 'L/C오픈일'
      _Asim0010n.Opdat                                                                                                                                     as Opdat,

      @ObjectModel.text.element: ['Opbnkt']
      @EndUserText.label: '개설은행'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_OPBNK', element: 'Cdno' }}]
      _Asim0010n.Opbnk                                                                                                                                     as Opbnk,

      @EndUserText.label: '개설은행명'
      _Asim0010n.Opbnkt                                                                                                                                    as Opbnkt,

      @EndUserText.label: 'L/C번호'
      _Asim0010n.Opnum                                                                                                                                     as Opnum,

      @EndUserText.label: 'L/C오픈금액'
      @Semantics.amount.currencyCode : 'Opwrs'
      _Asim0010n.Opamt                                                                                                                                     as Opamt,

      @EndUserText.label: '통화 키'
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_CurrencyStdVH', element: 'Currency' }}]
      _Asim0010n.Opwrs                                                                                                                                     as Opwrs,

      @ObjectModel.text.element: ['Ptermt']
      @EndUserText.label: '결제조건'
      _Asim0010n.Pterm                                                                                                                                     as Pterm,

      @EndUserText.label: '결제조건명'
      _Asim0010n.Ptermt                                                                                                                                    as Ptermt,

      @EndUserText.label: '결제예정일'
      _Asim0010n.Pedat                                                                                                                                     as Pedat,

      @EndUserText.label: '결제일'
      _Asim0010n.Pdate                                                                                                                                     as Pdate,

      @EndUserText.label: '오픈예정일'
      _Asim0010n.Oedat                                                                                                                                     as Oedat,

      @ObjectModel.text.element: ['Oplift']
      @EndUserText.label: '오픈처'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_OPLIF', element: 'Cdno' }}]
      _Asim0010n.Oplif                                                                                                                                     as Oplif,

      @EndUserText.label: '오픈처명'
      _Asim0010n.Oplift                                                                                                                                    as Oplift,

      @EndUserText.label: 'Sdate'
      _Asim0010n.Sdate                                                                                                                                     as Sdate,

      @EndUserText.label: 'Edate'
      _Asim0010n.Edate                                                                                                                                     as Edate,

      @ObjectModel.text.element: ['Colift']
      @EndUserText.label: '실계약처'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_COLIF', element: 'Cdno' }}]
      _Asim0010n.Colif                                                                                                                                     as Colif,

      @EndUserText.label: '실계약처명'
      _Asim0010n.Colift                                                                                                                                    as Colift,

      @ObjectModel.text.element: ['Filift']
      @EndUserText.label: '파이낸스'
      _Asim0010n.Filif                                                                                                                                     as Filif,

      @EndUserText.label: '파이낸스명'
      _Asim0010n.Filift                                                                                                                                    as Filift,

      @EndUserText.label: '계약번호1'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_CONT1', element: 'Cdno' }}]
      _Asim0010n.Cont1                                                                                                                                     as Cont1,

      @EndUserText.label: '계약번호2'
      _Asim0010n.Cont2                                                                                                                                     as Cont2,

      @EndUserText.label: '접수일'
      _Asim0010n.Acdat                                                                                                                                     as Acdat,

      @EndUserText.label: 'BOOKING No.'
      _Asim0010n.Bokno                                                                                                                                     as Bokno,

      @ObjectModel.text.element: ['Conrtt']
      @EndUserText.label: '계약유형'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_CONRT', element: 'Cdno' }}]
      _Asim0010n.Conrt                                                                                                                                     as Conrt,

      @EndUserText.label: '계약유형명'
      _Asim0010n.Conrt                                                                                                                                     as Conrtt,

      @EndUserText.label: '양도일(수입대행)'
      _Asim0010n.Trdat                                                                                                                                     as Trdat,

      @EndUserText.label: 'B/L번호(수입대행)'
      _Asim0010n.Trbln                                                                                                                                     as Trbln,

      @EndUserText.label: '개설환율'
      _Asim0010n.Rqrsf                                                                                                                                     as Rqrsf,

      @EndUserText.label: '부보환율'
      _Asim0010n.Bbrsf                                                                                                                                     as Bbrsf,

      @EndUserText.label: '부보대상금액'
      @Semantics.amount.currencyCode : 'Bbwrs'
      _Asim0010n.Bbamt                                                                                                                                     as Bbamt,

      @ObjectModel.filter.enabled: false
      @EndUserText.label: '통화 키'
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_CurrencyStdVH', element: 'Currency' }}]
      _Asim0010n.Bbwrs                                                                                                                                     as Bbwrs,

      @EndUserText.label: '부보일'
      _Asim0010n.Bbdat                                                                                                                                     as Bbdat,

      @ObjectModel.text.element: ['Bbgbt']
      @EndUserText.label: '보험조건'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_BBGB', element: 'Cdno' }}]
      _Asim0010n.Bbgb                                                                                                                                      as Bbgb,

      @EndUserText.label: '보험조건명'
      _Asim0010n.Bbgbt                                                                                                                                     as Bbgbt,

      @EndUserText.label: '계약완료'
      _Asim0010n.Rqche                                                                                                                                     as Rqche,

      @EndUserText.label: '인수일'
      _Asim0010n.Isdat                                                                                                                                     as Isdat,

      @EndUserText.label: '주차(오퍼)'
      _Asim0010n.Rqweek                                                                                                                                    as Rqweek,

      @EndUserText.label: '보험증권번호'
      _Asim0010n.Bbno                                                                                                                                      as Bbno,

      @ObjectModel.text.element: ['Bblift']
      @EndUserText.label: '보험회사'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_BBLIF', element: 'Cdno' }}]
      _Asim0010n.Bblif                                                                                                                                     as Bblif,

      @EndUserText.label: '보험회사명'
      _Asim0010n.Bblift                                                                                                                                    as Bblift,

      @ObjectModel.filter.enabled: false
      @EndUserText.label: '부보 Basic Rate'
      _Asim0010n.Bbrate                                                                                                                                    as Bbrate,

      @ObjectModel.filter.enabled: false
      @EndUserText.label: 'Remark'
      _Asim0010n.Remak                                                                                                                                     as Remak,

      @EndUserText.label: '생성자'
      @Semantics.user.createdBy: true
      created_by                                                                                                                                           as CreatedBy,
      @EndUserText.label: '생성일'
      @Semantics.systemDateTime.createdAt: true
      created_at                                                                                                                                           as CreatedAt,
      @EndUserText.label: '최종 변경자'
      @Semantics.user.lastChangedBy: true
      last_changed_by                                                                                                                                      as LastChangedBy,
      @EndUserText.label: '최종 변경일'
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at                                                                                                                                      as LastChangedAt,
      @EndUserText.label: '인스턴스 변경시간'
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at                                                                                                                                as LocalLastChangedAt,

      _Asim0050n.return_msg                                                                                                                                as ReturnMsg,
      @ObjectModel.filter.enabled: false
      @EndUserText.label: '삭제 지시자'
      _Asim0050n.loekz                                                                                                                                     as Loekz,

      _Item,
      _BusinessPartner,
      _PurchasingGroup


}

where
  _Asim0050n.loekz = ''

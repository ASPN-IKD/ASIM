@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입 부대비 헤더 인터페이스 뷰'
define root view entity YI_ASIM0130N
  as select from zasimt0130n as _Asim0130n

  composition [1..*] of YI_ASIM0141N             as _Item

  association [1..1] to I_CompanyCode            as _CompanyCode            on  $projection.Bukrs = _CompanyCode.CompanyCode
  association [1..1] to I_PurchasingOrganization as _PurchasingOrganization on  $projection.Ekorg = _PurchasingOrganization.PurchasingOrganization
  association [1..1] to I_BusinessPartner        as _BusinessPartner        on  _Asim0130n.lifre_fees = _BusinessPartner.BusinessPartner
  association [0..1] to I_BusinessPartner        as _BusinessPartner1       on  _Asim0130n.trlif_fees = _BusinessPartner1.BusinessPartner

  association [0..1] to YI_ASIM0001N             as _Zcdno                  on  $projection.Zcdno =    _Zcdno.Zcdno
                                                                            and _Zcdno.Zcode      like '%ZCDNO'
                                                                            and _Zcdno.Zcdno      <>   '00'
  association [0..1] to YI_ASIM0001N             as _Zterm                  on  _Asim0130n.zterm_fees =    _Zterm.Zcdno
                                                                            and _Zterm.Zcode          like '%ZTERM'
                                                                            and _Zterm.Zcdno          <>   '00'
  association [0..1] to YI_ASIM0001N             as _Zlsch                  on  $projection.Zlsch =    _Zlsch.Zcdno
                                                                            and _Zlsch.Zcode      like '%ZLSCH'
                                                                            and _Zlsch.Zcdno      <>   '00'
  association [0..1] to YI_ASIM0001N             as _Mwskz                  on  $projection.Mwskz =    _Mwskz.Zcdno
                                                                            and _Mwskz.Zcode      like '%MWSKZ'
                                                                            and _Mwskz.Zcdno      <>   '00'
  association [0..1] to YI_ASIM0001N             as _Feegb                  on  $projection.Feegb =    _Feegb.Zcdno
                                                                            and _Feegb.Zcode      like '%FEEGB'
                                                                            and _Feegb.Zcdno      <>   '00'

  association [0..1] to YI_ASIM0090N             as _Asim0090n              on  _Asim0090n.Mblnr = _Asim0130n.mblnr
                                                                            and _Asim0090n.Mjahr = _Asim0130n.mjahr
                                                                            and _Asim0130n.feegb = 'D'
  association [0..1] to YI_ASIM0070N             as _Asim0070n              on  _Asim0070n.Cclno = _Asim0130n.cclno
                                                                            and _Asim0070n.Cclyr = _Asim0130n.cclyr
                                                                            and _Asim0130n.feegb = 'C'
  association [0..1] to YI_ASIM0030N             as _Asim0030n              on  _Asim0030n.Blino = _Asim0130n.blino
                                                                            and _Asim0030n.Bliyr = _Asim0130n.bliyr
                                                                            and _Asim0130n.feegb = 'B'
  association [1..1] to YI_ASIM0010N             as _Asim0010n              on  _Asim0010n.Reqno = _Asim0130n.reqno
                                                                            and _Asim0010n.Reqyr = _Asim0130n.reqyr

{
      @ObjectModel.filter.enabled: false
  key uuid                                               as Uuid,

      @EndUserText.label: '부대비번호'
      feeno                                              as Feeno,

      @EndUserText.label: '부대비연도'
      feeyr                                              as Feeyr,

      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO', element: 'Cdno'}, additionalBinding: [{ localElement: 'Feegb', element: 'Zvalu2' }] }]
      @ObjectModel.text.element: ['Zcdnot']
      @EndUserText.label: '부대비항목'
      zcdno                                              as Zcdno, //참조문서 구분에 따라 변경되어야함 ADDITIONAL BINDING 사용

      @EndUserText.label: '부대비항목명'
      _Zcdno.Ztext                                       as Zcdnot,

      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_FEEGB', element: 'Cdno'} }]
      @ObjectModel.text.element: ['Feegbt']
      @EndUserText.label: '참조문서구분'
      feegb                                              as Feegb, //A 계약, B BL, C 통관, D 입고

      @EndUserText.label: '참조문서구분명'
      _Feegb.Ztext                                       as Feegbt,

      @EndUserText.label: '참조문서번호'
      gbno                                               as Gbno,

      @EndUserText.label: '연결부대비번호'
      feeno1                                             as Feeno1,

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

      @EndUserText.label: '구매그룹'
      _Asim0010n.Ekgrp                                   as Ekgrp,

      @EndUserText.label: '구매그룹명'
      _Asim0010n.Ekgrpt                                  as Ekgrpt,

      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_REQMU', element: 'Reqmu' }}]
      @EndUserText.label: '관리번호'
      reqmu                                              as Reqmu,

      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_REQNO', element: 'Reqno' }}]
      @EndUserText.label: '계약내부번호'
      reqno                                              as Reqno,

      @EndUserText.label: '계약연도'
      reqyr                                              as Reqyr,

      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_BLINO', element: 'Blino' }}]
      @EndUserText.label: 'B/L내부번호'
      blino                                              as Blino,

      @EndUserText.label: 'B/L연도'
      bliyr                                              as Bliyr,


      @EndUserText.label: '통관내부번호'
      cclno                                              as Cclno,

      @EndUserText.label: '통관연도'
      cclyr                                              as Cclyr,

      @EndUserText.label: '입고문서번호'
      mblnr                                              as Mblnr,

      @EndUserText.label: '입고연도'
      mjahr                                              as Mjahr,


      @EndUserText.label: '전기일'
      budat_fees                                         as BudatFees,

      @ObjectModel.text.element: ['LifreFeest']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_LIFREFEES', element: 'LifreFees' }, additionalBinding: [{ localElement: 'WaersFees', element: 'PurchaseOrderCurrency', usage: #RESULT }]}
      ]
      @EndUserText.label: '송장발행처'
      lifre_fees                                         as LifreFees,

      @EndUserText.label: '송장발행처명'
      _BusinessPartner.BusinessPartnerName               as LifreFeest,

      @ObjectModel.text.element: ['TrlifFeest']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_TRLIFFEES', element: 'TrlifFees' }}
      ]
      @EndUserText.label: '송장대행업체'
      trlif_fees                                         as TrlifFees,

      @EndUserText.label: '송장대행업체명'
      _BusinessPartner1.BusinessPartnerName              as TrlifFeest,

      @ObjectModel.text.element: ['ZtermFeest']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_ZTERMFEES', element: 'Cdno' }}
      ]
      @EndUserText.label: '지급조건'
      zterm_fees                                         as ZtermFees,

      @EndUserText.label: '지급조건명'
      _Zterm.Ztext                                       as ZtermFeest,

      @Semantics.amount.currencyCode : 'WaersFees'
      @EndUserText.label: '공급가액'
      rmwwr_fees                                         as RmwwrFees,

      @Semantics.amount.currencyCode : 'WaersFees'
      @EndUserText.label: '총송장금액'
      ivamt_fees                                         as IvamtFees,

      @Semantics.amount.currencyCode : 'WaersFees'
      @EndUserText.label: '세액'
      wmwst1_fees                                        as Wmwst1Fees,

      @EndUserText.label: '통화 키'
      waers_fees                                         as WaersFees,


      @ObjectModel.text.element: ['Zlscht']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_ZLSCH', element: 'Cdno' }}
      ]
      @EndUserText.label: '지급방법'
      zlsch                                              as Zlsch,

      @EndUserText.label: '지급방법명'
      _Zlsch.Ztext                                       as Zlscht,

      @ObjectModel.text.element: ['Mwskzt']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_MWSKZ', element: 'Cdno' },
      additionalBinding: [{ localElement: 'TaxRate', element: 'TaxRate' , usage: #RESULT }]
      }]
      @EndUserText.label: '세금코드'
      mwskz                                              as Mwskz,

      @EndUserText.label: '세금코드명'
      _Mwskz.Ztext                                       as Mwskzt,

      cast('' as abap.char(40))                          as TaxRate,

      @EndUserText.label: '기산일/만기일'
      zfbdt                                              as Zfbdt,

      @EndUserText.label: '만기일'
      fbedt                                              as Fbedt,

      @EndUserText.label: '일수'
      zbd1t                                              as Zbd1t,

      @EndUserText.label: '환율'
      kursf                                              as Kursf,

      @EndUserText.label: '전표헤더텍스트'
      bktxt                                              as Bktxt,

      @EndUserText.label: '송장문서번호'
      belnr                                              as Belnr, //값이 존재하면 전기 값이 없으면 미전기.

      @EndUserText.label: '회계연도'
      gjahr                                              as Gjahr,

      @EndUserText.label: '회계전표번호(FI)'
      belnr_fi                                           as BelnrFi,

      @EndUserText.label: '회계연도(FI)'
      gjahr_fi                                           as GjahrFi,

      @EndUserText.label: '회계전표번호(AP)'
      belnr_ap                                           as BelnrAp,

      @EndUserText.label: '회계연도(AP)'
      gjahr_ap                                           as GjahrAp,

      @EndUserText.label: '회계전표번호(TR)'
      belnr_tr                                           as BelnrTr,

      @EndUserText.label: '회계연도(TR)'
      gjahr_tr                                           as GjahrTr,

      @EndUserText.label: '메시지'
      mesg                                               as Mesg,

      @EndUserText.label: '세금계산코드'
      code                                               as Code,

      @EndUserText.label: '전자세금계산서번호'
      zetno                                              as Zetno,

      @EndUserText.label: '전기여부'
      case when _Asim0130n.belnr is null or _Asim0130n.belnr = '' then 'X'
      else 'O' end                                        as Postgb,
      
      case when _Asim0130n.belnr is null or _Asim0130n.belnr = '' then '2'
      else '3'
      end as  status,

      @EndUserText.label: '요청일'
      _Asim0010n.Reqdt                                   as Reqdt,

      @ObjectModel.text.element: ['Lifnrt']
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_LIFNR', element: 'Lifnr' }}]
      @EndUserText.label: '공급업체'
      _Asim0010n.Lifnr                                   as Lifnr,

      @EndUserText.label: '공급업체명'
      _Asim0010n.Lifnrt                                  as Lifnrt,

      @ObjectModel.text.element: ['Lifret']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_LIFRE', element: 'Cdno' }}]
      @EndUserText.label: '공급처'
      _Asim0010n.Lifre                                   as Lifre,

      @EndUserText.label: '공급처명'
      _Asim0010n.Lifret                                  as Lifret,

      @ObjectModel.text.element: ['Inco1t']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_INCO1', element: 'Inco1' }}]
      @EndUserText.label: '인도조건'
      _Asim0010n.Inco1                                   as Inco1,

      @EndUserText.label: '인도조건명'
      _Asim0010n.Inco1t                                  as Inco1t,

      @EndUserText.label: '인도처'
      _Asim0010n.Inco2                                   as Inco2,

      @ObjectModel.text.element: ['Ztermt']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_ZTERM', element: 'Cdno' }}]
      @EndUserText.label: '지급조건'
      _Asim0010n.Zterm                                   as Zterm,

      @EndUserText.label: '지급조건명'
      _Asim0010n.Ztermt                                  as Ztermt,

      @ObjectModel.text.element: ['Zcdno1t']
      @EndUserText.label: '도착지'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO1', element: 'Cdno' }}]
      _Asim0010n.Zcdno1                                  as Zcdno1,

      @EndUserText.label: '도착지명'
      _Asim0010n.Zcdno1t                                 as Zcdno1t,

      @ObjectModel.text.element: ['Zcdno2t']
      @EndUserText.label: '운송수단'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO2', element: 'Cdno' }}]
      _Asim0010n.Zcdno2                                  as Zcdno2,

      @EndUserText.label: '운송수단명'
      _Asim0010n.Zcdno2t                                 as Zcdno2t,

      @ObjectModel.text.element: ['Zcdno3t']
      @EndUserText.label: '선적지'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO3', element: 'Cdno' }}]
      _Asim0010n.Zcdno3                                  as Zcdno3,

      @EndUserText.label: '선적지명'
      _Asim0010n.Zcdno3t                                 as Zcdno3t,

      @ObjectModel.text.element: ['Zcdno4t']
      @EndUserText.label: '운송형태'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO4', element: 'Cdno' }}]
      _Asim0010n.Zcdno4                                  as Zcdno4,

      @EndUserText.label: '운송형태명'
      _Asim0010n.Zcdno4t                                 as Zcdno4t,

      @EndUserText.label: '총금액'
      @Semantics.amount.currencyCode : 'Waers'
      _Asim0010n.Netwr                                   as Netwr,

      @EndUserText.label: '통화키'
      _Asim0010n.Waers                                   as Waers,

      @EndUserText.label: 'L/C오픈일'
      _Asim0010n.Opdat                                   as Opdat,

      @ObjectModel.text.element: ['Opbnkt']
      @EndUserText.label: '개설은행'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_OPBNK', element: 'Cdno' }}]
      _Asim0010n.Opbnk                                   as Opbnk,

      @EndUserText.label: '개설은행명'
      _Asim0010n.Opbnkt                                  as Opbnkt,

      @EndUserText.label: 'L/C번호'
      _Asim0010n.Opnum                                   as Opnum,

      @EndUserText.label: 'L/C오픈금액'
      @Semantics.amount.currencyCode : 'Opwrs'
      _Asim0010n.Opamt                                   as Opamt,

      @EndUserText.label: '통화 키'
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_CurrencyStdVH', element: 'Currency' }}]
      _Asim0010n.Opwrs                                   as Opwrs,

      @ObjectModel.text.element: ['Ptermt']
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_Pterm', element: 'Cdno' }}]
      @EndUserText.label: '결제조건'
      _Asim0010n.Pterm                                   as Pterm,

      @EndUserText.label: '결제조건명'
      _Asim0010n.Ptermt                                  as Ptermt,

      @EndUserText.label: '결제예정일'
      _Asim0010n.Pedat                                   as Pedat,

      @EndUserText.label: '결제일'
      _Asim0010n.Pdate                                   as Pdate,

      @EndUserText.label: '오픈예정일'
      _Asim0010n.Oedat                                   as Oedat,

      @ObjectModel.text.element: ['Oplift']
      @EndUserText.label: '오픈처'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_OPLIF', element: 'Cdno' }}]
      _Asim0010n.Oplif                                   as Oplif,

      @EndUserText.label: '오픈처명'
      _Asim0010n.Oplift                                  as Oplift,

      @EndUserText.label: 'Sdate'
      _Asim0010n.Sdate                                   as Sdate,

      @EndUserText.label: 'Edate'
      _Asim0010n.Edate                                   as Edate,

      @ObjectModel.text.element: ['Colift']
      @EndUserText.label: '실계약처'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_COLIF', element: 'Cdno' }}]
      _Asim0010n.Colif                                   as Colif,

      @EndUserText.label: '실계약처명'
      _Asim0010n.Colift                                  as Colift,

      @ObjectModel.text.element: ['Filift']
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_FILIF', element: 'Cdno' }}]
      @EndUserText.label: '파이낸스'
      _Asim0010n.Filif                                   as Filif,

      @EndUserText.label: '파이낸스명'
      _Asim0010n.Filift                                  as Filift,

      @EndUserText.label: '계약번호1'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_CONT1', element: 'Cont1' }}]
      _Asim0010n.Cont1                                   as Cont1,

      @EndUserText.label: '계약번호2'
      _Asim0010n.Cont2                                   as Cont2,

      @EndUserText.label: '접수일'
      _Asim0010n.Acdat                                   as Acdat,

      @EndUserText.label: 'BOOKING No.'
      _Asim0010n.Bokno                                   as Bokno,

      @ObjectModel.text.element: ['Conrtt']
      @EndUserText.label: '계약유형'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_CONRT', element: 'Cdno' }}]
      _Asim0010n.Conrt                                   as Conrt,

      @EndUserText.label: '계약유형명'
      _Asim0010n.Conrt                                   as Conrtt,

      @EndUserText.label: '양도일(수입대행)'
      _Asim0010n.Trdat                                   as Trdat,

      @EndUserText.label: 'B/L번호(수입대행)'
      _Asim0010n.Trbln                                   as Trbln,

      @EndUserText.label: '개설환율'
      _Asim0010n.Rqrsf                                   as Rqrsf,

      @EndUserText.label: '부보환율'
      _Asim0010n.Bbrsf                                   as Bbrsf,

      @EndUserText.label: '부보대상금액'
      @Semantics.amount.currencyCode : 'Bbwrs'
      _Asim0010n.Bbamt                                   as Bbamt,

      @ObjectModel.filter.enabled: false
      @EndUserText.label: '통화 키'
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_CurrencyStdVH', element: 'Currency' }}]
      _Asim0010n.Bbwrs                                   as Bbwrs,

      @EndUserText.label: '부보일'
      _Asim0010n.Bbdat                                   as Bbdat,

      @ObjectModel.text.element: ['Bbgbt']
      @EndUserText.label: '보험조건'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_BBGB', element: 'Cdno' }}]
      _Asim0010n.Bbgb                                    as Bbgb,

      @EndUserText.label: '보험조건명'
      _Asim0010n.Bbgbt                                   as Bbgbt,

      @EndUserText.label: '계약완료'
      _Asim0010n.Rqche                                   as Rqche,

      @EndUserText.label: '인수일'
      _Asim0010n.Isdat                                   as Isdat,

      @EndUserText.label: '주차(오퍼)'
      _Asim0010n.Rqweek                                  as Rqweek,

      @EndUserText.label: '보험증권번호'
      _Asim0010n.Bbno                                    as Bbno,

      @ObjectModel.text.element: ['Bblift']
      @EndUserText.label: '보험회사'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_BBLIF', element: 'Cdno' }}]
      _Asim0010n.Bblif                                   as Bblif,

      @EndUserText.label: '보험회사명'
      _Asim0010n.Bblift                                  as Bblift,

      @ObjectModel.filter.enabled: false
      @EndUserText.label: '부보 Basic Rate'
      _Asim0010n.Bbrate                                  as Bbrate,

      @ObjectModel.filter.enabled: false
      @EndUserText.label: 'Remark'
      _Asim0010n.Remak                                   as Remak,

      @EndUserText.label: '구매문서번호'
      case when _Asim0130n.feegb = 'B' then _Asim0030n.Ebeln
      when _Asim0130n.feegb = 'C' then _Asim0070n.Ebeln
      when _Asim0130n.feegb = 'D' then _Asim0090n.Ebeln
      else null  end                                     as Ebeln,

      @EndUserText.label: 'B/L번호'
      case when _Asim0130n.feegb = 'B' then _Asim0030n.Bleno
           when _Asim0130n.feegb = 'C' then _Asim0070n.Bleno
           when _Asim0130n.feegb = 'D' then _Asim0090n.Bleno
           else null  end                                as Bleno,

      @EndUserText.label: 'B/L발행일'
      case when _Asim0130n.feegb = 'B' then _Asim0030n.Bldat
           when _Asim0130n.feegb = 'C' then _Asim0070n.Bldat
           when _Asim0130n.feegb = 'D' then _Asim0090n.Bldat
           else null  end                                as Bldat,

      @EndUserText.label: '입항일'
      case when _Asim0130n.feegb = 'B' then _Asim0030n.Bleta
           when _Asim0130n.feegb = 'C' then _Asim0070n.Bleta
           when _Asim0130n.feegb = 'D' then _Asim0090n.Bleta
           else null  end                                as Bleta,

      @EndUserText.label: '선적일'
      case when _Asim0130n.feegb = 'B' then _Asim0030n.Bletd
           when _Asim0130n.feegb = 'C' then _Asim0070n.Bletd
           when _Asim0130n.feegb = 'D' then _Asim0090n.Bletd
           else null  end                                as Bletd,

      @EndUserText.label: 'ETD'
      case when _Asim0130n.feegb = 'B' then _Asim0030n.Rqetd
           when _Asim0130n.feegb = 'C' then _Asim0070n.Rqetd
           when _Asim0130n.feegb = 'D' then _Asim0090n.Rqetd
           else null  end                                as Rqetd,

      @EndUserText.label: 'ETA'
      case when _Asim0130n.feegb = 'B' then _Asim0030n.Rqeta
           when _Asim0130n.feegb = 'C' then _Asim0070n.Rqeta
           when _Asim0130n.feegb = 'D' then _Asim0090n.Rqeta
           else null  end                                as Rqeta,

      @EndUserText.label: '만기일수'
      case when _Asim0130n.feegb = 'B' then _Asim0030n.Bld1t
           when _Asim0130n.feegb = 'C' then _Asim0070n.Bld1t
           when _Asim0130n.feegb = 'D' then _Asim0090n.Bld1t
           else null  end                                as Bld1t,

      @EndUserText.label: '인수만기일'
      case when _Asim0130n.feegb = 'B' then _Asim0030n.Bledt
           when _Asim0130n.feegb = 'C' then _Asim0070n.Bledt
           when _Asim0130n.feegb = 'D' then _Asim0090n.Bledt
           else null  end                                as Bledt,

      @EndUserText.label: '선적서류접수일'
      case when _Asim0130n.feegb = 'B' then _Asim0030n.Bldat2
           when _Asim0130n.feegb = 'C' then _Asim0070n.Bldat2
           when _Asim0130n.feegb = 'D' then _Asim0090n.Bldat2
           else null  end                                as Bldat2,

      @EndUserText.label: '입고예정일'
      case when _Asim0130n.feegb = 'B' then _Asim0030n.Blgrd
           when _Asim0130n.feegb = 'C' then _Asim0070n.Blgrd
           when _Asim0130n.feegb = 'D' then _Asim0090n.Blgrd
           else null  end                                as Blgrd,

      @Semantics.quantity.unitOfMeasure: 'Gewei'
      @EndUserText.label: '총중량'
      case when _Asim0130n.feegb = 'B' then _Asim0030n.Brgew
           when _Asim0130n.feegb = 'C' then _Asim0070n.Brgew
           when _Asim0130n.feegb = 'D' then _Asim0090n.Brgew
           else null  end                                as Brgew,

      @Semantics.quantity.unitOfMeasure: 'Gewei'
      @EndUserText.label: '순중량'
      case when _Asim0130n.feegb = 'B' then _Asim0030n.Negew
           when _Asim0130n.feegb = 'C' then _Asim0070n.Negew
           when _Asim0130n.feegb = 'D' then _Asim0090n.Negew
           else null  end                                as Negew,

      @EndUserText.label: '중량단위'
      case when _Asim0130n.feegb = 'B' then _Asim0030n.Gewei
           when _Asim0130n.feegb = 'C' then _Asim0070n.Gewei
           when _Asim0130n.feegb = 'D' then _Asim0090n.Gewei
           else null  end                                as Gewei,

      @EndUserText.label: 'L/G번호'
      case when _Asim0130n.feegb = 'B' then _Asim0030n.Lgnum
           when _Asim0130n.feegb = 'C' then _Asim0070n.Lgnum
           when _Asim0130n.feegb = 'D' then _Asim0090n.Lgnum
           else null  end                                as Lgnum,

      @EndUserText.label: '컨테이너번호'
      case when _Asim0130n.feegb = 'B' then _Asim0030n.Cntno
           when _Asim0130n.feegb = 'C' then _Asim0070n.Cntno
           when _Asim0130n.feegb = 'D' then _Asim0090n.Cntno
           else null  end                                as Cntno,

      @ObjectModel.text.element: ['Mosnot']
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_MOSNO', element: 'Cdno' }}]
      @EndUserText.label: '모선번호'
      case when _Asim0130n.feegb = 'B' then _Asim0030n.Mosno
           when _Asim0130n.feegb = 'C' then _Asim0070n.Mosno
           when _Asim0130n.feegb = 'D' then _Asim0090n.Mosno
           else null  end                                as Mosno,

      @EndUserText.label: '모선번호명'
      case when _Asim0130n.feegb = 'B' then _Asim0030n.Mosnot
           when _Asim0130n.feegb = 'C' then _Asim0070n.Mosnot
           when _Asim0130n.feegb = 'D' then _Asim0090n.Mosnot
           else null  end                                as Mosnot,

      @EndUserText.label: 'B/L총금액'
      @Semantics.amount.currencyCode : 'BLWaers'
      case when _Asim0130n.feegb = 'B' then _Asim0030n.Blamt
           when _Asim0130n.feegb = 'C' then _Asim0070n.Blamt
           when _Asim0130n.feegb = 'D' then _Asim0090n.Blamt
           else null  end                                as Blamt,

      @EndUserText.label: 'B/L통화키'
      case when _Asim0130n.feegb = 'B' then _Asim0030n.Waers
           when _Asim0130n.feegb = 'C' then _Asim0070n.Waers
           when _Asim0130n.feegb = 'D' then _Asim0090n.Waers
           else null  end                                as BLWaers,

      @EndUserText.label: 'B/L Text'
      case when _Asim0130n.feegb = 'B' then _Asim0030n.Blitx
           when _Asim0130n.feegb = 'C' then _Asim0070n.Blitx
           when _Asim0130n.feegb = 'D' then _Asim0090n.Blitx
           else null  end                                as Blitx,

      @EndUserText.label: '납품완료체크'
      case when _Asim0130n.feegb = 'B' then _Asim0030n.Blche
           when _Asim0130n.feegb = 'C' then _Asim0070n.Blche
           when _Asim0130n.feegb = 'D' then _Asim0090n.Blche
           else null  end                                as Blche,

      @EndUserText.label: '검역여부'
      case when _Asim0130n.feegb = 'B' then _Asim0030n.Eccgb
           when _Asim0130n.feegb = 'C' then _Asim0070n.Eccgb
           when _Asim0130n.feegb = 'D' then _Asim0090n.Eccgb
           else null  end                                as Eccgb,


      @EndUserText.label: '수입신고번호'
      case when _Asim0130n.feegb = 'C' then _Asim0070n.Decno
           when _Asim0130n.feegb = 'D' then _Asim0090n.Decno
           else null  end                                as Decno,

      @ObjectModel.text.element: ['Cclift']
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_CCLIF', element: 'Cdno' }}]
      @EndUserText.label: '세관'
      case when _Asim0130n.feegb = 'C' then _Asim0070n.Cclif
           when _Asim0130n.feegb = 'D' then _Asim0090n.Cclif
           else null  end                                as Cclif,

      @EndUserText.label: '세관명'
      case when _Asim0130n.feegb = 'C' then _Asim0070n.Cclift
           when _Asim0130n.feegb = 'D' then _Asim0090n.Cclift
           else null  end                                as Cclift,

      @EndUserText.label: '신고일'
      case when _Asim0130n.feegb = 'C' then _Asim0070n.Decdt
           when _Asim0130n.feegb = 'D' then _Asim0090n.Decdt
           else null  end                                as Decdt,

      @EndUserText.label: '반입일'
      case when _Asim0130n.feegb = 'C' then _Asim0070n.Ccldt
           when _Asim0130n.feegb = 'D' then _Asim0090n.Ccldt
           else null  end                                as Ccldt,

      @ObjectModel.text.element: ['Ccpert']
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_CCPER', element: 'Cdno' }}]
      @EndUserText.label: '신고인'
      case when _Asim0130n.feegb = 'C' then _Asim0070n.Ccper
           when _Asim0130n.feegb = 'D' then _Asim0090n.Ccper
           else null  end                                as Ccper,

      @EndUserText.label: '신고인명'
      case when _Asim0130n.feegb = 'C' then _Asim0070n.Ccpert
           when _Asim0130n.feegb = 'D' then _Asim0090n.Ccpert
           else null  end                                as Ccpert,

      @Semantics.amount.currencyCode : 'Ccwae'
      @EndUserText.label: '총과세가격'
      case when _Asim0130n.feegb = 'C' then _Asim0070n.Ccamt
           when _Asim0130n.feegb = 'D' then _Asim0090n.Ccamt
           else null  end                                as Ccamt,

      @Semantics.amount.currencyCode : 'Ccwaek'
      @EndUserText.label: '총과세가격(환화)'
      case when _Asim0130n.feegb = 'C' then _Asim0070n.Ccamtk
           when _Asim0130n.feegb = 'D' then _Asim0090n.Ccamtk
           else null  end                                as Ccamtk,

      @Semantics.amount.currencyCode : 'Ccwaek'
      @EndUserText.label: '관세'
      case when _Asim0130n.feegb = 'C' then _Asim0070n.Ccvat1
           when _Asim0130n.feegb = 'D' then _Asim0090n.Ccvat1
           else null  end                                as Ccvat1,

      @Semantics.amount.currencyCode : 'Ccwaek'
      @EndUserText.label: '수입부가세'
      case when _Asim0130n.feegb = 'C' then _Asim0070n.Ccvat2
           when _Asim0130n.feegb = 'D' then _Asim0090n.Ccvat2
           else null  end                                as Ccvat2,

      @Semantics.amount.currencyCode : 'Ccwaek'
      @EndUserText.label: '과세 표준액(현지 통화)'
      case when _Asim0130n.feegb = 'C' then _Asim0070n.Hwbas
           when _Asim0130n.feegb = 'D' then _Asim0090n.Hwbas
           else null  end                                as Hwbas,

      @ObjectModel.filter.enabled: false
      @EndUserText.label: '통화 키'
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_CurrencyStdVH', element: 'Currency' }}]
      case when _Asim0130n.feegb = 'C' then _Asim0070n.Ccwae
           when _Asim0130n.feegb = 'D' then _Asim0090n.Ccwae
           else null  end                                as Ccwae,

      @EndUserText.label: '현지통화'
      case when _Asim0130n.feegb = 'C' then _Asim0070n.Ccwaek
           when _Asim0130n.feegb = 'D' then _Asim0090n.Ccwaek
           else null  end                                as Ccwaek,

      @EndUserText.label: '통관환율'
      case when _Asim0130n.feegb = 'C' then _Asim0070n.Ccrsf
           when _Asim0130n.feegb = 'D' then _Asim0090n.Ccrsf
           else null  end                                as Ccrsf,

      @EndUserText.label: '접수일'
      case when _Asim0130n.feegb = 'C' then _Asim0070n.Ccdat1
           when _Asim0130n.feegb = 'D' then _Asim0090n.Ccdat1
           else null  end                                as Ccdat1,

      @EndUserText.label: '수리일'
      case when _Asim0130n.feegb = 'C' then _Asim0070n.Ccdat2
           when _Asim0130n.feegb = 'D' then _Asim0090n.Ccdat2
           else null  end                                as Ccdat2,

      @EndUserText.label: '검사(반입)장소'
      case when _Asim0130n.feegb = 'C' then _Asim0070n.Cclog
           when _Asim0130n.feegb = 'D' then _Asim0090n.Cclog
           else null  end                                as Cclog,

      @ObjectModel.text.element: ['Ccmost']
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_MOSNO', element: 'Cdno' }}]
      @EndUserText.label: '환적모선'
      case when _Asim0130n.feegb = 'C' then _Asim0070n.Ccmos
           when _Asim0130n.feegb = 'D' then _Asim0090n.Ccmos
           else null  end                                as Ccmos,

      @EndUserText.label: '환적모선명'
      case when _Asim0130n.feegb = 'C' then _Asim0070n.Ccmost
           when _Asim0130n.feegb = 'D' then _Asim0090n.Ccmost
           else null  end                                as Ccmost,

      @ObjectModel.text.element: ['Cclgortt']
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_CCLGORT', element: 'Cdno' }}]
      @EndUserText.label: '보세창고'
      case when _Asim0130n.feegb = 'C' then _Asim0070n.Cclgort
           when _Asim0130n.feegb = 'D' then _Asim0090n.Cclgort
           else null  end                                as Cclgort,

      @EndUserText.label: '보세창고명'
      case when _Asim0130n.feegb = 'C' then _Asim0070n.Cclgortt
           when _Asim0130n.feegb = 'D' then _Asim0090n.Cclgortt
           else null  end                                as Cclgortt,

      @EndUserText.label: '통관비고'
      case when _Asim0130n.feegb = 'C' then _Asim0070n.Ccltx
           when _Asim0130n.feegb = 'D' then _Asim0090n.Ccltx
           else null  end                                as Ccltx,

      @EndUserText.label: '입고전기일'
      case when _Asim0130n.feegb = 'D' then _Asim0090n.BudatGr
           else null  end                                as BudatGr,

      @EndUserText.label: '헤더텍스트'
      case when _Asim0130n.feegb = 'D' then _Asim0090n.Bktxt
           else null  end                                as GRbktxt,

      @EndUserText.label: '통관기준 입고완료'
      case when _Asim0130n.feegb = 'D' then _Asim0090n.Grche
           else null  end                                as Grche,

      _Zcdno.Zvalu1                                      as Zvalu1,
      _Zcdno.Zvalu2                                      as Zvalu2,
      _Zcdno.Zvalu3                                      as Zvalu3,
      _Zcdno.Zvalu4                                      as Zvalu4,
      _Zcdno.Zvalu5                                      as Zvalu5,
      _Zcdno.Zvalu6                                      as Zvalu6,
      _Zcdno.Zvalu7                                      as Zvalu7,

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

      //Association
      _Item
}
where
  loekz = ''

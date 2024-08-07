@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '부대비 생성가능 정보 - B/L'
define root view entity YI_ASIM0132N
  as

  select from YI_ASIM0040N as _Asim0040n
    join      YI_ASIM0030N as _Asim0030n on _Asim0030n.Uuid = _Asim0040n.ParentUUID

  association [0..1] to YI_ASIM0001N as _Feegb on  $projection.Feegb =    _Feegb.Zcdno
                                               and _Feegb.Zcode      like '%FEEGB'
                                               and _Feegb.Zcdno      <>   '00'

{
      @ObjectModel.filter.enabled: false
  key _Asim0040n.Uuid                                                                                                           as Uuid,

//      @ObjectModel.filter.enabled: false
//      _Asim0030n.Uuid                                                                                                           as ParentUUID,

      @EndUserText.label: 'B/L연도'
      _Asim0040n.Bliyr                                                                                                          as Bliyr,

      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_BLINO', element: 'Blino' }}]
      @EndUserText.label: 'B/L내부번호'
      _Asim0040n.Blino                                                                                                          as Blino,

//      @EndUserText.label: 'B/L품목번호'
//      _Asim0040n.Blinp                                                                                                          as Blinp,

      @EndUserText.label: '계약연도'
      _Asim0040n.Reqyr                                                                                                          as Reqyr,

      @EndUserText.label: '요청일'
      _Asim0030n.Reqdt                                                                                                          as Reqdt,

      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_REQNO', element: 'Reqno' }}]
      @EndUserText.label: '계약내부번호'
      _Asim0040n.Reqno                                                                                                          as Reqno,

//      @EndUserText.label: '계약품목'
//      _Asim0040n.Itmno                                                                                                          as Itmno,

      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_REQMU', element: 'Reqmu' }}]
      @EndUserText.label: '관리번호'
      _Asim0030n.Reqmu                                                                                                          as Reqmu,

      @EndUserText.label: '구매문서번호'
      _Asim0040n.Ebeln                                                                                                          as Ebeln,

      @EndUserText.label: '구매문서품목번호'
      _Asim0040n.Ebelp                                                                                                          as Ebelp,

      @ObjectModel.text.element: ['Bukrst']
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_BUKRS', element: 'Bukrs' }}]
      @EndUserText.label: '회사코드'
      _Asim0030n.Bukrs                                                                                                          as Bukrs,

      @EndUserText.label: '회사코드명'
      _Asim0030n.Bukrst                                                                                                         as Bukrst,

      @ObjectModel.text.element: ['Ekorgt']
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_EKORG', element: 'Ekorg' }}]
      @EndUserText.label: '구매조직'
      _Asim0030n.Ekorg                                                                                                          as Ekorg,

      @EndUserText.label: '구매조직명'
      _Asim0030n.Ekorgt                                                                                                         as Ekorgt,

      @ObjectModel.text.element: ['Ekgrpt']
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_EKGRP', element: 'Ekgrp' }}]
      @EndUserText.label: '구매그룹'
      _Asim0030n.Ekgrp                                                                                                          as Ekgrp,

      @EndUserText.label: '구매그룹명'
      _Asim0030n.Ekgrpt                                                                                                         as Ekgrpt,

      @ObjectModel.text.element: ['Lifnrt']
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_LIFNR', element: 'Lifnr' }}]
      @EndUserText.label: '공급업체'
      _Asim0030n.Lifnr                                                                                                          as Lifnr,

      @EndUserText.label: '공급업체명'
      _Asim0030n.Lifnrt                                                                                                         as Lifnrt,

      @EndUserText.label: '삭제지시자'
      _Asim0030n.Loekz                                                                                                          as Loekz,

      @EndUserText.label: 'B/L번호'
      _Asim0030n.Bleno                                                                                                          as Bleno,

      @EndUserText.label: 'B/L발행일'
      _Asim0030n.Bldat                                                                                                          as Bldat,

      @EndUserText.label: '입항일'
      _Asim0030n.Bleta                                                                                                          as Bleta,

      @EndUserText.label: '선적일'
      _Asim0030n.Bletd                                                                                                          as Bletd,

      @EndUserText.label: 'ETD'
      _Asim0030n.Rqetd                                                                                                          as Rqetd,

      @EndUserText.label: 'ETA'
      _Asim0030n.Rqeta                                                                                                          as Rqeta,

      @EndUserText.label: '만기일수'
      _Asim0030n.Bld1t                                                                                                          as Bld1t,

      @EndUserText.label: '인수만기일'
      _Asim0030n.Bledt                                                                                                          as Bledt,

      @EndUserText.label: '선적서류접수일'
      _Asim0030n.Bldat2                                                                                                         as Bldat2,

      @EndUserText.label: '입고예정일'
      _Asim0030n.Blgrd                                                                                                          as Blgrd,

      @EndUserText.label: '총중량'
      _Asim0030n.Brgew                                                                                                          as Brgew,

      @EndUserText.label: '순중량'
      _Asim0030n.Negew                                                                                                          as Negew,

      @EndUserText.label: '중량단위'
      _Asim0030n.Gewei                                                                                                          as Gewei,

      @EndUserText.label: 'L/G번호'
      _Asim0030n.Lgnum                                                                                                          as Lgnum,

      @EndUserText.label: '컨테이너번호'
      _Asim0030n.Cntno                                                                                                          as Cntno,

      @ObjectModel.text.element: ['Mosno']
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_MOSNO', element: 'Cdno' }}]
      @EndUserText.label: '모선번호'
      _Asim0030n.Mosno                                                                                                          as Mosno,

      @EndUserText.label: '모선번호명'
      _Asim0030n.Mosnot                                                                                                         as Mosnot,

      @EndUserText.label: 'B/L총금액'
      @Semantics.amount.currencyCode : 'Waers'
      _Asim0030n.Blamt                                                                                                          as Blamt,

      @EndUserText.label: '통화키'
      _Asim0030n.Waers                                                                                                          as Waers,

      @EndUserText.label: 'I/V 통화 키'
      _Asim0030n.Waers                                                                                                          as Ivwae,

      @EndUserText.label: 'B/L Text'
      _Asim0030n.Blitx                                                                                                          as Blitx,

      @EndUserText.label: '납품완료체크'
      _Asim0030n.Blche                                                                                                          as Blche,

      @EndUserText.label: '검역여부'
      _Asim0030n.Eccgb                                                                                                          as Eccgb,

      @ObjectModel.text.element: ['Lifret']
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_LIFRE', element: 'Cdno' }}]
      @EndUserText.label: '공급처'
      _Asim0030n.Lifre                                                                                                          as Lifre,

      @EndUserText.label: '공급처명'
      _Asim0030n.Lifret                                                                                                         as Lifret,

      @EndUserText.label: '지급처'
      _Asim0030n.Lifnr                                                                                                          as Ivlif,

      @EndUserText.label: '지급처명'
      _Asim0030n.Lifnrt                                                                                                         as Ivlift,

      @ObjectModel.text.element: ['Inco1t']
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_INCO1', element: 'Inco1' }}]
      @EndUserText.label: '인도조건'
      _Asim0030n.Inco1                                                                                                          as Inco1,

      @EndUserText.label: '인도조건명'
      _Asim0030n.Inco1t                                                                                                         as Inco1t,

      @EndUserText.label: '인도처'
      _Asim0030n.Inco2                                                                                                          as Inco2,

      @ObjectModel.text.element: ['ZtermtFees']
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZTERM', element: 'Cdno' }}]
      @EndUserText.label: '지급조건'
      _Asim0030n.Zterm                                                                                                          as ZtermFees,

      @EndUserText.label: '지급조건명'
      _Asim0030n.Ztermt                                                                                                         as ZtermtFees,

      @ObjectModel.text.element: ['Zcdno1t']
      @EndUserText.label: '도착지'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO1', element: 'Cdno' }}]
      _Asim0030n.Zcdno1                                                                                                         as Zcdno1,

      @EndUserText.label: '도착지명'
      _Asim0030n.Zcdno1t                                                                                                        as Zcdno1t,

      @ObjectModel.text.element: ['Zcdno2t']
      @EndUserText.label: '운송수단'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO2', element: 'Cdno' }}]
      _Asim0030n.Zcdno2                                                                                                         as Zcdno2,

      @EndUserText.label: '운송수단명'
      _Asim0030n.Zcdno2t                                                                                                        as Zcdno2t,

      @ObjectModel.text.element: ['Zcdno3t']
      @EndUserText.label: '선적지'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO3', element: 'Cdno' }}]
      _Asim0030n.Zcdno3                                                                                                         as Zcdno3,

      @EndUserText.label: '선적지명'
      _Asim0030n.Zcdno3t                                                                                                        as Zcdno3t,

      @ObjectModel.text.element: ['Zcdno4t']
      @EndUserText.label: '운송형태'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO4', element: 'Cdno' }}]
      _Asim0030n.Zcdno4                                                                                                         as Zcdno4,

      @EndUserText.label: '운송형태명'
      _Asim0030n.Zcdno4t                                                                                                        as Zcdno4t,

      @EndUserText.label: '총금액'
      @Semantics.amount.currencyCode : 'Waers'
      _Asim0030n.Netwr                                                                                                          as Netwr,

      @EndUserText.label: 'L/C오픈일'
      _Asim0030n.Opdat                                                                                                          as Opdat,

      @ObjectModel.text.element: ['Opbnkt']
      @EndUserText.label: '개설은행'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_OPBNK', element: 'Cdno' }}]
      _Asim0030n.Opbnk                                                                                                          as Opbnk,

      @EndUserText.label: '개설은행명'
      _Asim0030n.Opbnkt                                                                                                         as Opbnkt,

      @EndUserText.label: 'L/C번호'
      _Asim0030n.Opnum                                                                                                          as Opnum,

      @EndUserText.label: 'L/C오픈금액'
      @Semantics.amount.currencyCode : 'Opwrs'
      _Asim0030n.Opamt                                                                                                          as Opamt,

      @EndUserText.label: '통화 키'
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_CurrencyStdVH', element: 'Currency' }}]
      _Asim0030n.Opwrs                                                                                                          as Opwrs,

      @ObjectModel.text.element: ['Ptermt']
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_PTERM', element: 'Cdno' }}]
      @EndUserText.label: '결제조건'
      _Asim0030n.Pterm                                                                                                          as Pterm,

      @EndUserText.label: '결제조건명'
      _Asim0030n.Ptermt                                                                                                         as Ptermt,

     @EndUserText.label: '일수'
      _Asim0030n.Zbd1t                     as Zbd1t,

      @EndUserText.label: '결제조건일수'
      cast( 0 as abap.dec(3,0))                     as Zbd1tFees,

      @EndUserText.label: '결제예정일'
      _Asim0030n.Pedat                                                                                                          as Pedat,

      @EndUserText.label: '만기기준일'
      _Asim0030n.Pdate                                                                                                          as Zfbdt,

      @EndUserText.label: '오픈예정일'
      _Asim0030n.Oedat                                                                                                          as Oedat,

      @ObjectModel.text.element: ['Oplift']
      @EndUserText.label: '오픈처'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_OPLIF', element: 'Cdno' }}]
      _Asim0030n.Oplif                                                                                                          as Oplif,

      @EndUserText.label: '오픈처명'
      _Asim0030n.Oplift                                                                                                         as Oplift,

      @EndUserText.label: 'Sdate'
      _Asim0030n.Sdate                                                                                                          as Sdate,

      @EndUserText.label: 'Edate'
      _Asim0030n.Edate                                                                                                          as Edate,

      @ObjectModel.text.element: ['Colift']
      @EndUserText.label: '실계약처'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_COLIF', element: 'Cdno' }}]
      _Asim0030n.Colif                                                                                                          as Colif,

      @EndUserText.label: '실계약처명'
      _Asim0030n.Colift                                                                                                         as Colift,

      @ObjectModel.text.element: ['Filift']
      @EndUserText.label: '파이낸스'
      _Asim0030n.Filif                                                                                                          as Filif,

      @EndUserText.label: '파이낸스명'
      _Asim0030n.Filift                                                                                                         as Filift,

      @EndUserText.label: '계약번호1'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_CONT1', element: 'Cdno' }}]
      _Asim0030n.Cont1                                                                                                          as Cont1,

      @EndUserText.label: '계약번호2'
      _Asim0030n.Cont2                                                                                                          as Cont2,

      @EndUserText.label: '접수일'
      _Asim0030n.Acdat                                                                                                          as Acdat,

      @EndUserText.label: 'BOOKING No.'
      _Asim0030n.Bokno                                                                                                          as Bokno,

      @ObjectModel.text.element: ['Conrtt']
      @EndUserText.label: '계약유형'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_CONRT', element: 'Cdno' }}]
      _Asim0030n.Conrt                                                                                                          as Conrt,

      @EndUserText.label: '계약유형명'
      _Asim0030n.Conrt                                                                                                          as Conrtt,

      @EndUserText.label: '양도일(수입대행)'
      _Asim0030n.Trdat                                                                                                          as Trdat,

      @EndUserText.label: 'B/L번호(수입대행)'
      _Asim0030n.Trbln                                                                                                          as Trbln,

      @EndUserText.label: '개설환율'
      _Asim0030n.Rqrsf                                                                                                          as Rqrsf,

      @EndUserText.label: '부보환율'
      _Asim0030n.Bbrsf                                                                                                          as Bbrsf,

      @EndUserText.label: '부보대상금액'
      @Semantics.amount.currencyCode : 'Bbwrs'
      _Asim0030n.Bbamt                                                                                                          as Bbamt,

      @ObjectModel.filter.enabled: false
      @EndUserText.label: '통화 키'
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_CurrencyStdVH', element: 'Currency' }}]
      _Asim0030n.Bbwrs                                                                                                          as Bbwrs,

      @EndUserText.label: '부보일'
      _Asim0030n.Bbdat                                                                                                          as Bbdat,

      @ObjectModel.text.element: ['Bbgbt']
      @EndUserText.label: '보험조건'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_BBGB', element: 'Cdno' }}]
      _Asim0030n.Bbgb                                                                                                           as Bbgb,

      @EndUserText.label: '보험조건명'
      _Asim0030n.Bbgbt                                                                                                          as Bbgbt,

      @EndUserText.label: '계약완료'
      _Asim0030n.Rqche                                                                                                          as Rqche,

      @EndUserText.label: '인수일'
      _Asim0030n.Isdat                                                                                                          as Isdat,

      @EndUserText.label: '주차(오퍼)'
      _Asim0030n.Rqweek                                                                                                         as Rqweek,

      @EndUserText.label: '보험증권번호'
      _Asim0030n.Bbno                                                                                                           as Bbno,

      @ObjectModel.text.element: ['Bblift']
      @EndUserText.label: '보험회사'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_BBLIF', element: 'Cdno' }}]
      _Asim0030n.Bblif                                                                                                          as Bblif,

      @EndUserText.label: '보험회사명'
      _Asim0030n.Bblift                                                                                                         as Bblift,

      @ObjectModel.filter.enabled: false
      @EndUserText.label: '부보 Basic Rate'
      _Asim0030n.Bbrate                                                                                                         as Bbrate,

      @ObjectModel.filter.enabled: false
      @EndUserText.label: 'Remark'
      _Asim0030n.Remak                                                                                                          as Remak,

      @ObjectModel.text.element: ['Werkst']
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_WERKS', element: 'Werks' }}]
      @EndUserText.label: '플랜트'
      _Asim0040n.Werks                                                                                                          as Werks,

      @EndUserText.label: '플랜트명'
      _Asim0040n.Werkst                                                                                                         as Werkst,

      @ObjectModel.text.element: ['Maktx']
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_MATNR', element: 'Matnr' }}]
      @EndUserText.label: '자재번호'
      _Asim0040n.Matnr                                                                                                          as Matnr,

      @EndUserText.label: '자재명'
      _Asim0040n.Maktx                                                                                                          as Maktx,

      @ObjectModel.text.element: ['Lgortt']
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_LGORT', element: 'Lgort' }}]
      @EndUserText.label: '저장위치'
      _Asim0040n.Lgort                                                                                                          as Lgort,

      @EndUserText.label: '저장위치명'
      _Asim0040n.Lgortt                                                                                                         as Lgortt,

      @EndUserText.label: 'B/L수량'
      @Semantics.quantity.unitOfMeasure: 'Blmns'
      _Asim0040n.Blmng                                                                                                          as Blmng,

      @EndUserText.label: '잔여수량'
      @Semantics.quantity.unitOfMeasure: 'Blmns'
      //분할 생성 시,
      case when _Asim0040n.Modmg_iv > 0 then _Asim0040n.Modmg_iv
      else _Asim0040n.Blmng end                                                                                                 as Divmg,

      @EndUserText.label: 'B/L단위'
      _Asim0040n.Blmns                                                                                                          as Blmns,

      @EndUserText.label: 'B/L단가'
      @Semantics.amount.currencyCode: 'Waers'
      _Asim0040n.Blmpr                                                                                                          as Blmpr,

      @EndUserText.label: 'B/L금액'
      @Semantics.amount.currencyCode: 'Waers'
      case when _Asim0040n.Modpr = 0 then 0
      else case when _Asim0040n.Modmg_iv > 0 then
           cast( _Asim0040n.Modmg_iv * ( _Asim0040n.Modpr / _Asim0040n.Blpnh ) as abap.dec(20,2))
           else cast( _Asim0040n.Blmng * ( _Asim0040n.Modpr / _Asim0040n.Blpnh ) as abap.dec(20,2))
           end
      end                                                                                                                       as Blmwr,

      @EndUserText.label: '가격단위'
      _Asim0040n.Blpnh                                                                                                          as Blpnh,

      @EndUserText.label: '납품일'
      _Asim0040n.Eindt                                                                                                          as Eindt,

      @EndUserText.label: '관세율'
      _Asim0040n.Zdc1_p                                                                                                         as Zdc1_p,

      //      @EndUserText.label: '관세액'
      //      @Semantics.amount.currencyCode: 'Waers'
      //      _Asim0040n.Zdc1_n                                                                        as Zdc1_n,

      @EndUserText.label: '부대비율'
      _Asim0040n.Zdc2_p                                                                                                         as Zdc2_p,

      //      @EndUserText.label: '부대비액'
      //      @Semantics.amount.currencyCode: 'Waers'
      //      _Asim0040n.Zdc2_n                                                                        as Zdc2_n,

      @EndUserText.label: '제조일'
      _Asim0040n.Hsdat                                                                                                          as Hsdat,

      @EndUserText.label: '계정지정범주'
      _Asim0040n.Knttp                                                                                                          as Knttp,

      @EndUserText.label: 'G/L계정'
      _Asim0040n.Sakto                                                                                                          as Sakto,

      @EndUserText.label: '자산번호'
      _Asim0040n.Anln1                                                                                                          as Anln1,

      @EndUserText.label: '코스트센터'
      _Asim0040n.Kostl                                                                                                          as Kostl,

      @EndUserText.label: '구매요청번호'
      _Asim0040n.Zebeln                                                                                                         as Zebeln,

      @EndUserText.label: '구매요청품목'
      _Asim0040n.Zebelp                                                                                                         as Zebelp,

      @EndUserText.label: 'BL참조'
      cast('B' as abap.char(1))                                                                                                 as Ivgb,

      @EndUserText.label: '만기일'
      dats_add_days(_Asim0030n.Pdate,cast(cast(cast(_Asim0030n.Zbd1t as abap.char(5)) as abap.numc(5)) as abap.int4),'INITIAL') as Fbedt,

      @EndUserText.label: '참조구분'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_FEEGB', element: 'Cdno'} }]
      @ObjectModel.text.element: ['Feegbt']
      cast('B' as abap.char(12))                                                                                                as Feegb,

      @EndUserText.label: '참조문서구분'
      cast('B/L참조' as abap.char(40))                                                                                            as Feegbt,
      
      @EndUserText.label: '참조코드'
      _Asim0030n.Blino                as Gbno
      
//      @EndUserText.label : '공급가액' 
//      @Semantics.amount.currencyCode : 'Waers'
//      _Asim0030n.Blamt                                                                                                          as RmwwrFees,
//      
//      @EndUserText.label: '통화 키'
//      _Asim0030n.Waers                                                                                                          as WaersFees
}
where
  _Asim0030n.Loekz = ''
  and _Asim0030n.Blche = ''

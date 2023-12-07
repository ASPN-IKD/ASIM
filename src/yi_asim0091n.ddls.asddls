@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입입고 생성가능 정보 인터페이스 뷰'
define root view entity YI_ASIM0091N
  as select from YI_ASIM0080N as _Asim0080n
    join         YI_ASIM0070N as _Asim0070n on _Asim0070n.Uuid = _Asim0080n.ParentUUID

  association [0..1] to YI_ASIM0090N_CREATED_FINAL as _Mod on  _Asim0080n.Cclno = _Mod.Cclno
                                                           and _Asim0080n.Cclyr = _Mod.Cclyr
                                                           and _Asim0080n.Cclnp = _Mod.Cclnp
{
  key _Asim0080n.Uuid                 as Uuid,

      @EndUserText.label: '통관번호'
      _Asim0080n.Cclno                as Cclno,

      @EndUserText.label: '통관연도'
      _Asim0080n.Cclyr                as Cclyr,

      @EndUserText.label: '통관품목'
      _Asim0080n.Cclnp                as Cclnp,

      @EndUserText.label: 'B/L내부번호'
      _Asim0070n.Blino                as Blino,

      @EndUserText.label: 'B/L연도'
      _Asim0070n.Bliyr                as Bliyr,

      @EndUserText.label: 'B/L품목'
      _Asim0080n.Blinp                as Blinp,

      @EndUserText.label: '통관예정연도'
      _Asim0070n.Eccyr                as Eccyr,

      @EndUserText.label: '통관예정품목'
      _Asim0080n.Eccnp                as Eccnp,

      @EndUserText.label: '통관예정번호'
      _Asim0070n.Eccno                as Eccno,

      @EndUserText.label: '계약연도'
      _Asim0070n.Reqyr                as Reqyr,

      @EndUserText.label: '계약내부번호'
      _Asim0070n.Reqno                as Reqno,

      @EndUserText.label: '계약품목'
      _Asim0080n.Itmno                as Itmno,

      @EndUserText.label: '관리번호'
      _Asim0070n.Reqmu                as Reqmu,

      @EndUserText.label: '구매문서번호'
      _Asim0080n.Ebeln                as Ebeln,

      @EndUserText.label: '구매문서품목'
      _Asim0080n.Ebelp                as Ebelp,

      @ObjectModel.text.element: ['Bukrst']
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_BUKRS', element: 'Bukrs' }}]
      @EndUserText.label: '회사코드'
      _Asim0070n.Bukrs                as Bukrs,

      @EndUserText.label: '회사코드명'
      _Asim0070n.Bukrst               as Bukrst,

      @EndUserText.label: '구매조직'
      _Asim0070n.Ekorg                as Ekorg,

      @EndUserText.label: '구매조직명'
      _Asim0070n.Ekorgt               as Ekorgt,

      @ObjectModel.text.element: ['Ekgrpt']
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_EKGRP', element: 'Ekgrp' }}]
      @EndUserText.label: '구매그룹'
      _Asim0070n.Ekgrp                as Ekgrp,

      @EndUserText.label: '구매그룹명'
      _Asim0070n.Ekgrpt               as Ekgrpt,

      @ObjectModel.text.element: ['Lifnrt']
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_LIFNR', element: 'Lifnr' }}]
      @EndUserText.label: '공급업체'
      _Asim0070n.Lifnr                as Lifnr,

      @EndUserText.label: '공급업체명'
      _Asim0070n.Lifnrt               as Lifnrt,

      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_CCLIF', element: 'Cdno'} }]
      @ObjectModel.text.element: ['Cclift']
      @EndUserText.label: '세관'
      _Asim0070n.Cclif                as Cclif,

      @EndUserText.label: '세관명'
      _Asim0070n.Cclift               as Cclift,

      @EndUserText.label: '수입신고번호'
      _Asim0070n.Decno                as Decno,

      @EndUserText.label: '신고일'
      _Asim0070n.Decdt                as Decdt,

      @EndUserText.label: '반입일'
      _Asim0070n.Ccldt                as Ccldt,

      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_CCPER', element: 'Cdno'} }]
      @ObjectModel.text.element: ['Ccpert']
      @EndUserText.label: '신고인'
      _Asim0070n.Ccper                as Ccper,

      @EndUserText.label: '신고인명'
      _Asim0070n.Ccpert               as Ccpert,

      @Semantics.amount.currencyCode : 'Ccwae'
      @EndUserText.label: '총과세가격'
      _Asim0070n.Ccamt                as Ccamt,

      @Semantics.amount.currencyCode : 'Ccwaek'
      @EndUserText.label: '총과세가격(현지 통화)'
      _Asim0070n.Ccamtk               as Ccamtk,

      @Semantics.amount.currencyCode : 'Ccwaek'
      @EndUserText.label: '관세'
      _Asim0070n.Ccvat1               as Ccvat1,

      @Semantics.amount.currencyCode : 'Ccwaek'
      @EndUserText.label: '수입부가세'
      _Asim0070n.Ccvat2               as Ccvat2,

      @Semantics.amount.currencyCode : 'Ccwaek'
      @EndUserText.label: '과세 표준액(현지 통화)'
      _Asim0070n.Hwbas                as Hwbas,

      @ObjectModel.filter.enabled: false
      @EndUserText.label: '통화 키'
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_CurrencyStdVH', element: 'Currency' }}]
      _Asim0070n.Ccwae                as Ccwae,

      @EndUserText.label: '현지통화'
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_CurrencyStdVH', element: 'Currency' }} ]
      _Asim0070n.Ccwaek               as Ccwaek,

      @EndUserText.label: '통관환율'
      _Asim0070n.Ccrsf                as Ccrsf,

      @EndUserText.label: '접수일'
      _Asim0070n.Ccdat1               as Ccdat1,

      @EndUserText.label: '수리일'
      _Asim0070n.Ccdat2               as Ccdat2,

      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_MOSNO', element: 'Cdno'} }]
      @ObjectModel.text.element: ['Ccmost']
      @EndUserText.label: '환적모선'
      _Asim0070n.Ccmos                as Ccmos,

      @EndUserText.label: '환적모선명'
      _Asim0070n.Ccmost               as Ccmost,

      @EndUserText.label: '통관비고'
      _Asim0070n.Ccltx                as Ccltx,

      @EndUserText.label: 'B/L번호'
      _Asim0070n.Bleno                as Bleno,

      @EndUserText.label: 'B/L발행일'
      _Asim0070n.Bldat                as Bldat,

      @EndUserText.label: '입항일'
      _Asim0070n.Bleta                as Bleta,

      @EndUserText.label: '선적일'
      _Asim0070n.Bletd                as Bletd,

      @EndUserText.label: 'ETD'
      _Asim0070n.Rqetd                as Rqetd,

      @EndUserText.label: 'ETA'
      _Asim0070n.Rqeta                as Rqeta,

      @EndUserText.label: '만기일수'
      _Asim0070n.Bld1t                as Bld1t,

      @EndUserText.label: '인수만기일'
      _Asim0070n.Bledt                as Bledt,

      @EndUserText.label: '선적서류접수일'
      _Asim0070n.Bldat2               as Bldat2,

      @EndUserText.label: '입고예정일'
      _Asim0070n.Blgrd                as Blgrd,

      @EndUserText.label: '총중량'
      _Asim0070n.Brgew                as Brgew,
      @EndUserText.label: '순중량'
      _Asim0070n.Negew                as Negew,
      @EndUserText.label: '중량단위'
      _Asim0070n.Gewei                as Gewei,

      @EndUserText.label: 'L/G번호'
      _Asim0070n.Lgnum                as Lgnum,

      @EndUserText.label: '컨테이너번호'
      _Asim0070n.Cntno                as Cntno,

      @ObjectModel.text.element: ['Mosnot']
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_MOSNO', element: 'Cdno' }}
      ]
      @EndUserText.label: '모선번호'
      _Asim0070n.Mosno                as Mosno,

      @EndUserText.label: '모선번호명'
      _Asim0070n.Mosnot               as Mosnot,

      @EndUserText.label: 'B/L총금액'
      @Semantics.amount.currencyCode : 'Waers'
      _Asim0070n.Blamt                as Blamt,

      @EndUserText.label: '통화키'
      _Asim0070n.Waers                as Waers,

      @EndUserText.label: 'B/L Text'
      _Asim0070n.Blitx                as Blitx,

      @EndUserText.label: '납품완료체크'
      _Asim0070n.Blche                as Blche,

      @EndUserText.label: '검역여부'
      _Asim0070n.Eccgb                as Eccgb,

      @ObjectModel.text.element: ['Lifret']
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_LIFRE', element: 'Cdno' }}]
      @EndUserText.label: '공급처'
      _Asim0070n.Lifre                as Lifre,

      @EndUserText.label: '공급처명'
      _Asim0070n.Lifret               as Lifret,

      @ObjectModel.text.element: ['Inco1t']
      @EndUserText.label: '인도조건'
      _Asim0070n.Inco1                as Inco1,

      @EndUserText.label: '인도조건명'
      _Asim0070n.Inco1t               as Inco1t,

      @EndUserText.label: '인도처'
      _Asim0070n.Inco2                as Inco2,

      @ObjectModel.text.element: ['Ztermt']
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZTERM', element: 'Cdno' }}]
      @EndUserText.label: '지급조건'
      _Asim0070n.Zterm                as Zterm,

      @EndUserText.label: '지급조건명'
      _Asim0070n.Ztermt               as Ztermt,

      @ObjectModel.text.element: ['Zcdno1t']
      @EndUserText.label: '도착지'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO1', element: 'Cdno' }}]
      _Asim0070n.Zcdno1               as Zcdno1,

      @EndUserText.label: '도착지명'
      _Asim0070n.Zcdno1t              as Zcdno1t,

      @ObjectModel.text.element: ['Zcdno2t']
      @EndUserText.label: '운송수단'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO2', element: 'Cdno' }}]
      _Asim0070n.Zcdno2               as Zcdno2,

      @EndUserText.label: '운송수단명'
      _Asim0070n.Zcdno2t              as Zcdno2t,

      @ObjectModel.text.element: ['Zcdno3t']
      @EndUserText.label: '선적지'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO3', element: 'Cdno' }}]
      _Asim0070n.Zcdno3               as Zcdno3,

      @EndUserText.label: '선적지명'
      _Asim0070n.Zcdno3t              as Zcdno3t,

      @ObjectModel.text.element: ['Zcdno4t']
      @EndUserText.label: '운송형태'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO4', element: 'Cdno' }}]
      _Asim0070n.Zcdno4               as Zcdno4,

      @EndUserText.label: '운송형태명'
      _Asim0070n.Zcdno4t              as Zcdno4t,

      @EndUserText.label: '총금액'
      @Semantics.amount.currencyCode : 'Waers'
      _Asim0070n.Netwr                as Netwr,

      @EndUserText.label: 'L/C오픈일'
      _Asim0070n.Opdat                as Opdat,

      @ObjectModel.text.element: ['Opbnkt']
      @EndUserText.label: '개설은행'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_OPBNK', element: 'Cdno' }}]
      _Asim0070n.Opbnk                as Opbnk,

      @EndUserText.label: '개설은행명'
      _Asim0070n.Opbnkt               as Opbnkt,

      @EndUserText.label: 'L/C번호'
      _Asim0070n.Opnum                as Opnum,

      @EndUserText.label: 'L/C오픈금액'
      @Semantics.amount.currencyCode : 'Opwrs'
      _Asim0070n.Opamt                as Opamt,

      @EndUserText.label: '통화 키'
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_CurrencyStdVH', element: 'Currency' }}]
      _Asim0070n.Opwrs                as Opwrs,

      @ObjectModel.text.element: ['Ptermt']
      @EndUserText.label: '결제조건'
      _Asim0070n.Pterm                as Pterm,

      @EndUserText.label: '결제조건명'
      _Asim0070n.Ptermt               as Ptermt,

      @EndUserText.label: '결제조건일수'
      _Asim0070n.Zbd1t                as Zbd1t,

      @EndUserText.label: '결제예정일'
      _Asim0070n.Pedat                as Pedat,

      @EndUserText.label: '결제일'
      _Asim0070n.Pdate                as Pdate,

      @EndUserText.label: '오픈예정일'
      _Asim0070n.Oedat                as Oedat,

      @ObjectModel.text.element: ['Oplift']
      @EndUserText.label: '오픈처'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_OPLIF', element: 'Cdno' }}]
      _Asim0070n.Oplif                as Oplif,

      @EndUserText.label: '오픈처명'
      _Asim0070n.Oplift               as Oplift,

      @EndUserText.label: 'Sdate'
      _Asim0070n.Sdate                as Sdate,

      @EndUserText.label: 'Edate'
      _Asim0070n.Edate                as Edate,

      @ObjectModel.text.element: ['Colift']
      @EndUserText.label: '실계약처'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_COLIF', element: 'Cdno' }}]
      _Asim0070n.Colif                as Colif,

      @EndUserText.label: '실계약처명'
      _Asim0070n.Colift               as Colift,

      @ObjectModel.text.element: ['Filift']
      @EndUserText.label: '파이낸스'
      _Asim0070n.Filif                as Filif,

      @EndUserText.label: '파이낸스명'
      _Asim0070n.Filift               as Filift,

      @EndUserText.label: '계약번호1'
      //@Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_CONT1', element: 'Cdno' }}]
      _Asim0070n.Cont1                as Cont1,

      @EndUserText.label: '계약번호2'
      _Asim0070n.Cont2                as Cont2,

      @EndUserText.label: '접수일'
      _Asim0070n.Acdat                as Acdat,

      @EndUserText.label: 'BOOKING No.'
      _Asim0070n.Bokno                as Bokno,

      @ObjectModel.text.element: ['Conrtt']
      @EndUserText.label: '계약유형'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_CONRT', element: 'Cdno' }}]
      _Asim0070n.Conrt                as Conrt,

      @EndUserText.label: '계약유형명'
      _Asim0070n.Conrt                as Conrtt,

      @EndUserText.label: '양도일(수입대행)'
      _Asim0070n.Trdat                as Trdat,

      @EndUserText.label: 'B/L번호(수입대행)'
      _Asim0070n.Trbln                as Trbln,

      @EndUserText.label: '개설환율'
      _Asim0070n.Rqrsf                as Rqrsf,

      @EndUserText.label: '부보환율'
      _Asim0070n.Bbrsf                as Bbrsf,

      @EndUserText.label: '부보대상금액'
      @Semantics.amount.currencyCode : 'Bbwrs'
      _Asim0070n.Bbamt                as Bbamt,

      @ObjectModel.filter.enabled: false
      @EndUserText.label: '통화 키'
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_CurrencyStdVH', element: 'Currency' }}]
      _Asim0070n.Bbwrs                as Bbwrs,

      @EndUserText.label: '부보일'
      _Asim0070n.Bbdat                as Bbdat,

      @ObjectModel.text.element: ['Bbgbt']
      @EndUserText.label: '보험조건'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_BBGB', element: 'Cdno' }}]
      _Asim0070n.Bbgb                 as Bbgb,

      @EndUserText.label: '보험조건명'
      _Asim0070n.Bbgbt                as Bbgbt,

      @EndUserText.label: '계약완료'
      _Asim0070n.Rqche                as Rqche,

      @EndUserText.label: '인수일'
      _Asim0070n.Isdat                as Isdat,

      @EndUserText.label: '주차(오퍼)'
      _Asim0070n.Rqweek               as Rqweek,

      @EndUserText.label: '보험증권번호'
      _Asim0070n.Bbno                 as Bbno,

      @ObjectModel.text.element: ['Bblift']
      @EndUserText.label: '보험회사'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_BBLIF', element: 'Cdno' }}]
      _Asim0070n.Bblif                as Bblif,

      @EndUserText.label: '보험회사명'
      _Asim0070n.Bblift               as Bblift,

      @ObjectModel.filter.enabled: false
      @EndUserText.label: '부보 Basic Rate'
      _Asim0070n.Bbrate               as Bbrate,

      @ObjectModel.filter.enabled: false
      @EndUserText.label: 'Remark'
      _Asim0070n.Remak                as Remak,

      @EndUserText.label: '통관예정일'
      _Asim0070n.Eccdt                as Eccdt,

      @EndUserText.label: '입고예정일'
      _Asim0070n.Egrdt                as Egrdt,

      @EndUserText.label: '화물관리번호'
      _Asim0070n.Eccmrn               as Eccmrn,

      @EndUserText.label: '보세운송번호'
      _Asim0070n.Ecctrn               as Ecctrn,

      @EndUserText.label: '장치위치정보'
      _Asim0070n.Eccwmn               as Eccwmn,

      @ObjectModel.text.element: ['Cclgortt']
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_CCLGORT', element: 'Cdno' }}]
      @EndUserText.label: '보세창고'
      _Asim0070n.Cclgort              as Cclgort,

      @EndUserText.label: '보세창고명'
      _Asim0070n.Cclgortt             as Cclgortt,

      @EndUserText.label: '검사(반입)장소'
      _Asim0070n.Cclog                as Cclog,

      @ObjectModel.text.element: ['Werkst']
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_WERKS', element: 'Werks' }}]
      @EndUserText.label: '플랜트'
      _Asim0080n.Werks                as Werks,

      @EndUserText.label: '플랜트명'
      _Asim0080n.Werkst               as Werkst,

      @ObjectModel.text.element: ['Maktx']
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_MATNR', element: 'Matnr' }}]
      @EndUserText.label: '자재번호'
      _Asim0080n.Matnr                as Matnr,

      @EndUserText.label: '자재명'
      _Asim0080n.Maktx                as Maktx,

      @ObjectModel.text.element: ['Lgortt']
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_LGORT', element: 'Lgort' }}]
      @EndUserText.label: '저장위치'
      _Asim0080n.Lgort                as Lgort,

      @EndUserText.label: '저장위치명'
      _Asim0080n.Lgortt               as Lgortt,

      @EndUserText.label: '통관수량'
      @Semantics.quantity.unitOfMeasure: 'Cclmns'
      case when _Mod.chk = '' then cast(_Mod.Modmg as abap.quan(13,3))
      when  _Mod.chk is null then _Asim0080n.Cclmng
           else _Asim0080n.Cclmng end as Cclmng,

      @EndUserText.label: '통관단위'
      _Asim0080n.Cclmns               as Cclmns
}

where
       _Asim0070n.Loekz = ''
  and(
       _Mod.chk         = ''
    or _Mod.chk         is null
  )

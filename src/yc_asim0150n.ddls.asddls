@EndUserText.label: '수입마감 컨섭션 뷰'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity YC_ASIM0150N
  provider contract transactional_query
  as projection on YI_ASIM0150N
{
      @EndUserText.label: '구매문서번호'
  key Ebeln,
      @EndUserText.label: '관리번호'
  key Reqmu,
      @EndUserText.label: 'B/L내부번호'
  key Blino,
      @EndUserText.label: 'B/L연도'
  key Bliyr,
      @EndUserText.label: '계약완료여부'
      Rqche,
      @EndUserText.label: '계약완료여부 아이콘'
      RqcheIcon,
      @EndUserText.label: '납품완료여부'
      Blche,
      @EndUserText.label: '납품완료여부 아이콘'
      BlcheIcon,
      @EndUserText.label: '물품대미착금액'
      Pbxxa,
      @EndUserText.label: '관세미착금액'
      Zdc1a,
      @EndUserText.label: '부대비미착금액'
      Zdc2a,
      @EndUserText.label: '미착조정여부'
      Grirche,
      @EndUserText.label: '미착조정여부 아이콘'
      GrircheIcon,
      @EndUserText.label: '최종마감문서'
      Fblnr,
      @EndUserText.label: '최종마감연도'
      Fjahr,
      @EndUserText.label: '최종마감전기일'
      Fdate,
      @EndUserText.label: '계약연도'
      Reqyr,
      @EndUserText.label: '계약내부번호'
      Reqno,
      @ObjectModel.text.element: ['Bukrst']
      @EndUserText.label: '회사코드'
      Bukrs,
      @EndUserText.label: '회사코드명'
      Bukrst,
      @ObjectModel.text.element: ['Ekorgt']
      @EndUserText.label: '구매조직'
      Ekorg,
      @EndUserText.label: '구매조직명'
      Ekorgt,
      @ObjectModel.text.element: ['Ekgrpt']
      @EndUserText.label: '구매그룹'
      Ekgrp,
      @EndUserText.label: '구매그룹명'
      Ekgrpt,
      @ObjectModel.text.element: ['Lifnrt']
      @EndUserText.label: '공급업체'
      Lifnr,
      @EndUserText.label: '공급업체명'
      Lifnrt,
      @EndUserText.label: '삭제지시자'
      Loekz,
      @EndUserText.label: '요청일'
      Reqdt,
      @EndUserText.label: 'B/L번호'
      Bleno,
      @EndUserText.label: 'B/L발행일'
      Bldat,
      @EndUserText.label: '입항일'
      Bleta,
      @EndUserText.label: '선적일'
      Bletd,
      @EndUserText.label: 'ETD'
      Rqetd,
      @EndUserText.label: 'ETA'
      Rqeta,
      @EndUserText.label: '만기일수'
      Bld1t,
      @EndUserText.label: '인수만기일'
      Bledt,
      @EndUserText.label: '선적서류접수일'
      Bldat2,
      @EndUserText.label: '입고예정일'
      Blgrd,
      @EndUserText.label: '총중량'
      @Semantics.quantity.unitOfMeasure: 'Gewei'
      Brgew,
      @EndUserText.label: '순중량'
      @Semantics.quantity.unitOfMeasure: 'Gewei'
      Negew,
      @EndUserText.label: '중량단위'
      Gewei,
      @EndUserText.label: 'L/G번호'
      Lgnum,
      @EndUserText.label: '컨테이너번호'
      Cntno,
      @ObjectModel.text.element: ['Mosnot']
      @EndUserText.label: '모선번호'
      Mosno,
      @EndUserText.label: '모선번호명'
      Mosnot,
      @EndUserText.label: 'B/L총금액'
      @Semantics.amount.currencyCode : 'Waers'
      Blamt,
      @EndUserText.label: '통화키'
      Waers,
      @EndUserText.label: 'B/L Text'
      Blitx,
      @EndUserText.label: '검역여부'
      Eccgb,
      @ObjectModel.text.element: ['Lifret']
      @EndUserText.label: '공급처'
      Lifre,
      @EndUserText.label: '공급처명'
      Lifret,
      @ObjectModel.text.element: ['Inco1t']
      @EndUserText.label: '인도조건'
      Inco1,
      @EndUserText.label: '인도조건명'
      Inco1t,
      @EndUserText.label: '인도처'
      Inco2,
      @ObjectModel.text.element: ['Ztermt']
      @EndUserText.label: '지급조건'
      Zterm,
      @EndUserText.label: '지급조건명'
      Ztermt,
      @ObjectModel.text.element: ['Zcdno1t']
      @EndUserText.label: '도착지'
      Zcdno1,
      @EndUserText.label: '도착지명'
      Zcdno1t,
      @ObjectModel.text.element: ['Zcdno2t']
      @EndUserText.label: '운송수단'
      Zcdno2,
      @EndUserText.label: '운송수단명'
      Zcdno2t,
      @ObjectModel.text.element: ['Zcdno3t']
      @EndUserText.label: '선적지'
      Zcdno3,
      @EndUserText.label: '선적지명'
      Zcdno3t,
      @ObjectModel.text.element: ['Zcdno4t']
      @EndUserText.label: '운송형태'
      Zcdno4,
      @EndUserText.label: '운송형태명'
      Zcdno4t,
      @EndUserText.label: '계약총금액'
      @Semantics.amount.currencyCode : 'Waers'
      Netwr,
      @EndUserText.label: 'L/C오픈일'
      Opdat,
      @ObjectModel.text.element: ['Opbnkt']
      @EndUserText.label: '개설은행'
      Opbnk,
      @EndUserText.label: '개설은행명'
      Opbnkt,
      @EndUserText.label: 'L/C번호'
      Opnum,
      @EndUserText.label: 'L/C오픈금액'
      @Semantics.amount.currencyCode : 'Opwrs'
      Opamt,
      @EndUserText.label: '개설통화키'
      Opwrs,
      @ObjectModel.text.element: ['Ptermt']
      @EndUserText.label: '결제조건'
      Pterm,
      @EndUserText.label: '결제조건명'
      Ptermt,
      @EndUserText.label: '결제조건일수'
      Zbd1t,
      @EndUserText.label: '결제예정일'
      Pedat,
      @EndUserText.label: '결제일'
      Pdate,
      @EndUserText.label: '오픈예정일'
      Oedat,
      @ObjectModel.text.element: ['Oplift']
      @EndUserText.label: '오픈처'
      Oplif,
      @EndUserText.label: '오픈처명'
      Oplift,
      @EndUserText.label: 'Sdate'
      Sdate,
      @EndUserText.label: 'Edate'
      Edate,
      @ObjectModel.text.element: ['Colift']
      @EndUserText.label: '실계약처'
      Colif,
      @EndUserText.label: '실계약처명'
      Colift,
      @ObjectModel.text.element: ['Filift']
      @EndUserText.label: '파이낸스'
      Filif,
      @EndUserText.label: '파이낸스명'
      Filift,
      @EndUserText.label: '계약번호1'
      Cont1,
      @EndUserText.label: '계약번호2'
      Cont2,
      @EndUserText.label: '접수일'
      Acdat,
      @EndUserText.label: 'BOOKING No.'
      Bokno,
      @ObjectModel.text.element: ['Conrtt']
      @EndUserText.label: '계약유형'
      Conrt,
      @EndUserText.label: '계약유형명'
      Conrtt,
      @ObjectModel.filter.enabled: false
      @EndUserText.label: 'Remark'
      Remak,
      @EndUserText.label: '현지통화키'
      Waersk
}

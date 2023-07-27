@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'B/L 내부번호 도움말'
@ObjectModel.resultSet.sizeCategory: #XS
// 미완성된 뷰 - lfa1 인터페이스 및 30n_c 필요
define view entity ZASIMV_BLINO
  as select from zasimt0030n
  // inner join   lfa1   as B     on A.lifnr = B.lifnr
  //    inner join   zasimt0010n_c as C on  A.loekz           = C.loekz
  //                             and A.loekz           = ''
  //                             and C.loekz = ''
  association [1..1] to YI_ASIM0010N as _asim0010n on  $projection.reqmu = _asim0010n.Reqmu
                                                   and zasimt0030n.reqno = _asim0010n.Reqno
                                                   and zasimt0030n.reqyr = _asim0010n.Reqyr
  association [1..1] to ZASIMV_LIFNR as _lifnr     on  $projection.lifnr = _lifnr.Lifnr
  association [0..1] to YI_ASIM0001N as _mosno     on  $projection.mosno =    _mosno.Zcdno
                                                   and _mosno.Zcode      like '%MOSNO'
                                                   and _mosno.Zcdno      <>   '00'
{
      @EndUserText.label: 'B/L내부번호'
  key blino,

      @EndUserText.label: 'B/L연도'
      bliyr,

      @EndUserText.label: '관리번호'
      reqmu,

      @EndUserText.label: '구매문서번호'
      ebeln,
      
      @ObjectModel.text.element: ['Lifnrt']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_LIFNR', element: 'Lifnr' }}
      ]
      @EndUserText.label: '공급업체'
      lifnr,

      @EndUserText.label: '공급업체명'
      _lifnr.Lifnrt     as Lifnrt,

      @ObjectModel.text.element: ['Ztermt']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_ZTERM', element: 'Zterm' }}
      ]
      @EndUserText.label: '지급조건'
      _asim0010n.Zterm  as Zterm,

      @EndUserText.label: '지급조건명'
      _asim0010n.Ztermt as Ztermt,

      @EndUserText.label: '계약번호1'
      _asim0010n.Cont1  as Cont1,

      @EndUserText.label: '계약번호2'
      _asim0010n.Cont2  as Cont2,

      @EndUserText.label: 'L/C번호'
      _asim0010n.Opnum  as Opnum,

      @EndUserText.label: 'B/L번호'
      bleno,

      @EndUserText.label: 'B/L발행일'
      bldat,

      @EndUserText.label: '입항일'
      bleta,

      @EndUserText.label: '선적일'
      bletd,

      @EndUserText.label: 'ETD'
      rqetd,

      @EndUserText.label: 'ETA'
      rqeta,

      @EndUserText.label: '선적서류접수일'
      bldat2,

      @EndUserText.label: '입고예정일'
      blgrd,

      @Semantics.quantity.unitOfMeasure: 'Gewei'
      @EndUserText.label: '총중량'
      brgew,

      @Semantics.quantity.unitOfMeasure: 'Gewei'
      @EndUserText.label: '순중량'
      negew,

      @EndUserText.label: '중량단위'
      gewei,

      @EndUserText.label: 'L/G번호'
      lgnum,

      @EndUserText.label: '컨테이너번호'
      cntno,

      @ObjectModel.text.element: ['Mosnot']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_MOSNO', element: 'Mosno' }}
      ]
      @EndUserText.label: '모선번호'
      mosno,

      @EndUserText.label: '모선명'
      _mosno.Ztext      as Mosnot,

      @Semantics.amount.currencyCode: 'WAERS'
      @EndUserText.label: 'B/L총금액'
      blamt,

      @EndUserText.label: '통화'
      waers,

      @EndUserText.label: 'B/L비고'
      blitx
}

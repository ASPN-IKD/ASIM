@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입 구매오더 헤더/아이템 인터페이스 뷰'
define view entity YI_ASIM0012N
  as select from zasimt0010n as _reqhead
  left outer join zasimt0020n as _reqitem   on  _reqitem.parentuuid = _reqhead.uuid
  association [0..1] to YI_ASIM0001N as _zcdno3 on  $projection.Zcdno3 =    _zcdno3.Zcdno
                                                and _zcdno3.Zcode      like '%ZCDNO3'
                                                and _zcdno3.Zcdno      <>   '00'
  association [0..1] to YI_ASIM0040N as _blitem on _blitem.Reqno = _reqitem.reqno
                                                and _blitem.Reqyr = _reqitem.reqyr
                                                and _blitem.Itmno = _reqitem.itmno

{
  key _reqhead.uuid        as Uuid,
      @EndUserText.label: '회사코드'
      _reqhead.bukrs,
      @EndUserText.label: '구매조직'
      _reqhead.ekorg       as Ekorg,
      @EndUserText.label: '관리번호'
      _reqhead.reqmu       as Reqmu,
      @EndUserText.label: '계약내부번호'
      _reqhead.reqno       as Reqno,
      @EndUserText.label: '요청일'
      _reqhead.reqdt       as Reqdt,
      @EndUserText.label: '공급업체'
      _reqhead.lifnr       as Lifnr,
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_ZTERM', element: 'Cdno' }}
      ]
      @EndUserText.label: '지급조건'
      _reqhead.zterm       as Zterm,
      @EndUserText.label: '계약번호1'
      _reqhead.cont1       as Cont1,
      @EndUserText.label: '계약번호2'
      _reqhead.cont2,
      @EndUserText.label: '선적지'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO3', element: 'Cdno' }}]
      _reqhead.zcdno3      as Zcdno3,
      @EndUserText.label: '도착지'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO1', element: 'Cdno' }}]
      _reqhead.zcdno1      as Zcdno1,
      @EndUserText.label: 'L/C오픈일'
      _reqhead.opdat       as Opdat,
      @EndUserText.label: 'L/C번호'
      _reqhead.opnum       as Opnum,
      @EndUserText.label: '보험증권번호'
      _reqhead.bbno        as Bbno,
      @EndUserText.label: '계약품목'
      _reqitem.itmno as Itmno,
      @EndUserText.label: '자재번호'
      _reqitem.matnr as Matnr,
      @EndUserText.label: '플랜트'
      _reqitem.werks as Werks,
      @EndUserText.label: '계약수량'
      @Semantics.quantity.unitOfMeasure: 'Reqms'
      case
      // 0보다 작으면 0 처리 (안보여야 함)
      //  when cast((_reqitem.reqmg - _blitem.Blmng) as abap.quan( 13, 3 )) <= cast(0 as abap.quan( 13, 3 ))
      //  then cast(0 as abap.quan( 13, 3 ))
      // 완료한도 안에 있으면 0처리 (안보여야함)
      // when cast((_reqitem.reqmg - _blitem.Blmng) as abap.quan( 13, 3 )) <= cast(5 as abap.quan( 13, 3 ))
        when cast((_reqitem.reqmg - _blitem.Blmng) as abap.quan( 13, 3 )) <= cast(5 as abap.quan( 13, 3 ))
        then cast(0 as abap.quan( 13, 3 ))
        else cast(_reqitem.reqmg - _blitem.Blmng as abap.quan( 13, 3 ))
      end             as Reqmg,
      _reqitem.reqms as Reqms,
      @EndUserText.label: '계약단가'
      _reqitem.reqnr as Reqnr,
      _reqitem.waers as Waers,
      @EndUserText.label: '인도조건'
      _reqhead.inco1       as Inco1m,
      _blitem.Blmng as Blmng,
      _blitem.Blmns as Blmns
}
where cast((_reqitem.reqmg - _blitem.Blmng) as abap.quan( 13, 3 )) > cast(5 as abap.quan( 13, 3 ))

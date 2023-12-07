@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입I/V 기생성 정보 인터페이스 뷰'
define view entity YI_ASIM0050N_CREATED
  as select from zasimt0060n as _Ivitem
    join         zasimt0050n as _Ivheader on  _Ivitem.belnr = _Ivheader.belnr
                                          and _Ivitem.gjahr = _Ivheader.gjahr
    join         zasimt0020n as _reqitem  on  _Ivitem.reqno = _reqitem.reqno
                                          and _Ivitem.reqyr = _reqitem.reqyr
                                          and _Ivitem.itmno = _reqitem.itmno
{
  key _Ivheader.ivgb     as Ivgb,
  key _Ivitem.reqno,
  key _Ivitem.reqyr,
  key _Ivitem.itmno,

      @Semantics.quantity.unitOfMeasure: 'Meins'
      sum(_Ivitem.ivmng) as Ivmng,
      _Ivitem.meins      as Meins

      //  @Semantics.quantity.unitOfMeasure: 'Blmns'
      //  _Blitem.blmng as Blmng,
      //  _Blitem.blmns as Blmns,

      //  @Semantics.quantity.unitOfMeasure: 'Reqms'
      //  _reqitem.reqmg as Reqmg,
      //  _reqitem.reqms as Reqms

}
where
      _Ivheader.stblg = ''
  and _Ivheader.ivgb  = 'A'
  and _Ivheader.loekz = ''

group by
  _Ivitem.reqno,
  _Ivitem.reqyr,
  _Ivitem.itmno,
  //_Ivitem.blino,
  //_Ivitem.bliyr,
  //_Ivitem.blinp,
  _Ivitem.meins,
  _Ivheader.ivgb
//         _Blitem.blmng,
//         _Blitem.blmns,
//         _reqitem.reqmg,
//         _reqitem.reqms

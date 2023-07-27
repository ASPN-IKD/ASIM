@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입B/L 기생성 정보 인터페이스 뷰'
define view entity YI_ASIM0030N_CREATED as select from zasimt0040n as _blitem
   join zasimt0020n as _reqitem on _blitem.reqno = _reqitem.reqno
                                and _blitem.reqyr = _reqitem.reqyr
                                and _blitem.itmno = _reqitem.itmno
{
  key _blitem.reqno as Reqno,
  key _blitem.reqyr as Reqyr,
  key _blitem.itmno as Itmno,
  
  @Semantics.quantity.unitOfMeasure: 'Blmns'
  sum(_blitem.blmng) as Blmng,
  _blitem.blmns as Blmns,
  
  @Semantics.quantity.unitOfMeasure: 'Reqms'
  _reqitem.reqmg as Reqmg,
  _reqitem.reqms as Reqms
  
} where _blitem.loekz =  ''

group by _blitem.reqno,
         _blitem.reqyr,
         _blitem.itmno,
         _blitem.blmns,
         _reqitem.reqmg,
         _reqitem.reqms

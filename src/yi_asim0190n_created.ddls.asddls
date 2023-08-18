@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입통관예정 기생성 정보 인터페이스 뷰'
define view entity YI_ASIM0190N_CREATED as select from zasimt0200n as _Eccitem
 join zasimt0040n as _Blitem on _Eccitem.blino = _Blitem.blino
                                and _Eccitem.bliyr = _Blitem.bliyr
                                and _Eccitem.blinp = _Blitem.blinp
 join zasimt0030n as _Blheader on _Blitem.blino = _Blheader.blino
                                and _Blitem.bliyr = _Blheader.bliyr
                                and _Blheader.eccgb = 'X'
{
  key _Eccitem.blino as Blino,
  key _Eccitem.bliyr as Bliyr,
  key _Eccitem.blinp as Blinp,
  
  @Semantics.quantity.unitOfMeasure: 'Eccmns'
  sum(_Eccitem.eccmng) as Eccmng,
  _Eccitem.eccmns as Eccmns,
  
  @Semantics.quantity.unitOfMeasure: 'Blmns'
  _Blitem.blmng as Blmng,
  _Blitem.blmns as Blmns  
  
} where _Eccitem.loekz =  ''

group by _Eccitem.blino,
         _Eccitem.bliyr,
         _Eccitem.blinp,
         _Eccitem.eccmns,
         _Blitem.blmng,
         _Blitem.blmns

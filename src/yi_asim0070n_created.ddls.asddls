@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입통관 기생성 정보 인터페이스 뷰'
define root view entity YI_ASIM0070N_CREATED as select from zasimt0080n as _Ccitem
 join zasimt0030n as _Blheader on _Blheader.blino = _Ccitem.blino
                               and _Blheader.bliyr = _Ccitem.bliyr
 join zasimt0040n as _Blitem on _Ccitem.blino = _Blitem.blino
                                and _Ccitem.bliyr = _Blitem.bliyr
                                and _Ccitem.blinp = _Blitem.blinp
 left outer join zasimt0200n as _Eccitem on _Ccitem.eccno = _Eccitem.eccno
                                        and _Ccitem.eccyr = _Eccitem.eccyr 
                                        and _Ccitem.eccnp = _Eccitem.eccnp
{
  key _Blheader.eccgb as Eccgb,
  key _Ccitem.blino as Blino,
  key _Ccitem.bliyr as Bliyr,
  key _Ccitem.blinp as Blinp,
  key _Ccitem.eccno as Eccno,
  key _Ccitem.eccyr as Eccyr,
  key _Ccitem.eccnp as Eccnp,
  
  @Semantics.quantity.unitOfMeasure: 'Cclmns'
  sum(_Ccitem.cclmng ) as Cclmng,
  _Ccitem.cclmns as Cclmns,
  
  @Semantics.quantity.unitOfMeasure: 'Blmns'
  _Blitem.blmng as Blmng,
  _Blitem.blmns as Blmns,
  
  @Semantics.quantity.unitOfMeasure: 'Eccmns'
  _Eccitem.eccmng - _Eccitem.failmng - _Eccitem.sampmng as Eccmng,
  _Eccitem.eccmns as Eccmns
  
} where _Ccitem.loekz = ''

group by _Blheader.eccgb,
         _Ccitem.blino,
         _Ccitem.bliyr,
         _Ccitem.blinp,
         _Ccitem.eccno,
         _Ccitem.eccyr,
         _Ccitem.eccnp,
         _Ccitem.cclmns,
         _Blitem.blmng,
         _Blitem.blmns,
         _Eccitem.eccmng,
         _Eccitem.failmng,
         _Eccitem.sampmng,
         _Eccitem.eccmns

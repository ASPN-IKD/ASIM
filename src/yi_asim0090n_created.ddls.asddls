@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입입고 기생성 정보 인터페이스 뷰'
define root view entity YI_ASIM0090N_CREATED as select from zasimt0100n as _Gritem
 join zasimt0070n as _Cclheader on _Cclheader.cclno = _Gritem.cclno
                               and _Cclheader.cclyr = _Gritem.cclyr
 join zasimt0080n as _Cclitem on _Gritem.cclno = _Cclitem.cclno
                                and _Gritem.cclyr = _Cclitem.cclyr
                                and _Gritem.cclnp = _Cclitem.cclnp
{
  key _Gritem.cclno as Cclno,
  key _Gritem.cclyr as Cclyr,
  key _Gritem.cclnp as Cclnp,
  
  @Semantics.quantity.unitOfMeasure: 'Grmns'
  sum(_Gritem.grmng ) as Grmng,
  _Gritem.grmns as Grmns,
  
  @Semantics.quantity.unitOfMeasure: 'Cclmns'
  _Cclitem.cclmng as Cclmng,
  _Cclitem.cclmns as Cclmns
  
} where _Gritem.loekz = ''

group by _Gritem.cclno,
         _Gritem.cclyr,
         _Gritem.cclnp,
         _Gritem.grmns,
         _Cclitem.cclmng,
         _Cclitem.cclmns

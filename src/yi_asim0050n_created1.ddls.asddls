@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입I/V 기생성 정보 인터페이스 뷰'
define view entity YI_ASIM0050N_CREATED1
  as select from zasimt0060n as _Ivitem
    join         zasimt0050n as _Ivheader /*on  _Ivitem.belnr = _Ivheader.belnr
                                          and _Ivitem.gjahr = _Ivheader.gjahr sg639 20231106*/
                                          on _Ivitem.parentuuid = _Ivheader.uuid
    join         zasimt0040n as _Blitem   on  _Ivitem.blino = _Blitem.blino
                                          and _Ivitem.bliyr = _Blitem.bliyr
                                          and _Ivitem.blinp = _Blitem.blinp
{
  key _Ivheader.ivgb     as Ivgb,
  key _Ivitem.blino      as Blino,
  key _Ivitem.bliyr      as Bliyr,
  key _Ivitem.blinp      as Blinp,

      @Semantics.quantity.unitOfMeasure: 'Meins'
      sum(_Ivitem.ivmng) as Ivmng,
      _Ivitem.meins      as Meins


}
where
      _Ivheader.stblg = ''
  and _Ivheader.ivgb  = 'B'
  and _Ivheader.loekz = ''

group by
  _Ivitem.blino,
  _Ivitem.bliyr,
  _Ivitem.blinp,
  _Ivitem.meins,
  _Ivheader.ivgb

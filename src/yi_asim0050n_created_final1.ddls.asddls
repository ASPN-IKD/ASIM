@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입I/V 기생성 정보 인터페이스 뷰(참조용)'
define view entity YI_ASIM0050N_CREATED_FINAL1 as select from YI_ASIM0050N_CREATED1 as _item
   join         zasimt0040n as _Blitem  on  _item.Blino = _Blitem.blino
                                          and _item.Bliyr = _Blitem.bliyr
                                          and _item.Blinp = _Blitem.blinp



{
  key _item.Ivgb as Ivgb,
  key _item.Blino ,
  key _item.Bliyr ,
  key _item.Blinp ,

      @Semantics.quantity.unitOfMeasure: 'Blmns'
      _Blitem.blmng  as Blmng,
      
      cast(_item.Ivmng as abap.dec(20,3)) as Ivmng,
      
      _Blitem.blmns as Blmns,

      //제외여부필드
      case when cast(_Blitem.blmng as abap.dec(20,3)) <= cast(_item.Ivmng as abap.dec(20,3)) then 'X'
           else null
           end as chk,

      //잔량필드
      case when cast(_Blitem.blmng as abap.dec(20,3)) <= cast(_item.Ivmng as abap.dec(20,3)) then 0
             else cast(_Blitem.blmng as abap.dec(20,3)) - cast(_item.Ivmng as abap.dec(20,3))
           end as Modmg
}

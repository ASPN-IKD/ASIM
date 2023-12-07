@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입I/V 기생성 정보 인터페이스 뷰(참조용)'
define view entity YI_ASIM0050N_CREATED_FINAL as select from YI_ASIM0050N_CREATED as _item
   join         zasimt0020n as _reqitem  on  _item.reqno = _reqitem.reqno
                                          and _item.reqyr = _reqitem.reqyr
                                          and _item.itmno = _reqitem.itmno



{
  key _item.Ivgb as Ivgb,
  key _item.reqno ,
  key _item.reqyr ,
  key _item.itmno ,

      @Semantics.quantity.unitOfMeasure: 'Blmns'
      _reqitem.reqmg  as Blmng,
      
      cast(_item.Ivmng as abap.dec(20,3)) as Ivmng,
      
      _reqitem.reqms as Blmns,

      //제외여부필드
      case when cast(_reqitem.reqmg as abap.dec(20,3)) <= cast(_item.Ivmng as abap.dec(20,3)) then 'X'
           else null
           end as chk,

      //잔량필드
      case when cast(_reqitem.reqmg as abap.dec(20,3)) <= cast(_item.Ivmng as abap.dec(20,3)) then 0
           else cast(_reqitem.reqmg as abap.dec(20,3)) - cast(_item.Ivmng as abap.dec(20,3))
           end as Modmg
}

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입계약 기생성 정보 인터페이스 뷰(참조용)'
define view entity YI_ASIM0010N_CREATED_PO_FINAL
  as select from YI_ASIM0010N_CREATED_PO as _item
  join I_PurchaseOrderItemAPI01 as _poitem on  _item.Ebeln = _poitem.PurchaseOrder
                                           and _item.Ebelp = _poitem.PurchaseOrderItem
{
  key _item.Ebeln as Ebeln,
  key _item.Ebelp as Ebelp,

      @Semantics.quantity.unitOfMeasure: 'Reqms'
      _item.Reqmg as Reqmg,
      _item.Reqms as Reqms,
      _item.Pomns as Pomns,
      
      //제외여부필드
      case
      when cast(_item.Pomng as abap.dec(20,3)) <= cast(_item.Reqmg as abap.dec(20,3)) then 'X'
      else ''
      end         as chk,
      
      //잔량필드
      @Semantics.quantity.unitOfMeasure: 'Pomns'
      case when _item.Reqmg = 0 or _item.Reqmg is null then cast(_item.Pomng as abap.dec(20,3))
      else cast(_item.Pomng as abap.dec(20,3)) - cast(_item.Reqmg as abap.dec(20,3)) 
      end         as Modmg
}

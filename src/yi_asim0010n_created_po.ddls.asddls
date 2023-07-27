@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입계약 기생성 정보 인터페이스 뷰'
define view entity YI_ASIM0010N_CREATED_PO
  as select from YI_ASIM0020N             as _item
    join         I_PurchaseOrderItemAPI01 as _poitem on  _item.Ebeln = _poitem.PurchaseOrder
                                                     and _item.Ebelp = _poitem.PurchaseOrderItem

{
  key _item.Ebeln                       as Ebeln,
  key _item.Ebelp                       as Ebelp,

      @Semantics.quantity.unitOfMeasure: 'Reqms'
      sum( _item.Reqmg )                as Reqmg,
      _item.Reqms                       as Reqms,

      @Semantics.quantity.unitOfMeasure: 'Meins'
      _poitem.OrderQuantity             as Menge,
      _poitem.PurchaseOrderQuantityUnit as Meins,

      @Semantics.amount.currencyCode: 'Waers'
      sum( _item.Reqwr )                as Reqwr,
      _item.Waers                       as Waers

}
where
      _item.Loekz =  ''
  and _item.Ebeln <> ''
group by
  _item.Ebeln,
  _item.Ebelp,
  _poitem.OrderQuantity,
  _poitem.PurchaseOrderQuantityUnit,
  _item.Reqms,
  _item.Waers

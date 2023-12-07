@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입계약 기생성 정보 인터페이스 뷰'
define view entity YI_ASIM0010N_CREATED_PO
  as select from zasimt0020n             as _item
    join         I_PurchaseOrderItemAPI01 as _poitem on  _item.ebeln = _poitem.PurchaseOrder
                                                     and _item.ebelp = _poitem.PurchaseOrderItem

{
  key _item.ebeln                       as Ebeln,
  key _item.ebelp                       as Ebelp,

      @Semantics.quantity.unitOfMeasure: 'Reqms'
      sum( _item.reqmg )                as Reqmg,
      _item.reqms                       as Reqms,

//      @Semantics.quantity.unitOfMeasure: 'Meins'
//      _poitem.OrderQuantity             as Menge,
//      _poitem.PurchaseOrderQuantityUnit as Meins,

      @Semantics.amount.currencyCode: 'Waers'
      sum( _item.reqwr )                as Reqwr,
      _item.waers                       as Waers

}
where
      _item.loekz =  ''
  and _item.ebeln <> ''
group by
  _item.ebeln,
  _item.ebelp,
//  _poitem.OrderQuantity,
//  _poitem.PurchaseOrderQuantityUnit,
  _item.reqms,
  _item.waers

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입계약 기생성 정보 인터페이스 뷰'
define view entity YI_ASIM0010N_CREATED_PO
  as select from I_PurchaseOrderItemAPI01 as _poitem
    left outer join   zasimt0020n         as _item   on  _item.ebeln = _poitem.PurchaseOrder
                                                     and _item.ebelp = _poitem.PurchaseOrderItem

{
  key _poitem.PurchaseOrder             as Ebeln,
  key _poitem.PurchaseOrderItem         as Ebelp,
  
     @Semantics.quantity.unitOfMeasure: 'Pomns'
     _poitem.OrderQuantity              as Pomng,    
     _poitem.PurchaseOrderQuantityUnit    as Pomns,
     
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
      _poitem.PurchasingDocumentDeletionCode =  ''
group by
  _poitem.PurchaseOrder,
  _poitem.PurchaseOrderItem,
//  _poitem.OrderQuantity,
//  _poitem.PurchaseOrderQuantityUnit,
  _poitem.OrderQuantity,
  _poitem.PurchaseOrderQuantityUnit,
  _item.reqms,
  _item.waers

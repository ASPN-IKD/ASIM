@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '구매오더 GET - 아이템 > PurchaseOrderPricingElement'
define view entity YI_POGETITEMPRC_001
  as select from zpogetitemprc001
//  association to parent YI_POGETITEM_001 as _Item on $projection.ItemUuid = _Item.Uuid    
{
  key uuid               as Uuid,
      item_uuid          as ItemUuid,
      header_uuid        as HeaderUuid,
      purchaseorder      as Purchaseorder,
      purchaseorderitem  as Purchaseorderitem,
      conditiontype      as Conditiontype,
      conditionratevalue as Conditionratevalue,
      conditionamount    as Conditionamount
}

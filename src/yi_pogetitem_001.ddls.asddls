@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '구매오더 GET - 아이템'
define view entity YI_POGETITEM_001
  as select from zpogettitem001 as _Item
  association to parent YI_POGETHEADER_001 as _Header on $projection.HeaderUuid = _Header.Uuid
//  composition [1..*] of YI_POGETITEMACC_001 as _AccountAssignment
//  composition [1..*] of YI_POGETITEMPRC_001 as _PurchaseOrderPricing
//  composition [1..*] of YI_POGETITEMSCH_001 as _ScheduleLine    
{
  key uuid                      as Uuid,
      header_uuid               as HeaderUuid,
      purchaseorder             as Purchaseorder,
      purchaseorderitem         as Purchaseorderitem,
      purchaseorderitemtext     as Purchaseorderitemtext,
      plant                     as Plant,
      storagelocation           as Storagelocation,
      orderquantity             as Orderquantity,
      purchaseorderquantityunit as Purchaseorderquantityunit,
      netpriceamount            as Netpriceamount,
      netpricequantity          as Netpricequantity,
      accountassignmentcategory as Accountassignmentcategory,
      material                  as Material,
      _Header
}

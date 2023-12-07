@EndUserText.label: '구매 요청 생성 가격 요소  - 루트뷰'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity YR_IM_PO_ITEM_PE as select from  yim_po_item_pe
   association to parent YR_IM_PO_ITEM as _Item on
    $projection.ItemUUID = _Item.ItemUUID
    association [0..1] to YR_IM_PO_HEADER as _Header on $projection.HeaderUUID = _Header.OrderUUID

{
    key purchaseelementuuid as PurchaseElementUUID,
    headeruuid as HeaderUUID,
    itemuuid as ItemUUID,
    purchaseorderitem as PurchaseOrderItem,
    conditiontype as ConditionType,
    conditionratevalue as ConditionRateValue,
    conditioncurrency as ConditionCurrency,
    conditionquantityunit as ConditionQuantityUnit,
    ifmsg as Ifmsg,
    ifstatus as Ifstatus,
    _Header,
    _Item
}

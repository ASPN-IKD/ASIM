@EndUserText.label: '구매 요청 생성 스케쥴 라인 - 루트뷰'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity YR_IM_PO_ITEM_SL as select from yim_po_item_sl
 association to parent YR_IM_PO_ITEM as _Item on
    $projection.ItemUUID = _Item.ItemUUID
    association [0..1] to YR_IM_PO_HEADER as _Header on $projection.HeaderUUID = _Header.orderuuid

{
    key schedulelineuuid as ScheduleLineUUID,
    headeruuid as HeaderUUID,
    itemuuid as ItemUUID,
    purchasingdocumentitem as PurchasingDocumentItem,
    scheduleline as ScheduleLine,
    schedulelinedeliverydate as ScheduleLineDeliveryDate,
    ifmsg as Ifmsg,
    ifstatus as Ifstatus,
    _Header,
    _Item
}

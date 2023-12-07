@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '구매오더 GET - 아이템 > ScheduleLine'
define view entity YI_POGETITEMSCH_001
  as select from zpogetitemsch001
//  association to parent YI_POGETITEM_001 as _Item on $projection.ItemUuid = _Item.Uuid  
{
  key uuid                     as Uuid,
      item_uuid                as ItemUuid,
      header_uuid              as HeaderUuid,
      purchasingdocument       as Purchasingdocument,
      purchasingdocumentitem   as Purchasingdocumentitem,
      scheduleline             as Scheduleline,
      schedulelinedeliverydate as Schedulelinedeliverydate
}

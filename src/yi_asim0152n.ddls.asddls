@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.ignorePropagatedAnnotations: true

define root view entity YI_ASIM0152N 
  as select from I_PurchaseOrderAPI01 as _Ekko
  
  association [0..1] to I_PurchaseOrderHistoryAPI01   as _Ekbe on  _Ekko.PurchaseOrder = _Ekbe.PurchaseOrder
                                                               and _Ekbe.PurchasingHistoryCategory = 'K'
  association [0..1] to I_PurOrdHistDeliveryCostAPI01 as _Ekbz on  _Ekko.PurchaseOrder = _Ekbz.PurchaseOrder
                                                               and _Ekbz.PurchasingHistoryCategory = 'K'
{
  key _Ekko.PurchaseOrder as Ebeln,
  
  case when _Ekbe.PurchasingHistoryCategory is not null 
         then max(_Ekbe.PurchasingHistoryDocument)
         else case when _Ekbz.PurchasingHistoryCategory is not null
                     then max(_Ekbz.PurchasingHistoryDocument)
                     else ''
                   end
       end as Fblnr
} group by _Ekko.PurchaseOrder,
           _Ekbe.PurchasingHistoryCategory,
           _Ekbz.PurchasingHistoryCategory

@EndUserText.label: '구매 요청 참조 생성 품목 - 루트뷰'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity YR_IM_PO_ITEM
  as select from yim_po_item

  association to parent YR_IM_PO_HEADER  as _Header on $projection.OrderUUID = _Header.OrderUUID
  composition [0..*] of YR_IM_PO_ITEM_PE as _PricingElement
  composition [0..*] of YR_IM_PO_ITEM_SL as _ScheduleLine
{
  key itemuuid                     as ItemUUID,
      orderuuid                    as OrderUUID,
      purchaseorder                as PurchaseOrder,
      purchaseorderitem            as PurchaseOrderItem,
      plant                        as Plant,
      storagelocation              as StorageLocation,
      material                     as Material,
      orderquantity                as OrderQuantity,
      purchaseorderquantityunit    as PurchaseOrderQuantityUnit,
      orderpriceunit               as OrderPriceUnit,
      @Semantics.amount.currencyCode : 'DocumentCurrency'
      netpriceamount               as NetPriceAmount,
      netpricequantity             as NetPriceQuantity,
      taxcode                      as TaxCode,
      goodsreceiptisexpected       as GoodsReceiptIsExpected,
      goodsreceiptisnonvaluated    as GoodsReceiptIsNonValuated,
      invoiceisexpected            as InvoiceIsExpected,
      invoiceisgoodsreceiptbased   as InvoiceIsGoodsReceiptBased,
      isreturnsitem                as IsReturnsItem,
      purchasingitemisfreeofcharge as PurchasingItemIsFreeOfCharge,
      ifmsg                        as Ifmsg,
      ifstatus                     as Ifstatus,
      _Header.DocumentCurrency     as DocumentCurrency,

      _Header,
      _PricingElement,
      _ScheduleLine

}

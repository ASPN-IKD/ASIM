@EndUserText.label: '구매 요청 참조 생성 헤더 - 루트뷰'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity YR_IM_PO_HEADER 
    as select from  yim_po_header
     composition [0..*] of YR_IM_PO_ITEM    as _Item

{
    key orderuuid as OrderUUID,
    purchaseorder as PurchaseOrder,
    companycode as CompanyCode,
    purchaseordertype as PurchaseOrderType,
    supplier as Supplier,
    language as Language,
    purchasingorganization as PurchasingOrganization,
    purchasinggroup as PurchasingGroup,
    purchaseorderdate as PurchaseOrderDate,
    documentcurrency as DocumentCurrency,
    incotermsclassification as IncotermsClassification,
    correspncexternalreference as CorrespncExternalReference,
    correspncinternalreference as CorrespncInternalReference,
    ifmsg as Ifmsg,
    ifstatus as Ifstatus,
    
    _Item
}

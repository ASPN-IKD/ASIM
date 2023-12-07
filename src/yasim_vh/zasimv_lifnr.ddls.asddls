@EndUserText.label: '공급업체 도움말 뷰'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZASIMV_LIFNR as select from I_Supplier
 association [0..*] to I_SupplierPurchasingOrg        as _SupplierPurchasingOrg        on  $projection.Lifnr = _SupplierPurchasingOrg.Supplier
 association [0..*] to I_Supplier        as _Text        on  $projection.Lifnr = _Text.Supplier
 
{   
    
    @ObjectModel.text.element: ['Lifnrt']
    @EndUserText.label: '공급업체'
    key Supplier as Lifnr,

    @EndUserText.label: '구매조직'
    _SupplierPurchasingOrg.PurchasingOrganization as Ekorg,
    
    @EndUserText.label: '공급업체명'
    @Semantics.text: true
    SupplierName as Lifnrt,
    
    @EndUserText.label: '구매그룹'
    _SupplierPurchasingOrg.PurchasingGroup as Ekgrp,
    
    @UI.hidden: true
    @EndUserText.label: '지급조건'
    _SupplierPurchasingOrg.PaymentTerms as Zterm,
    
    @UI.hidden: true
    @EndUserText.label: '인도조건'
    _SupplierPurchasingOrg.IncotermsClassification as Inco1,
    
    @UI.hidden: true
    @EndUserText.label: '인도처'
    _SupplierPurchasingOrg.IncotermsTransferLocation as Inco2,
    
        
    @EndUserText.label: '통화'
    _SupplierPurchasingOrg.PurchaseOrderCurrency,
    
    @EndUserText.label: '국가'
    Country,
    
    @EndUserText.label: '도시'
    CityName,
    
    @EndUserText.label: '거리'
    StreetName
}

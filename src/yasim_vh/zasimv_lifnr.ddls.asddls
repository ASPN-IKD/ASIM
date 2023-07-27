@EndUserText.label: '공급업체 도움말 뷰'
@AccessControl.authorizationCheck: #NOT_REQUIRED

define view entity ZASIMV_LIFNR as select from I_Supplier
{   
    @ObjectModel.text.element: ['Lifnrt']
    @EndUserText.label: '공급업체'
    key Supplier as Lifnr,
    @EndUserText.label: '공급업체명'
    @Semantics.text: true
    SupplierName as Lifnrt,
    @EndUserText.label: '국가'
    Country,
    @EndUserText.label: '도시'
    CityName,
    @EndUserText.label: '거리'
    StreetName
}

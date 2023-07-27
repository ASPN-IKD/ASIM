@EndUserText.label: '구매조직 도움말 뷰'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZASIMV_EKORG as select from I_PurchasingOrganization
{
    @ObjectModel.text.element: ['Ekorgt']
    key PurchasingOrganization as Ekorg,
    PurchasingOrganizationName as Ekorgt,
    CompanyCode as Bukrs
}

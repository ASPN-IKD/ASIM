@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '통화단위 도움말 뷰'
define root view entity ZASIMV_WAERS as select from I_CurrencyStdVH
{
  @EndUserText.label: '화폐단위'
  key Currency as Waers,
  @EndUserText.label: '설명'
  _Text
}

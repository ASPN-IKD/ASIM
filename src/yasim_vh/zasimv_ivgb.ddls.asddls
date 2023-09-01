@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '물품대참조구분 도움말 뷰'
define root view entity ZASIMV_IVGB 
as select from zasimt0001n

{
      @ObjectModel.text.element: ['Text'] // Search Term #DisplayTextAndID
  key zcdno as Cdno,
      ztext as Text
}
where
      zcode like '%IVGB'
  and zcdno <>   '00'


@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '회사 도움말 뷰'
// 미완성된 뷰
define view entity ZASIMV_BUKRS 
as select from zasimt0001n_c
{
      @ObjectModel.text.element: ['Text']
  key zcdno as Cdno,
      ztext as Text
}
where
      zcode like '%CCLGORT'
  and zcdno <>   '00'

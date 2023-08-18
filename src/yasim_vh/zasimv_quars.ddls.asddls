@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '검역결과 도움말 뷰'
define view entity ZASIMV_QUARS
 as select from zasimt0001n_c
{
  key zcdno as Cdno,    
  key ztext as Text
}
where
      zcode like '%QUARS'
  and zcdno <>   '00'

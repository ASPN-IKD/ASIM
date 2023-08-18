@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '검역상태 도움말 뷰'
define view entity ZASIMV_QUACD
 as select from zasimt0001n_c
{
  key zcdno as Cdno,    
  key ztext as Text
}
where
      zcode like '%QUACD'
  and zcdno <>   '00'

@EndUserText.label: '보험회사 도움말'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZASIMV_BBLIF as select from zasimt0001n_c
{  
    key zcdno as Cdno,
    ztext as Text
}
where
      zcode like '%BBLIF'
  and zcdno <>   '00'

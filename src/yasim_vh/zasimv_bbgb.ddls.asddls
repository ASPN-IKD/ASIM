@EndUserText.label: '보험기본조건 도움말'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZASIMV_BBGB as select from zasimt0001n_c
{  
    @ObjectModel.text.element: ['Text']
    key zcdno as Cdno,
    ztext as Text
}
where
      zcode like '%%BBGB'
  and zcdno <>   '00'

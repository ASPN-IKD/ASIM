@EndUserText.label: '보험기본조건 도움말'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZASIMV_BBGB as select from zasimt0001n
{  
    @ObjectModel.text.element: ['Text']
    @EndUserText.label: '보험조건'
    key zcdno as Cdno,
    
    @EndUserText.label: '보험조건명'
    ztext as Text
}
where
      zcode like '%%BBGB'
  and zcdno <>   '00'

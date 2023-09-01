@EndUserText.label: '보험회사 도움말'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZASIMV_BBLIF as select from zasimt0001n
{  
    @ObjectModel.text.element: ['Text']
    @EndUserText.label: '보험회사'
    key zcdno as Cdno,
    
    @EndUserText.label: '보험회사명'
    ztext as Text
}
where
      zcode like '%BBLIF'
  and zcdno <>   '00'

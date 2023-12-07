@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '검역결과 도움말 뷰'
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZASIMV_QUARS
 as select from zasimt0001n
{
    @ObjectModel.text.element: ['Text']
  key zcdno as Cdno,    
   ztext as Text
}
where
      zcode like '%QUARS'
  and zcdno <>   '00'

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '지급조건 도움말 뷰'
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZASIMV_ZTERM
  as select from zasimt0001n
{
      @ObjectModel.text.element: ['Text'] // Search Term #DisplayTextAndID
      @EndUserText.label: '지급조건'
  key zcdno as Cdno,
      @EndUserText.label: '지급조건명'
      ztext as Text
}
where
      zcode like '%ZTERM'
  and zcdno <>   '00'

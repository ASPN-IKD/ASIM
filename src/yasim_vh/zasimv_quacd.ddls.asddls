@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '검역상태 도움말 뷰'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.resultSet.sizeCategory: #XS
@Search.searchable: true
@Consumption.ranked: true
define view entity ZASIMV_QUACD
  as select from zasimt0001n

{
      @ObjectModel.text.element: ['Text']
      @Search.defaultSearchElement: true
  key zcdno as Cdno,
      ztext as Text
}
where
      zcode like '%QUACD'
  and zcdno <>   '00'

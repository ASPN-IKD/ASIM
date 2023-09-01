@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '보세창고 뷰'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZASIMV_CCLGORT
  as select from zasimt0001n
{
      @ObjectModel.text.element: ['Text']
      @EndUserText.label: '보세창고'
  key zcdno as Cdno,
      @EndUserText.label: '보세창고명'
      ztext as Text
}
where
      zcode like '%CCLGORT'
  and zcdno <>   '00'

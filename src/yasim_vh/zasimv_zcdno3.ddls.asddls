@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '선적지 도움말 뷰'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZASIMV_ZCDNO3 
as select from zasimt0001n
{
  @ObjectModel.text.element: ['Text']
  key zcdno as Cdno,    
      ztext as Text
}
where
      zcode like '%ZCDNO3'
  and zcdno <>   '00'

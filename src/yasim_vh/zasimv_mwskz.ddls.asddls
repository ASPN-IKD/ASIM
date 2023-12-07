@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '세금 도움말 뷰'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZASIMV_MWSKZ 
  as select from zasimt0001n
{
      @ObjectModel.text.element: ['Text']
  key zcdno as Cdno,    
      ztext as Text,
      zvalu1 as TaxRate
}
where
      zcode like '%MWSKZ'
  and zcdno <>   '00'

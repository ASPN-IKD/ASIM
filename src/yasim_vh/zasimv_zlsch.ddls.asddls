@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '지급방법 도움말 뷰'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZASIMV_ZLSCH 
  as select from zasimt0001n
{
      @ObjectModel.text.element: ['Text']
  key zcdno as Cdno,    
      ztext as Text
}
where
      zcode like '%ZLSCH'
  and zcdno <>   '00'

@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '운송수단 도움말 뷰'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZASIMV_ZCDNO2 
    as select from zasimt0001n
{
  @ObjectModel.text.element: ['Text']
  @EndUserText.label: '운송수단'
  key zcdno as Cdno,    
  @EndUserText.label: '운송수단명'
      ztext as Text
}
where
      zcode like '%ZCDNO2'
  and zcdno <>   '00'

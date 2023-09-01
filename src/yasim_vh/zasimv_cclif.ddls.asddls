@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '세관 도움말 뷰'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZASIMV_CCLIF
  as select from zasimt0001n
{
      @ObjectModel.text.element: ['Text']
      @EndUserText.label: '세관'
  key zcdno as Cdno,    
      @EndUserText.label: '세관명'
      ztext as Text
}
where
      zcode like '%CCLIF'
  and zcdno <>   '00'

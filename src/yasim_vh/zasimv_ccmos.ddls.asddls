@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '환적모선 통관 도움말 뷰'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZASIMV_CCMOS 
  as select from zasimt0001n
{
      @ObjectModel.text.element: ['Text']
  key zcdno as Cdno,    
      ztext as Text
}
where
      zcode like '%MOSNO'
  and zcdno <>   '00'

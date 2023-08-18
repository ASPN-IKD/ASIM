@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '운송형태 도움말 뷰'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZASIMV_ZCDNO4 
  as select from zasimt0001n_c
{
      
  key zcdno as Cdno,    
      ztext as Text
}
where
      zcode like '%ZCDNO4'
  and zcdno <>   '00'

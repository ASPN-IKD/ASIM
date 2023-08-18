@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '선적지 도움말 뷰'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZASIMV_ZCDNO3 
as select from zasimt0001n_c
{
     
  key zcdno as Cdno,    
      ztext as Text
}
where
      zcode like '%ZCDNO3'
  and zcdno <>   '00'

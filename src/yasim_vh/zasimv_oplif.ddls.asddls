@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '오픈처 도움말 뷰'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZASIMV_OPLIF 
  as select from zasimt0001n
{
      
  key zcdno as Cdno,    
      ztext as Text
}
where
      zcode like '%OPLIF'
  and zcdno <>   '00'

@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '파이낸스 도움말 뷰'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZASIMV_FILIF 
  as select from zasimt0001n_c
{
  key zcdno as Cdno,    
      ztext as Text
}
where
      zcode like '%FILIF'
  and zcdno <>   '00'

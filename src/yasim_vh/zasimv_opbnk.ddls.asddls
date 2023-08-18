@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '개설은행 도움말 뷰'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZASIMV_OPBNK 
  as select from zasimt0001n_c
{
      
  key zcdno as Cdno,    
      ztext as Text
}
where
      zcode like '%OPBNK'
  and zcdno <>   '00'

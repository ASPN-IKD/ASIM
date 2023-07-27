@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '운송형태 도움말 뷰'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

define view entity ZASIMV_ZCDNO4 
  as select from zasimt0001n
{
      @EndUserText.label: '운송형태'
  key zcdno as Cdno,    
  @EndUserText.label: '운송형태명'
      ztext as Text
}
where
      zcode like '%ZCDNO4'
  and zcdno <>   '00'

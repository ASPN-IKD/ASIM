@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '파이낸스 도움말 뷰'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZASIMV_LIFRE 
  as select from zasimt0001n
{
 @ObjectModel.text.element: ['Text']
 @EndUserText.label: '공급처'
  key zcdno as Cdno,  
 @EndUserText.label: '공급처명'  
      ztext as Text
}
where
      zcode like '%LIFRE'
  and zcdno <>   '00'

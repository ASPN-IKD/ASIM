@EndUserText.label: '저장위치 도움말 뷰'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZASIMV_LGORT
  as select from I_StorageLocation
{
         @EndUserText.label: '저장위치'
  key    StorageLocation     as Lgort,
         @EndUserText.label: '저장위치명'
         StorageLocationName as Lgortt,
         
         @EndUserText.label: '플랜트'
         Plant as Plant,
         
         @EndUserText.label: '플랜트명'
         _Plant.PlantName
         
         

}

@EndUserText.label: '자재그룹 도움말 뷰'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZASIMV_MATKL
  as select from I_ProductGroupText_2
{
         @EndUserText.label: '자재그룹'
  key    ProductGroup     as Matkl,

         @EndUserText.label: '자재그룹명'
         ProductGroupName as Matklt
}
where
  I_ProductGroupText_2.Language = '3'

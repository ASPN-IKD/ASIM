@EndUserText.label: '자재유형 도움말 뷰'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZASIMV_MTART
  as select from I_ProductTypeText

{
          @EndUserText.label: '자재유형'
  key     ProductType      as Mtart,

          @EndUserText.label: '자재유형명'
          MaterialTypeName as Mtartt

}
where
  I_ProductTypeText.Language = '3'

@EndUserText.label: '인도조건 도움말 뷰'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZASIMV_INCO1
  as select from I_IncotermsClassificationText
{
  @ObjectModel.text.element: ['Inco1t']
  key IncotermsClassification     as inco1,
      IncotermsClassificationName as Inco1t

}
where
  Language = '3'

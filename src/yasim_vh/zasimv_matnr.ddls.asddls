@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '공급처 도움말 뷰'
define view entity ZASIMV_MATNR
  as select from I_Product
  association [1..1] to I_ProductDescription as _maktx on  $projection.Matnr = _maktx.Product
                                                       and _maktx.Language   = '3'
  association [1..1] to I_ProductTypeText    as _mtart on  $projection.Mtart = _mtart.ProductType
                                                       and _mtart.Language   = '3'
  association [1..1] to I_ProductGroupText_2 as _matkl on  $projection.Matkl = _matkl.ProductGroup
                                                       and _matkl.Language   = '3'

{
      @EndUserText.label: '자재번호'
  key Product                   as Matnr,

      @EndUserText.label: '자재명'
      _maktx.ProductDescription as Maktx,

      @ObjectModel.text.element: ['Mtartt']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_MTART', element: 'Mtart' }}
      ]
      @EndUserText.label: '자재유형'
      ProductType               as Mtart,

      @EndUserText.label: '자재유형명'
      _mtart.MaterialTypeName   as Mtartt,
      
      @ObjectModel.text.element: ['Matklt']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_MATKL', element: 'Matkl' }}
      ]
      @EndUserText.label: '자재그룹'
      ProductGroup              as Matkl,

      @EndUserText.label: '자재그룹명'
      _matkl.ProductGroupName   as Matklt,

      @EndUserText.label: '기본단위'
      BaseUnit                  as Meins
}

@EndUserText.label: '플랜트 도움말 뷰'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZASIMV_WERKS
  as select from I_Plant

  association [1..1] to I_ValuationArea as _ValuationArea on I_Plant.ValuationArea = _ValuationArea.ValuationArea

{
      @EndUserText.label: '플랜트'
  key Plant                      as Werks,
      @EndUserText.label: '플랜트명'
      PlantName                  as Werkst,
      @EndUserText.label: '회사코드'
      _ValuationArea.CompanyCode as Bukrs
}

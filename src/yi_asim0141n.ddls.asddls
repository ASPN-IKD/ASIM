@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입 부대비 품목 인터페이스 뷰'
define view entity YI_ASIM0141N
  as select from zasimt0140n as _Asim0140n
  association        to parent YI_ASIM0130N            as _Head                    on  _Head.Uuid = $projection.ParentUUID
  
  association [1..1] to I_Plant       as _plant       on  $projection.Werks = _plant.Plant
  association [1..1] to I_ProductText as _productText on  $projection.Matnr     = _productText.Product
                                                      and _productText.Language = '3'
{
      @ObjectModel.filter.enabled: false
  key uuid                     as Uuid,

      @ObjectModel.filter.enabled: false
      parentuuid               as ParentUUID,

      @EndUserText.label: '부대비번호'
      feeno                    as Feeno,

      @EndUserText.label: '부대비연도'
      feeyr                    as Feeyr,

      @EndUserText.label: '부대비품목'
      feenp                    as Feenp,

      @EndUserText.label: '부대비항목'
      zcdno                    as Zcdno,

      @EndUserText.label: '참조문서구분'
      feegb                    as Feegb,

      @EndUserText.label: '참조문서번호'
      gbno                     as Gbno,

      @EndUserText.label: '참조문서품목'
      gbnp                     as Gbnp,

      @EndUserText.label: '연결부대비번호'
      feeno1                   as Feeno1,

      @EndUserText.label: '구매문서번호'
      ebeln                    as Ebeln,

      @EndUserText.label: '구매문서품목번호'
      ebelp                    as Ebelp,

      @EndUserText.label: '자재 번호'
      matnr                    as Matnr,

      @EndUserText.label: '자재명'
      _productText.ProductName as Maktx,

      @EndUserText.label: '플랜트'
      werks                    as Werks,

      @EndUserText.label: '플랜트명'
      _plant.PlantName         as Werkst,

      @EndUserText.label: '부대비수량'
      menge_fees               as MengeFees,

      @EndUserText.label: '부대비단위'
      meins_fees               as MeinsFees,

      @EndUserText.label: '참조금액'
      netwr                    as Netwr,

      @EndUserText.label: '참조통화'
      waers                    as Waers,

      @EndUserText.label: '부대비금액'
      @Semantics.amount.currencyCode: 'WaersFees'
      netwr_fees               as NetwrFees,
      
      @Semantics.amount.currencyCode: 'WaersFees'
      @EndUserText.label: '부대비세액'
      wmwst_fees               as WmwstFees,

      @EndUserText.label: '부대비통화'
       @Consumption.valueHelpDefinition: [{ entity : { element: 'Waers', name: 'ZASIMV_WAERS' } } ]
      waers_fees               as WaersFees,

      @EndUserText.label: '관세율'
      zdc1_p                   as Zdc1_p,

      @EndUserText.label: '입고문서번호'
      mblnr                    as Mblnr,

      @EndUserText.label: '입고연도'
      mjahr                    as Mjahr,

      @EndUserText.label: '입고품목'
      zeile                    as Zelie,

      @EndUserText.label: '통관내부번호'
      cclno                    as Cclno,

      @EndUserText.label: '통관연도'
      cclyr                    as Cclyr,

      @EndUserText.label: '통관품목'
      cclnp                    as Cclnp,

      @EndUserText.label: 'B/L내부번호'
      blino                    as Blino,

      @EndUserText.label: 'B/L연도'
      bliyr                    as Bliyr,

      @EndUserText.label: 'B/L품목'
      blinp                    as Blinp,

      @EndUserText.label: '계약내부번호'
      reqno                    as Reqno,

      @EndUserText.label: '계약연도'
      reqyr                    as Reqyr,

      @EndUserText.label: '계약품목'
      itmno                    as Itmno,
      
              @Semantics.amount.currencyCode : 'Waers'
      cast(0 as abap.curr(17,2)) as UnitPrice,
      
      _Head

}

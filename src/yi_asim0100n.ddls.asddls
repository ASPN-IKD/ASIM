@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입입고 아이템 인터페이스 뷰'
define root view entity YI_ASIM0100N
  as select from zasimt0100n

  association [1..1] to I_ProductText     as _productText     on  $projection.Matnr     = _productText.Product
                                                              and _productText.Language = '3'
  association [1..1] to I_Plant           as _plant           on  $projection.Werks = _plant.Plant
  association [0..1] to I_StorageLocation as _storageLocation on  $projection.Werks = _storageLocation.Plant
                                                              and $projection.Lgort = _storageLocation.StorageLocation
  association [1..1] to YI_ASIM0040N     as _asim0040         on  $projection.Blino = _asim0040.Blino
                                                              and $projection.Bliyr = _asim0040.Bliyr
                                                              and $projection.Blinp = _asim0040.Blinp

{
      @ObjectModel.filter.enabled: false
  key uuid                                 as Uuid,

      @ObjectModel.filter.enabled: false
      parentuuid                           as ParentUUID,

      @EndUserText.label: '자재 문서 번호'
      mblnr                                as Mblnr,

      @EndUserText.label: '자재 문서 연도'
      mjahr                                as Mjahr,

      @EndUserText.label: '자재 문서 항목'
      zeile                                as Zeile,

      @EndUserText.label: '통관번호'
      cclno                                as Cclno,

      @EndUserText.label: '통관연도'
      cclyr                                as Cclyr,

      @EndUserText.label: '통관품목'
      cclnp                                as Cclnp,

      @EndUserText.label: '통관예정번호'
      eccno                                as Eccno,

      @EndUserText.label: '통관예정년도'
      eccyr                                as Eccyr,

      @EndUserText.label: '통관예정품목'
      eccnp                                as Eccnp,

      @EndUserText.label: 'B/L내부번호'
      blino                                as Blino,

      @EndUserText.label: 'B/L연도'
      bliyr                                as Bliyr,

      @EndUserText.label: 'B/L품목'
      blinp                                as Blinp,

      @EndUserText.label: '구매 문서 번호'
      ebeln                                as Ebeln,

      @EndUserText.label: '구매 문서 품목 번호'
      ebelp                                as Ebelp,

      @EndUserText.label: '계약내부번호'
      reqno                                as Reqno,

      @EndUserText.label: '계약연도'
      reqyr                                as Reqyr,

      @EndUserText.label: '계약품목'
      itmno                                as Itmno,

      @EndUserText.label: '배치 번호'
      charg                                as Charg,

      @EndUserText.label: '제조일'
      hsdat                                as Hsdat,

      @EndUserText.label: '유효기간'
      vfdat                                as Vfdat,

      @EndUserText.label: '최대 저장 기간'
      maxlz                                as Maxlz,

      @EndUserText.label: '자재 번호'
      matnr                                as Matnr,

      @EndUserText.label: '자재명'
      _productText.ProductName             as Maktx,

      @Semantics.quantity.unitOfMeasure: 'Grmns'
      @EndUserText.label: '입고수량'
      grmng                                as Grmng,

      @EndUserText.label: '기본 단위'
      grmns                                as Grmns,

      @Semantics.quantity.unitOfMeasure: 'Grmns1'
      @EndUserText.label: '입고 대체수량'
      grmng1                               as Grmng1,

      @EndUserText.label: '대체단위'
      grmns1                               as Grmns1,

      @EndUserText.label: '플랜트'
      werks                                as Werks,

      @EndUserText.label: '플랜트명'
      _plant.PlantName                     as Werkst,

      @Consumption.valueHelpDefinition: [{ entity : { element: 'Lgort', name: 'ZASIMV_LGORT' } }]
      @EndUserText.label: '저장 위치'
      lgort                                as Lgort,

      @EndUserText.label: '저장위치명'
      _storageLocation.StorageLocationName as Lgortt,

      @Semantics.amount.currencyCode : 'V2wae'
      @EndUserText.label: '의제매입세 재고자산 차감액'
      amtv2                                as Amtv2,

      @EndUserText.label: '통화 키'
      v2wae                                as V2wae,

      @EndUserText.label: '회계 전표 번호'
      belnr1                               as Belnr1,

      @EndUserText.label: '회계연도'
      gjahr1                               as Gjahr1,

      @EndUserText.label: '회계 전표 번호'
      cbelnr                               as Cbelnr,

      @EndUserText.label: '회계연도'
      cgjahr                               as Cgjahr,


      @ObjectModel.filter.enabled: false
      @EndUserText.label: '삭제 지시자'
      loekz                                as Loekz,
      
      _asim0040.Waers                      as Waers,
      
      @Semantics.amount.currencyCode: 'Waers'
      _asim0040.Blmpr                      as Blmpr,
      
      @Semantics.amount.currencyCode: 'Waers'
      cast( cast( _asim0040.Blmpr as abap.dec( 20, 2)) * grmng / _asim0040.Blpnh as abap.dec( 20, 2 )  ) as Grnwr,

      cast('' as abap.char(3))             as ItemIndex,
      
      @EndUserText.label : '가격단위'
      _asim0040.Blpnh as Blpnh

}

where
  loekz = ''

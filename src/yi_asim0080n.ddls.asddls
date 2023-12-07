@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입 통관 품목 인터페이스 뷰'
define root view entity YI_ASIM0080N
  as select from zasimt0080n

  association [1..1] to I_ProductText     as _productText     on  $projection.Matnr     = _productText.Product
                                                              and _productText.Language = '3'
  association [1..1] to I_Plant           as _plant           on  $projection.Werks = _plant.Plant
  association [0..1] to I_StorageLocation as _storageLocation on  $projection.Werks = _storageLocation.Plant
                                                              and $projection.Lgort = _storageLocation.StorageLocation
  association [0..1] to YI_ASIM0200N      as _asim0200        on  $projection.Eccno = _asim0200.Eccno
                                                              and $projection.Eccyr = _asim0200.Eccyr
                                                              and $projection.Eccnp = _asim0200.Eccnp
  association [1..1] to YI_ASIM0040N     as _asim0040        on  $projection.Blino = _asim0040.Blino
                                                              and $projection.Bliyr = _asim0040.Bliyr
                                                              and $projection.Blinp = _asim0040.Blinp

{
      @ObjectModel.filter.enabled: false
  key uuid                                 as Uuid,

      @ObjectModel.filter.enabled: false
      parentuuid                           as ParentUUID,

      @EndUserText.label: '통관내부번호'
      cclno                                as Cclno,

      @EndUserText.label: '통관연도'
      cclyr                                as Cclyr,

      @EndUserText.label: '통관품목'
      cclnp                                as Cclnp,

      @ObjectModel.filter.enabled: false
      @EndUserText.label: '삭제 지시자'
      loekz                                as Loekz,

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

      @EndUserText.label: '구매문서번호'
      ebeln                                as Ebeln,

      @EndUserText.label: '구매문서품목번호'
      ebelp                                as Ebelp,

      @EndUserText.label: '계약내부번호'
      reqno                                as Reqno,

      @EndUserText.label: '계약연도'
      reqyr                                as Reqyr,

      @EndUserText.label: '계약품목'
      itmno                                as Itmno,

      @EndUserText.label: '자재번호'
      matnr                                as Matnr,

      @EndUserText.label: '자재명'
      _productText.ProductName             as Maktx,

      @EndUserText.label: '플랜트'
      werks                                as Werks,

      @EndUserText.label: '플랜트명'
      _plant.PlantName                     as Werkst,
      
      @Consumption.valueHelpDefinition: [{ entity : { element: 'Lgort', name: 'ZASIMV_LGORT' } }]
      @EndUserText.label: '저장위치'
      lgort                                as Lgort,

      @EndUserText.label: '저장위치명'
      _storageLocation.StorageLocationName as Lgortt,

      @EndUserText.label: '통관수량'
      cclmng                               as Cclmng,

      @EndUserText.label: '통관단위'
      cclmns                               as Cclmns,

      @EndUserText.label: '통관대체수량'
      cclmng1                              as Cclmng1,

      @EndUserText.label: '통관대체단위'
      cclmns1                              as Cclmns1,

      @EndUserText.label: '검역일'
      _asim0200.Quadt                      as Quadt,

      @Semantics.quantity.unitOfMeasure : 'Cclmns'
      @EndUserText.label: '불합격수량'
      _asim0200.Failmng                    as Failmng,

      @Semantics.quantity.unitOfMeasure : 'Cclmns'
      @EndUserText.label: '샘플수량'
      _asim0200.Sampmng                    as Sampmng,

      @EndUserText.label: '통화 단위'
      @Consumption.valueHelpDefinition: [{ entity : { element: 'Waers', name: 'ZASIMV_WAERS' } } ]
      _asim0040.Waers                      as Waers,
      
      @Semantics.amount.currencyCode: 'Waers'
      _asim0040.Blmpr                      as Blmpr,
      
      @Semantics.amount.currencyCode: 'Waers'
      cast( cast( _asim0040.Blmpr as abap.dec( 20, 2)) * cclmng / _asim0040.Blpnh as abap.dec( 20, 2 )  ) as Cclwr,
      
       
      cast('' as abap.char(3))             as ItemIndex
}

where
  loekz = ''

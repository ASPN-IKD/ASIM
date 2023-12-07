@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입입고 생성가능 정보 인터페이스 뷰'
define root view entity YI_ASIM0102N
  as select from zasimt0080n as _Asim0080n

  association [1..1] to YI_ASIM0070N      as _Asim0070n       on  _Asim0070n.Uuid = _Asim0080n.parentuuid

  association [1..1] to I_ProductText     as _productText     on  $projection.Matnr     = _productText.Product
                                                              and _productText.Language = '3'
  association [1..1] to I_Plant           as _plant           on  $projection.Werks = _plant.Plant
  association [0..1] to I_StorageLocation as _storageLocation on  $projection.Werks = _storageLocation.Plant
                                                              and $projection.Lgort = _storageLocation.StorageLocation



{

      @ObjectModel.filter.enabled: false
  key _Asim0080n.uuid                      as Uuid,

      @ObjectModel.filter.enabled: false
      parentuuid                           as ParentUUID,

      @EndUserText.label: '자재 문서 번호'
      cast('' as abap.char(10))            as Mblnr,

      @EndUserText.label: '자재 문서 연도'
      cast('' as abap.numc(4))             as Mjahr,

      @EndUserText.label: '자재 문서 항목'
      cast('' as abap.numc(4))             as Zeile,

      @EndUserText.label: '통관내부번호'
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

      @ObjectModel.filter.enabled: false
      @EndUserText.label: '삭제 지시자'
      loekz                                as Loekz,

      @EndUserText.label: '배치 번호'
      cast('' as charg_d )                 as Charg,

      @EndUserText.label: '제조일'
      cast('' as abap.dats)                as Hsdat,

      @EndUserText.label: '유효기간'
      cast('' as abap.dats)                as Vfdat,

      @EndUserText.label: '최대 저장 기간'
      cast(0 as abap.dec(5,0))             as Maxlz,


      @EndUserText.label: '자재번호'
      matnr                                as Matnr,

      @EndUserText.label: '자재명'
      _productText.ProductName             as Maktx,
      
      @Semantics.quantity.unitOfMeasure : 'Grmns'
      @EndUserText.label: '입고수량'
     _Asim0080n.cclmng           as Grmng,

      @EndUserText.label: '기본 단위'
     _Asim0080n.cclmns            as Grmns,

      @Semantics.quantity.unitOfMeasure : 'Grmns1'
      @EndUserText.label: '입고 대체수량'
      cast(0 as menge_d )            as Grmng1,

      @EndUserText.label: '대체단위'
      cast('' as meins )            as Grmns1,

      @EndUserText.label: '플랜트'
      werks                                as Werks,

      @EndUserText.label: '플랜트명'
      _plant.PlantName                     as Werkst,
      
       @Consumption.valueHelpDefinition: [{ entity : { element: 'Lgort', name: 'ZASIMV_LGORT' }, additionalBinding: [{ element: 'Plant', localElement: 'Werks', usage: #FILTER }] }]
      @EndUserText.label: '저장위치'
      lgort                                as Lgort,

      @EndUserText.label: '저장위치명'
      _storageLocation.StorageLocationName as Lgortt,
  
      @Semantics.amount.currencyCode : 'V2wae'
      @EndUserText.label: '의제매입세 재고자산 차감액'
      cast(0 as abap.curr(23,2))            as Amtv2,

      @EndUserText.label: '통화 키'
      cast('' as  waers )            as V2wae,
      
      @EndUserText.label: '회계 전표 번호'
      cast('' as belnr_d )            as Belnr1,
      
      @EndUserText.label: '회계연도'
      cast('' as gjahr)            as Gjahr1,
      
      @EndUserText.label: '회계 전표 번호'
      cast('' as belnr_d )            as Cbelnr,
      
      @EndUserText.label: '회계연도'
      cast('' as gjahr )            as Cgjahr,
      


      cast('' as abap.char(3))             as ItemIndex

}

where
  loekz = ''

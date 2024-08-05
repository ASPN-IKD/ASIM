@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입 통관 품목 인터페이스 뷰'
define root view entity YI_ASIM0080N
  as select from zasimt0080n
  left outer join YI_ASIM0090N_CREATED_FINAL  as _created_gr on  zasimt0080n.cclno = _created_gr.Cclno
                                                                and zasimt0080n.cclyr = _created_gr.Cclyr
                                                                and zasimt0080n.cclnp = _created_gr.Cclnp
                                                                
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
  key zasimt0080n.uuid                                 as Uuid,

      @ObjectModel.filter.enabled: false
      zasimt0080n.parentuuid                           as ParentUUID,

      @EndUserText.label: '통관내부번호'
      zasimt0080n.cclno                                as Cclno,

      @EndUserText.label: '통관연도'
      zasimt0080n.cclyr                                as Cclyr,

      @EndUserText.label: '통관품목'
      zasimt0080n.cclnp                                as Cclnp,

      @ObjectModel.filter.enabled: false
      @EndUserText.label: '삭제 지시자'
      zasimt0080n.loekz                                as Loekz,

      @EndUserText.label: '통관예정번호'
      zasimt0080n.eccno                                as Eccno,

      @EndUserText.label: '통관예정년도'
      zasimt0080n.eccyr                                as Eccyr,

      @EndUserText.label: '통관예정품목'
      zasimt0080n.eccnp                                as Eccnp,

      @EndUserText.label: 'B/L내부번호'
      zasimt0080n.blino                                as Blino,

      @EndUserText.label: 'B/L연도'
      zasimt0080n.bliyr                                as Bliyr,

      @EndUserText.label: 'B/L품목'
      zasimt0080n.blinp                                as Blinp,

      @EndUserText.label: '구매문서번호'
      zasimt0080n.ebeln                                as Ebeln,

      @EndUserText.label: '구매문서품목번호'
      zasimt0080n.ebelp                                as Ebelp,

      @EndUserText.label: '계약내부번호'
      zasimt0080n.reqno                                as Reqno,

      @EndUserText.label: '계약연도'
      zasimt0080n.reqyr                                as Reqyr,

      @EndUserText.label: '계약품목'
      zasimt0080n.itmno                                as Itmno,

      @EndUserText.label: '자재번호'
      zasimt0080n.matnr                                as Matnr,

      @EndUserText.label: '자재명'
      _productText.ProductName             as Maktx,

      @EndUserText.label: '플랜트'
      zasimt0080n.werks                                as Werks,

      @EndUserText.label: '플랜트명'
      _plant.PlantName                     as Werkst,
      
      @Consumption.valueHelpDefinition: [{ entity : { element: 'Lgort', name: 'ZASIMV_LGORT' } }]
      @EndUserText.label: '저장위치'
      zasimt0080n.lgort                                as Lgort,

      @EndUserText.label: '저장위치명'
      _storageLocation.StorageLocationName as Lgortt,

      @EndUserText.label: '통관수량'
      zasimt0080n.cclmng                               as Cclmng,

      @EndUserText.label: '통관단위'
      zasimt0080n.cclmns                               as Cclmns,

      @EndUserText.label: '통관대체수량'
      zasimt0080n.cclmng1                              as Cclmng1,

      @EndUserText.label: '통관대체단위'
      zasimt0080n.cclmns1                              as Cclmns1,

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
      
      @EndUserText.label: '가격단위'
      _asim0040.Blpnh as Blpnh,
      
      @Semantics.amount.currencyCode: 'Waers'
      cast( cast( _asim0040.Blmpr as abap.dec( 20, 2)) * zasimt0080n.cclmng / _asim0040.Blpnh as abap.dec( 20, 2 )  ) as Cclwr,
      
      /*수입입고 기생성여부 확인 chk = 'X'이면 생성완료 입고생성 시 제외처리 */
           _created_gr.chk                              as Chk_gr,

           /*수입입고 기생성여부 확인 chk = ''이면 잔량으로 확인함 */
           @Semantics.quantity.unitOfMeasure: 'Cclmns'
           @EndUserText.label: '수입통관잔량'
           case when _created_gr.chk = '' or _created_gr.chk = 'X' then cast(_created_gr.Modmg as abap.quan(13,3))
                else zasimt0080n.cclmng end              as Modmg_gr,
       
      cast('' as abap.char(3))             as ItemIndex
}

where
  zasimt0080n.loekz = ''

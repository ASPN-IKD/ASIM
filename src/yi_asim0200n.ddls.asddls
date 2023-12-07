@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입 통관예정 아이템 인터페이스 뷰'
define root view entity YI_ASIM0200N
  as select from    zasimt0200n
    left outer join YI_ASIM0070N_CREATED_FINAL as _created_cc on  zasimt0200n.eccno = _created_cc.Eccno
                                                              and zasimt0200n.eccyr = _created_cc.Eccyr
                                                              and zasimt0200n.eccnp = _created_cc.Eccnp
                                                              and _created_cc.Eccgb = 'X'

  association [1..1] to I_ProductText       as _productText     on  $projection.Matnr     = _productText.Product
                                                                and _productText.Language = '3'
  association [1..1] to I_Plant             as _plant           on  $projection.Werks = _plant.Plant
  association [0..1] to I_StorageLocation   as _storageLocation on  $projection.Werks = _storageLocation.Plant
                                                                and $projection.Lgort = _storageLocation.StorageLocation

  association [0..1] to YI_ASIM0001N        as _Quacd           on  $projection.Quacd =    _Quacd.Zcdno
                                                                and _Quacd.Zcode      like '%QUACD'
                                                                and _Quacd.Zcdno      <>   '00'
  association [0..1] to YI_ASIM0001N        as _Quars           on  $projection.Quars =    _Quars.Zcdno
                                                                and _Quars.Zcode      like '%QUARS'
                                                                and _Quars.Zcdno      <>   '00'

{
      @ObjectModel.filter.enabled: false
  key zasimt0200n.uuid                           as Uuid,

      @ObjectModel.filter.enabled: false
      zasimt0200n.parentuuid                     as ParentUUID,

      @EndUserText.label: '통관예정번호'
      zasimt0200n.eccno                          as Eccno,

      @EndUserText.label: '통관예정년도'
      zasimt0200n.eccyr                          as Eccyr,

      @EndUserText.label: '통관예정품목'
      zasimt0200n.eccnp                          as Eccnp,

      @EndUserText.label: 'B/L내부번호'
      zasimt0200n.blino                          as Blino,

      @EndUserText.label: 'B/L연도'
      zasimt0200n.bliyr                          as Bliyr,

      @EndUserText.label: 'B/L품목'
      zasimt0200n.blinp                          as Blinp,

      @EndUserText.label: '구매 문서 번호'
      zasimt0200n.ebeln                          as Ebeln,

      @EndUserText.label: '구매 문서 품목 번호'
      zasimt0200n.ebelp                          as Ebelp,

      @EndUserText.label: '계약내부번호'
      zasimt0200n.reqno                          as Reqno,

      @EndUserText.label: '계약연도'
      zasimt0200n.reqyr                          as Reqyr,

      @EndUserText.label: '계약품목'
      zasimt0200n.itmno                          as Itmno,
      @ObjectModel.text.element: [ 'Werkst' ]
      @EndUserText.label: '플랜트'
      zasimt0200n.werks                          as Werks,
      @EndUserText.label: '플랜트명'
      _plant.PlantName                           as Werkst,
      @EndUserText.label: '자재번호'
      zasimt0200n.matnr                          as Matnr,
      @EndUserText.label: '자재명'
      _productText.ProductName                   as Maktx,
      @EndUserText.label: '저장위치'
       @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_LGORT', element: 'Lgort' }}]
      zasimt0200n.lgort                          as Lgort,
      @EndUserText.label: '저장위치명'
      _storageLocation.StorageLocationName       as Lgortt,

      @Semantics.quantity.unitOfMeasure : 'Eccmns'
      @EndUserText.label: '통관예정수량'
      zasimt0200n.eccmng                         as Eccmng,

      @EndUserText.label: '통관예정단위'
      zasimt0200n.eccmns                         as Eccmns,

      @Semantics.quantity.unitOfMeasure : 'Eccmns1'
      @EndUserText.label: '통관예정 대체수량'
      zasimt0200n.eccmng1                        as Eccmng1,

      @EndUserText.label: '통관예정 대체단위'
      zasimt0200n.eccmns1                        as Eccmns1,

      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_QUACD', element: 'Cdno' }}]
      @EndUserText.label: '검역상태'
      zasimt0200n.quacd                          as Quacd,

      @EndUserText.label: '검역상태명'
      _Quacd.Ztext                               as Quacdt,
      
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_QUARS', element: 'Cdno' }} ]
      @EndUserText.label: '검역결과'
      zasimt0200n.quars                          as Quars,

      @EndUserText.label: '검역결과명'
      _Quars.Ztext                               as Quarst,

      @EndUserText.label: '검역일'
      zasimt0200n.quadt                          as Quadt,

      @Semantics.quantity.unitOfMeasure : 'Eccmns'
      @EndUserText.label: '불합격수량'
      zasimt0200n.failmng                        as Failmng,

      @Semantics.quantity.unitOfMeasure : 'Eccmns1'
      @EndUserText.label: '불합격 대체수량'
      zasimt0200n.failmng1                       as Failmng1,

      @Semantics.quantity.unitOfMeasure : 'Eccmns'
      @EndUserText.label: '샘플수량'
      zasimt0200n.sampmng                        as Sampmng,

      @Semantics.quantity.unitOfMeasure : 'Eccmns1'
      @EndUserText.label: '샘플 대체수량'
      zasimt0200n.sampmng1                       as Sampmng1,

      @EndUserText.label: '비고'
      zasimt0200n.eccremak                       as Eccremak,

      @ObjectModel.filter.enabled: false
      @EndUserText.label: '삭제 지시자'
      zasimt0200n.loekz                          as Loekz,
      
      @EndUserText.label: '통화 단위'
      zasimt0200n.waers                          as Waers,

      /*수입통관예정 기생성여부 확인 chk = 'X'이면 생성완료 통관 생성 시 제외처리 */
      _created_cc.chk                            as Chk_cc,

      /*수입통관예정 기생성여부 확인 chk = ''이면 잔량으로 확인함 */
      @Semantics.quantity.unitOfMeasure: 'Eccmns'
      @EndUserText.label: '수입B/L잔량(통관)'
      case when _created_cc.chk = '' or _created_cc.chk = 'X' then cast(_created_cc.Modmg as abap.quan(13,3)) 
           else zasimt0200n.eccmng end as Modmg_cc,
      
      cast('' as abap.char(3)) as ItemIndex
}
where
  zasimt0200n.loekz = ''

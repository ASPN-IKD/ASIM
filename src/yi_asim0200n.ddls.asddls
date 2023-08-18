@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입 통관예정 아이템 인터페이스 뷰'
define view entity YI_ASIM0200N
  as select from zasimt0200n
  association to parent YI_ASIM0190N as _Head on _Head.Uuid = $projection.Parentuuid

//  association [1..1] to I_ProductText                  as _productText             on  $projection.Matnr     = _productText.Product
//                                                                                   and _productText.Language = '3'
//  association [1..1] to I_Plant                        as _plant                   on  $projection.Werks = _plant.Plant
//  association [0..1] to I_StorageLocation              as _storageLocation         on  $projection.Werks = _storageLocation.Plant
//
//  association [0..1] to YI_ASIM0001N as _Quacd   on  $projection.Quacd =    _Quacd.Zcdno
//                                                   and _Quacd.Zcode      like '%QUACD'
//                                                   and _Quacd.Zcdno      <>   '00' 
//  association [0..1] to YI_ASIM0001N as _Quars   on  $projection.Quars =    _Quars.Zcdno
//                                                   and _Quars.Zcode      like '%QUARS'
//                                                   and _Quars.Zcdno      <>   '00'                                                                                   and $projection.Lgort = _storageLocation.StorageLocation
{
      @ObjectModel.filter.enabled: false
  key uuid                  as Uuid,

      @ObjectModel.filter.enabled: false
  key parentuuid            as Parentuuid,

      @EndUserText.label: '통관예정번호'
      eccno                 as Eccno,

      @EndUserText.label: '통관예정년도'
      eccyr                 as Eccyr,

      @EndUserText.label: '통관예정품목'
      eccnp                 as Eccnp,

      @EndUserText.label: 'B/L내부번호'
      blino                 as Blino,

      @EndUserText.label: 'B/L연도'
      bliyr                 as Bliyr,

      @EndUserText.label: 'B/L품목'
      blinp                 as Blinp,

      @EndUserText.label: '구매 문서 번호'
      ebeln                 as Ebeln,

      @EndUserText.label: '구매 문서 품목 번호'
      ebelp                 as Ebelp,

      @EndUserText.label: '계약내부번호'
      reqno                 as Reqno,

      @EndUserText.label: '계약연도'
      reqyr                 as Reqyr,

      @EndUserText.label: '계약품목'
      itmno                 as Itmno,

      werks                 as Werks,
      //           @EndUserText.label: '플랜트명'
      //           _plant.PlantName                             as Werkst,
      @EndUserText.label: '자재번호'
      matnr                 as Matnr,
      //           @EndUserText.label: '자재명'
      //           _productText.ProductName                     as Maktx,
      @EndUserText.label: '저장위치'
      lgort                 as Lgort,
      //           @EndUserText.label: '저장위치명'
      //           _storageLocation.StorageLocationName         as Lgortt,

      @Semantics.quantity.unitOfMeasure : 'Eccmns'
      @EndUserText.label: '통관예정수량'
      eccmng                as Eccmng,

      @EndUserText.label: '통관예정단위'
      eccmns                as Eccmns,

      @Semantics.quantity.unitOfMeasure : 'Eccmns1'
      @EndUserText.label: '통관예정 대체수량'
      eccmng1               as Eccmng1,

      @EndUserText.label: '통관예정 대체단위'
      eccmns1               as Eccmns1,

      @EndUserText.label: '검역상태'
      quacd                 as Quacd,

//      @EndUserText.label: '검역상태명'
//      _Quacd.Ztext                 as Quacdt,

      @EndUserText.label: '검역결과'
      quars                 as Quars,
      
//      @EndUserText.label: '검역결과명'
//      _Quars.Ztext                 as Quarst,

      @EndUserText.label: '검역일'
      quadt                 as Quadt,

      @Semantics.quantity.unitOfMeasure : 'Eccmns'
      @EndUserText.label: '불합격수량'
      failmng               as Failmng,

      @Semantics.quantity.unitOfMeasure : 'Eccmns1'
      @EndUserText.label: '불합격 대체수량'
      failmng1              as Failmng1,

      @Semantics.quantity.unitOfMeasure : 'Eccmns'
      @EndUserText.label: '샘플수량'
      sampmng               as Sampmng,

      @Semantics.quantity.unitOfMeasure : 'Eccmns1'
      @EndUserText.label: '샘플 대체수량'
      sampmng1              as Sampmng1,

      @EndUserText.label: '비고'
      eccremak              as Eccremak,

      crtnm                 as Crtnm,
      crtbu                 as Crtbu,

      @Semantics.systemDateTime.createdAt: true
      @EndUserText.label: 'Create Date'
      crtdt                 as Crtdt,

      crttm                 as Crttm,
      chgnm                 as Chgnm,
      chgbu                 as Chgbu,

      @ObjectModel.filter.enabled: false
      @EndUserText.label: 'Change Date'
      chgdt                 as Chgdt,

      chgtm                 as Chgtm,

      @ObjectModel.filter.enabled: false
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      @ObjectModel.filter.enabled: false
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,


      @ObjectModel.filter.enabled: false
      @EndUserText.label: '삭제 지시자'
      loekz                 as Loekz,

      _Head
}
where
  loekz = ''

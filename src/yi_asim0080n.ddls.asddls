@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입 통관 품목 인터페이스 뷰'
define view entity YI_ASIM0080N
  as select from zasimt0080n
   association        to parent YI_ASIM0070N            as _Head                    on  _Head.Uuid = $projection.Parentuuid

{
      @ObjectModel.filter.enabled: false
  key uuid                  as Uuid,

      @ObjectModel.filter.enabled: false
  key parentuuid            as Parentuuid,

      @EndUserText.label: '통관 번호'
      cclno                 as Cclno,

      @EndUserText.label: '통관 연도'
      cclyr                 as Cclyr,

      @EndUserText.label: '통관 품목'
      cclnp                 as Cclnp,

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

      @EndUserText.label: '자재 번호'
      matnr                 as Matnr,

      @EndUserText.label: '플랜트'
      werks                 as Werks,

      @EndUserText.label: '저장위치'
      lgort                 as Lgort,

      @EndUserText.label: '통관수량'
      cclmng                as Cclmng,

      @EndUserText.label: '통관단위'
      cclmns                as Cclmns,

      @EndUserText.label: '통관대체수량'
      cclmng1               as Cclmng1,

      @EndUserText.label: '통관대체단위'
      cclmns1               as Cclmns1,


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

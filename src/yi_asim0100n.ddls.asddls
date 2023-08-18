@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입입고 아이템 인터페이스 뷰'
define view entity YI_ASIM0100N
  as select from zasimt0100n
  association to parent YI_ASIM0090N as _Head on _Head.Uuid = $projection.Parentuuid

{
      @ObjectModel.filter.enabled: false
  key uuid                  as Uuid,

      @ObjectModel.filter.enabled: false
  key parentuuid            as Parentuuid,

      @EndUserText.label: '자재 문서 번호'
      mblnr                 as Mblnr,

      @EndUserText.label: '자재 문서 연도'
      mjahr                 as Mjahr,

      @EndUserText.label: '자재 문서 항목'
      zeile                 as Zeile,

      @EndUserText.label: '통관번호'
      cclno                 as Cclno,

      @EndUserText.label: '통관연도'
      cclyr                 as Cclyr,

      @EndUserText.label: '통관품목'
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

      @EndUserText.label: '배치 번호'
      charg                 as Charg,

      @EndUserText.label: '제조일'
      hsdat                 as Hsdat,

      @EndUserText.label: '유효기간'
      vfdat                 as Vfdat,

      @EndUserText.label: '최대 저장 기간'
      maxlz                 as Maxlz,

      @EndUserText.label: '자재 번호'
      matnr                 as Matnr,

      @EndUserText.label: '입고수량'
      grmng                 as Grmng,

      @EndUserText.label: '기본 단위'
      grmns                 as Grmns,

      @EndUserText.label: '입고 대체수량'
      grmng1                as Grmng1,

      @EndUserText.label: '대체단위'
      grmns1                as Grmns1,

      @EndUserText.label: '플랜트'
      werks                 as Werks,

      @EndUserText.label: '저장 위치'
      lgort                 as Lgort,

      @EndUserText.label: '의제매입세 재고자산 차감액'
      amtv2                 as Amtv2,

      @EndUserText.label: '통화 키'
      v2wae                 as V2wae,

      @EndUserText.label: '회계 전표 번호'
      belnr1                as Belnr1,

      @EndUserText.label: '회계연도'
      gjahr1                as Gjahr1,

      @EndUserText.label: '회계 전표 번호'
      cbelnr                as Cbelnr,

      @EndUserText.label: '회계연도'
      cgjahr                as Cgjahr,


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

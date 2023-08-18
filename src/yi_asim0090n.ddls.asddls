@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입입고 헤더 인터페이스 뷰'
define root view entity YI_ASIM0090N as select from zasimt0090n as _Grheader
composition [1..*] of YI_ASIM0100N                  as _Item

association [1..1] to YI_ASIM0010N as _Reqheader on _Reqheader.Reqno = _Grheader.reqno
                                                 and _Reqheader.Reqyr = _Grheader.reqyr
{
    @ObjectModel.filter.enabled: false
    key uuid as Uuid,
    
    @EndUserText.label: '자재 문서 번호'    
    mblnr as Mblnr,
    
    @EndUserText.label: '자재 문서 연도'
    mjahr as Mjahr,
    
    @EndUserText.label: '전표상 전기일'
    budat_gr as BudatGr,
    
    @EndUserText.label: '회계 전표 번호'
    belnr_gr as BelnrGr,
    
    @EndUserText.label: '회계연도'
    gjahr_gr as GjahrGr,
    
    @EndUserText.label: '자재 문서 번호'
    smbln_gr as SmblnGr,
    
    @EndUserText.label: '자재 문서 연도'
    sjahr_gr as SjahrGr,
    
    @EndUserText.label: '계약연도'
    reqyr as Reqyr,
    
    @EndUserText.label: '계약내부번호'
    reqno as Reqno,
    
    @EndUserText.label: '관리번호'
    reqmu as Reqmu,
    
    @EndUserText.label: 'B/L내부번호'
    blino as Blino,
    
    @EndUserText.label: 'B/L연도'
    bliyr as Bliyr,
    
    @EndUserText.label: '통관예정번호'
    eccno as Eccno,
    
    @EndUserText.label: '통관예정년도'
    eccyr as Eccyr,
    
    @EndUserText.label: '통관번호'
    cclno as Cclno,
    
    @EndUserText.label: '통관연도'
    cclyr as Cclyr,
    
    @EndUserText.label: '회사 코드'
    bukrs as Bukrs,
    
    @EndUserText.label: '구매 조직'
    ekorg as Ekorg,
    
    @EndUserText.label: '공급업체 계정 번호'
    lifnr as Lifnr,
    
    @EndUserText.label: '헤더 텍스트'
    bktxt as Bktxt,
    
    @EndUserText.label: '통관기준 입고완료'
    grche as Grche,
    
    crtnm as Crtnm,
    crtbu as Crtbu,

    @Semantics.systemDateTime.createdAt: true
    @EndUserText.label: 'Create Date'
    crtdt as Crtdt,

    crttm as Crttm,
    chgnm as Chgnm,
    chgbu as Chgbu,
    
    @ObjectModel.filter.enabled: false
    @EndUserText.label: 'Change Date'
    chgdt as Chgdt,
    
    chgtm as Chgtm,
    
    @ObjectModel.filter.enabled: false
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    local_last_changed_at as LocalLastChangedAt,
    
    @ObjectModel.filter.enabled: false
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed_at as LastChangedAt,
    
    
    @ObjectModel.filter.enabled: false
    @EndUserText.label: '삭제 지시자'
    loekz as Loekz,
    
    _Item,
    
    _Reqheader
}

where
  loekz = ''

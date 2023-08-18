@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입 통관 헤더 인터페이스 뷰'
define root view entity YI_ASIM0070N as select from zasimt0070n

composition [1..*] of YI_ASIM0080N                  as _Item

{

    @ObjectModel.filter.enabled: false
    key uuid as Uuid,
    
    @EndUserText.label: '통관 번호'
    cclno as Cclno,
    
    @EndUserText.label: '통관 연도'
    cclyr as Cclyr,
    
    @EndUserText.label: '관리번호'
    reqmu as Reqmu,
    
    @EndUserText.label: '계역내부번호'
    reqno as Reqno,
    
    @EndUserText.label: '계약연도'
    reqyr as Reqyr,
    
    @EndUserText.label: 'B/L내부번호'
    blino as Blino,
    
    @EndUserText.label: 'B/L연도'
    bliyr as Bliyr,
    
    @EndUserText.label: '통관예정번호'
    eccno as Eccno,
    
    @EndUserText.label: '통관예정년도'
    eccyr as Eccyr,
    
    @EndUserText.label: '수입신고번호'
    decno as Decno,
    
    @EndUserText.label: '회사조직'
    bukrs as Bukrs,
    
    @EndUserText.label: '구매조직'
    ekorg as Ekorg,
    
    @EndUserText.label: '세관'
    cclif as Cclif,
    
    @EndUserText.label: '신고일'
    decdt as Decdt,
    
    @EndUserText.label: '반입일'
    ccldt as Ccldt,
    
    @EndUserText.label: '신고인'
    ccper as Ccper,
    
    @EndUserText.label: '총과세가격'
    ccamt as Ccamt,
    
    @EndUserText.label: '총과세가격(환화)'
    ccamtk as Ccamtk,
    
    @EndUserText.label: '관세'
    ccvat1 as Ccvat1,
    
    @EndUserText.label: '수입부가세'
    ccvat2 as Ccvat2,
    
    @EndUserText.label: '과세 표준액(현지 통화)'
    hwbas as Hwbas,
    
    @EndUserText.label: '통화 키'
    ccwae as Ccwae,
    
    @EndUserText.label: '현지통화'
    ccwaek as Ccwaek,
    
    @EndUserText.label: '통관환율'
    ccrsf as Ccrsf,
    
    @EndUserText.label: '접수일'
    ccdat1 as Ccdat1,
    
    @EndUserText.label: '수리일'
    ccdat2 as Ccdat2,
    
    @EndUserText.label: '검사(반입)장소'
    cclog as Cclog,
    
    @EndUserText.label: '환적모선'
    ccmos as Ccmos,
    
    @EndUserText.label: '보세창고'
    cclgort as Cclgort,
    
    @EndUserText.label: '비고'
    ccltx as Ccltx,
    
    
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
    
    _Item
}
where
  loekz = ''

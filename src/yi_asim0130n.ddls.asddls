@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입 부대비 헤더 인터페이스 뷰'
define root view entity YI_ASIM0130N as select from zasimt0130n

{
    @ObjectModel.filter.enabled: false
    key uuid as Uuid,
    
    @EndUserText.label: '부대비번호'
    feeno as Feeno,
    
    @EndUserText.label: '부대비연도'
    feeyr as Feeyr,
    
    @EndUserText.label: '부대비항목'
    zcdno as Zcdno,
    
    @EndUserText.label: '참조문서구분'
    feegb as Feegb,
    
    @EndUserText.label: '참조문서번호'
    gbno as Gbno,
    
    @EndUserText.label: '연결부대비번호'
    feeno1 as Feeno1,
    
    @EndUserText.label: '회사 코드'
    bukrs as Bukrs,
    
    @EndUserText.label: '구매 조직'
    ekorg as Ekorg,
    
    @EndUserText.label: '관리번호'
    reqmu as Reqmu,
    
    @EndUserText.label: '계약내부번호'
    reqno as Reqno,
    
    @EndUserText.label: '계약연도'
    reqyr as Reqyr,
    
    @EndUserText.label: 'B/L내부번호'
    blino as Blino,
    
    @EndUserText.label: 'B/L연도'
    bliyr as Bliyr,
    
    @EndUserText.label: '통관번호'
    cclno as Cclno,
    
    @EndUserText.label: '통관연도'
    cclyr as Cclyr,
    
    @EndUserText.label: '자재 문서 번호'
    mblnr as Mblnr,
    
    @EndUserText.label: '자재 문서 연도'
    mjahr as Mjahr,
    
    @EndUserText.label: '전표상 전기일'
    budat_fees as BudatFees,
    
    @EndUserText.label: '지급처'
    lifre_fees as LifreFees,
    
    @EndUserText.label: '송장대행업체'
    trlif_fees as TrlifFees,
    
    @EndUserText.label: '지급조건'
    zterm_fees as ZtermFees,
    
    @EndUserText.label: '금액'
    ivamt_fees as IvamtFees,
    
    @EndUserText.label: '세액'
    wmwst1_fees as Wmwst1Fees,
    
    @EndUserText.label: '통화 키'
    waers_fees as WaersFees,
    
    @EndUserText.label: '지급방법'
    zlsch as Zlsch,
    
    @EndUserText.label: '세금코드'
    mwskz as Mwskz,
    
    @EndUserText.label: '만기일 계산을 위한 기준일'
    zfbdt as Zfbdt,
    
    @EndUserText.label: '만기일'
    fbedt as Fbedt,
    
    @EndUserText.label: '환율'
    kursf as Kursf,
    
    @EndUserText.label: '전표 헤더 텍스트'
    bktxt as Bktxt,
    
    @EndUserText.label: '송장 문서의 문서 번호'
    belnr as Belnr,
    
    @EndUserText.label: '회계연도'
    gjahr as Gjahr,
    
    @EndUserText.label: '회계 전표 번호(FI)'
    belnr_fi as BelnrFi,
    
    @EndUserText.label: '회계연도(FI)'
    gjahr_fi as GjahrFi,
    
    @EndUserText.label: '회계 전표 번호(AP)'
    belnr_ap as BelnrAp,
    
    @EndUserText.label: '회계연도(AP)'
    gjahr_ap as GjahrAp,
    
    @EndUserText.label: '회계 전표 번호(TR)'
    belnr_tr as BelnrTr,
    
    @EndUserText.label: '회계연도(TR)'
    gjahr_tr as GjahrTr,
    
    @EndUserText.label: '메시지'
    mesg as Mesg,
    
    @EndUserText.label: '메시지 코드'
    code as Code,
    
    @EndUserText.label: '기타참조번호'
    zetno as Zetno,
    
    
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
    loekz as Loekz
}

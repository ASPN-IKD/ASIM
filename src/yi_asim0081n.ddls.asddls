@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '보세창고관리 인터페이스 뷰'
define root view entity YI_ASIM0081N as select from zasimt0081n
{

    @ObjectModel.filter.enabled: false
    key uuid as Uuid,
    
     @EndUserText.label: '통관 번호'
    cclno as Cclno,
    
     @EndUserText.label: '통관 연도'
    cclyr as Cclyr,
    
    @EndUserText.label: '통관 품목'
    cclnp as Cclnp,
    
    @EndUserText.label: '자재 문서 번호'
    mblnr as Mblnr,
    
    @EndUserText.label: '자재 문서 연도'
    mjahr as Mjahr,
    
    @EndUserText.label: '입고/통관 구분'
    @EndUserText.quickInfo: '(GR:입고, CC:통관, CL:마감)'
    grgb as Grgb,
    
    @EndUserText.label: '통관예정번호'
    eccno as Eccno,
    
    @EndUserText.label: '통관예정년도'
    eccyr as Eccyr,
    
    @EndUserText.label: '통관예정품목'
    eccnp as Eccnp,
    
    @EndUserText.label: 'B/L내부번호'
    blino as Blino,
    
    @EndUserText.label: 'B/L연도'
    bliyr as Bliyr,
    
    @EndUserText.label: 'B/L품목'
    blinp as Blinp,
    
    @EndUserText.label: '구매 문서 번호'
    ebeln as Ebeln,
    
    @EndUserText.label: '구매 문서 품목 번호'
    ebelp as Ebelp,
    
    @EndUserText.label: '계약내부번호'
    reqno as Reqno,
    
    @EndUserText.label: '계약연도'
    reqyr as Reqyr,
    
    @EndUserText.label: '계약품목'
    itmno as Itmno,
    
    @EndUserText.label: '자재 번호'
    matnr as Matnr,
    
    @EndUserText.label: '플랜트'
    werks as Werks,
    
    @EndUserText.label: '저장 위치'
    lgort as Lgort,
    
    @EndUserText.label: '보세창고'
    cclgort as Cclgort,
    
    @EndUserText.label: '전표상 전기일'
    budat as Budat,
    
    @EndUserText.label: '보세창고수량'
    cclabst as Cclabst,
    
    @EndUserText.label: '통관단위'
    cclmns as Cclmns,
    
    @EndUserText.label: '검역상태'
    quacd as Quacd,
    
    @EndUserText.label: '검역결과'
    quars as Quars,
    
    @EndUserText.label: '검역일'
    quadt as Quadt,
    
    @EndUserText.label: '불합격수량'
    failmng as Failmng,
    
    @EndUserText.label: '샘플수량'
    sampmng as Sampmng,
    
    @EndUserText.label: '통관기준 입고완료'
    grche as Grche

}

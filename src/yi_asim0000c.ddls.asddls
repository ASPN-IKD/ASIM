@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '상세화면관리 인터페이스 뷰'
define root view entity YI_ASIM0000C as select from zasimt0000c
{
    key uuid as Uuid,
    @EndUserText.label: '프로그램ID'
    key progid as Progid,
    @EndUserText.label: '뷰ID'
    key viewid as Viewid,
    @EndUserText.label: '프로그램명'
    prognm as Prognm,
    @EndUserText.label: '뷰명'
    viewnm as Viewnm,
    @EndUserText.label: '뷰순번'
    viewob as Viewob,
    @EndUserText.label: '뷰모드'
    viewat as Viewat,
    @EndUserText.label: '뷰타입'
    viewtp as Viewtp,
    @EndUserText.label: '사용여부'
    usediv as Usediv,
    @EndUserText.label: '전체필드'
    fielda as Fielda,
    @EndUserText.label: '생성필드'
    fieldc as Fieldc,
    @EndUserText.label: '수정필드'
    fieldu as Fieldu,
    @EndUserText.label: 'CDSVIEW'
    cdsvid as Cdsvid
}

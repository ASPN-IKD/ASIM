@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '상세화면관리 컨섭션 뷰'
@Metadata.allowExtensions: true
define root view entity YC_ASIM0000N
  provider contract transactional_query
  as projection on YR_ASIM0000N
{
    key Uuid,
    Progid,
    Viewid,
    Prognm,
    Viewnm,
    Viewob,
    Viewat,
    Viewtp,
    Usediv,
    Fielda,
    Fieldc,
    Fieldu,
    Cdsvid
}

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '상세화면관리 루트 뷰'
define root view entity YR_ASIM0000N
  as select from YI_ASIM0000C
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

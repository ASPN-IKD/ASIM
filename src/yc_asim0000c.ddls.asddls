@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '상세화면관리 컨섭션 뷰'
@Metadata.allowExtensions: true
define root view entity YC_ASIM0000C
  provider contract transactional_query
  as projection on YI_ASIM0000C
{
    key Uuid,
    key Progid,
    key Viewid,
    Prognm,
    Viewnm,
    Viewob,
    Viewat,
    Viewtp,
    Usediv,
    Fieldall,
    Fieldcre,
    Fieldupd,
    Fieldnum,
    Fielddat,
    Fieldkey,
    Fieldseq,
    Roleid
}

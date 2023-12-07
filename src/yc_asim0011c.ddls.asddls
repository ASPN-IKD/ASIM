@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '권한관리 - 사용자'
@Metadata.allowExtensions: true
define view entity YC_ASIM0011C
  as projection on YI_ASIM0011C
{
    key Parentuuid,
    key Uuid,
    Roletype,
    Userid,
    Usernm,
    Userdp,
    Hiddenid,
    Remark,
    _0010C :  redirected to parent YC_ASIM0010C
}

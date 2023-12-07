@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '권한관리 컨섭션 뷰'
@Metadata.allowExtensions: true
define root view entity YC_ASIM0010C
  provider contract transactional_query
  as projection on YI_ASIM0010C
{
    key Uuid,
    Bukrs,
    Ekorg,
    Roleid,
    Rolenm,
    Hiddenid,
    Remark,
    
    _0011C : redirected to composition child YC_ASIM0011C
}

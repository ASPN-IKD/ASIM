@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '권한관리 인터페이스 뷰'
@Metadata.allowExtensions: true
define root view entity YI_ASIM0010C 
  as select from zasimt0010c
  composition [1..*] of YI_ASIM0011C as _0011C
{
    key uuid as Uuid,
    @EndUserText.label: '회사코드'
    bukrs as Bukrs,
    @EndUserText.label: '구매조직'
    ekorg as Ekorg,
    @EndUserText.label: '권한코드'
    roleid as Roleid,
    @EndUserText.label: '권한화면'
    rolenm as Rolenm,
    @EndUserText.label: '숨김버튼(조회용)'
    hiddenid as Hiddenid,
    @EndUserText.label: '비고'
    remark as Remark,
    _0011C // Make association public
}

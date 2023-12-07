@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '권한관리 - API'
define view entity YI_ASIM0012C as select from zasimt0010c as _rolehead
left outer join zasimt0011c as _roleitem on _roleitem.parentuuid = _rolehead.uuid
{
    key _rolehead.uuid as Uuid,
    @EndUserText.label: '회사코드'
    _rolehead.bukrs as Bukrs,
    @EndUserText.label: '구매조직'
    _rolehead.ekorg as Ekorg,
    @EndUserText.label: '권한코드'
    _rolehead.roleid as Roleid,
    @EndUserText.label: '권한화면'
    _rolehead.rolenm as Rolenm,
    @EndUserText.label: '비고'
    _rolehead.remark as Remark,
    @EndUserText.label: '권한타입'
    _roleitem.roletype as Roletype,
    @EndUserText.label: '사용자ID'
    _roleitem.userid as Userid,
    @EndUserText.label: '사용자명'
    _roleitem.usernm as Usernm,
    @EndUserText.label: '사용자부서'
    _roleitem.userdp as Userdp,
    @EndUserText.label: '숨김버튼'
    case when _roleitem.roletype = 'M' then _roleitem.hiddenid else 
    case when _roleitem.hiddenid != '' then _roleitem.hiddenid else _rolehead.hiddenid end end 
    as Hiddenid
}



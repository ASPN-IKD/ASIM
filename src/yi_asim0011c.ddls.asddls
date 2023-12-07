@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '권한관리 - 사용자'
@Metadata.allowExtensions: true
define view entity YI_ASIM0011C
  as select from zasimt0011c
  association to parent YI_ASIM0010C as _0010C on _0010C.Uuid = $projection.Parentuuid



{

            @EndUserText.label: '권한관리 UUID'
  key       parentuuid  as Parentuuid,

            @EndUserText.label: 'UUID'
  key       uuid        as Uuid,
  
            @EndUserText.label: '권한유형'
            roletype    as Roletype,

            @EndUserText.label: '사용자ID'
            userid      as Userid,

            @EndUserText.label: '사용자명'
            usernm      as Usernm,

            @EndUserText.label: '사용자부서'
            userdp      as Userdp,
            
            @EndUserText.label: '숨김버튼(사용자별)'
            hiddenid    as Hiddenid,

            @EndUserText.label: '비고'
            remark      as Remark,
            _0010C // Make association public

}

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '코드 관리 - 대분류 뷰'
@Metadata.allowExtensions: true
define root view entity YI_ASIM0000N
  as select from zasimt0000n
  composition [1..*] of YI_ASIM0001N as _0001N
{

      @EndUserText.label: 'UUID'
  key uuid    as Uuid,

      @EndUserText.label: '대분류 코드'
      zcode   as Zcode,

      @EndUserText.label: '코드 텍스트'
      ztext   as Ztext,

      @EndUserText.label: 'Value01 명칭'
      zvalu1t as Zvalu1t,

      @EndUserText.label: 'Value02 명칭'
      zvalu2t as Zvalu2t,

      @EndUserText.label: 'Value03 명칭'
      zvalu3t as Zvalu3t,

      @EndUserText.label: 'Value04 명칭'
      zvalu4t as Zvalu4t,

      @EndUserText.label: 'Value05 명칭'
      zvalu5t as Zvalu5t,

      @EndUserText.label: 'Value06 명칭'
      zvalu6t as Zvalu6t,

      @EndUserText.label: 'Value07 명칭'
      zvalu7t as Zvalu7t,
      
      @EndUserText.label: '생성자'
      @Semantics.user.createdBy: true
      created_by            as CreatedBy,
      @EndUserText.label: '생성일'
      @Semantics.systemDateTime.createdAt: true
      created_at            as CreatedAt,
      @EndUserText.label: '최종 변경자'
      @Semantics.user.lastChangedBy: true
      last_changed_by       as LastChangedBy,
      @EndUserText.label: '최종 변경일'
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      @EndUserText.label: '인스턴스 변경시간'
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      
      
      
      _0001N // Make association public
}

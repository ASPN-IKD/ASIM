@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입설정 인터페이스 뷰'
define view entity YI_ASIM0001N as select from zasimt0001n
{
    key zcode as Zcode,
    @EndUserText.label: '코드'
    key zcdno as Zcdno,
    @EndUserText.label: '값1'
    zvalu1 as Zvalu1,
    @EndUserText.label: '값2'
    zvalu2 as Zvalu2,
    @EndUserText.label: '값3'
    zvalu3 as Zvalu3,
    @EndUserText.label: '값4'
    zvalu4 as Zvalu4,
    @EndUserText.label: '값5'
    zvalu5 as Zvalu5,
    @EndUserText.label: '값6'
    zvalu6 as Zvalu6,
    @EndUserText.label: '값7'
    zvalu7 as Zvalu7,
    @EndUserText.label: '코드명'
    ztext as Ztext
}

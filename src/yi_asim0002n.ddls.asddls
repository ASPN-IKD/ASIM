@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '코드 관리 - 소분류 뷰'
@Metadata.allowExtensions: true
define root view entity YI_ASIM0002N
  as select from zasimt0001n
{

            @EndUserText.label: '대분류 UUID'
  key       parentuuid as Parentuuid,

            @EndUserText.label: 'UUID'
  key       uuid       as Uuid,

            @EndUserText.label: '대분류 코드'
            zcode      as Zcode,

            @EndUserText.label: '코드 번호'
            zcdno      as Zcdno,

            @Consumption.valueHelpDefinition: [
             {entity: {name: 'I_CurrencyStdVH', element: 'Currency' }}
            ]
            @EndUserText.label: 'Value01'
            zvalu1     as Zvalu1,

            @EndUserText.label: 'Value02'
            zvalu2     as Zvalu2,

            @EndUserText.label: 'Value03'
            zvalu3     as Zvalu3,

            @EndUserText.label: 'Value04'
            zvalu4     as Zvalu4,

            @EndUserText.label: 'Value05'
            zvalu5     as Zvalu5,

            @EndUserText.label: 'Value06'
            zvalu6     as Zvalu6,

            @EndUserText.label: 'Value07'
            zvalu7     as Zvalu7,

            @EndUserText.label: '코드 텍스트'
            ztext      as Ztext
}

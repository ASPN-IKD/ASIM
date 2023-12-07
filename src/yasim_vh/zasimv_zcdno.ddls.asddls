@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '부대비용코드 도움말 뷰'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZASIMV_ZCDNO 
  as select from zasimt0001n
{
      @ObjectModel.text.element: ['Text']
  key zcdno as Cdno,    
      ztext as Text,
      @EndUserText.label: '조건유형'
      zvalu1 as Zvalu1,
      @EndUserText.label: '참조문서구분'
      zvalu2 as Zvalu2,
      @EndUserText.label: '차대변지시자'
      zvalu3 as Zvalu3,
      @EndUserText.label: '선급지시자'
      zvalu4 as Zvalu4,
      @EndUserText.label: '선급전환연동'
      zvalu5 as Zvalu5,
      @EndUserText.label: '연동세금코드'
      zvalu6 as Zvalu6,

      zvalu7 as Zvalu7
}
where
      zcode like '%ZCDNO'
  and zcdno <>   '00'

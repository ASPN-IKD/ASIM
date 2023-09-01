@EndUserText.label: '회사코드 도움말 뷰'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZASIMV_BUKRS
  as select from I_CompanyCode
  
{     
      @EndUserText.label: '회사코드'
  key CompanyCode     as Bukrs,
      @EndUserText.label: '회사코드명'
      CompanyCodeName as Bukrst

}
where
  Language = '3'

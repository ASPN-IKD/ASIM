@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '환율 인터페이스 뷰'
define root view entity YI_ASIM_CURRATE as select from I_ExchangeRateRawData as Currate

left outer join  YI_ASIM0001N as _Curr on _Curr.Zcode      like '%CURR'
                                            and _Curr.Zcdno      <>   '00'
                                            and _Curr.Zvalu1     = Currate.SourceCurrency
                                            and _Curr.Zvalu2     = Currate.TargetCurrency
                                            
{
  //key cast(Currate.ExchangeRateType as abap.char( 4 )) as ExchangeRateType,
  
  key Currate.SourceCurrency  as SourceCurrency ,
  
  key Currate.TargetCurrency  as TargetCurrency,
  
  Currate.ValidityStartDate, 
  
  case when _Curr.Zvalu3 is not null then cast(Currate.ExchangeRate * cast(_Curr.Zvalu3 as abap.dec(10,2) ) / cast(_Curr.Zvalu4 as abap.dec(10,2) ) as abap.dec( 9,5 )) 
  else cast(Currate.ExchangeRate as  abap.dec( 9,5 )) end as Exrate
   
} where Currate.ExchangeRateType = 'M'

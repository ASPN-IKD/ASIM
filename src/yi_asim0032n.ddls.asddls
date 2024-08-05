@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입 선급전환 정보 인터페이스 뷰'
define root view entity YI_ASIM0032N
  as select from YI_ASIM0130N as _Exh
  
  //선급전환
  association [0..1] to YI_ASIM0130N as _Exhb on  _Exhb.Zcdno  = _Exh.Zvalu5
                                              and _Exhb.Zvalu4 = 'S'
                                              and _Exhb.Zvalu3 = 'H'
                                              and _Exhb.Reqmu  = _Exh.Reqmu
                                              and _Exhb.Loekz  = ''
  //선급환급
  association [0..1] to YI_ASIM0130N as _Exhm on  _Exhm.Zvalu5 = _Exh.Zcdno  
                                              and _Exhm.Zvalu4 = 'H'
                                              and _Exhm.Zvalu3 = 'S'
                                              and _Exhm.Reqmu  = _Exh.Reqmu
                                              and _Exhm.Loekz  = ''


{
      @EndUserText.label: '관리번호'
  key _Exh.Reqmu                    as Reqmu,
      @EndUserText.label: '계약내부번호'
  key _Exh.Reqno                    as Reqno,
      @EndUserText.label: '계약내부연도'
  key _Exh.Reqyr                    as Reqyr,
      @EndUserText.label: '계약번호1'
  key _Exh.Cont1                    as Cont1,
      
//      cast('' as abap.char(10))     as Blino,
      @EndUserText.label: '부대비항목'
  key   _Exh.Zcdno                    as Zcdnoa,
      @EndUserText.label: '부대비항목명'
      _Exh.Zcdnot                   as Zcdnota,
      @EndUserText.label: '통화'
      _Exh.WaersFees                as WaersFees,
      
      @EndUserText.label: '선급 금액'
      @Semantics.amount.currencyCode : 'WaersFees'
      cast ( case when _Exhm.Reqmu is not null and _Exhb.Reqmu is not null
             then sum(_Exh.RmwwrFees) - sum(_Exhm.RmwwrFees)
           when _Exhm.Reqmu is null and _Exhb.Reqmu is not null
             then sum(_Exh.RmwwrFees)
           when _Exhm.Reqmu is not null and _Exhb.Reqmu is null
             then sum(_Exh.RmwwrFees) - sum(_Exhm.RmwwrFees)
           when _Exhm.Reqmu is null and _Exhb.Reqmu is null
             then sum(_Exh.RmwwrFees)
           else  sum(_Exh.RmwwrFees)
           end as abap.dec(20,2) )  as RmwwrFeest,
      
      @EndUserText.label: '선급 세액'
      @Semantics.amount.currencyCode : 'WaersFees'
      cast ( case when _Exhm.Reqmu is not null and _Exhb.Reqmu is not null
             then sum(_Exh.Wmwst1Fees) - sum(_Exhm.Wmwst1Fees)
           when _Exhm.Reqmu is null and _Exhb.Reqmu is not null
             then sum(_Exh.Wmwst1Fees)
           when _Exhm.Reqmu is not null and _Exhb.Reqmu is null
             then sum(_Exh.Wmwst1Fees) - sum(_Exhm.Wmwst1Fees)
           when _Exhm.Reqmu is null and _Exhb.Reqmu is null
             then sum(_Exh.Wmwst1Fees)
           else  sum(_Exh.Wmwst1Fees)
           end as abap.dec(20,2) )  as Wmwst1Feest,
           
      @EndUserText.label: '선급 총금액'
      @Semantics.amount.currencyCode : 'WaersFees'
      cast ( case when _Exhm.Reqmu is not null and _Exhb.Reqmu is not null
              then sum(_Exh.IvamtFees) - sum(_Exhm.IvamtFees)
            when _Exhm.Reqmu is null and _Exhb.Reqmu is not null
              then sum(_Exh.IvamtFees)
            when _Exhm.Reqmu is not null and _Exhb.Reqmu is null
              then sum(_Exh.IvamtFees) - sum(_Exhm.IvamtFees)
            when _Exhm.Reqmu is null and _Exhb.Reqmu is null
              then sum(_Exh.IvamtFees)
            else  sum(_Exh.IvamtFees)
            end as abap.dec(20,2) ) as IvamtFeest,
      
      @EndUserText.label: '선급 잔액'
      @Semantics.amount.currencyCode : 'WaersFees'
      cast ( case when _Exhm.Reqmu is not null and _Exhb.Reqmu is not null
             then sum(_Exh.RmwwrFees) - sum(_Exhm.RmwwrFees) - sum(_Exhb.RmwwrFees)
           when _Exhm.Reqmu is null and _Exhb.Reqmu is not null
             then sum(_Exh.RmwwrFees) - sum(_Exhb.RmwwrFees)
           when _Exhm.Reqmu is not null and _Exhb.Reqmu is null
             then sum(_Exh.RmwwrFees) - sum(_Exhm.RmwwrFees)
           when _Exhm.Reqmu is null and _Exhb.Reqmu is null
             then sum(_Exh.RmwwrFees)
           else  sum(_Exh.RmwwrFees)
           end as abap.dec(20,2) )  as RmwwrFeesa,
      @EndUserText.label: '선급 잔액(세액)'
      @Semantics.amount.currencyCode : 'WaersFees'
      cast ( case when _Exhm.Reqmu is not null and _Exhb.Reqmu is not null
             then sum(_Exh.Wmwst1Fees) - sum(_Exhm.Wmwst1Fees) - sum(_Exhb.Wmwst1Fees)
           when _Exhm.Reqmu is null and _Exhb.Reqmu is not null
             then sum(_Exh.Wmwst1Fees) - sum(_Exhb.Wmwst1Fees)
           when _Exhm.Reqmu is not null and _Exhb.Reqmu is null
             then sum(_Exh.Wmwst1Fees) - sum(_Exhm.Wmwst1Fees)
           when _Exhm.Reqmu is null and _Exhb.Reqmu is null
             then sum(_Exh.Wmwst1Fees)
           else  sum(_Exh.Wmwst1Fees)
           end as abap.dec(20,2) )  as Wmwst1Feesa,
      @EndUserText.label: '선급 잔액(총금액)'
      @Semantics.amount.currencyCode : 'WaersFees'
      cast ( case when _Exhm.Reqmu is not null and _Exhb.Reqmu is not null
              then sum(_Exh.IvamtFees) - sum(_Exhm.IvamtFees) - sum(_Exhb.IvamtFees)
            when _Exhm.Reqmu is null and _Exhb.Reqmu is not null
              then sum(_Exh.IvamtFees) - sum(_Exhb.IvamtFees)
            when _Exhm.Reqmu is not null and _Exhb.Reqmu is null
              then sum(_Exh.IvamtFees) - sum(_Exhm.IvamtFees)
            when _Exhm.Reqmu is null and _Exhb.Reqmu is null
              then sum(_Exh.IvamtFees)
            else  sum(_Exh.IvamtFees)
            end as abap.dec(20,2) ) as IvamtFeesa,
      @EndUserText.label: '선급전환 공급가액'
      @Semantics.amount.currencyCode : 'WaersFees'
      cast ( 0 as abap.dec(20,2) )  as RmwwrFees,
      @EndUserText.label: '선급전환 세액'
      @Semantics.amount.currencyCode : 'WaersFees'
      cast ( 0 as abap.dec(20,2) )  as Wmwst1Fees


}
where _Exh.Feegb  = 'A'
  and _Exh.Zvalu4 = 'H'
  and _Exh.Zvalu3 = 'H'
  and _Exh.Loekz  = ''

group by
  _Exh.Reqmu,
  _Exhb.Reqmu,
  _Exhm.Reqmu,
  _Exh.Reqno,
  _Exh.Reqyr,
  _Exh.Cont1,
  _Exh.Zcdno,
  _Exh.Zcdnot,
  _Exh.WaersFees

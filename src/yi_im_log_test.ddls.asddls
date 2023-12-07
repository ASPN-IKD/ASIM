@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.ignorePropagatedAnnotations: true
@EndUserText.label: '수입이력테스트'
define view entity YI_IM_LOG_TEST as 

select from YI_ASIM0050N
{
    key cast('IV' as abap.char( 2 )) as DocDiv,
    key Belnr as NodeID,
    key 3 as HierarchyLevel,
    concat_with_space('I/V :',Belnr,1) as Description,
    case Ivgb when 'A' then 'IM' when 'B' then concat('BL',Blino) end as ParentNodeID,
    'expanded' as Drillstate,
    case Ivgb when 'A' then 12 when 'B' then 22 end as OrderBy,
    Reqyr,
    Reqno,
    Reqmu,
    cast(Invno as abap.char( 100 )) as Remark1,
    cast('' as abap.char( 100 )) as Remark2,
    @Semantics.amount.currencyCode : 'Currency'
    cast(Netwr as abap.curr(17,2)) as TolAmt, /*금액(LC)*/
    Waers as Currency, /*통화*/
    Belnr as DocNo1, /*자재문서번호*/
    cast(BelnrFi as abap.char( 100 )) as DocNo2, /*회계문서번호 belnr_fi*/
    @Semantics.calendar.yearMonth: true
    cast(BudatIv as budat) as PostDate, /*전기일 budat_iv*/
    @Semantics.amount.currencyCode : 'Currency'
    cast(0 as abap.curr(17,2)) as Amount1, /*물대금액*/
    @Semantics.amount.currencyCode : 'Currency'
    cast(0 as abap.curr(17,2)) as Amount2, /*관세금액*/
    @Semantics.amount.currencyCode : 'Currency'
    cast(0 as abap.curr(17,2)) as Amount3 /*부대비금액*/ ,
    Kursf,
    @Semantics.amount.currencyCode: 'Currency'
    Ivamt,
floor(cast( cast( Kursf as abap.fltp) * cast( Ivamt as abap.fltp) as abap.dec(17, 2 ))) as Ivwra1,
    cast( cast( Kursf as abap.fltp) * cast( Ivamt as abap.fltp) as abap.dec(17, 2 )) as Ivwra2
}
where 1=1
  and Loekz = ''

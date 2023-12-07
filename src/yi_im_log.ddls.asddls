@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.ignorePropagatedAnnotations: true
@EndUserText.label: '수입이력테스트'
define view entity YI_IM_LOG as 




select from YI_ASIM0010N
{
    key cast('IM' as abap.char( 2 )) as DocDiv,
    key cast(Reqmu as abap.char( 20 )) as NodeID,
    key 1 as HierarchyLevel,
    cast(concat_with_space('계약 :',Reqno,1) as abap.char( 30 )) as Description,
    cast('IM' as abap.char( 20 )) as ParentNodeID,
    'expanded' as Drillstate,
    11 as OrderBy,
    Reqyr,
    Reqno,
    Reqmu,
    cast(Cont1 as abap.char( 100 )) as Remark1,
    cast(Lifnrt as abap.char( 100 )) as Remark2,
    @Semantics.amount.currencyCode : 'Currency'
    cast(Netwr as abap.curr(17,2)) as TolAmt, /*금액(LC)*/
    Waers as Currency, /*통화*/
    Reqno as DocNo1, /*자재문서번호*/
    cast('' as abap.char( 100 )) as DocNo2, /*회계문서번호 belnr_fi*/
    @Semantics.calendar.yearMonth: true
    cast('' as budat) as PostDate, /*전기일 budat_iv*/
    cast(0 as abap.dec(17)) as Amount1, /*물대금액*/
    cast(0 as abap.dec(17)) as Amount2, /*관세금액*/
    cast(0 as abap.dec(17)) as Amount3 /*부대비금액*/ 
}
where 1=1
  and Loekz = ''

union all

select from YI_ASIM0030N
{
    key cast('BL' as abap.char( 2 )) as DocDiv,
    key Blino as NodeID,
    key 2 as HierarchyLevel,
    concat_with_space('B/L :',Blino,1) as Description,
    concat('BL',Blino) as ParentNodeID,
    'expanded' as Drillstate,
    21 as OrderBy,
    Reqyr,
    Reqno,
    Reqmu,
    cast(Blino as abap.char( 100 )) as Remark1,
    cast(Ebeln as abap.char( 100 )) as Remark2,
    cast(Blamt as abap.curr(17,2)) as TolAmt, /*금액(LC)*/
    Waers as Currency, /*통화*/
    Blino as DocNo1, /*자재문서번호*/
    cast('' as abap.char( 100 )) as DocNo2, /*회계문서번호 belnr_fi*/
    cast('' as budat) as PostDate, /*전기일 budat_iv*/
    cast(0 as abap.dec(17)) as Amount1, /*물대금액*/
    cast(0 as abap.dec(17)) as Amount2, /*관세금액*/
    cast(0 as abap.dec(17)) as Amount3 /*부대비금액*/ 
}
where 1=1
  and Loekz = ''
  
union all

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
    cast(Ivamt as abap.curr(17,2)) as TolAmt, /*금액(LC)*/
    Waers as Currency, /*통화*/
    Belnr as DocNo1, /*자재문서번호*/
    cast(BelnrFi as abap.char( 100 )) as DocNo2, /*회계문서번호 belnr_fi*/
    cast(BudatIv as budat) as PostDate, /*전기일 budat_iv*/
    floor(cast( cast( Kursf as abap.fltp) * cast( Ivamt as abap.fltp) as abap.dec(17, 2))) as Amount1, /*물대금액*/
    cast(0 as abap.dec(17)) as Amount2, /*관세금액*/
    cast(0 as abap.dec(17)) as Amount3 /*부대비금액*/ 
}
where 1=1
  and Loekz = ''

union all

select from YI_ASIM0190N
{
    key cast('EC' as abap.char( 2 )) as DocDiv,
    key Eccno as NodeID,
    key 4 as HierarchyLevel,
    concat_with_space('통관예정 :',Eccno,1) as Description,
    concat('EC',Eccno) as ParentNodeID,
    'expanded' as Drillstate,
    31 as OrderBy,
    Reqyr,
    Reqno,
    Reqmu,
    cast(Cclgortt as abap.char( 100 )) as Remark1,
    cast('' as abap.char( 100 )) as Remark2,
    cast(0 as abap.curr(17,2)) as TolAmt, /*금액(LC)*/
    Waers as Currency, /*통화*/
    Eccno as DocNo1, /*자재문서번호*/
    cast('' as abap.char( 100 )) as DocNo2, /*회계문서번호 belnr_fi*/
    cast('' as budat) as PostDate, /*전기일 budat_iv*/
    cast(0 as abap.dec(17)) as Amount1, /*물대금액*/
    cast(0 as abap.dec(17)) as Amount2, /*관세금액*/
    cast(0 as abap.dec(17)) as Amount3 /*부대비금액*/ 
}
where 1=1
  and Loekz = ''
  
union all

select from YI_ASIM0070N
{
    key cast('CC' as abap.char( 2 )) as DocDiv,
    key Cclno as NodeID,
    key 5 as HierarchyLevel,
    concat_with_space('통관 :',Cclno,1) as Description,
    concat('CC',Cclno) as ParentNodeID,
    'expanded' as Drillstate,
    41 as OrderBy,
    Reqyr,
    Reqno,
    Reqmu,
    cast(Decno as abap.char( 100 )) as Remark1,
    cast(Cclift as abap.char( 100 )) as Remark2,
    cast(0 as abap.curr(17,2)) as TolAmt, /*금액(LC)*/
    Waers as Currency, /*통화*/
    Cclno as DocNo1, /*자재문서번호*/
    cast('' as abap.char( 100 )) as DocNo2, /*회계문서번호 belnr_fi*/
    cast('' as budat) as PostDate, /*전기일 budat_iv*/
    cast(0 as abap.dec(17)) as Amount1, /*물대금액*/
    cast(0 as abap.dec(17)) as Amount2, /*관세금액*/
    cast(0 as abap.dec(17)) as Amount3 /*부대비금액*/ 
}
where 1=1
  and Loekz = ''
  
union all

select from YI_ASIM0090N
{
    key cast('IG' as abap.char( 2 )) as DocDiv,
    key Mblnr as NodeID,
    key 6 as HierarchyLevel,
    concat_with_space('입고 :',Mblnr,1) as Description,
    concat('IG',Mblnr) as ParentNodeID,
    'expanded' as Drillstate,
    51 as OrderBy,
    Reqyr,
    Reqno,
    Reqmu,
    cast('' as abap.char( 100 )) as Remark1,
    cast('' as abap.char( 100 )) as Remark2,
    cast(0 as abap.curr(17,2)) as TolAmt, /*금액(LC)*/
    Waers as Currency, /*통화*/
    Mblnr as DocNo1, /*자재문서번호*/
    cast(BelnrGr as abap.char( 100 )) as DocNo2, /*회계문서번호 belnr_fi*/
    cast(BudatGr as budat) as PostDate, /*전기일 budat_iv*/
    cast(0 as abap.dec(17)) as Amount1, /*물대금액*/
    cast(0 as abap.dec(17)) as Amount2, /*관세금액*/
    cast(0 as abap.dec(17)) as Amount3 /*부대비금액*/ 
}
where 1=1
  and Loekz = ''

union all

select from YI_ASIM0130N
{
    key cast('EX' as abap.char( 2 )) as DocDiv,
    key Feeno as NodeID,
    key case Feegb when 'A' then 1
         when 'B' then 2
         when 'C' then 4
         when 'D' then 5 end as HierarchyLevel,
    concat_with_space('비용 :',Feeno,1) as Description,
    case Feegb when 'A' then 'IM'
         when 'B' then concat('BL',Blino)
         when 'C' then concat('CC',Cclno)
         when 'D' then concat('IG',Mblnr) end as ParentNodeID,
    'leaf' as Drillstate,
    case Feegb when 'A' then 19
         when 'B' then 29
         when 'C' then 49
         when 'D' then 59 end as OrderBy,
    Reqyr,
    Reqno,
    Reqmu,
    cast(Zcdnot as abap.char( 100 )) as Remark1,
    cast(LifreFeest as abap.char( 100 )) as Remark2,
    cast(RmwwrFees as abap.curr(17,2)) as TolAmt, /*금액(LC)*/
    WaersFees as Currency, /*통화*/
    Feeno as DocNo1, /*자재문서번호*/
    cast(BelnrFi as abap.char( 100 )) as DocNo2, /*회계문서번호 belnr_fi*/
    cast(BudatFees as budat) as PostDate, /*전기일 budat_iv*/
    cast(0 as abap.dec(17)) as Amount1, /*물대금액*/
    //cast(RmwwrFees as abap.dec(17)) as Amount2, /*관세금액*/
    //cast(RmwwrFees as abap.dec(17)) as Amount3 /*부대비금액*/ 
    cast(case when Zcdno = '01' then cast(RmwwrFees*100 as abap.dec(17)) else 0 end as abap.dec(17)) as Amount2, /*관세금액*/
    cast(case when Zcdno = '01' then 0 else cast(RmwwrFees*100 as abap.dec(17)) end as abap.dec(17)) as Amount3 /*부대비금액*/
}
where 1=1
  and Loekz = ''
  
union all

select from YI_ASIM0010N
{
    key cast('IM' as abap.char( 2 )) as DocDiv,
    key 'IM' as NodeID,
    key 0 as HierarchyLevel,
    '계약' as Description,
    '0' as ParentNodeID,
    'expanded' as Drillstate,
    10 as OrderBy,
    Reqyr,
    Reqno,
    Reqmu,
    cast('' as abap.char( 100 )) as Remark1,
    cast('' as abap.char( 100 )) as Remark2,
    cast(0 as abap.curr(17,2)) as TolAmt, /*금액(LC)*/
    cast('' as abap.cuky) as Currency, /*통화*/
    cast('' as abap.char( 10 )) as DocNo1, /*자재문서번호*/
    cast('' as abap.char( 100 )) as DocNo2, /*회계문서번호 belnr_fi*/
    cast('' as budat) as PostDate, /*전기일 budat_iv*/
    cast(0 as abap.dec(17)) as Amount1, /*물대금액*/
    cast(0 as abap.dec(17)) as Amount2, /*관세금액*/
    cast(0 as abap.dec(17)) as Amount3 /*부대비금액*/ 
}
where 1=1
  and Loekz = ''

union all

select from YI_ASIM0030N
{
    key cast('BL' as abap.char( 2 )) as DocDiv,
    key concat('BL',Blino) as NodeID,
    key 1 as HierarchyLevel,
    'B/L' as Description,
    'IM' as ParentNodeID,
    'expanded' as Drillstate,
    20 as OrderBy,
    Reqyr,
    Reqno,
    Reqmu,
    cast('' as abap.char( 100 )) as Remark1,
    cast('' as abap.char( 100 )) as Remark2,
    cast(0 as abap.curr(17,2)) as TolAmt, /*금액(LC)*/
    cast('' as abap.cuky) as Currency, /*통화*/
    cast('' as abap.char( 10 )) as DocNo1, /*자재문서번호*/
    cast('' as abap.char( 100 )) as DocNo2, /*회계문서번호 belnr_fi*/
    cast('' as budat) as PostDate, /*전기일 budat_iv*/
    cast(0 as abap.dec(17)) as Amount1, /*물대금액*/
    cast(0 as abap.dec(17)) as Amount2, /*관세금액*/
    cast(0 as abap.dec(17)) as Amount3 /*부대비금액*/ 
}
where 1=1
  and Loekz = ''
  
union all

select from YI_ASIM0190N
{
    key cast('EC' as abap.char( 2 )) as DocDiv,
    key concat('EC',Eccno) as NodeID,
    key 3 as HierarchyLevel,
    '통관예정' as Description,
    concat('BL',Blino) as ParentNodeID,
    'expanded' as Drillstate,
    30 as OrderBy,
    Reqyr,
    Reqno,
    Reqmu,
    cast('' as abap.char( 100 )) as Remark1,
    cast('' as abap.char( 100 )) as Remark2,
    cast(0 as abap.curr(17,2)) as TolAmt, /*금액(LC)*/
    cast('' as abap.cuky) as Currency, /*통화*/
    cast('' as abap.char( 10 )) as DocNo1, /*자재문서번호*/
    cast('' as abap.char( 100 )) as DocNo2, /*회계문서번호 belnr_fi*/
    cast('' as budat) as PostDate, /*전기일 budat_iv*/
    cast(0 as abap.dec(17)) as Amount1, /*물대금액*/
    cast(0 as abap.dec(17)) as Amount2, /*관세금액*/
    cast(0 as abap.dec(17)) as Amount3 /*부대비금액*/ 
}
where 1=1
  and Loekz = ''

union all

select from YI_ASIM0070N
{
    key cast('CC' as abap.char( 2 )) as DocDiv,
    key concat('CC',Cclno) as NodeID,
    key 4 as HierarchyLevel,
    '통관' as Description,
    concat('EC',Eccno) as ParentNodeID,
    'expanded' as Drillstate,
    40 as OrderBy,
    Reqyr,
    Reqno,
    Reqmu,
    cast('' as abap.char( 100 )) as Remark1,
    cast('' as abap.char( 100 )) as Remark2,
    cast(0 as abap.curr(17,2)) as TolAmt, /*금액(LC)*/
    cast('' as abap.cuky) as Currency, /*통화*/
    cast('' as abap.char( 10 )) as DocNo1, /*자재문서번호*/
    cast('' as abap.char( 100 )) as DocNo2, /*회계문서번호 belnr_fi*/
    cast('' as budat) as PostDate, /*전기일 budat_iv*/
    cast(0 as abap.dec(17)) as Amount1, /*물대금액*/
    cast(0 as abap.dec(17)) as Amount2, /*관세금액*/
    cast(0 as abap.dec(17)) as Amount3 /*부대비금액*/ 
}
where 1=1
  and Loekz = ''
  
union all

select from YI_ASIM0090N
{
    key cast('IG' as abap.char( 2 )) as DocDiv,
    key concat('IG',Mblnr) as NodeID,
    key 5 as HierarchyLevel,
    '입고' as Description,
    concat('CC',Cclno) as ParentNodeID,
    'expanded' as Drillstate,
    50 as OrderBy,
    Reqyr,
    Reqno,
    Reqmu,
    cast('' as abap.char( 100 )) as Remark1,
    cast('' as abap.char( 100 )) as Remark2,
    cast(0 as abap.curr(17,2)) as TolAmt, /*금액(LC)*/
    cast('' as abap.cuky) as Currency, /*통화*/
    cast('' as abap.char( 10 )) as DocNo1, /*자재문서번호*/
    cast('' as abap.char( 100 )) as DocNo2, /*회계문서번호 belnr_fi*/
    cast('' as budat) as PostDate, /*전기일 budat_iv*/
    cast(0 as abap.dec(17)) as Amount1, /*물대금액*/
    cast(0 as abap.dec(17)) as Amount2, /*관세금액*/
    cast(0 as abap.dec(17)) as Amount3 /*부대비금액*/ 
}
where 1=1
  and Loekz = ''

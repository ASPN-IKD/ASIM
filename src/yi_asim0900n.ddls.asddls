@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.ignorePropagatedAnnotations: true
@EndUserText.label: '수입원가현황 인터페이스 뷰'
define root view entity YI_ASIM0900N   as

  select from YI_ASIM0130N as _exah
    join      YI_ASIM0140N as _exai   on _exah.Uuid = _exai.ParentUUID
    join      YI_ASIM0010N as _reqivh on  _exah.Reqno = _reqivh.Reqno
                                      and _exah.Reqyr = _reqivh.Reqyr
    join      YI_ASIM0020N as _reqivi on  _reqivh.Uuid = _reqivi.ParentUUID
                                      and _exai.Itmno  = _reqivi.Itmno
  association [0..1] to YI_ASIM0001N as _curr on  _exah.WaersFees =    _curr.Zvalu1
                                              and _curr.Zcode     like '%CURR'
{
      @EndUserText.label: '관리번호'
  key _exah.Reqmu                                                                                                as Reqmu,
      @EndUserText.label: '구매문서번호'
  key _exai.Ebeln                                                                                                as Ebeln,
      @EndUserText.label: '구매문서품목'
  key _exai.Ebelp                                                                                                as Ebelp,
      @ObjectModel.text.element: ['Feegbt']
      @EndUserText.label: '참조문서구분'
  key 'A'                                                                                                        as Feegb,
      @EndUserText.label: '참조문서번호'
  key _exah.Feeno                                                                                                as Feeno,
      @EndUserText.label: '참조문서년도'
  key _exah.Feeyr                                                                                                as Feeyr,
      @EndUserText.label: '참조문서품목'
  key _exai.Feenp                                                                                                as Feenp,

      @EndUserText.label: '참조문서구분명'
      _exah.Feegbt                                                                                               as Feegbt,
      @ObjectModel.text.element: ['Zcdnot']
      @EndUserText.label: '비용코드'
      _exah.Zcdno                                                                                                as Zcdno,
      @EndUserText.label: '비용코드명'
      _exah.Zcdnot                                                                                               as Zcdnot,
      @EndUserText.label: '자재번호'
      _exai.Matnr                                                                                                as Matnr,
      @EndUserText.label: '자재명'
      _exai.Maktx                                                                                                as Maktx,
      @ObjectModel.text.element: ['Werkst']
      @EndUserText.label: '플랜트'
      _exai.Werks                                                                                                as Werks,
      @EndUserText.label: '플랜트명'
      _exai.Werkst                                                                                               as Werkst,
      @EndUserText.label: '전기일'
      _exah.BudatFees                                                                                            as Budat,
      @ObjectModel.text.element: ['Lifret']
      @EndUserText.label: '송장발행처'
      _exah.LifreFees                                                                                            as Lifre,
      @EndUserText.label: '송장발행처명'
      _exah.LifreFeest                                                                                           as Lifret,
      @ObjectModel.text.element: ['Ztermt']
      @EndUserText.label: '지급조건'
      _exah.ZtermFees                                                                                            as Zterm,
      @EndUserText.label: '지급조건명'
      _exah.ZtermFeest                                                                                           as Ztermt,
      @Semantics.quantity.unitOfMeasure: 'Meins'
      @EndUserText.label: '비용수량'
      _exai.MengeFees                                                                                            as Menge,
      @EndUserText.label: '비용단위'
      _exai.MeinsFees                                                                                            as Meins,
      @EndUserText.label: '비용통화'
      _exai.WaersFees                                                                                            as Waers,
      @Semantics.amount.currencyCode : 'Waers'
      @EndUserText.label: '공급가액'
      _exai.NetwrFees                                                                                            as Netwr,
      @Semantics.amount.currencyCode : 'Waers'
      @EndUserText.label: '세액'
      _exai.WmwstFees                                                                                            as Wmwst,
      @Semantics.amount.currencyCode : 'Waers'
      @EndUserText.label: '총금액'
      cast( cast(_exai.NetwrFees as abap.dec(20,2)) + cast(_exai.WmwstFees as abap.dec(20,2)) as abap.dec(20,2)) as Rmmwr,
      @EndUserText.label: '현지통화'
      'KRW'                                                                                                      as Waersk,
      @EndUserText.label: '공급가액(KRW)'
      case when _exai.WaersFees <> 'KRW' then cast( cast(_exai.NetwrFees as abap.dec(20,2)) * _exah.Kursf * cast(_curr.Zvalu3 as abap.dec(5,0)) as abap.dec(20,0))
           else cast(_exai.NetwrFees as abap.dec(20,0)) end                                                      as Netwrk,
      @EndUserText.label: '세액(KRW)'
      case when _exai.WaersFees <> 'KRW' then cast( cast(_exai.WmwstFees as abap.dec(20,2)) * _exah.Kursf * cast(_curr.Zvalu3 as abap.dec(5,0)) as abap.dec(20,0))
           else cast(_exai.WmwstFees as abap.dec(20,0)) end                                                      as Wmwstk,
      @EndUserText.label: '총금액(KRW)'
      case when _exai.WaersFees <> 'KRW' then cast( ( cast(_exai.NetwrFees as abap.dec(20,2)) + cast(_exai.WmwstFees as abap.dec(20,2)) ) * _exah.Kursf * cast(_curr.Zvalu3 as abap.dec(5,0)) as abap.dec(20,0))
           else cast( cast(_exai.NetwrFees as abap.dec(20,2))
           + cast(_exai.WmwstFees as abap.dec(20,2)) as abap.dec(20,0))
           end                                                                                                   as Rmmwrk,
      @EndUserText.label: '입고금액'
      cast(0 as abap.dec(20,0))                                                                                  as DmbtrGr,
      @EndUserText.label: '미착금액'
      cast(0 as abap.dec(20,0))                                                                                  as DmbtrGrir,
      @EndUserText.label: '실입고금액'
      cast(0 as abap.dec(20,0))                                                                                  as DmbtrTot,
      @EndUserText.label: '입고수량'
      cast(0 as abap.dec(20,3))                                                                                  as MengeGr,
      @EndUserText.label: '입고단가'
      cast(0 as abap.dec(20,0))                                                                                  as NetprGr,
      @ObjectModel.text.element: ['Zlscht']
      @EndUserText.label: '지급방법'
      _exah.Zlsch                                                                                                as Zlsch,
      @EndUserText.label: '지급방법명'
      _exah.Zlscht                                                                                               as Zlscht,
      @ObjectModel.text.element: ['Mwskzt']
      @EndUserText.label: '세금코드'
      _exah.Mwskz                                                                                                as Mwskz,
      @EndUserText.label: '세금코드명'
      _exah.Mwskzt                                                                                               as Mwskzt,
      @EndUserText.label: '기산일'
      _exah.Zfbdt                                                                                                as Zfbdt,
      @EndUserText.label: '만기일'
      _exah.Fbedt                                                                                                as Fbedt,
      @EndUserText.label: '환율'
      _exah.Kursf                                                                                                as Kursf,
      @EndUserText.label: '송장문서번호'
      _exah.Belnr                                                                                                as Belnr,
      @EndUserText.label: '송장문서연도'
      _exah.Gjahr                                                                                                as Gjahr,
        @ObjectModel.text.element: ['Bukrst']
      @EndUserText.label: '회사코드'
      _reqivh.Bukrs                                                                                              as Bukrs,
      @EndUserText.label: '회사코드명'
      _reqivh.Bukrst                                                                                             as Bukrst,
      @EndUserText.label: '구매조직'
       @ObjectModel.text.element: ['Ekorgt']
      _reqivh.Ekorg                                                                                              as Ekorg,
      @EndUserText.label: '구매조직명'
      _reqivh.Ekorgt                                                                                             as Ekorgt,
      @EndUserText.label: '공급업체'
       @ObjectModel.text.element: ['Lifnrt']
      _reqivh.Lifnr                                                                                              as Lifnr,
      @EndUserText.label: '공급업체명'
      _reqivh.Lifnrt                                                                                             as Lifnrt,
      @EndUserText.label: '계약번호1'
      _reqivh.Cont1                                                                                              as Cont1,
      @EndUserText.label: '계약번호2'
      _reqivh.Cont2                                                                                              as Cont2,
      @EndUserText.label: '계약일'
      _reqivh.Reqdt                                                                                              as Reqdt,
      @EndUserText.label: '인도조건'
        @ObjectModel.text.element: ['Inco1t']
      _reqivh.Inco1                                                                                              as Inco1,
      @EndUserText.label: '인도조건명'
      _reqivh.Inco1t                                                                                             as Inco1t,
      @EndUserText.label: '인도처'
      _reqivh.Inco2                                                                                              as Inco2,
      @ObjectModel.text.element: ['Zcdno1t']
      @EndUserText.label: '도착지'
      _reqivh.Zcdno1                                                                                             as Zcdno1,
      @ObjectModel.text.element: ['Zcdno2t']
      @EndUserText.label: '운송수단'
      _reqivh.Zcdno2                                                                                             as Zcdno2,
      @ObjectModel.text.element: ['Zcdno3t']
      @EndUserText.label: '선적지'
      _reqivh.Zcdno3                                                                                             as Zcdno3,
      @ObjectModel.text.element: ['Zcdno4t']
      @EndUserText.label: '운송형태'
      _reqivh.Zcdno4                                                                                             as Zcdno4,
      @EndUserText.label: '도착지명'
      _reqivh.Zcdno1t                                                                                            as Zcdno1t,
      @EndUserText.label: '운송수단명'
      _reqivh.Zcdno2t                                                                                            as Zcdno2t,
      @EndUserText.label: '선적지명'
      _reqivh.Zcdno3t                                                                                            as Zcdno3t,
      @EndUserText.label: '운송형대명'
      _reqivh.Zcdno4t                                                                                            as Zcdno4t,
      @EndUserText.label: 'L/C번호'
      _reqivh.Opnum                                                                                              as Opnum,
      @EndUserText.label: 'L/C오픈일'
      _reqivh.Opdat                                                                                              as Opdat,
      @ObjectModel.text.element: ['Opbnkt']
      @EndUserText.label: '오픈은행'
      _reqivh.Opbnk                                                                                              as Opbnk,
      @EndUserText.label: '오픈은행명'
      _reqivh.Opbnkt                                                                                             as Opbnkt,

      @EndUserText.label: 'B/L번호'
      cast('' as abap.char(30))                                                                                  as Bleno,
      @EndUserText.label: '선적일'
      cast('' as abap.dats )                                                                                     as Bletd,
      @EndUserText.label: '입항일'
      cast('' as abap.dats )                                                                                     as Bleta,
      @EndUserText.label: 'B/L발행일'
      cast('' as abap.dats )                                                                                     as Bldat,

      @EndUserText.label: '수입신고번호'
      cast('' as abap.char(20))                                                                                  as Decno,
      @EndUserText.label: '신고일'
      cast('' as abap.dats )                                                                                     as Decdt,
      @ObjectModel.text.element: ['Cclift']
      @EndUserText.label: '세관'
      cast('' as abap.char(12))                                                                                  as Cclif,
      @EndUserText.label: '세관명'
      cast('' as abap.char(50))                                                                                  as Cclift,
      @EndUserText.label: '반입일'
      cast('' as abap.dats )                                                                                     as Ccldt,
      @ObjectModel.text.element: ['Cclgortt']
      @EndUserText.label: '보세창고'
      cast('' as abap.char(12))                                                                                  as Cclgort,
      @EndUserText.label: '보세창고명'
      cast('' as abap.char(50))                                                                                  as Cclgortt,
      @EndUserText.label: '입고전기일'
      cast('' as abap.dats )                                                                                     as BudatGr,
      @ObjectModel.text.element: ['Lgortt']
      @EndUserText.label: '저장위치'
      cast('' as abap.char(4))                                                                                   as Lgort,
      @EndUserText.label: '저장위치명'
      cast('' as abap.char(16))                                                                                  as Lgortt



}
where
      _exah.Feegb =  'A'
  and _exai.Ebeln <> ''
  and _exah.Loekz =  ''

union all

select from YI_ASIM0130N as _exbh
  join      YI_ASIM0140N as _exbi on _exbh.Uuid = _exbi.ParentUUID
  join      YI_ASIM0030N as _blh  on  _exbh.Blino = _blh.Blino
                                  and _exbh.Bliyr = _blh.Bliyr
  join      YI_ASIM0040N as _bli  on  _blh.Uuid   = _bli.ParentUUID
                                  and _exbi.Blinp = _bli.Blinp
association [0..1] to YI_ASIM0001N as _curr on  _exbh.WaersFees =    _curr.Zvalu1
                                            and _curr.Zcode     like '%CURR'
{
  key _exbh.Reqmu                                                                                                as Reqmu,
  key _exbi.Ebeln                                                                                                as Ebeln,
  key _exbi.Ebelp                                                                                                as Ebelp,
  key 'B'                                                                                                        as Feegb,
  key _exbh.Feeno                                                                                                as Feeno,
  key _exbh.Feeyr                                                                                                as Feeyr,
  key _exbi.Feenp                                                                                                as Feenp,
      _exbh.Feegbt                                                                                               as Feegbt,
      _exbh.Zcdno                                                                                                as Zcdno,
      _exbh.Zcdnot                                                                                               as Zcdnot,
      _exbi.Matnr                                                                                                as Matnr,
      _exbi.Maktx                                                                                                as Maktx,
      _exbi.Werks                                                                                                as Werks,
      _exbi.Werkst                                                                                               as Werkst,
      _exbh.BudatFees                                                                                            as Budat,
      _exbh.LifreFees                                                                                            as Lifre,
      _exbh.LifreFeest                                                                                           as Lifret,
      _exbh.ZtermFees                                                                                            as Zterm,
      _exbh.ZtermFeest                                                                                           as Ztermt,
      _exbi.MengeFees                                                                                            as Menge,
      _exbi.MeinsFees                                                                                            as Meins,
      _exbi.WaersFees                                                                                            as Waers,
      _exbi.NetwrFees                                                                                            as Netwr,
      _exbi.WmwstFees                                                                                            as Wmwst,
      cast( cast(_exbi.NetwrFees as abap.dec(20,2)) + cast(_exbi.WmwstFees as abap.dec(20,2)) as abap.dec(20,2)) as Rmmwr,
      'KRW'                                                                                                      as Waersk,
      case when _exbi.WaersFees <> 'KRW' then cast( cast(_exbi.NetwrFees as abap.dec(20,2)) * _exbh.Kursf * cast(_curr.Zvalu3 as abap.dec(5,0)) as abap.dec(20,0))
           else cast(_exbi.NetwrFees as abap.dec(20,0)) end                                                      as Netwrk,
      case when _exbi.WaersFees <> 'KRW' then cast( cast(_exbi.WmwstFees as abap.dec(20,2)) * _exbh.Kursf * cast(_curr.Zvalu3 as abap.dec(5,0)) as abap.dec(20,0))
           else cast(_exbi.WmwstFees as abap.dec(20,0)) end                                                      as Wmwstk,
      case when _exbi.WaersFees <> 'KRW' then cast( ( cast(_exbi.NetwrFees as abap.dec(20,2)) + cast(_exbi.WmwstFees as abap.dec(20,2)) ) * _exbh.Kursf * cast(_curr.Zvalu3 as abap.dec(5,0)) as abap.dec(20,0))
           else cast( cast(_exbi.NetwrFees as abap.dec(20,2))
           + cast(_exbi.WmwstFees as abap.dec(20,2)) as abap.dec(20,0))
           end                                                                                                   as Rmmwrk,
      cast(0 as abap.dec(20,0))                                                                                  as DmbtrGr,
      cast(0 as abap.dec(20,0))                                                                                  as DmbtrGrir,
      cast(0 as abap.dec(20,0))                                                                                  as DmbtrTot,
      cast(0 as abap.dec(20,3))                                                                                  as MengeGr,
      cast(0 as abap.dec(20,0))                                                                                  as NetprGr,
      _exbh.Zlsch                                                                                                as Zlsch,
      _exbh.Zlscht                                                                                               as Zlscht,
      _exbh.Mwskz                                                                                                as Mwskz,
      _exbh.Mwskzt                                                                                               as Mwskzt,
      _exbh.Zfbdt                                                                                                as Zfbdt,
      _exbh.Fbedt                                                                                                as Fbedt,
      _exbh.Kursf                                                                                                as Kursf,
      _exbh.Belnr                                                                                                as Belnr,
      _exbh.Gjahr                                                                                                as Gjahr,
      _blh.Bukrs                                                                                                 as Bukrs,
      _blh.Bukrst                                                                                                as Bukrst,
      _blh.Ekorg                                                                                                 as Ekorg,
      _blh.Ekorgt                                                                                                as Ekorgt,
      _blh.Lifnr                                                                                                 as Lifnr,
      _blh.Lifnrt                                                                                                as Lifnrt,
      _blh.Cont1                                                                                                 as Cont1,
      _blh.Cont2                                                                                                 as Cont2,
      _blh.Reqdt                                                                                                 as Reqdt,
      _blh.Inco1                                                                                                 as Inco1,
      _blh.Inco1t                                                                                                as Inco1t,
      _blh.Inco2                                                                                                 as Inco2,
      _blh.Zcdno1                                                                                                as Zcdno1,
      _blh.Zcdno2                                                                                                as Zcdno2,
      _blh.Zcdno3                                                                                                as Zcdno3,
      _blh.Zcdno4                                                                                                as Zcdno4,
      _blh.Zcdno1t                                                                                               as Zcdno1t,
      _blh.Zcdno2t                                                                                               as Zcdno2t,
      _blh.Zcdno3t                                                                                               as Zcdno3t,
      _blh.Zcdno4t                                                                                               as Zcdno4t,
      _blh.Opnum                                                                                                 as Opnum,
      _blh.Opdat                                                                                                 as Opdat,
      _blh.Opbnk                                                                                                 as Opbnk,
      _blh.Opbnkt                                                                                                as Opbnkt,

      _blh.Bleno                                                                                                 as Bleno,
      _blh.Bletd                                                                                                 as Bletd,
      _blh.Bleta                                                                                                 as Bleta,
      _blh.Bldat                                                                                                 as Bldat,

      cast('' as abap.char(20))                                                                                  as Decno,
      cast('' as abap.dats )                                                                                     as Decdt,
      cast('' as abap.char(12))                                                                                  as Cclif,
      cast('' as abap.char(50))                                                                                  as Cclift,
      cast('' as abap.dats )                                                                                     as Ccldt,
      cast('' as abap.char(12))                                                                                  as Cclgort,
      cast('' as abap.char(50))                                                                                  as Cclgortt,
      cast('' as abap.dats )                                                                                     as BudatGr,
      cast('' as abap.char(4))                                                                                   as Lgort,
      cast('' as abap.char(16))                                                                                  as Lgortt
}
where
      _exbh.Feegb =  'B'
  and _exbi.Ebeln <> ''
  and _exbh.Loekz =  ''

union all

select from YI_ASIM0130N as _exch
  join      YI_ASIM0140N as _exci on _exch.Uuid = _exci.ParentUUID
  join      YI_ASIM0070N as _cclh on  _exch.Cclno = _cclh.Cclno
                                  and _exch.Cclyr = _cclh.Cclyr
  join      YI_ASIM0080N as _ccli on  _cclh.Uuid  = _ccli.ParentUUID
                                  and _exci.Cclnp = _ccli.Cclnp
association [0..1] to YI_ASIM0001N as _curr on  _exch.WaersFees =    _curr.Zvalu1
                                            and _curr.Zcode     like '%CURR'
{
  key _exch.Reqmu                                                                                                as Reqmu,
  key _exci.Ebeln                                                                                                as Ebeln,
  key _exci.Ebelp                                                                                                as Ebelp,
  key 'C'                                                                                                        as Feegb,
  key _exch.Feeno                                                                                                as Feeno,
  key _exch.Feeyr                                                                                                as Feeyr,
  key _exci.Feenp                                                                                                as Feenp,
      _exch.Feegbt                                                                                               as Feegbt,
      _exch.Zcdno                                                                                                as Zcdno,
      _exch.Zcdnot                                                                                               as Zcdnot,
      _exci.Matnr                                                                                                as Matnr,
      _exci.Maktx                                                                                                as Maktx,
      _exci.Werks                                                                                                as Werks,
      _exci.Werkst                                                                                               as Werkst,
      _exch.BudatFees                                                                                            as Budat,
      _exch.LifreFees                                                                                            as Lifre,
      _exch.LifreFeest                                                                                           as Lifret,
      _exch.ZtermFees                                                                                            as Zterm,
      _exch.ZtermFeest                                                                                           as Ztermt,
      _exci.MengeFees                                                                                            as Menge,
      _exci.MeinsFees                                                                                            as Meins,
      _exci.WaersFees                                                                                            as Waers,
      _exci.NetwrFees                                                                                            as Netwr,
      _exci.WmwstFees                                                                                            as Wmwst,
      cast( cast(_exci.NetwrFees as abap.dec(20,2)) + cast(_exci.WmwstFees as abap.dec(20,2)) as abap.dec(20,2)) as Rmmwr,
      'KRW'                                                                                                      as Waersk,
      case when _exci.WaersFees <> 'KRW' then cast( cast(_exci.NetwrFees as abap.dec(20,2)) * _exch.Kursf * cast(_curr.Zvalu3 as abap.dec(5,0)) as abap.dec(20,0))
           else cast(_exci.NetwrFees as abap.dec(20,0)) end                                                      as Netwrk,
      case when _exci.WaersFees <> 'KRW' then cast( cast(_exci.WmwstFees as abap.dec(20,2)) * _exch.Kursf * cast(_curr.Zvalu3 as abap.dec(5,0)) as abap.dec(20,0))
           else cast(_exci.WmwstFees as abap.dec(20,0)) end                                                      as Wmwstk,
      case when _exci.WaersFees <> 'KRW' then cast( ( cast(_exci.NetwrFees as abap.dec(20,2)) + cast(_exci.WmwstFees as abap.dec(20,2)) ) * _exch.Kursf * cast(_curr.Zvalu3 as abap.dec(5,0)) as abap.dec(20,0))
           else cast( cast(_exci.NetwrFees as abap.dec(20,2))
           + cast(_exci.WmwstFees as abap.dec(20,2)) as abap.dec(20,0))
           end                                                                                                   as Rmmwrk,
      cast(0 as abap.dec(20,0))                                                                                  as DmbtrGr,
      cast(0 as abap.dec(20,0))                                                                                  as DmbtrGrir,
      cast(0 as abap.dec(20,0))                                                                                  as DmbtrTot,
      cast(0 as abap.dec(20,3))                                                                                  as MengeGr,
      cast(0 as abap.dec(20,0))                                                                                  as NetprGr,
      _exch.Zlsch                                                                                                as Zlsch,
      _exch.Zlscht                                                                                               as Zlscht,
      _exch.Mwskz                                                                                                as Mwskz,
      _exch.Mwskzt                                                                                               as Mwskzt,
      _exch.Zfbdt                                                                                                as Zfbdt,
      _exch.Fbedt                                                                                                as Fbedt,
      _exch.Kursf                                                                                                as Kursf,
      _exch.Belnr                                                                                                as Belnr,
      _exch.Gjahr                                                                                                as Gjahr,
      _cclh.Bukrs                                                                                                as Bukrs,
      _cclh.Bukrst                                                                                               as Bukrst,
      _cclh.Ekorg                                                                                                as Ekorg,
      _cclh.Ekorgt                                                                                               as Ekorgt,
      _cclh.Lifnr                                                                                                as Lifnr,
      _cclh.Lifnrt                                                                                               as Lifnrt,
      _cclh.Cont1                                                                                                as Cont1,
      _cclh.Cont2                                                                                                as Cont2,
      _cclh.Reqdt                                                                                                as Reqdt,
      _cclh.Inco1                                                                                                as Inco1,
      _cclh.Inco1t                                                                                               as Inco1t,
      _cclh.Inco2                                                                                                as Inco2,
      _cclh.Zcdno1                                                                                               as Zcdno1,
      _cclh.Zcdno2                                                                                               as Zcdno2,
      _cclh.Zcdno3                                                                                               as Zcdno3,
      _cclh.Zcdno4                                                                                               as Zcdno4,
      _cclh.Zcdno1t                                                                                              as Zcdno1t,
      _cclh.Zcdno2t                                                                                              as Zcdno2t,
      _cclh.Zcdno3t                                                                                              as Zcdno3t,
      _cclh.Zcdno4t                                                                                              as Zcdno4t,
      _cclh.Opnum                                                                                                as Opnum,
      _cclh.Opdat                                                                                                as Opdat,
      _cclh.Opbnk                                                                                                as Opbnk,
      _cclh.Opbnkt                                                                                               as Opbnkt,

      _cclh.Bleno                                                                                                as Bleno,
      _cclh.Bletd                                                                                                as Bletd,
      _cclh.Bleta                                                                                                as Bleta,
      _cclh.Bldat                                                                                                as Bldat,

      _cclh.Decno                                                                                                as Decno,
      _cclh.Decdt                                                                                                as Decdt,
      _cclh.Cclif                                                                                                as Cclif,
      _cclh.Cclift                                                                                               as Cclift,
      _cclh.Ccldt                                                                                                as Ccldt,
      _cclh.Cclgort                                                                                              as Cclgort,
      _cclh.Cclgortt                                                                                             as Cclgortt,
      cast('' as abap.dats )                                                                                     as BudatGr,
      cast('' as abap.char(4))                                                                                   as Lgort,
      cast('' as abap.char(16))                                                                                  as Lgortt
}
where
      _exch.Feegb =  'C'
  and _exci.Ebeln <> ''
  and _exch.Loekz =  ''

union all

select from YI_ASIM0130N as _exdh
  join      YI_ASIM0140N as _exdi on _exdh.Uuid = _exdi.ParentUUID
  join      YI_ASIM0090N as _grh  on  _exdh.Mblnr = _grh.Mblnr
                                  and _exdh.Mjahr = _grh.Mjahr
  join      YI_ASIM0100N as _gri  on  _grh.Uuid   = _gri.ParentUUID
                                  and _exdi.Zelie = _gri.Zeile
association [0..1] to YI_ASIM0001N as _curr on  _exdh.WaersFees =    _curr.Zvalu1
                                            and _curr.Zcode     like '%CURR'
{
  key _exdh.Reqmu                                                                                                as Reqmu,
  key _exdi.Ebeln                                                                                                as Ebeln,
  key _exdi.Ebelp                                                                                                as Ebelp,
  key 'D'                                                                                                        as Feegb,
  key _exdh.Feeno                                                                                                as Feeno,
  key _exdh.Feeyr                                                                                                as Feeyr,
  key _exdi.Feenp                                                                                                as Feenp,
      _exdh.Feegbt                                                                                               as Feegbt,
      _exdh.Zcdno                                                                                                as Zcdno,
      _exdh.Zcdnot                                                                                               as Zcdnot,
      _exdi.Matnr                                                                                                as Matnr,
      _exdi.Maktx                                                                                                as Maktx,
      _exdi.Werks                                                                                                as Werks,
      _exdi.Werkst                                                                                               as Werkst,
      _exdh.BudatFees                                                                                            as Budat,
      _exdh.LifreFees                                                                                            as Lifre,
      _exdh.LifreFeest                                                                                           as Lifret,
      _exdh.ZtermFees                                                                                            as Zterm,
      _exdh.ZtermFeest                                                                                           as Ztermt,
      _exdi.MengeFees                                                                                            as Menge,
      _exdi.MeinsFees                                                                                            as Meins,
      _exdi.WaersFees                                                                                            as Waers,
      _exdi.NetwrFees                                                                                            as Netwr,
      _exdi.WmwstFees                                                                                            as Wmwst,
      cast( cast(_exdi.NetwrFees as abap.dec(20,2)) + cast(_exdi.WmwstFees as abap.dec(20,2)) as abap.dec(20,2)) as Rmmwr,
      'KRW'                                                                                                      as Waersk,
      case when _exdi.WaersFees <> 'KRW' then cast( cast(_exdi.NetwrFees as abap.dec(20,2)) * _exdh.Kursf * cast(_curr.Zvalu3 as abap.dec(5,0)) as abap.dec(20,0))
           else cast(_exdi.NetwrFees as abap.dec(20,0)) end                                                      as Netwrk,
      case when _exdi.WaersFees <> 'KRW' then cast( cast(_exdi.WmwstFees as abap.dec(20,2)) * _exdh.Kursf * cast(_curr.Zvalu3 as abap.dec(5,0)) as abap.dec(20,0))
           else cast(_exdi.WmwstFees as abap.dec(20,0)) end                                                      as Wmwstk,
      case when _exdi.WaersFees <> 'KRW' then cast( ( cast(_exdi.NetwrFees as abap.dec(20,2)) + cast(_exdi.WmwstFees as abap.dec(20,2)) ) * _exdh.Kursf * cast(_curr.Zvalu3 as abap.dec(5,0)) as abap.dec(20,0))
           else cast( cast(_exdi.NetwrFees as abap.dec(20,2))
           + cast(_exdi.WmwstFees as abap.dec(20,2)) as abap.dec(20,0))
           end                                                                                                   as Rmmwrk,
      cast(0 as abap.dec(20,0))                                                                                  as DmbtrGr,
      cast(0 as abap.dec(20,0))                                                                                  as DmbtrGrir,
      cast(0 as abap.dec(20,0))                                                                                  as DmbtrTot,
      cast(0 as abap.dec(20,3))                                                                                  as MengeGr,
      cast(0 as abap.dec(20,0))                                                                                  as NetprGr,
      _exdh.Zlsch                                                                                                as Zlsch,
      _exdh.Zlscht                                                                                               as Zlscht,
      _exdh.Mwskz                                                                                                as Mwskz,
      _exdh.Mwskzt                                                                                               as Mwskzt,
      _exdh.Zfbdt                                                                                                as Zfbdt,
      _exdh.Fbedt                                                                                                as Fbedt,
      _exdh.Kursf                                                                                                as Kursf,
      _exdh.Belnr                                                                                                as Belnr,
      _exdh.Gjahr                                                                                                as Gjahr,
      _grh.Bukrs                                                                                                 as Bukrs,
      _grh.Bukrst                                                                                                as Bukrst,
      _grh.Ekorg                                                                                                 as Ekorg,
      _grh.Ekorgt                                                                                                as Ekorgt,
      _grh.Lifnr                                                                                                 as Lifnr,
      _grh.Lifnrt                                                                                                as Lifnrt,
      _grh.Cont1                                                                                                 as Cont1,
      _grh.Cont2                                                                                                 as Cont2,
      _grh.Reqdt                                                                                                 as Reqdt,
      _grh.Inco1                                                                                                 as Inco1,
      _grh.Inco1t                                                                                                as Inco1t,
      _grh.Inco2                                                                                                 as Inco2,
      _grh.Zcdno1                                                                                                as Zcdno1,
      _grh.Zcdno2                                                                                                as Zcdno2,
      _grh.Zcdno3                                                                                                as Zcdno3,
      _grh.Zcdno4                                                                                                as Zcdno4,
      _grh.Zcdno1t                                                                                               as Zcdno1t,
      _grh.Zcdno2t                                                                                               as Zcdno2t,
      _grh.Zcdno3t                                                                                               as Zcdno3t,
      _grh.Zcdno4t                                                                                               as Zcdno4t,
      _grh.Opnum                                                                                                 as Opnum,
      _grh.Opdat                                                                                                 as Opdat,
      _grh.Opbnk                                                                                                 as Opbnk,
      _grh.Opbnkt                                                                                                as Opbnkt,

      _grh.Bleno                                                                                                 as Bleno,
      _grh.Bletd                                                                                                 as Bletd,
      _grh.Bleta                                                                                                 as Bleta,
      _grh.Bldat                                                                                                 as Bldat,

      _grh.Decno                                                                                                 as Decno,
      _grh.Decdt                                                                                                 as Decdt,
      _grh.Cclif                                                                                                 as Cclif,
      _grh.Cclift                                                                                                as Cclift,
      _grh.Ccldt                                                                                                 as Ccldt,
      _grh.Cclgort                                                                                               as Cclgort,
      _grh.Cclgortt                                                                                              as Cclgortt,
      _grh.BudatGr                                                                                               as BudatGr,
      _gri.Lgort                                                                                                 as Lgort,
      _gri.Lgortt                                                                                                as Lgortt
}
where
      _exdh.Feegb =  'D'
  and _exdi.Ebeln <> ''
  and _exdh.Loekz =  ''

union all

select from YI_ASIM0050N as _ivah
  join      YI_ASIM0060N as _ivai   on _ivah.Uuid = _ivai.ParentUUID
  join      YI_ASIM0010N as _reqivh on  _ivah.Reqno = _reqivh.Reqno
                                    and _ivah.Reqyr = _reqivh.Reqyr
  join      YI_ASIM0020N as _reqivi on  _reqivh.Uuid = _reqivi.ParentUUID
                                    and _ivai.Itmno  = _reqivi.Itmno
association [0..1] to YI_ASIM0001N as _curr on  _ivah.Ivwae =    _curr.Zvalu1
                                            and _curr.Zcode like '%CURR'
{
  key _ivah.Reqmu                                                                                        as Reqmu,
  key _ivai.Ebeln                                                                                        as Ebeln,
  key _ivai.Ebelp                                                                                        as Ebelp,
  key 'E'                                                                                                as Feegb,
  key _ivah.Belnr                                                                                        as Feeno,
  key _ivah.Gjahr                                                                                        as Feeyr,
  key _ivai.Buzei                                                                                        as Feenp,
      cast('물품대' as abap.char(50))                                                                       as Feegbt,
      cast('' as abap.char(12))                                                                          as Zcdno,
      cast('' as abap.char(50))                                                                          as Zcdnot,
      _ivai.Matnr                                                                                        as Matnr,
      _ivai.Maktx                                                                                        as Maktx,
      _ivai.Werks                                                                                        as Werks,
      _ivai.Werkst                                                                                       as Werkst,
      _ivah.BudatIv                                                                                      as Budat,
      _ivah.Ivlif                                                                                        as Lifre,
      _ivah.Ivlift                                                                                       as Lifret,
      _ivah.Zterm                                                                                        as Zterm,
      _ivah.Ztermt                                                                                       as Ztermt,
      _ivai.Ivmng                                                                                        as Menge,
      _ivai.Meins                                                                                        as Meins,
      _ivai.Waers                                                                                        as Waers,
      _ivai.Ivwra                                                                                        as Netwr,
      _ivai.Ivwmw                                                                                        as Wmwst,
      cast( cast(_ivai.Ivwra as abap.dec(20,2)) + cast(_ivai.Ivwmw as abap.dec(20,2)) as abap.dec(20,2)) as Rmmwr,
      'KRW'                                                                                              as Waersk,
      case when _ivai.Waers <> 'KRW' then cast( cast(_ivai.Ivwra as abap.dec(20,2)) * _ivah.Kursf * cast(_curr.Zvalu3 as abap.dec(5,0)) as abap.dec(20,0))
           else cast(_ivai.Ivwra as abap.dec(20,0)) end                                                  as Netwrk,
      case when _ivai.Waers <> 'KRW' then cast( cast(_ivai.Ivwmw as abap.dec(20,2)) * _ivah.Kursf * cast(_curr.Zvalu3 as abap.dec(5,0)) as abap.dec(20,0))
           else cast(_ivai.Ivwmw as abap.dec(20,0)) end                                                  as Wmwstk,
      case when _ivai.Waers <> 'KRW' then cast( ( cast(_ivai.Ivwra as abap.dec(20,2)) + cast(_ivai.Ivwmw as abap.dec(20,2)) ) * _ivah.Kursf * cast(_curr.Zvalu3 as abap.dec(5,0)) as abap.dec(20,0))
           else cast( cast(_ivai.Ivwra as abap.dec(20,2))
           + cast(_ivai.Ivwmw as abap.dec(20,2)) as abap.dec(20,0))
           end                                                                                           as Rmmwrk,
      cast(0 as abap.dec(20,0))                                                                          as DmbtrGr,
      cast(0 as abap.dec(20,0))                                                                          as DmbtrGrir,
      cast(0 as abap.dec(20,0))                                                                          as DmbtrTot,
      cast(0 as abap.dec(20,3))                                                                          as MengeGr,
      cast(0 as abap.dec(20,0))                                                                          as NetprGr,
      _ivah.Zlsch                                                                                        as Zlsch,
      _ivah.Zlscht                                                                                       as Zlscht,
      _ivah.Mwskz                                                                                        as Mwskz,
      _ivah.Mwskzt                                                                                       as Mwskzt,
      _ivah.Zfbdt                                                                                        as Zfbdt,
      _ivah.Fbedt                                                                                        as Fbedt,
      _ivah.Kursf                                                                                        as Kursf,
      _ivah.Belnr                                                                                        as Belnr,
      _ivah.Gjahr                                                                                        as Gjahr,
      _reqivh.Bukrs                                                                                      as Bukrs,
      _reqivh.Bukrst                                                                                     as Bukrst,
      _reqivh.Ekorg                                                                                      as Ekorg,
      _reqivh.Ekorgt                                                                                     as Ekorgt,
      _reqivh.Lifnr                                                                                      as Lifnr,
      _reqivh.Lifnrt                                                                                     as Lifnrt,
      _reqivh.Cont1                                                                                      as Cont1,
      _reqivh.Cont2                                                                                      as Cont2,
      _reqivh.Reqdt                                                                                      as Reqdt,
      _reqivh.Inco1                                                                                      as Inco1,
      _reqivh.Inco1t                                                                                     as Inco1t,
      _reqivh.Inco2                                                                                      as Inco2,
      _reqivh.Zcdno1                                                                                     as Zcdno1,
      _reqivh.Zcdno2                                                                                     as Zcdno2,
      _reqivh.Zcdno3                                                                                     as Zcdno3,
      _reqivh.Zcdno4                                                                                     as Zcdno4,
      _reqivh.Zcdno1t                                                                                    as Zcdno1t,
      _reqivh.Zcdno2t                                                                                    as Zcdno2t,
      _reqivh.Zcdno3t                                                                                    as Zcdno3t,
      _reqivh.Zcdno4t                                                                                    as Zcdno4t,
      _reqivh.Opnum                                                                                      as Opnum,
      _reqivh.Opdat                                                                                      as Opdat,
      _reqivh.Opbnk                                                                                      as Opbnk,
      _reqivh.Opbnkt                                                                                     as Opbnkt,

      cast('' as abap.char(30))                                                                          as Bleno,
      cast('' as abap.dats )                                                                             as Bletd,
      cast('' as abap.dats )                                                                             as Bleta,
      cast('' as abap.dats )                                                                             as Bldat,

      cast('' as abap.char(20))                                                                          as Decno,
      cast('' as abap.dats )                                                                             as Decdt,
      cast('' as abap.char(12))                                                                          as Cclif,
      cast('' as abap.char(50))                                                                          as Cclift,
      cast('' as abap.dats )                                                                             as Ccldt,
      cast('' as abap.char(12))                                                                          as Cclgort,
      cast('' as abap.char(50))                                                                          as Cclgortt,
      cast('' as abap.dats )                                                                             as BudatGr,
      cast('' as abap.char(4))                                                                           as Lgort,
      cast('' as abap.char(16))                                                                          as Lgortt
}
where
      _ivah.Ivgb  =  'A'
  and _ivai.Ebeln <> ''
  and _ivah.Loekz =  ''
  and _ivah.Stblg =  ''

union all

select from YI_ASIM0050N as _ivbh
  join      YI_ASIM0060N as _ivbi  on _ivbh.Uuid = _ivbi.ParentUUID
  join      YI_ASIM0030N as _blivh on  _ivbh.Blino = _blivh.Blino
                                   and _ivbh.Bliyr = _blivh.Bliyr
  join      YI_ASIM0040N as _blivi on  _blivh.Uuid = _blivi.ParentUUID
                                   and _ivbi.Blinp = _blivi.Blinp
association [0..1] to YI_ASIM0001N as _curr on  _ivbh.Ivwae =    _curr.Zvalu1
                                            and _curr.Zcode like '%CURR'
{
  key _ivbh.Reqmu                                                                                        as Reqmu,
  key _ivbi.Ebeln                                                                                        as Ebeln,
  key _ivbi.Ebelp                                                                                        as Ebelp,
  key 'E'                                                                                                as Feegb,
  key _ivbh.Belnr                                                                                        as Feeno,
  key _ivbh.Gjahr                                                                                        as Feeyr,
  key _ivbi.Buzei                                                                                        as Feenp,
      cast('물품대' as abap.char(50))                                                                       as Feegbt,
      cast('' as abap.char(12))                                                                          as Zcdno,
      cast('' as abap.char(50))                                                                          as Zcdnot,
      _ivbi.Matnr                                                                                        as Matnr,
      _ivbi.Maktx                                                                                        as Maktx,
      _ivbi.Werks                                                                                        as Werks,
      _ivbi.Werkst                                                                                       as Werkst,
      _ivbh.BudatIv                                                                                      as Budat,
      _ivbh.Ivlif                                                                                        as Lifre,
      _ivbh.Ivlift                                                                                       as Lifret,
      _ivbh.Zterm                                                                                        as Zterm,
      _ivbh.Ztermt                                                                                       as Ztermt,
      _ivbi.Ivmng                                                                                        as Menge,
      _ivbi.Meins                                                                                        as Meins,
      _ivbi.Waers                                                                                        as Waers,
      _ivbi.Ivwra                                                                                        as Netwr,
      _ivbi.Ivwmw                                                                                        as Wmwst,
      cast( cast(_ivbi.Ivwra as abap.dec(20,2)) + cast(_ivbi.Ivwmw as abap.dec(20,2)) as abap.dec(20,2)) as Rmmwr,
      'KRW'                                                                                              as Waersk,
      case when _ivbi.Waers <> 'KRW' then cast( cast(_ivbi.Ivwra as abap.dec(20,2)) * _ivbh.Kursf * cast(_curr.Zvalu3 as abap.dec(5,0)) as abap.dec(20,0))
           else cast(_ivbi.Ivwra as abap.dec(20,0)) end                                                  as Netwrk,
      case when _ivbi.Waers <> 'KRW' then cast( cast(_ivbi.Ivwmw as abap.dec(20,2)) * _ivbh.Kursf * cast(_curr.Zvalu3 as abap.dec(5,0)) as abap.dec(20,0))
           else cast(_ivbi.Ivwmw as abap.dec(20,0)) end                                                  as Wmwstk,
      case when _ivbi.Waers <> 'KRW' then cast( ( cast(_ivbi.Ivwra as abap.dec(20,2)) + cast(_ivbi.Ivwmw as abap.dec(20,2)) ) * _ivbh.Kursf * cast(_curr.Zvalu3 as abap.dec(5,0)) as abap.dec(20,0))
           else cast( cast(_ivbi.Ivwra as abap.dec(20,2))
           + cast(_ivbi.Ivwmw as abap.dec(20,2)) as abap.dec(20,0))
           end                                                                                           as Rmmwrk,
      cast(0 as abap.dec(20,0))                                                                          as DmbtrGr,
      cast(0 as abap.dec(20,0))                                                                          as DmbtrGrir,
      cast(0 as abap.dec(20,0))                                                                          as DmbtrTot,
      cast(0 as abap.dec(20,3))                                                                          as MengeGr,
      cast(0 as abap.dec(20,0))                                                                          as NetprGr,
      _ivbh.Zlsch                                                                                        as Zlsch,
      _ivbh.Zlscht                                                                                       as Zlscht,
      _ivbh.Mwskz                                                                                        as Mwskz,
      _ivbh.Mwskzt                                                                                       as Mwskzt,
      _ivbh.Zfbdt                                                                                        as Zfbdt,
      _ivbh.Fbedt                                                                                        as Fbedt,
      _ivbh.Kursf                                                                                        as Kursf,
      _ivbh.Belnr                                                                                        as Belnr,
      _ivbh.Gjahr                                                                                        as Gjahr,
      _blivh.Bukrs                                                                                       as Bukrs,
      _blivh.Bukrst                                                                                      as Bukrst,
      _blivh.Ekorg                                                                                       as Ekorg,
      _blivh.Ekorgt                                                                                      as Ekorgt,
      _blivh.Lifnr                                                                                       as Lifnr,
      _blivh.Lifnrt                                                                                      as Lifnrt,
      _blivh.Cont1                                                                                       as Cont1,
      _blivh.Cont2                                                                                       as Cont2,
      _blivh.Reqdt                                                                                       as Reqdt,
      _blivh.Inco1                                                                                       as Inco1,
      _blivh.Inco1t                                                                                      as Inco1t,
      _blivh.Inco2                                                                                       as Inco2,
      _blivh.Zcdno1                                                                                      as Zcdno1,
      _blivh.Zcdno2                                                                                      as Zcdno2,
      _blivh.Zcdno3                                                                                      as Zcdno3,
      _blivh.Zcdno4                                                                                      as Zcdno4,
      _blivh.Zcdno1t                                                                                     as Zcdno1t,
      _blivh.Zcdno2t                                                                                     as Zcdno2t,
      _blivh.Zcdno3t                                                                                     as Zcdno3t,
      _blivh.Zcdno4t                                                                                     as Zcdno4t,
      _blivh.Opnum                                                                                       as Opnum,
      _blivh.Opdat                                                                                       as Opdat,
      _blivh.Opbnk                                                                                       as Opbnk,
      _blivh.Opbnkt                                                                                      as Opbnkt,

      _blivh.Bleno                                                                                       as Bleno,
      _blivh.Bletd                                                                                       as Bletd,
      _blivh.Bleta                                                                                       as Bleta,
      _blivh.Bldat                                                                                       as Bldat,

      cast('' as abap.char(20))                                                                          as Decno,
      cast('' as abap.dats )                                                                             as Decdt,
      cast('' as abap.char(12))                                                                          as Cclif,
      cast('' as abap.char(50))                                                                          as Cclift,
      cast('' as abap.dats )                                                                             as Ccldt,
      cast('' as abap.char(12))                                                                          as Cclgort,
      cast('' as abap.char(50))                                                                          as Cclgortt,
      cast('' as abap.dats )                                                                             as BudatGr,
      cast('' as abap.char(4))                                                                           as Lgort,
      cast('' as abap.char(50))                                                                          as Lgortt
}
where
      _ivbh.Ivgb  =  'B'
  and _ivbi.Ebeln <> ''
  and _ivbh.Loekz =  ''
  and _ivbh.Stblg =  ''

union all

select from YI_ASIM0090N as _grh
  join      YI_ASIM0100N as _gri on _grh.Uuid = _gri.ParentUUID
association [0..1] to YI_ASIM0901N as _fidoc on  _fidoc.Ebeln = _gri.Ebeln
                                             and _fidoc.Ebelp = _gri.Ebelp

{
  key _grh.Reqmu                                                                                                                       as Reqmu,
  key _gri.Ebeln                                                                                                                       as Ebeln,
  key _gri.Ebelp                                                                                                                       as Ebelp,
  key 'F'                                                                                                                              as Feegb,
  key _grh.Mblnr                                                                                                                       as Feeno,
  key _grh.Mjahr                                                                                                                       as Feeyr,
  key cast( concat('00',_gri.Zeile) as abap.numc(6))                                                                                   as Feenp,
      cast('입고' as abap.char(50))                                                                                                      as Feegbt,
      cast('' as abap.char(12))                                                                                                        as Zcdno,
      cast('' as abap.char(50))                                                                                                        as Zcdnot,
      _gri.Matnr                                                                                                                       as Matnr,
      _gri.Maktx                                                                                                                       as Maktx,
      _gri.Werks                                                                                                                       as Werks,
      _gri.Werkst                                                                                                                      as Werkst,
      _grh.BudatGr                                                                                                                     as Budat,
      _grh.Lifnr                                                                                                                       as Lifre,
      _grh.Lifnrt                                                                                                                      as Lifret,
      cast('' as abap.char(12))                                                                                                        as Zterm,
      cast('' as abap.char(50))                                                                                                        as Ztermt,
      cast(0 as abap.dec(20,3))                                                                                                        as Menge,
      cast('' as meins)                                                                                                                as Meins,
      cast('' as waers)                                                                                                                as Waers,
      cast(0 as abap.curr(17,2))                                                                                                       as Netwr,
      cast(0 as abap.curr(15,2))                                                                                                       as Wmwst,
      cast(0 as abap.dec(20,2))                                                                                                        as Rmmwr,
      'KRW'                                                                                                                            as Waersk,
      cast(0 as abap.dec(20,0))                                                                                                        as Netwrk,
      cast(0 as abap.dec(20,0))                                                                                                        as Wmwstk,
      cast(0 as abap.dec(20,0))                                                                                                        as Rmmwrk,
      cast(_gri.Grmng * _fidoc(p_budat: $session.system_date ).Dmbtr / _fidoc(p_budat: $session.system_date ).Menge as abap.dec(20,0)) as DmbtrGr,
      _fidoc(p_budat: $session.system_date ).Grir                                                                                      as DmbtrGrir,
      _fidoc(p_budat: $session.system_date ).Dmbtr                                                                                     as DmbtrTot,
      _gri.Grmng                                                                                                                       as MengeGr,
      cast(_fidoc(p_budat: $session.system_date ).Dmbtr / _fidoc(p_budat: $session.system_date ).Menge as abap.dec(20,0))              as NetprGr,
      cast('' as abap.char(12))                                                                                                        as Zlsch,
      cast('' as abap.char(50))                                                                                                        as Zlscht,
      cast('' as abap.char(12))                                                                                                        as Mwskz,
      cast('' as abap.char(50))                                                                                                        as Mwskzt,
      cast('' as abap.dats)                                                                                                            as Zfbdt,
      cast('' as abap.dats)                                                                                                            as Fbedt,
      1                                                                                                                                as Kursf,
      _grh.Mblnr                                                                                                                       as Belnr,
      _grh.Mjahr                                                                                                                       as Gjahr,
      _grh.Bukrs                                                                                                                       as Bukrs,
      _grh.Bukrst                                                                                                                      as Bukrst,
      _grh.Ekorg                                                                                                                       as Ekorg,
      _grh.Ekorgt                                                                                                                      as Ekorgt,
      _grh.Lifnr                                                                                                                       as Lifnr,
      _grh.Lifnrt                                                                                                                      as Lifnrt,
      _grh.Cont1                                                                                                                       as Cont1,
      _grh.Cont2                                                                                                                       as Cont2,
      _grh.Reqdt                                                                                                                       as Reqdt,
      _grh.Inco1                                                                                                                       as Inco1,
      _grh.Inco1t                                                                                                                      as Inco1t,
      _grh.Inco2                                                                                                                       as Inco2,
      _grh.Zcdno1                                                                                                                      as Zcdno1,
      _grh.Zcdno2                                                                                                                      as Zcdno2,
      _grh.Zcdno3                                                                                                                      as Zcdno3,
      _grh.Zcdno4                                                                                                                      as Zcdno4,
      _grh.Zcdno1t                                                                                                                     as Zcdno1t,
      _grh.Zcdno2t                                                                                                                     as Zcdno2t,
      _grh.Zcdno3t                                                                                                                     as Zcdno3t,
      _grh.Zcdno4t                                                                                                                     as Zcdno4t,
      _grh.Opnum                                                                                                                       as Opnum,
      _grh.Opdat                                                                                                                       as Opdat,
      _grh.Opbnk                                                                                                                       as Opbnk,
      _grh.Opbnkt                                                                                                                      as Opbnkt,

      _grh.Bleno                                                                                                                       as Bleno,
      _grh.Bletd                                                                                                                       as Bletd,
      _grh.Bleta                                                                                                                       as Bleta,
      _grh.Bldat                                                                                                                       as Bldat,

      _grh.Decno                                                                                                                       as Decno,
      _grh.Decdt                                                                                                                       as Decdt,
      _grh.Cclif                                                                                                                       as Cclif,
      _grh.Cclift                                                                                                                      as Cclift,
      _grh.Ccldt                                                                                                                       as Ccldt,
      _grh.Cclgort                                                                                                                     as Cclgort,
      _grh.Cclgortt                                                                                                                    as Cclgortt,
      _grh.BudatGr                                                                                                                     as BudatGr,
      _gri.Lgort                                                                                                                       as Lgort,
      _gri.Lgortt                                                                                                                      as Lgortt
}
where
      _gri.Ebeln <> ''
  and _grh.Loekz =  ''

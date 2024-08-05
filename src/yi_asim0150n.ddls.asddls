@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.ignorePropagatedAnnotations: true
@EndUserText.label: '수입마감 인터페이스 뷰'
define root view entity YI_ASIM0150N
  as select from YI_ASIM0030N as _Bl
    join         YI_ASIM0152N as _Kp on _Kp.Ebeln = _Bl.Ebeln
  association [0..1] to YI_ASIM0151N                  as _Pbxx on  _Bl.Ebeln   = _Pbxx.Ebeln
                                                               and _Pbxx.Trkey = 'WRX'
  association [0..1] to YI_ASIM0151N                  as _Zdc1 on  _Bl.Ebeln   = _Zdc1.Ebeln
                                                               and _Zdc1.Trkey = 'PK1'
  association [0..1] to YI_ASIM0151N                  as _Zdc2 on  _Bl.Ebeln   = _Zdc2.Ebeln
                                                               and _Zdc2.Trkey = 'PK2'
  association [0..1] to I_PurchaseOrderHistoryAPI01   as _Ekbe on  _Kp.Ebeln                           = _Ekbe.PurchaseOrder
                                                               and _Kp.Fblnr                           = _Ekbe.PurchasingHistoryDocument
                                                               and _Ekbe.PurchasingHistoryDocumentItem = '0001'
                                                               and _Ekbe.PurchasingHistoryCategory     = 'K'
  association [0..1] to I_PurOrdHistDeliveryCostAPI01 as _Ekbz on  _Kp.Ebeln                           = _Ekbz.PurchaseOrder
                                                               and _Kp.Fblnr                           = _Ekbz.PurchasingHistoryDocument
                                                               and _Ekbz.PurchasingHistoryDocumentItem = '0001'
                                                               and _Ekbz.PurchasingHistoryCategory     = 'K'
{
      @EndUserText.label: '구매문서번호'
  key _Bl.Ebeln,
      @EndUserText.label: '관리번호'
  key _Bl.Reqmu,
      @EndUserText.label: 'B/L내부번호'
  key _Bl.Blino,
      @EndUserText.label: 'B/L연도'
  key _Bl.Bliyr,
      @EndUserText.label: '계약완료여부'
      @Consumption.valueHelpDefinition: [{ entity: { element: 'boolean', name : 'ZASIMV_BOOL' } }]
      _Bl.Rqche,
      @EndUserText.label: '계약완료여부 아이콘'
      case when _Bl.Rqche = 'X' then '3'
        else '1' end                                              as RqcheIcon,
      @EndUserText.label: '납품완료여부'
      @Consumption.valueHelpDefinition: [{ entity: { element: 'boolean', name : 'ZASIMV_BOOL' } }]
      _Bl.Blche,
      @EndUserText.label: '납품완료여부 아이콘'
      case when _Bl.Blche = 'X' then '3'
        else '1' end                                              as BlcheIcon,
      @EndUserText.label: '물품대미착금액'
      @Semantics.amount.currencyCode : 'Waersk'
      _Pbxx(p_budat: $session.system_date).Grir                   as Pbxxa,
      @EndUserText.label: '관세미착금액'
      @Semantics.amount.currencyCode : 'Waersk'
      _Zdc1(p_budat: $session.system_date).Grir                   as Zdc1a,
      @EndUserText.label: '부대비미착금액'
      @Semantics.amount.currencyCode : 'Waersk'
      _Zdc2(p_budat: $session.system_date).Grir                   as Zdc2a,
      @EndUserText.label: '미착조정여부'
      @Consumption.valueHelpDefinition: [{ entity: { element: 'boolean', name : 'ZASIMV_BOOL' } }]
      cast (case when ( _Pbxx(p_budat: $session.system_date).Grir = 0 or _Pbxx(p_budat: $session.system_date).Grir is null )
                and ( _Zdc1(p_budat: $session.system_date).Grir = 0 or _Zdc1(p_budat: $session.system_date).Grir is null )
                and ( _Zdc2(p_budat: $session.system_date).Grir = 0 or _Zdc2(p_budat: $session.system_date).Grir is null )
             then 'X'
             else ''
           end                                  as abap_boolean ) as Grirche,
      @EndUserText.label: '미착조정여부 아이콘'
      case when ( _Pbxx(p_budat: $session.system_date).Grir = 0 or _Pbxx(p_budat: $session.system_date).Grir is null )
                and ( _Zdc1(p_budat: $session.system_date).Grir = 0 or _Zdc1(p_budat: $session.system_date).Grir is null )
                and ( _Zdc2(p_budat: $session.system_date).Grir = 0 or _Zdc2(p_budat: $session.system_date).Grir is null )
             then '3'
             else '1'
           end                                                    as GrircheIcon,
      @EndUserText.label: '최종마감문서'
      _Kp.Fblnr                                                   as Fblnr,
      @EndUserText.label: '최종마감연도'
      case when _Ekbe.PurchasingHistoryDocumentYear is not null
             then _Ekbe.PurchasingHistoryDocumentYear
             else case when _Ekbz.PurchasingHistoryDocumentYear is not null
                         then _Ekbz.PurchasingHistoryDocumentYear
                         else cast('0000' as abap.numc(4))
                       end
           end                                                    as Fjahr,
      @EndUserText.label: '최종마감전기일'
      case when _Ekbe.PostingDate is not null
             then _Ekbe.PostingDate
             else case when _Ekbz.PostingDate is not null
                         then _Ekbz.PostingDate
                         else cast('' as abap.dats)
                       end
           end                                                    as Fdate,

      @EndUserText.label: '계약연도'
      _Bl.Reqyr,
      @EndUserText.label: '계약내부번호'
      _Bl.Reqno,
      @ObjectModel.text.element: ['Bukrst']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_BUKRS', element: 'Bukrs' }}
      ]
      @EndUserText.label: '회사코드'
      _Bl.Bukrs,
      @EndUserText.label: '회사코드명'
      _Bl.Bukrst,
      @ObjectModel.text.element: ['Ekorgt']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_EKORG', element: 'Ekorg' }}
      ]
      @EndUserText.label: '구매조직'
      _Bl.Ekorg,
      @EndUserText.label: '구매조직명'
      _Bl.Ekorgt,
      @ObjectModel.text.element: ['Ekgrpt']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_EKGRP', element: 'Ekgrp' }}
      ]
      @EndUserText.label: '구매그룹'
      _Bl.Ekgrp,
      @EndUserText.label: '구매그룹명'
      _Bl.Ekgrpt,
      @ObjectModel.text.element: ['Lifnrt']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_LIFNR', element: 'Lifnr' }}
      ]
      @EndUserText.label: '공급업체'
      _Bl.Lifnr,
      @EndUserText.label: '공급업체명'
      _Bl.Lifnrt,
      @EndUserText.label: '삭제지시자'
      _Bl.Loekz,
      @EndUserText.label: '요청일'
      _Bl.Reqdt,
      @EndUserText.label: 'B/L번호'
      _Bl.Bleno,
      @EndUserText.label: 'B/L발행일'
      _Bl.Bldat,
      @EndUserText.label: '입항일'
      _Bl.Bleta,
      @EndUserText.label: '선적일'
      _Bl.Bletd,
      @EndUserText.label: 'ETD'
      _Bl.Rqetd,
      @EndUserText.label: 'ETA'
      _Bl.Rqeta,
      @EndUserText.label: '만기일수'
      _Bl.Bld1t,
      @EndUserText.label: '인수만기일'
      _Bl.Bledt,
      @EndUserText.label: '선적서류접수일'
      _Bl.Bldat2,
      @EndUserText.label: '입고예정일'
      _Bl.Blgrd,
      @EndUserText.label: '총중량'
      @Semantics.quantity.unitOfMeasure: 'Gewei'
      _Bl.Brgew,
      @EndUserText.label: '순중량'
      @Semantics.quantity.unitOfMeasure: 'Gewei'
      _Bl.Negew,
      @EndUserText.label: '중량단위'
      _Bl.Gewei,
      @EndUserText.label: 'L/G번호'
      _Bl.Lgnum,
      @EndUserText.label: '컨테이너번호'
      _Bl.Cntno,
      @ObjectModel.text.element: ['Mosnot']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_MOSNO', element: 'Cdno' }}
      ]
      @EndUserText.label: '모선번호'
      _Bl.Mosno,
      @EndUserText.label: '모선번호명'
      _Bl.Mosnot,
      @EndUserText.label: 'B/L총금액'
      @Semantics.amount.currencyCode : 'Waers'
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_CurrencyStdVH', element: 'Currency' }}]
      _Bl.Blamt,
      @EndUserText.label: '통화키'
      _Bl.Waers,
      @EndUserText.label: 'B/L Text'
      _Bl.Blitx,
      @EndUserText.label: '검역여부'
      _Bl.Eccgb,


      @ObjectModel.text.element: ['Lifret']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_LIFRE', element: 'Cdno' }}
      ]
      @EndUserText.label: '공급처'
      _Bl.Lifre,
      @EndUserText.label: '공급처명'
      _Bl.Lifret,
      @ObjectModel.text.element: ['Inco1t']
      @EndUserText.label: '인도조건'
      _Bl.Inco1,
      @EndUserText.label: '인도조건명'
      _Bl.Inco1t,
      @EndUserText.label: '인도처'
      _Bl.Inco2,
      @ObjectModel.text.element: ['Ztermt']
      @Consumption.valueHelpDefinition: [
      {entity: {name: 'ZASIMV_ZTERM', element: 'Cdno' }}
      ]
      @EndUserText.label: '지급조건'
      _Bl.Zterm,
      @EndUserText.label: '지급조건명'
      _Bl.Ztermt,
      @ObjectModel.text.element: ['Zcdno1t']
      @EndUserText.label: '도착지'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO1', element: 'Cdno' }}]
      _Bl.Zcdno1,
      @EndUserText.label: '도착지명'
      _Bl.Zcdno1t,
      @ObjectModel.text.element: ['Zcdno2t']
      @EndUserText.label: '운송수단'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO2', element: 'Cdno' }}]
      _Bl.Zcdno2,
      @EndUserText.label: '운송수단명'
      _Bl.Zcdno2t,
      @ObjectModel.text.element: ['Zcdno3t']
      @EndUserText.label: '선적지'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO3', element: 'Cdno' }}]
      _Bl.Zcdno3,
      @EndUserText.label: '선적지명'
      _Bl.Zcdno3t,
      @ObjectModel.text.element: ['Zcdno4t']
      @EndUserText.label: '운송형태'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO4', element: 'Cdno' }}]
      _Bl.Zcdno4,
      @EndUserText.label: '운송형태명'
      _Bl.Zcdno4t,
      @EndUserText.label: '계약총금액'
      @Semantics.amount.currencyCode : 'Waers'
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_CurrencyStdVH', element: 'Currency' }}]
      _Bl.Netwr,
      @EndUserText.label: 'L/C오픈일'
      _Bl.Opdat,
      @ObjectModel.text.element: ['Opbnkt']
      @EndUserText.label: '개설은행'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_OPBNK', element: 'Cdno' }}]
      _Bl.Opbnk,
      @EndUserText.label: '개설은행명'
      _Bl.Opbnkt,
      @EndUserText.label: 'L/C번호'
      _Bl.Opnum,
      @EndUserText.label: 'L/C오픈금액'
      @Semantics.amount.currencyCode : 'Opwrs'
      _Bl.Opamt,
      @EndUserText.label: '개설통화키'
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_CurrencyStdVH', element: 'Currency' }}]
      _Bl.Opwrs,
      @ObjectModel.text.element: ['Ptermt']
      @EndUserText.label: '결제조건'
      _Bl.Pterm,
      @EndUserText.label: '결제조건명'
      _Bl.Ptermt,
      @EndUserText.label: '결제조건일수'
      _Bl.Zbd1t,
      @EndUserText.label: '결제예정일'
      _Bl.Pedat,
      @EndUserText.label: '결제일'
      _Bl.Pdate,
      @EndUserText.label: '오픈예정일'
      _Bl.Oedat,
      @ObjectModel.text.element: ['Oplift']
      @EndUserText.label: '오픈처'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_OPLIF', element: 'Cdno' }}]
      _Bl.Oplif,
      @EndUserText.label: '오픈처명'
      _Bl.Oplift,
      @EndUserText.label: 'Sdate'
      _Bl.Sdate,
      @EndUserText.label: 'Edate'
      _Bl.Edate,
      @ObjectModel.text.element: ['Colift']
      @EndUserText.label: '실계약처'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_COLIF', element: 'Cdno' }}]
      _Bl.Colif,
      @EndUserText.label: '실계약처명'
      _Bl.Colift,
      @ObjectModel.text.element: ['Filift']
      @EndUserText.label: '파이낸스'
      _Bl.Filif,
      @EndUserText.label: '파이낸스명'
      _Bl.Filift,
      @EndUserText.label: '계약번호1'
      _Bl.Cont1,
      @EndUserText.label: '계약번호2'
      _Bl.Cont2,
      @EndUserText.label: '접수일'
      _Bl.Acdat,
      @EndUserText.label: 'BOOKING No.'
      _Bl.Bokno,
      @ObjectModel.text.element: ['Conrtt']
      @EndUserText.label: '계약유형'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_CONRT', element: 'Cdno' }}]
      _Bl.Conrt,
      @EndUserText.label: '계약유형명'
      _Bl.Conrtt,
      @ObjectModel.filter.enabled: false
      @EndUserText.label: 'Remark'
      _Bl.Remak,
      @EndUserText.label: '현지통화키'
      cast('KRW' as abap.cuky(5))                                 as Waersk




}
where
  _Bl.Loekz <> 'X'

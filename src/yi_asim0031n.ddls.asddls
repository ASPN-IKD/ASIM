 @AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입B/L 생성가능 정보 인터페이스 뷰'
define root view entity YI_ASIM0031N
  as select from YI_ASIM0020N as _Asim0020n  
  association [1..1] to YI_ASIM0010N as _Asim0010n on  _Asim0010n.Uuid = _Asim0020n.ParentUUID                                                         
{
       @ObjectModel.filter.enabled: false
  key  _Asim0020n.Uuid           as Uuid,

       @ObjectModel.filter.enabled: false
       _Asim0010n.Uuid           as Uuidi,

       @EndUserText.label: '계약연도'
       _Asim0010n.Reqyr          as Reqyr,
       
       @EndUserText.label: '접수일'
       _Asim0010n.Reqdt          as Reqdt,

       @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_REQNO', element: 'Reqno' }}]
       @EndUserText.label: '계약내부번호'
       _Asim0010n.Reqno          as Reqno,

       @EndUserText.label: '계약품목'
       _Asim0020n.Itmno          as Itmno,

       @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_REQMU', element: 'Reqmu' }}]
       @EndUserText.label: '관리번호'
       _Asim0010n.Reqmu          as Reqmu,

       @EndUserText.label: '구매문서번호'
       _Asim0020n.Ebeln          as Ebeln,

       @EndUserText.label: '구매문서품목번호'
       _Asim0020n.Ebelp          as Ebelp,

       @ObjectModel.text.element: ['Bukrst']
       @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_BUKRS', element: 'Bukrs' }}]
       @EndUserText.label: '회사코드'
       _Asim0010n.Bukrs          as Bukrs,

       @EndUserText.label: '회사코드명'
       _Asim0010n.Bukrst         as Bukrst,

       @ObjectModel.text.element: ['Ekorgt']
       @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_EKORG', element: 'Ekorg' }}]
       @EndUserText.label: '구매조직'
       _Asim0010n.Ekorg          as Ekorg,

       @EndUserText.label: '구매조직명'
       _Asim0010n.Ekorgt         as Ekorgt,

       @ObjectModel.text.element: ['Ekgrpt']
       @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_EKGRP', element: 'Ekgrp' }}]
       @EndUserText.label: '구매그룹'
       _Asim0010n.Ekgrp          as Ekgrp,

       @EndUserText.label: '구매그룹명'
       _Asim0010n.Ekgrpt         as Ekgrpt,

       @ObjectModel.text.element: ['Lifnrt']
       @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_LIFNR', element: 'Lifnr' }}]
       @EndUserText.label: '공급업체'
       _Asim0010n.Lifnr          as Lifnr,

       @EndUserText.label: '공급업체명'
       _Asim0010n.Lifnrt         as Lifnrt,

       @ObjectModel.text.element: ['Lifret']
       @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_LIFRE', element: 'Cdno' }}]
       @EndUserText.label: '공급처'
       _Asim0010n.Lifre          as Lifre,

       @EndUserText.label: '공급처명'
       _Asim0010n.Lifret         as Lifret,

       @ObjectModel.text.element: ['Inco1t']
       @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_INCO1', element: 'inco1' }}]
       @EndUserText.label: '인도조건'
       _Asim0010n.Inco1          as Inco1,

       @EndUserText.label: '인도조건명'
       _Asim0010n.Inco1t         as Inco1t,

       @EndUserText.label: '인도처'
       _Asim0010n.Inco2          as Inco2,

       @ObjectModel.text.element: ['Ztermt']
       @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZTERM', element: 'Cdno' }}]
       @EndUserText.label: '지급조건'
       _Asim0010n.Zterm          as Zterm,

       @EndUserText.label: '지급조건명'
       _Asim0010n.Ztermt         as Ztermt,

       @ObjectModel.text.element: ['Zcdno1t']
       @EndUserText.label: '도착지'
       @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO1', element: 'Cdno' }}]
       _Asim0010n.Zcdno1         as Zcdno1,

       @EndUserText.label: '도착지명'
       _Asim0010n.Zcdno1t        as Zcdno1t,

       @ObjectModel.text.element: ['Zcdno2t']
       @EndUserText.label: '운송수단'
       @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO2', element: 'Cdno' }}]
       _Asim0010n.Zcdno2         as Zcdno2,

       @EndUserText.label: '운송수단명'
       _Asim0010n.Zcdno2t        as Zcdno2t,

       @ObjectModel.text.element: ['Zcdno3t']
       @EndUserText.label: '선적지'
       @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO3', element: 'Cdno' }}]
       _Asim0010n.Zcdno3         as Zcdno3,

       @EndUserText.label: '선적지명'
       _Asim0010n.Zcdno3t        as Zcdno3t,

       @ObjectModel.text.element: ['Zcdno4t']
       @EndUserText.label: '운송형태'
       @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO4', element: 'Cdno' }}]
       _Asim0010n.Zcdno4         as Zcdno4,

       @EndUserText.label: '운송형태명'
       _Asim0010n.Zcdno4t        as Zcdno4t,

       @EndUserText.label: '통화 키'
       @Consumption.valueHelpDefinition: [
       {entity: {name: 'I_CurrencyStdVH', element: 'Currency' }}
       ]
       _Asim0010n.Waers          as Waers,

       @EndUserText.label: '총금액'
       @Semantics.amount.currencyCode : 'Waers'
       _Asim0010n.Netwr          as Netwr,

       @EndUserText.label: 'L/C오픈일'
       _Asim0010n.Opdat          as Opdat,

       @ObjectModel.text.element: ['Opbnkt']
       @EndUserText.label: '개설은행'
       @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_OPBNK', element: 'Cdno' }}]
       _Asim0010n.Opbnk          as Opbnk,

       @EndUserText.label: '개설은행명'
       _Asim0010n.Opbnkt         as Opbnkt,

       @EndUserText.label: 'L/C번호'
       _Asim0010n.Opnum          as Opnum,

       @EndUserText.label: 'L/C오픈금액'
       @Semantics.amount.currencyCode : 'Opwrs'
       _Asim0010n.Opamt          as Opamt,

       @EndUserText.label: '통화 키'
       @Consumption.valueHelpDefinition: [{entity: {name: 'I_CurrencyStdVH', element: 'Currency' }}]
       _Asim0010n.Opwrs          as Opwrs,

       @ObjectModel.text.element: ['Ptermt']
       @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_PTERM', element: 'Cdno' }}]
       @EndUserText.label: '결제조건'
       _Asim0010n.Pterm          as Pterm,

       @EndUserText.label: '결제조건명'
       _Asim0010n.Ptermt         as Ptermt,

       @EndUserText.label: '결제조건일수'
       _Asim0010n.Zbd1t          as Zbd1t,

       @EndUserText.label: '결제예정일'
       _Asim0010n.Pedat          as Pedat,

       @EndUserText.label: '결제일'
       _Asim0010n.Pdate          as Pdate,

       @EndUserText.label: '오픈예정일'
       _Asim0010n.Oedat          as Oedat,

       @ObjectModel.text.element: ['Oplift']
       @EndUserText.label: '오픈처'
       @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_OPLIF', element: 'Cdno' }}]
       _Asim0010n.Oplif          as Oplif,

       @EndUserText.label: '오픈처명'
       _Asim0010n.Oplift         as Oplift,

       @EndUserText.label: 'Sdate'
       _Asim0010n.Sdate          as Sdate,

       @EndUserText.label: 'Edate'
       _Asim0010n.Edate          as Edate,

       @ObjectModel.text.element: ['Colift']
       @EndUserText.label: '실계약처'
       @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_COLIF', element: 'Cdno' }}]
       _Asim0010n.Colif          as Colif,

       @EndUserText.label: '실계약처명'
       _Asim0010n.Colift         as Colift,

       @ObjectModel.text.element: ['Filift']
       @EndUserText.label: '파이낸스'
       _Asim0010n.Filif          as Filif,

       @EndUserText.label: '파이낸스명'
       _Asim0010n.Filift         as Filift,

       @EndUserText.label: '계약번호1'
       @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_CONT1', element: 'Cont1' }}]
       _Asim0010n.Cont1          as Cont1,

       @EndUserText.label: '계약번호2'
       _Asim0010n.Cont2          as Cont2,

       @EndUserText.label: '접수일'
       _Asim0010n.Acdat          as Acdat,

       @EndUserText.label: 'BOOKING No.'
       _Asim0010n.Bokno          as Bokno,

       @ObjectModel.text.element: ['Conrtt']
       @EndUserText.label: '계약유형'
       @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_CONRT', element: 'Cdno' }}]
       _Asim0010n.Conrt          as Conrt,

       @EndUserText.label: '계약유형명'
       _Asim0010n.Conrt          as Conrtt,

       @EndUserText.label: '양도일(수입대행)'
       _Asim0010n.Trdat          as Trdat,

       @EndUserText.label: 'B/L번호(수입대행)'
       _Asim0010n.Trbln          as Trbln,

       @EndUserText.label: '개설환율'
       _Asim0010n.Rqrsf          as Rqrsf,

       @EndUserText.label: '부보환율'
       _Asim0010n.Bbrsf          as Bbrsf,

       @EndUserText.label: '부보대상금액'
       @Semantics.amount.currencyCode : 'Bbwrs'
       _Asim0010n.Bbamt          as Bbamt,

       @ObjectModel.filter.enabled: false
       @EndUserText.label: '통화 키'
       @Consumption.valueHelpDefinition: [{entity: {name: 'I_CurrencyStdVH', element: 'Currency' }}]
       _Asim0010n.Bbwrs          as Bbwrs,

       @EndUserText.label: '부보일'
       _Asim0010n.Bbdat          as Bbdat,

       @ObjectModel.text.element: ['Bbgbt']
       @EndUserText.label: '보험조건'
       @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_BBGB', element: 'Cdno' }}]
       _Asim0010n.Bbgb           as Bbgb,

       @EndUserText.label: '보험조건명'
       _Asim0010n.Bbgbt          as Bbgbt,

       @EndUserText.label: '계약완료'
       _Asim0010n.Rqche          as Rqche,

       @EndUserText.label: '인수일'
       _Asim0010n.Isdat          as Isdat,

       @EndUserText.label: '주차(오퍼)'
       _Asim0010n.Rqweek         as Rqweek,

       @EndUserText.label: '보험증권번호'
       _Asim0010n.Bbno           as Bbno,

       @ObjectModel.text.element: ['Bblift']
       @EndUserText.label: '보험회사'
       @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_BBLIF', element: 'Cdno' }}]
       _Asim0010n.Bblif          as Bblif,

       @EndUserText.label: '보험회사명'
       _Asim0010n.Bblift         as Bblift,

       @ObjectModel.filter.enabled: false
       @EndUserText.label: '부보 Basic Rate'
       _Asim0010n.Bbrate         as Bbrate,

       @ObjectModel.filter.enabled: false
       @EndUserText.label: 'Remark'
       _Asim0010n.Remak          as Remak,

       @ObjectModel.text.element: ['Werkst']
       @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_WERKS', element: 'Werks' }}]
       @EndUserText.label: '플랜트'
       _Asim0020n.Werks          as Werks,

       @EndUserText.label: '플랜트명'
       _Asim0020n.Werkst         as Werkst,

       @ObjectModel.text.element: ['Maktx']
       @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_MATNR', element: 'Matnr' }}]
       @EndUserText.label: '자재번호'
       _Asim0020n.Matnr          as Matnr,

       @EndUserText.label: '자재명'
       _Asim0020n.Maktx          as Maktx,

       @ObjectModel.text.element: ['Lgortt']
       @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_LGORT', element: 'Lgort' }}]
       @EndUserText.label: '저장위치'
       _Asim0020n.Lgort          as Lgort,

       @EndUserText.label: '저장위치명'
       _Asim0020n.Lgortt         as Lgortt,

       @EndUserText.label: '계약수량'
       @Semantics.quantity.unitOfMeasure: 'Reqms'
       _Asim0020n.Reqmg          as Reqmg,
       
       @EndUserText.label: '잔여수량'
       @Semantics.quantity.unitOfMeasure: 'Reqms'
       //분할 생성 시, 
       case when _Asim0020n.Modmg > 0 then _Asim0020n.Modmg
       else _Asim0020n.Reqmg end as Divmg,

       @EndUserText.label: '계약단위'
       _Asim0020n.Reqms          as Reqms,

       @EndUserText.label: '계약단가'
       @Semantics.amount.currencyCode: 'Waers'
       _Asim0020n.Reqnr          as Reqnr,

       @EndUserText.label: '계약금액'
       @Semantics.amount.currencyCode: 'Waers'
       case when _Asim0020n.Modpr = 0 then 0
       else case when _Asim0020n.Modmg > 0 then
            cast( _Asim0020n.Modmg * ( _Asim0020n.Modpr / _Asim0020n.Peinh ) as abap.dec(20,2))
            else cast( _Asim0020n.Reqmg * ( _Asim0020n.Modpr / _Asim0020n.Peinh ) as abap.dec(20,2))
            end
       end                       as Reqwr,

       @EndUserText.label: '가격단위'
       _Asim0020n.Peinh          as Peinh,

       @EndUserText.label: '판매관리문서번호'
       _Asim0020n.Vbeln          as Vbeln,

       @EndUserText.label: '임시오더번호'
       _Asim0020n.Zebeln         as Zebeln,

       @EndUserText.label: '임시오더품목'
       _Asim0020n.Zebelp         as Zebelp,

       @EndUserText.label: '품목비고'
       _Asim0020n.Remak          as Remakp,

       @EndUserText.label: '계정지정범주'
       _Asim0020n.Knttp          as Knttp,

       @EndUserText.label: 'G/L계정'
       _Asim0020n.Sakto          as Sakto,

       @EndUserText.label: '자산번호'
       _Asim0020n.Anln1          as Anln1,

       @EndUserText.label: '코스트센터'
       _Asim0020n.Kostl          as Kostl,

       @EndUserText.label: '관세율'
       _Asim0020n.Zdc1_p         as Zdc1_p,

       @EndUserText.label: '부대비율'
       _Asim0020n.Zdc2_p         as Zdc2_p
}
where
  _Asim0010n.Loekz = ''
  and _Asim0020n.Chk <> 'X'
  

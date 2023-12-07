@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '요청정보제공 도움말 뷰'
@Metadata.ignorePropagatedAnnotations: true


define view entity ZASIMV_REQMU
  as select from YI_ASIM0010N

  association [1..1] to ZASIMV_LIFNR                  as _lifnr                       on  $projection.Lifnr = _lifnr.Lifnr
  association [0..1] to I_IncotermsClassificationText as _IncotermsClassificationText on  $projection.Inco1                     = _IncotermsClassificationText.IncotermsClassification
                                                                                      and _IncotermsClassificationText.Language = '3'
  association [0..1] to YI_ASIM0001N                  as _zterm                       on  $projection.Zterm =    _zterm.Zcdno
                                                                                      and _zterm.Zcode      like '%ZTERM'
                                                                                      and _zterm.Zcdno      <>   '00'
  association [0..1] to YI_ASIM0001N                  as _opbnk                       on  $projection.Opbnk =    _opbnk.Zcdno
                                                                                      and _opbnk.Zcode      like '%OPBNK'
                                                                                      and _opbnk.Zcdno      <>   '00'
  association [0..1] to YI_ASIM0001N                  as _Pterm                       on  $projection.Pterm =    _Pterm.Zcdno
                                                                                      and _Pterm.Zcode      like '%PTERM'
                                                                                      and _Pterm.Zcdno      <>   '00'
  association [0..1] to YI_ASIM0001N                  as _lifre                       on  $projection.Lifre =    _lifre.Zcdno
                                                                                      and _lifre.Zcode      like '%LIFRE'
                                                                                      and _lifre.Zcdno      <>   '00'
{
@UI.hidden: true
 key Uuid,

  @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_REQMU', element: 'reqmu' }}]
  @EndUserText.label: '관리번호'
  Reqmu,

  @EndUserText.label: '계약연도'
  Reqyr,
  
  @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_REQNO', element: 'reqno' }}]
  @EndUserText.label: '계약내부번호'
  Reqno, 
 
  @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_BUKRS', element: 'Bukrs'} }]
  @EndUserText.label: '회사코드'
  Bukrs,
  
  @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_EKORG', element: 'Ekorg'} }]
  @EndUserText.label: '구매조직'
  Ekorg,
  
  @ObjectModel.text.element: ['Lifnrt']
  @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_LIFNR', element: 'Lifnr' }}]
  @EndUserText.label: '공급업체'
  Lifnr,
  
  @EndUserText.label: '공급업체명'
  _lifnr.Lifnrt                                            as Lifnrt,
  
  @EndUserText.label: '계약번호1'
  Cont1,
  
  @EndUserText.label: '계약번호2'
  Cont2,
  
  @EndUserText.label: '요청일'
  Reqdt,
  
  @ObjectModel.text.element: ['Lifret']
  @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_LIFRE', element: 'Cdno' }}]
  @EndUserText.label: '공급처'
  Lifre,
  
  @EndUserText.label: '공급처명'
  _lifre.Ztext                                             as Lifret,
  
  @ObjectModel.text.element: ['Inco1t']
  @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_INCO1', element: 'inco1' }}]
  @EndUserText.label: '인도조건'
  Inco1,
  
  @EndUserText.label: '인도조건명'
  _IncotermsClassificationText.IncotermsClassificationName as Inco1t,
  
  @EndUserText.label: '인도처'
  Inco2,
  
  @ObjectModel.text.element: ['Ztermt']
  @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZTERM', element: 'Cdno' }}]
  @EndUserText.label: '지급조건'
  Zterm,
  
  @EndUserText.label: '지급조건명'
  _zterm.Ztext                                             as Ztermt,
  
  @EndUserText.label: '계약총금액'
  @Semantics.amount.currencyCode: 'WAERS'
  Netwr,
  
  @EndUserText.label: '통화'
  Waers,
  
  @EndUserText.label: 'L/C오픈일'
  Opdat,
  
  @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_PTERM', element: 'Cdno' }}]
  @ObjectModel.text.element: ['Ptermt']
  @EndUserText.label: '결제조건'
  Pterm,
  
  @EndUserText.label: '결제조건명'
  _Pterm.Ztext                                             as Ptermt,
  
  @EndUserText.label: 'L/C번호'
  Opnum,
  
  @ObjectModel.text.element: ['Opbnkt']
  @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_OPBNK', element: 'Cdno' }}]  
  @EndUserText.label: '개설은행'
  Opbnk,
  
  @EndUserText.label: '개설은행명'
  _opbnk.Ztext                                             as Opbnkt,
  
  @EndUserText.label: 'L/C오픈금액'
  @Semantics.amount.currencyCode: 'OPWRS'
  Opamt,
  
  @EndUserText.label: '개설통화'
  Opwrs,
  
  @EndUserText.label: '부보일'
  Bbdat,
  
  @EndUserText.label: '보험증권번호'
  Bbno
  //REMAK
}
where
  Loekz like ''

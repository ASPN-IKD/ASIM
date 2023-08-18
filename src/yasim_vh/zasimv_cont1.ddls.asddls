@EndUserText.label: '계약문서1 (Cont1) 도움말 뷰'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity  ZASIMV_CONT1
    as select from zasimt0010n_c
    
  association [0..1] to ZASIMV_ZTERM          as _Term     on  $projection.Zterm = _Term.Cdno
  association [0..1] to ZASIMV_LIFRE          as _Lifre    on  $projection.Lifre = _Lifre.Cdno
  association [0..1] to ZASIMV_COLIF          as _Colif    on  $projection.Colif = _Colif.Cdno
  association [0..1] to ZASIMV_FILIF          as _Filif    on  $projection.Filif = _Filif.Cdno
  association [0..1] to ZASIMV_ZCDNO1         as _Zcdno1   on  $projection.Zcdno1 = _Zcdno1.Cdno
  association [0..1] to ZASIMV_ZCDNO1         as _Zcdno2   on  $projection.Zcdno2 = _Zcdno2.Cdno
  association [0..1] to ZASIMV_ZCDNO3         as _Zcdno3   on  $projection.Zcdno3 = _Zcdno3.Cdno
  association [0..1] to ZASIMV_ZCDNO4         as _Zcdno4   on  $projection.Zcdno4 = _Zcdno4.Cdno
  association [0..1] to ZASIMV_PTERM          as _Pterm    on  $projection.Pterm = _Pterm.Cdno
  association [0..1] to ZASIMV_OPBNK          as _Opbnk    on  $projection.Opbnk = _Opbnk.Cdno
  association [0..1] to ZASIMV_OPLIF          as _Oplif    on  $projection.Oplif = _Oplif.Cdno
  association [0..1] to ZASIMV_BBGB           as _Bbgb     on  $projection.Bbgb = _Bbgb.Cdno
  association [0..1] to ZASIMV_BBLIF          as _Bblif    on  $projection.Bblif = _Bblif.Cdno

  //Interface Association
  association [1..1] to zce_asim_vh_supplier3 as _Supplier on  $projection.Lifnr = _Supplier.Supplier
                                                           and $projection.Ekorg = _Supplier.PurchasingOrganization
  association [1..1] to ZCE_ASIM_VH_COMPANY   as _Company  on  $projection.Bukrs = _Company.CompanyCode
    
{
      @UI.hidden: true
  key uuid  as Uuid,
      @EndUserText.label: '계약번호1'
  key cont1 as Cont1,
      @EndUserText.label: '계약연도'
      reqyr                           as Reqyr,
      @EndUserText.label: '계약내부번호'
      reqno                           as Reqno,
      @EndUserText.label: '관리번호'
      reqmu                           as Reqmu,
      @EndUserText.label: '요청일'
      reqdt                           as Reqdt,
      @EndUserText.label: '회사 코드'
      @ObjectModel.foreignKey.association: '_Company'
      bukrs                           as Bukrs,
      @EndUserText.label: '구매 조직'
      ekorg                           as Ekorg,
      @EndUserText.label: '구매 그룹'
      ekgrp                           as Ekgrp,
      @EndUserText.label: '공급업체'
      @ObjectModel.foreignKey.association: '_Supplier'
      lifnr                           as Lifnr,
      @EndUserText.label: '삭제지시자'
      loekz                           as Loekz,
      @EndUserText.label: '공급처'
      @ObjectModel.foreignKey.association: '_Lifre'
      lifre                           as Lifre,
      @EndUserText.label: '인도조건'
      inco1                           as Inco1,
      @EndUserText.label: '인도처'
      inco2                           as Inco2,
      @EndUserText.label: '지급조건'
      @ObjectModel.foreignKey.association: '_Term'
      zterm                           as Zterm,
      @EndUserText.label: '도착지'
      @ObjectModel.foreignKey.association: '_Zcdno1'
      zcdno1                          as Zcdno1,
      @EndUserText.label: '운송수단'
      @ObjectModel.foreignKey.association: '_Zcdno2'
      zcdno2                          as Zcdno2,
      @EndUserText.label: '선적지'
      @ObjectModel.foreignKey.association: '_Zcdno3'
      zcdno3                          as Zcdno3,
      @EndUserText.label: '운송형태'
      @ObjectModel.foreignKey.association: '_Zcdno4'
      zcdno4                          as Zcdno4,
      @EndUserText.label: '총금액'
      netwr                           as Netwr,
      @EndUserText.label: '통화 키'
      waers                           as Waers,
      @EndUserText.label: 'L/C오픈일'
      opdat                           as Opdat,
      @EndUserText.label: '개설은행'
      @ObjectModel.foreignKey.association: '_Opbnk'
      opbnk                           as Opbnk,
      @EndUserText.label: 'L/C번호'
      opnum                           as Opnum,
      @EndUserText.label: 'L/C오픈금액'
      @Semantics.amount.currencyCode : 'Opwrs'
      opamt                           as Opamt,
      @EndUserText.label: '통화 키'
      opwrs                           as Opwrs,
      @EndUserText.label: '결제조건'
      @ObjectModel.foreignKey.association: '_Pterm'
      pterm                           as Pterm,
      @EndUserText.label: '결제조건일수'
      zbd1t                           as Zbd1t,
      @EndUserText.label: '결제예정일'
      pedat                           as Pedat,
      @EndUserText.label: '결제일'
      pdate                           as Pdate,
      @EndUserText.label: '오픈예정일'
      oedat                           as Oedat,
      @EndUserText.label: '오픈처'
      @ObjectModel.foreignKey.association: '_Oplif'
      oplif                           as Oplif,
      @EndUserText.label: 'Sdate'
      sdate                           as Sdate,
      @EndUserText.label: 'Edate'
      edate                           as Edate,
      @EndUserText.label: '실계약처'
      @ObjectModel.foreignKey.association: '_Colif'
      colif                           as Colif,
      @EndUserText.label: '파이낸스'
      @ObjectModel.foreignKey.association: '_Filif'
      filif                           as Filif,
      @EndUserText.label: '계약번호2'
      cont2                           as Cont2,
      @EndUserText.label: '접수일'
      acdat                           as Acdat,
      @EndUserText.label: 'BOOKING No.'
      bokno                           as Bokno,
      @EndUserText.label: '계약유형'
      conrt                           as Conrt,
      @EndUserText.label: '양도일(수입대행)'
      trdat                           as Trdat,
      @EndUserText.label: 'B/L번호(수입대행)'
      trbln                           as Trbln,
      @EndUserText.label: '개설환율'
      rqrsf                           as Rqrsf,
      @EndUserText.label: '부보환율'
      bbrsf                           as Bbrsf,
      @EndUserText.label: '부보대상금액'
      bbamt                           as Bbamt,
      @EndUserText.label: '통화 키'
      bbwrs                           as Bbwrs,
      @EndUserText.label: '부보일'
      bbdat                           as Bbdat,
      @EndUserText.label: '보험조건'
      @ObjectModel.foreignKey.association: '_Bbgb'
      bbgb                            as Bbgb,
      @EndUserText.label: '계약완료'
      rqche                           as Rqche,
      @EndUserText.label: '인수일'
      isdat                           as Isdat,
      @EndUserText.label: '주차(오퍼)'
      rqweek                          as Rqweek,
      @EndUserText.label: '보험증권번호'
      bbno                            as Bbno,
      @EndUserText.label: '보험회사'
      @ObjectModel.foreignKey.association: '_Bblif'
      bblif                           as Bblif,
      @EndUserText.label: '부보 Basic Rate'
      bbrate                          as Bbrate,
      
      
      _Term,
      _Lifre,
      _Colif,
      _Filif,
      _Zcdno1,
      _Zcdno2,
      _Zcdno3,
      _Zcdno4,
      _Pterm,
      _Opbnk,
      _Oplif,
      _Bbgb,
      _Bblif,
      _Supplier,
      _Company
}

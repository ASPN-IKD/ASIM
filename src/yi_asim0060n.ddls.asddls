@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입 I/V 품목 인터페이스 뷰'
define root view entity YI_ASIM0060N
  as select from zasimt0060n

  association [1..1] to I_ProductText                  as _productText             on  $projection.Matnr     = _productText.Product
                                                                                   and _productText.Language = '3'
  association [1..1] to I_Plant                        as _plant                   on  $projection.Werks = _plant.Plant
  association [1..1] to I_CurrencyStdVH                as _Currency                on  $projection.Waers = _Currency.Currency
{
      @ObjectModel.filter.enabled: false
  key uuid                  as Uuid,

      @ObjectModel.filter.enabled: false
      parentuuid            as ParentUUID,

      @EndUserText.label: '송장 문서 번호'
      belnr                 as Belnr,
      
       @EndUserText.label: '회계 전표 번호'
      belnr_fi              as BelnrFi,

      @EndUserText.label: '회계연도'
      gjahr                 as Gjahr,

      @EndUserText.label: '송장 문서 항목'
      buzei                 as Buzei,

      @EndUserText.label: '계약내부번호'
      reqno                 as Reqno,

      @EndUserText.label: '계약연도'
      reqyr                 as Reqyr,

      @EndUserText.label: '계약품목'
      itmno                 as Itmno,

      @EndUserText.label: 'B/L연도'
      bliyr                 as Bliyr,

      @EndUserText.label: 'B/L내부번호'
      blino                 as Blino,

      @EndUserText.label: 'B/L품목'
      blinp                 as Blinp,

      @EndUserText.label: '구매 문서 번호'
      ebeln                 as Ebeln,

      @EndUserText.label: '구매 문서 품목 번호'
      ebelp                 as Ebelp,

      @EndUserText.label: '플랜트'
      werks                 as Werks,

           @EndUserText.label: '플랜트명'
           _plant.PlantName                             as Werkst,

      @EndUserText.label: '자재 번호'
      matnr                 as Matnr,

           @EndUserText.label: '자재명'
           _productText.ProductName                     as Maktx,
      
      @Semantics.quantity.unitOfMeasure: 'Meins'
      @EndUserText.label: 'I/V 수량'
      ivmng                 as Ivmng,

      @EndUserText.label: '기본 단위'
      meins                 as Meins,

      @Semantics.quantity.unitOfMeasure: 'Meins1'
      @EndUserText.label: 'I/V 대체수량'
      ivmng1                as Ivmng1,

      @EndUserText.label: '대체 단위'
      meins1                as Meins1,
      
      @Semantics.amount.currencyCode : 'Waers'
      @EndUserText.label: 'I/V 금액'
      ivwra                 as Ivwra,

      @Semantics.amount.currencyCode : 'Waers'
      @EndUserText.label: '세액'
      ivwmw                 as Ivwmw,

      @Consumption.valueHelpDefinition: [{ entity : { element: 'Currency', name: 'I_CurrencyStdVH' } } ]
      @EndUserText.label: '통화 키'
      waers                 as Waers,


      @ObjectModel.filter.enabled: false
      @EndUserText.label: '삭제 지시자'
      loekz                 as Loekz,
      
      cast('' as abap.char(3)) as ItemIndex,
      
      @Semantics.amount.currencyCode : 'Waers'
      cast(0 as abap.curr(17,2)) as UnitPrice

}

where
  loekz = ''

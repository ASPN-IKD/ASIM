@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '공급처 도움말 뷰'
define view entity zasimv_matnr
  as select from zasimt_if_matnr
{

      @EndUserText.label        : '자재 번호'
  key product                as Product,
      @EndUserText.label: '자재 내역'
      maktg                  as Maktg,
      @EndUserText.label: '언어 키'
      spras                  as Spras,
      @EndUserText.label: '단위'
      alternativeunit        as Alternativeunit,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      @UI.hidden: true
      quantitynumerator      as Quantitynumerator,
      @Semantics.quantity.unitOfMeasure: 'AlternativeUnit'
      @UI.hidden: true
      quantitydenominator    as Quantitydenominator,
      @UI.hidden: true
      baseunit               as Baseunit,
      @EndUserText.label: '대체단위'
//      cast( replace( coalesce( subalternativeunit, '' ), 'BOT', 'BT') as meins) as Subalternativeunit,
      cast( coalesce( subalternativeunit, '' ) as meins) as subalternativeunit,
      @Semantics.quantity.unitOfMeasure: 'SubBaseUnit'
      @UI.hidden: true
      cast( coalesce( subquantitynumerator, 0.0 ) as abap.dec(5,0)) as Subquantitynumerator,
//      subquantitynumerator   as Subquantitynumerator,
      @Semantics.quantity.unitOfMeasure: 'SubBaseUnit'
      @UI.hidden: true
      cast( coalesce( subquantitydenominator, 0.0 ) as abap.dec(5,0)) as Subquantitydenominator,
//      subquantitydenominator as Subquantitydenominator,
      @UI.hidden: true
      cast( coalesce( subbaseunit, '' ) as meins) as Subbaseunit
//      subbaseunit            as Subbaseunit
}

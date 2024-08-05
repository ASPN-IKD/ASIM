@AccessControl.authorizationCheck: #NOT_REQUIRED
@AbapCatalog.viewEnhancementCategory: [#NONE]
@EndUserText.label: '수입마감 미착정보 뷰'
@Metadata.ignorePropagatedAnnotations: true
define view entity YI_ASIM0151N   with parameters
    p_budat : abap.dats
  as select from I_JournalEntryItem as _Fidoc
{
  key _Fidoc.PurchasingDocument     as Ebeln,
  key _Fidoc.TransactionTypeDetermination as Trkey,
  sum( cast(_Fidoc.AmountInCompanyCodeCurrency as abap.dec(20,2)) )             as Grir

}
where
      _Fidoc.PostingDate        <= $parameters.p_budat
  and _Fidoc.SourceLedger       =  '0L'
  and _Fidoc.PurchasingDocument <> ''
group by
  _Fidoc.PurchasingDocument,
  _Fidoc.TransactionTypeDetermination

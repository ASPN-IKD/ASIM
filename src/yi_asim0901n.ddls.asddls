@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '재고자산 및 미착정보 취합'
@Metadata.ignorePropagatedAnnotations: true

define view entity YI_ASIM0901N
  with parameters
    p_budat : abap.dats
  as select from I_JournalEntryItem as _Fidoc
{
  key _Fidoc.PurchasingDocument     as Ebeln,
  key _Fidoc.PurchasingDocumentItem as Ebelp,

      sum( case when _Fidoc.TransactionTypeDetermination = 'BSX' or
                _Fidoc.TransactionTypeDetermination = 'PRD' or
                _Fidoc.TransactionTypeDetermination = 'UMB' or
                _Fidoc.TransactionTypeDetermination = 'KDM'
           then cast(_Fidoc.AmountInCompanyCodeCurrency as abap.dec(20,2)) * 100
           else 0 end )             as Dmbtr,

      sum( case when _Fidoc.TransactionTypeDetermination = 'WRX' or
                _Fidoc.TransactionTypeDetermination = 'PK1' or
                _Fidoc.TransactionTypeDetermination = 'Pk2'
           then cast(_Fidoc.AmountInCompanyCodeCurrency as abap.dec(20,2)) * 100
           else 0 end )             as Grir,

      sum( case when _Fidoc.AccountingDocumentType = 'WE' and _Fidoc.TransactionTypeDetermination = 'BSX'
           then cast(_Fidoc.Quantity as abap.dec(20,3))
           else 0 end )             as Menge

}
where
      _Fidoc.PostingDate        <= $parameters.p_budat
  and _Fidoc.SourceLedger       =  '0L'
  and _Fidoc.PurchasingDocument <> ''
group by
  _Fidoc.PurchasingDocument,
  _Fidoc.PurchasingDocumentItem

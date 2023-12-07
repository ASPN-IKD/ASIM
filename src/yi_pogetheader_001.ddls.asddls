@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '구매오더 GET - 헤더'
define root view entity YI_POGETHEADER_001
  as select from zpogettheader001 as _Header
  composition [1..*] of YI_POGETITEM_001 as _Item 
{
  key uuid                    as Uuid,
      purchaseorder           as Purchaseorder,
      companycode             as Companycode,
      purchaseordertype       as Purchaseordertype,
      createdbyuser           as Createdbyuser,
      creationdate            as Creationdate,
      supplier                as Supplier,
      paymentterms            as Paymentterms,
      purchasingorganization  as Purchasingorganization,
      purchasinggroup         as Purchasinggroup,
      documentcurrency        as Documentcurrency,
      incotermsclassification as Incotermsclassification,
      incotermslocation1      as Incotermslocation1,
      request_user as RequestUser,
      _Item
}

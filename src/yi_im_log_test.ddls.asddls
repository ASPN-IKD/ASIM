@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.ignorePropagatedAnnotations: true
@EndUserText.label: '수입이력테스트'
define view entity YI_IM_LOG_TEST as 

  select from I_SalesDocumentItem

 
  {
  key SalesDocument,
  key SalesDocumentItem,
  SalesDocumentItemUUID,
  SDDocumentCategory,
  SalesDocumentItemCategory,
  SalesDocumentItemType,
  IsReturnsItem,
  CompletionRule,
  CreatedByUser,
  CreationDate,
  CreationTime,
  LastChangeDate,
  Division,
  Material,
  Product,
  OriginallyRequestedMaterial,
  MaterialByCustomer,
  InternationalArticleNumber,
  Batch,
  ProductHierarchyNode,
  ProductCatalog,
  MaterialSubstitutionReason,
  MaterialGroup,
  ProductGroup,
  
  /* Associations */
  _CreatedByUser,
  _Division,
  _ItemCategory,
  _Material,
  _MaterialGroup,
  _MaterialSubstitutionReason,
  _MaterialText,
  _OriginallyRequestedMaterial,
  _OrigMaterialText,
  _Partner,
  _PrecedingDocument,
  _PrecedingProcFlowDocItem,
  _PricingElement
  }

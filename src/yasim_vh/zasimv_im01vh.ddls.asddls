@EndUserText.label: '회사코드 도움말 뷰'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZASIMV_IM01VH
  as select from I_SupplierCompany
  association [1..1] to I_Supplier              as _Supplier              on $projection.Lgort = _Supplier.Supplier
  association [0..1] to I_CompanyCode           as _CompanyCode           on $projection.Bukrs = _CompanyCode.CompanyCode
  association [0..*] to I_SupplierPurchasingOrg as _SupplierPurchasingOrg on $projection.Lgort = _SupplierPurchasingOrg.Supplier


{
      @EndUserText.label: '회사코드'
//      @ObjectModel.text.element: ['Bukrst']
  key I_SupplierCompany.CompanyCode            as Bukrs,
//      @EndUserText.label: '회사코드명'
//      I_SupplierCompany.CompanyCodeName        as Bukrst,

      @ObjectModel.text.element: ['Lgortt']
      @EndUserText.label: '공급업체'
      I_SupplierCompany.Supplier               as Lgort,

      @EndUserText.label: '공급업체명'
      _Supplier.SupplierName as Lgortt,

      @EndUserText.label: '구매조직'
      _SupplierPurchasingOrg.PurchasingOrganization as Ekorg,

      @EndUserText.label: '구매그룹'
      _SupplierPurchasingOrg.PurchasingGroup as Ekgrp,
      
      _SupplierPurchasingOrg,
      _CompanyCode,
      _Supplier
      

}

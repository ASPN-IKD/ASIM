@EndUserText.label: '구매그룹 도움말 뷰'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZASIMV_EKGRP as select from zasimt0001n //I_PurchasingGroup


{
  @ObjectModel.text.element: ['Ekgrpt']
  key zcdno as Ekgrp,    
      ztext as Ekgrpt
}
where
      zcode like '%EKGRP'
  and zcdno <>   '00'

//{
//    @ObjectModel.text.element: ['Ekgrpt']
//    key PurchasingGroup as Ekgrp,
//    PurchasingGroupName as Ekgrpt
//}

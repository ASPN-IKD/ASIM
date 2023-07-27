@EndUserText.label: '구매그룹 도움말 뷰'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZASIMV_EKGRP as select from I_PurchasingGroup
{
    @ObjectModel.text.element: ['Ekgrpt']
    key PurchasingGroup as Ekgrp,
    PurchasingGroupName as Ekgrpt
}

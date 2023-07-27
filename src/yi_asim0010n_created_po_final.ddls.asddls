@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입계약 기생성 정보 인터페이스 뷰(참조용)'
define view entity YI_ASIM0010N_CREATED_PO_FINAL as select from YI_ASIM0010N_CREATED_PO as _item
{
  key _item.Ebeln                       as Ebeln,
  key _item.Ebelp                       as Ebelp,

  case 
  when cast(_item.Menge as abap.dec(17,2)) <= cast(_item.Reqmg as abap.dec(17,2)) then 'X'
  else ''
  end as chk
  
} 

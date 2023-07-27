@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입계약 기생성 정보 인터페이스 뷰(참조용)'
define view entity YI_ASIM0010N_CREATED_PO_FINAL
  as select from YI_ASIM0010N_CREATED_PO as _item
{
  key _item.Ebeln as Ebeln,
  key _item.Ebelp as Ebelp,

      @Semantics.quantity.unitOfMeasure: 'Reqms'
      _item.Reqmg as Reqmg,
      _item.Reqms as Reqms,
      
      //제외여부필드
      case
      when cast(_item.Menge as abap.dec(20,3)) <= cast(_item.Reqmg as abap.dec(20,3)) then 'X'
      else ''
      end         as chk,
      
      //잔량필드
      cast(_item.Menge as abap.dec(20,3)) - cast(_item.Reqmg as abap.dec(20,3)) as Modmg
}

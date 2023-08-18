@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입I/V 기생성 정보 인터페이스 뷰(참조용)'
define view entity YI_ASIM0050N_CREATED_FINAL as select from YI_ASIM0050N_CREATED as _item

{
  key _item.Ivgb as Ivgb,
  key case when _item.Ivgb = 'A' then _item.Reqno 
           else _item.Blino
           end as Blino,
  key case when _item.Ivgb = 'A' then _item.Reqyr 
           else _item.Bliyr
           end as Bliyr,
  key case when _item.Ivgb = 'A' then _item.Itmno 
           else _item.Blinp
           end as Blinp,

      @Semantics.quantity.unitOfMeasure: 'Blmns'
      case when _item.Ivgb = 'A' then _item.Reqmg 
           else _item.Blmng
           end as Blmng,
      
      _item.Blmns as Blmns,

      //제외여부필드
      case
      when _item.Ivgb = 'A'
        then case
             when cast(_item.Reqmg as abap.dec(20,3)) <= cast(_item.Ivmng as abap.dec(20,3)) then 'X'
             else ''
             end
      else
             case
             when cast(_item.Blmng as abap.dec(20,3)) <= cast(_item.Ivmng as abap.dec(20,3)) then 'X'
             else ''
             end
      end         as chk,

      //잔량필드
      case
      when _item.Ivgb = 'A'
        then case
             when cast(_item.Reqmg as abap.dec(20,3)) <= cast(_item.Ivmng as abap.dec(20,3)) then 0
             else cast(_item.Reqmg as abap.dec(20,3)) - cast(_item.Ivmng as abap.dec(20,3))
             end
      else
            case
             when cast(_item.Blmng as abap.dec(20,3)) <= cast(_item.Ivmng as abap.dec(20,3)) then 0
             else cast(_item.Blmng as abap.dec(20,3)) - cast(_item.Ivmng as abap.dec(20,3))
             end
      end         as Modmg
}

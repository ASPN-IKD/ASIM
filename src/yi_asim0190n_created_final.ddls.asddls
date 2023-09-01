@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입통관예정 기생성 정보 인터페이스 뷰(참조용)'
define view entity YI_ASIM0190N_CREATED_FINAL as select from YI_ASIM0190N_CREATED as _Item

  association [0..1] to YI_ASIM0001N as _limit on  _limit.Zcode like '%LIMIT'
                                               and _limit.Zcdno =    'B'
{
  key _Item.Blino as Blino,
  key _Item.Bliyr as Bliyr,
  key _Item.Blinp as Blinp,

@Semantics.quantity.unitOfMeasure: 'Eccmns'
      _Item.Eccmng as Eccmng,
      _Item.Eccmns as Eccmns,

      //제외여부필드
      case
      when _limit.Zvalu1 is null
        then case
             when cast(_item.Blmng as abap.dec(20,3)) <= cast(_item.Eccmng as abap.dec(20,3)) then 'X'
             else ''
             end
      else
             case
             when cast(_item.Blmng as abap.dec(20,3)) * (cast(_limit.Zvalu1 as abap.dec(20,3)) / 100) <= cast(_item.Eccmng as abap.dec(20,3)) then 'X'
             else ''
             end
      end         as chk,

      //잔량필드
      case
      when _limit.Zvalu1 is null
        then case
             when cast(_item.Blmng as abap.dec(20,3)) <= cast(_item.Eccmng as abap.dec(20,3)) then 0
             else cast(_item.Blmng as abap.dec(20,3)) - cast(_item.Eccmng as abap.dec(20,3))
             end
      else
            case
            when cast(_item.Blmng as abap.dec(20,3)) * (cast(_limit.Zvalu1 as abap.dec(20,3)) / 100) <= cast(_item.Eccmng as abap.dec(20,3)) then 0
            else cast(_item.Blmng as abap.dec(20,3)) - cast(_item.Eccmng as abap.dec(20,3))
            end
      end         as Modmg
}

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입입고 기생성 정보 인터페이스 뷰(참조용)'
define view entity YI_ASIM0090N_CREATED_FINAL as select from YI_ASIM0090N_CREATED as _Item

  association [0..1] to YI_ASIM0001N as _limit on  _limit.Zcode like '%LIMIT'
                                               and _limit.Zcdno =    'C'
{
  key _Item.Cclno as Cclno,
  key _Item.Cclyr as Cclyr,
  key _Item.Cclnp as Cclnp,

@Semantics.quantity.unitOfMeasure: 'Cclmns'
      _Item.Cclmng as Cclmng,
      _Item.Cclmns as Cclmns,

      //제외여부필드
      case
      when _limit.Zvalu1 is null
        then case
             when cast(_Item.Cclmng as abap.dec(20,3)) <= cast(_Item.Grmng as abap.dec(20,3)) then 'X'
             else ''
             end
      else
             case
             when cast(_Item.Cclmng as abap.dec(20,3)) * (cast(_limit.Zvalu1 as abap.dec(20,3)) / 100) <= cast(_Item.Grmng as abap.dec(20,3)) then 'X'
             else ''
             end
      end         as chk,

      //잔량필드
      case
      when _limit.Zvalu1 is null
        then case
             when cast(_Item.Cclmng as abap.dec(20,3)) <= cast(_Item.Grmng as abap.dec(20,3)) then 0
             else cast(_Item.Cclmng as abap.dec(20,3)) - cast(_Item.Grmng as abap.dec(20,3))
             end
      else
            case
            when cast(_Item.Cclmng as abap.dec(20,3)) * (cast(_limit.Zvalu1 as abap.dec(20,3)) / 100) <= cast(_Item.Grmng as abap.dec(20,3)) then 0
            else cast(_Item.Cclmng as abap.dec(20,3)) - cast(_Item.Grmng as abap.dec(20,3))
            end
      end         as Modmg
}

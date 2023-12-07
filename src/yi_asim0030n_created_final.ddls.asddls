@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입B/L 기생성 정보 인터페이스 뷰(참조용)'
define view entity YI_ASIM0030N_CREATED_FINAL
  as select from YI_ASIM0030N_CREATED as _item
  join zasimt0020n as _reqitem on _item.Reqno = _reqitem.reqno
                                          and _item.Reqyr = _reqitem.reqyr
                                          and _item.Itmno = _reqitem.itmno

  association [0..1] to YI_ASIM0001N as _limit on  _limit.Zcode like '%LIMIT'
                                               and _limit.Zcdno =    'A'

{
  key _item.Reqno as Reqno,
  key _item.Reqyr as Reqyr,
  key _item.Itmno as Itmno,

      @Semantics.quantity.unitOfMeasure: 'Blmns'
      _item.Blmng as Blmng,
      _item.Blmns as Blmns,

      //제외여부필드
      case
      when _limit.Zvalu1 is null
        then case
             when cast(_reqitem.reqmg as abap.dec(20,3)) <= cast(_item.Blmng as abap.dec(20,3)) then 'X'
             else ''
             end
      else
             case
             when cast(_reqitem.reqmg as abap.dec(20,3)) * (cast(_limit.Zvalu1 as abap.dec(20,3)) / 100) <= cast(_item.Blmng as abap.dec(20,3)) then 'X'
             else ''
             end
      end         as chk,

      //잔량필드
      case
      when _limit.Zvalu1 is null
        then case
             when cast(_reqitem.reqmg as abap.dec(20,3)) <= cast(_item.Blmng as abap.dec(20,3)) then 0
             else cast(_reqitem.reqmg as abap.dec(20,3)) - cast(_item.Blmng as abap.dec(20,3))
             end
      else
            case
            when cast(_reqitem.reqmg as abap.dec(20,3)) * (cast(_limit.Zvalu1 as abap.dec(20,3)) / 100) <= cast(_item.Blmng as abap.dec(20,3)) then 0
            else cast(_reqitem.reqmg as abap.dec(20,3)) - cast(_item.Blmng as abap.dec(20,3))
            end
      end         as Modmg
}


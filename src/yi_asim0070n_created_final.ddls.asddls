@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입통관 기생성 정보 인터페이스 뷰(참조용)'
define root view entity YI_ASIM0070N_CREATED_FINAL
  as select from YI_ASIM0070N_CREATED as _Item
  association [0..1] to YI_ASIM0001N as _limit on  _limit.Zcode like '%LIMIT'
                                               and _limit.Zcdno =    'C'
{
  key _Item.Eccgb  as Eccgb,
  key _Item.Blino  as Blino,
  key _Item.Bliyr  as Bliyr,
  key _Item.Blinp  as Blinp,
  key _Item.Eccno  as Eccno,
  key _Item.Eccyr  as Eccyr,
  key _Item.Eccnp  as Eccnp,

      _Item.Blmng  as Blmng,
      _Item.Blmns  as Blmns,

      _Item.Eccmng as Eccmng,
      _Item.Eccmns as Eccmns,

      //제외여부필드
      case when _Item.Eccgb = 'X'
           then case when _limit.Zvalu1 is null
                     then case when cast(_Item.Eccmng as abap.dec(20,3)) <= cast(_Item.Cclmng as abap.dec(20,3)) then 'X'
                               else ''
                          end
                     else case when cast(_Item.Eccmng as abap.dec(20,3)) * (cast(_limit.Zvalu1 as abap.dec(20,3)) / 100) <= cast(_Item.Cclmng as abap.dec(20,3)) then 'X'
                               else ''
                          end
                 end
            else case when _limit.Zvalu1 is null
                     then case when cast(_Item.Blmng as abap.dec(20,3)) <= cast(_Item.Cclmng as abap.dec(20,3)) then 'X'
                               else ''
                          end
                     else case when cast(_Item.Blmng as abap.dec(20,3)) * (cast(_limit.Zvalu1 as abap.dec(20,3)) / 100) <= cast(_Item.Cclmng as abap.dec(20,3)) then 'X'
                               else ''
                          end
                 end
       end         as chk,

      //잔량필드
      case when _Item.Eccgb = 'X'
          then case when _limit.Zvalu1 is null
                    then case when cast(_Item.Eccmng as abap.dec(20,3)) <= cast(_Item.Cclmng as abap.dec(20,3)) then 0
                              else cast(_Item.Eccmng as abap.dec(20,3)) - cast(_Item.Cclmng as abap.dec(20,3))
                         end
                    else case when cast(_Item.Eccmng as abap.dec(20,3)) * (cast(_limit.Zvalu1 as abap.dec(20,3)) / 100) <= cast(_Item.Cclmng as abap.dec(20,3)) then 0
                              else cast(_Item.Eccmng as abap.dec(20,3)) - cast(_Item.Cclmng as abap.dec(20,3))
                         end
                end
           else case when _limit.Zvalu1 is null
                     then case when cast(_Item.Blmng as abap.dec(20,3)) <= cast(_Item.Cclmng as abap.dec(20,3)) then 0
                              else cast(_Item.Blmng as abap.dec(20,3)) - cast(_Item.Cclmng as abap.dec(20,3))
                         end
                    else case when cast(_Item.Blmng as abap.dec(20,3)) * (cast(_limit.Zvalu1 as abap.dec(20,3)) / 100) <= cast(_Item.Cclmng as abap.dec(20,3)) then 0
                              else cast(_Item.Blmng as abap.dec(20,3)) - cast(_Item.Cclmng as abap.dec(20,3))
                         end
                end
       end         as Modmg



}

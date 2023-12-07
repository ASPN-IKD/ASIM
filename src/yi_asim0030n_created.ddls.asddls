//@AccessControl.authorizationCheck: #NOT_REQUIRED
//@EndUserText.label: '수입B/L 기생성 정보 인터페이스 뷰'
//// 수입계약에서 생성한 Item을 참조하여 B/L에 Item 생성
//// 계약내부번호, 연도, 품목번호가 동일한 데이터를 매핑
//define view entity YI_ASIM0030N_CREATED as select from zasimt0040n as _blitem
//  right outer join zasimt0020n as _reqitem on _blitem.reqno = _reqitem.reqno
//                                          and _blitem.reqyr = _reqitem.reqyr
//                                          and _blitem.itmno = _reqitem.itmno
//{
//  key _blitem.reqno as Reqno,
//  key _blitem.reqyr as Reqyr,
//  key _blitem.itmno as Itmno,
//  
//  // BL문서 - Item의 수량
////  @Semantics.quantity.unitOfMeasure: 'Blmns'
////  sum(_blitem.blmng) as Blmng2,
////  _blitem.blmns as Blmns,
////  
//  //수입계약 - Item의 수량
////  sum ( _reqitem.reqmg ) as Reqmg,
////  _reqitem.reqms as Reqms,
//  
//  @Semantics.quantity.unitOfMeasure: 'Reqms'
//  sum ( _reqitem.reqmg ) as Reqmg,
//  _reqitem.reqms as Reqms,
//
//  @Semantics.quantity.unitOfMeasure: 'blmns'
//  sum( _blitem.blmng  ) as blmng,  
//  _blitem.blmns as Blmns,
//
//  //X : Item의 전체 수량이 생성 되지 않았음을 의미.
//  case when ( sum( _reqitem.reqmg ) = sum( _blitem.blmng ) ) then ' ' 
//  else 'X'
//  end as create_yn
//
//  // 삭제 되지 않은 항목이고
//} where _blitem.loekz =  '' 
//
//// 수입 계약 번호 - 수입 계약 연도 - 해당 ItemNo - Item의 단위
//group by _blitem.reqno,
//         _blitem.reqyr,
//         _blitem.itmno,
//         _reqitem.itmno,
//         _blitem.blmng,
//         _reqitem.reqms,
//          _blitem.blmns

          
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입B/L 기생성 정보 인터페이스 뷰'
// 수입계약에서 생성한 Item을 참조하여 B/L에 Item 생성
// 계약내부번호, 연도, 품목번호가 동일한 데이터를 매핑
// 2023-11-02, 조회 테이블 수정, 김서현
define view entity YI_ASIM0030N_CREATED as select from YI_ASIM0021N as _reqItem
left outer join YI_ASIM0041N as _blItem on _blItem.Reqno = _reqItem.Reqno
                                       and _blItem.Reqyr = _reqItem.Reqyr
                                       and _blItem.Itmno = _reqItem.Itmno
                                       and _blItem.Loekz <> 'X'
{
    key _reqItem.Reqyr,
    key _reqItem.Reqno,
    key _reqItem.Itmno,
    _blItem.Itmno as bItemNo,   
    @Semantics.quantity.unitOfMeasure: 'reqms'
    sum(_reqItem.Reqmg) as Reqmg,
    _reqItem.Reqms as Reqms,

    @Semantics.quantity.unitOfMeasure: 'reqms' 
    sum(_blItem.Blmng) as Blmng,
    case 
        when _blItem.Blmns is null then _reqItem.Reqms
        else _blItem.Blmns
    end as Blmns
}
group by _reqItem.Reqyr, _reqItem.Reqno, _reqItem.Itmno, _blItem.Itmno, _reqItem.Reqms, _blItem.Blmns

          

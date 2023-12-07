@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입I/V 기생성 IVGB 정보 인터페이스 뷰'
define view entity YI_ASIM0050N_CREATED_IVGB as  

//IV생성되어 있는 문서 리스트 조회
//51, 52에서 해당 데이터 제외처리
//IV에서 BL참조된 문서는 계약참조 불가
//IV에서 계약참조된 문서는 BL참조 불가


//IV문서를 계약기준으로 LIST 생성한다. IVGB = A(수입참조), B(BL참조)
select 
  from zasimt0060n as _Ivitem
  join zasimt0050n as _Ivheader on  _Ivitem.parentuuid = _Ivheader.uuid
  join zasimt0020n as _reqitem  on  _Ivitem.reqno = _reqitem.reqno
                                and _Ivitem.reqyr = _reqitem.reqyr
                                and _Ivitem.itmno = _reqitem.itmno
{
  key _Ivheader.ivgb as Ivgb,
  key _Ivitem.reqno  as Reqno,
  key _Ivitem.reqyr  as Reqyr
}
where _Ivheader.stblg = ''//역분개문서번호
  and _Ivheader.loekz = ''//삭제 지시자
group by
  _Ivitem.reqno,
  _Ivitem.reqyr,
  _Ivitem.meins,
  _Ivheader.ivgb

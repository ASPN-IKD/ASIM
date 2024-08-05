@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.ignorePropagatedAnnotations: true
@EndUserText.label: '수입 진행현황 인터페이스 뷰'
define root view entity YI_ASIM0910N
  as select from    YI_ASIM0100N as _gri
    join            YI_ASIM0090N as _grh  on _grh.Uuid = _gri.ParentUUID
    join            YI_ASIM0010N as _reqh on  _gri.Reqno = _reqh.Reqno
                                          and _gri.Reqyr = _reqh.Reqyr
    join            YI_ASIM0020N as _reqi on  _reqh.Uuid = _reqi.ParentUUID
                                          and _gri.Itmno = _reqi.Itmno
    join            YI_ASIM0030N as _blh  on  _gri.Blino = _blh.Blino
                                          and _gri.Bliyr = _blh.Bliyr
    join            YI_ASIM0040N as _bli  on  _blh.Uuid  = _bli.ParentUUID
                                          and _gri.Blinp = _bli.Blinp
    join            YI_ASIM0070N as _cch  on  _gri.Cclno = _cch.Cclno
                                          and _gri.Cclyr = _cch.Cclyr
    join            YI_ASIM0080N as _cci  on  _cch.Uuid  = _cci.ParentUUID
                                          and _gri.Cclnp = _cci.Cclnp
    left outer join YI_ASIM0190N as _ecch on  _gri.Eccno = _ecch.Eccno
                                          and _gri.Eccyr = _ecch.Eccyr
    left outer join YI_ASIM0200N as _ecci on  _gri.Eccno = _ecci.Eccno
                                          and _gri.Eccyr = _ecci.Eccyr
                                          and _gri.Eccnp = _ecci.Eccnp

{
  key     _gri.Uuid,
          //진행상태 아이콘
          @EndUserText.label: '계약상태 아이콘'
          cast('3' as abap.char(1))                                                              as reqicon,
          @EndUserText.label: '계약상태'
          cast('완료' as abap.char(10))                                                            as reqstatus,


          @EndUserText.label: 'B/L상태 아이콘'
          cast('3' as abap.char(1))                                                              as blicon,
          @EndUserText.label: 'B/L상태'
          cast('완료' as abap.char(10))                                                            as blstatus,

          @EndUserText.label: '통관예정상태 아이콘'
          case when _blh.Eccgb = 'X' then '3'
               else '0' end                                                                      as eccicon,
          @EndUserText.label: '통관예정상태'
          case when _blh.Eccgb = 'X' then '완료'
               else 'ⓧ 제외' end                                                                   as eccstatus,

          @EndUserText.label: '통관상태 아이콘'
          cast('3' as abap.char(1))                                                              as ccicon,
          @EndUserText.label: '통관상태'
          cast('완료' as abap.char(10))                                                            as ccstatus,

          @EndUserText.label: '입고상태 아이콘'
          cast('3' as abap.char(1))                                                              as gricon,
          @EndUserText.label: '입고상태'
          cast('완료' as abap.char(10))                                                            as grstatus,

          //연결정보
          @EndUserText.label: '관리번호'
          _reqh.Reqmu,
          @EndUserText.label: '자재문서번호'
          _gri.Mblnr,
          @EndUserText.label: '자재문서연도'
          _gri.Mjahr,
          @EndUserText.label: '자재문서항목'
          _gri.Zeile,
          @EndUserText.label: '통관번호'
          _gri.Cclno,
          @EndUserText.label: '통관연도'
          _gri.Cclyr,
          @EndUserText.label: '통관품목'
          _gri.Cclnp,
          @EndUserText.label: '통관예정번호'
          _gri.Eccno,
          @EndUserText.label: '통관예정년도'
          _gri.Eccyr,
          @EndUserText.label: '통관예정품목'
          _gri.Eccnp,
          @EndUserText.label: 'B/L내부번호'
          _gri.Blino,
          @EndUserText.label: 'B/L연도'
          _gri.Bliyr,
          @EndUserText.label: 'B/L품목'
          _gri.Blinp,
          @EndUserText.label: '구매문서번호'
          _gri.Ebeln,
          @EndUserText.label: '구매문서품목번호'
          _gri.Ebelp,
          @EndUserText.label: '계약내부번호'
          _gri.Reqno,
          @EndUserText.label: '계약연도'
          _gri.Reqyr,
          @EndUserText.label: '계약품목'
          _gri.Itmno,

          //공통품목정보
          @ObjectModel.text.element: [ 'Maktx' ]
          @EndUserText.label: '자재'
          _gri.Matnr,
          @EndUserText.label: '자재명'
          _gri.Maktx,
          @ObjectModel.text.element: [ 'Werkst' ]
          @EndUserText.label: '플랜트'
          @Consumption.valueHelpDefinition: [{ entity : { element: 'Werks', name: 'ZASIMV_WERKS' } } ]
          _gri.Werks,
          @EndUserText.label: '플랜트명'
          _gri.Werkst,
          @ObjectModel.text.element: [ 'Lgortt' ]
          @EndUserText.label: '저장위치'
          _gri.Lgort,
          @EndUserText.label: '저장위치명'
          _gri.Lgortt,

          //입고품목
          @EndUserText.label: '배치번호'
          _gri.Charg,
          @EndUserText.label: '제조일'
          _gri.Hsdat,
          @EndUserText.label: '유효기간'
          _gri.Vfdat,
          @EndUserText.label: '최대저장기간'
          _gri.Maxlz,
          @EndUserText.label: '입고자재'
          _gri.Matnr                                                                             as Grmat,
          @EndUserText.label: '입고자재명'
          _gri.Maktx                                                                             as Grmakt,
          @Semantics.quantity.unitOfMeasure: 'Grmns'
          @EndUserText.label: '입고수량'
          _gri.Grmng,
          @EndUserText.label: '입고단위'
          _gri.Grmns,


          //입고 헤더
          @EndUserText.label: '입고전기일'
          _grh.BudatGr,
          @EndUserText.label: '회계문서번호'
          _grh.BelnrGr,
          @EndUserText.label: '회계연도'
          _grh.GjahrGr,
          @EndUserText.label: '헤더텍스트'
          _grh.Bktxt,
          @EndUserText.label: '통관기준 입고완료'
          _grh.Grche,

          //통관품목
          @EndUserText.label: '통관자재'
          _cci.Matnr                                                                             as Ccmat,
          @EndUserText.label: '통관자재명'
          _cci.Maktx                                                                             as Ccmakt,
          @Semantics.quantity.unitOfMeasure: 'Cclmns'
          @EndUserText.label: '통관수량'
          _gri.Grmng                                                                             as Cclmng,
          @EndUserText.label: '통관단위'
          _cci.Cclmns,

          //통관헤더
          @EndUserText.label: '수입신고번호'
          _cch.Decno,
          @ObjectModel.text.element: [ 'Cclift' ]
          @EndUserText.label: '세관'
          _cch.Cclif,
          @EndUserText.label: '세관명'
          _cch.Cclift,
          @EndUserText.label: '신고일'
          _cch.Decdt,
          @EndUserText.label: '반입일'
          _cch.Ccldt,
          @ObjectModel.text.element: [ 'Ccpert' ]
          @EndUserText.label: '신고인'
          _cch.Ccper,
          @EndUserText.label: '신고인명'
          _cch.Ccpert,
          @Semantics.amount.currencyCode: 'Ccwae'
          @EndUserText.label: '총과세가격'
          _cch.Ccamt,
          @Semantics.amount.currencyCode: 'Ccwaek'
          @EndUserText.label: '총과세가격(현지통화)'
          _cch.Ccamtk,
          @Semantics.amount.currencyCode: 'Ccwaek'
          @EndUserText.label: '관세'
          _cch.Ccvat1,
          @Semantics.amount.currencyCode: 'Ccwaek'
          @EndUserText.label: '수입부가세'
          _cch.Ccvat2,
          @Semantics.amount.currencyCode: 'Ccwaek'
          @EndUserText.label: '과세표준액(현지통화)'
          _cch.Hwbas,
          @ObjectModel.filter.enabled: false
          @EndUserText.label: '통화키'
          _cch.Ccwae,
          @EndUserText.label: '현지통화'
          _cch.Ccwaek,
          @EndUserText.label: '통관환율'
          _cch.Ccrsf,
          @EndUserText.label: '접수일'
          _cch.Ccdat1,
          @EndUserText.label: '수리일'
          _cch.Ccdat2,
          @EndUserText.label: '검사(반입)장소'
          _cch.Cclog,
          @ObjectModel.text.element: [ 'Ccmost' ]
          @EndUserText.label: '환적모선'
          _cch.Ccmos,
          @EndUserText.label: '환적모선명'
          _cch.Ccmost,
          @ObjectModel.text.element: [ 'Cclgortt' ]
          @EndUserText.label: '보세창고'
          _cch.Cclgort,
          @EndUserText.label: '보세창고명'
          _cch.Cclgortt,
          @EndUserText.label: '통관비고'
          _cch.Ccltx,

          //통관예정품목
          @ObjectModel.text.element: [ 'Eccmakt' ]
          @EndUserText.label: '통관예정자재'
          _ecci.Matnr                                                                            as Eccmat,
          @EndUserText.label: '통관예정자재명'
          _ecci.Maktx                                                                            as Eccmakt,
          @Semantics.quantity.unitOfMeasure: 'Eccmns'
          @EndUserText.label: '통관예정수량'
          cast(case when _gri.Eccno = '' then 0
               else _gri.Grmng
               end   as abap.dec(20,3))                                                          as Eccmng,
          @EndUserText.label: '통관예정단위'
          case when  _gri.Eccno = '' then _gri.Grmns
               else _ecci.Eccmns
               end                                                                               as Eccmns,
          @ObjectModel.text.element: [ 'Quacdt' ]
          @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_QUACD', element: 'Cdno' }}]
          @EndUserText.label: '검역상태'
          _ecci.Quacd,
          @EndUserText.label: '검역상태명'
          _ecci.Quacdt,
          @ObjectModel.text.element: [ 'Quarst' ]
          @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_QUARS', element: 'Cdno' }} ]
          @EndUserText.label: '검역결과'
          _ecci.Quars,
          @EndUserText.label: '검역결과명'
          _ecci.Quarst,
          @EndUserText.label: '검역일'
          _ecci.Quadt,
          @Semantics.quantity.unitOfMeasure: 'Eccmns'
          @EndUserText.label: '불합격수량'
          _ecci.Failmng,
          @Semantics.quantity.unitOfMeasure: 'Eccmns'
          @EndUserText.label: '샘플수량'
          _ecci.Sampmng,
          @EndUserText.label: '비고'
          _ecci.Eccremak,

          //통관예정헤더
          @EndUserText.label: '통관예정일'
          _ecch.Eccdt,
          @EndUserText.label: '입고예정일'
          _ecch.Egrdt,
          @EndUserText.label: '화물관리번호'
          _ecch.Eccmrn,
          @EndUserText.label: '보세운송번호'
          _ecch.Ecctrn,
          @EndUserText.label: '장치위치정보'
          _ecch.Eccwmn,

          //BL품목
          @EndUserText.label: 'B/L자재'
          _bli.Matnr                                                                             as Blmat,
          @EndUserText.label: 'B/L자재명'
          _bli.Maktx                                                                             as Blmakt,
          @Semantics.quantity.unitOfMeasure: 'Blmns'
          @EndUserText.label: 'B/L수량'
          _gri.Grmng                                                                             as Blmng,
          @EndUserText.label: 'B/L단위'
          _bli.Blmns,
          @Semantics.amount.currencyCode: 'Waers'
          @EndUserText.label: 'B/L단가'
          _bli.Blmpr,
          @Semantics.amount.currencyCode: 'Waers'
          @EndUserText.label: 'B/L금액'
          cast(_gri.Grmng * cast(_bli.Blmpr as abap.dec(20,2)) / _bli.Blpnh as abap.dec(20,2))   as Blmwr,
          @EndUserText.label: '가격단위'
          _bli.Blpnh,
          @EndUserText.label: '납품일'
          _bli.Eindt,
          @EndUserText.label: '관세율'
          _bli.Zdc1_p,
          @Semantics.amount.currencyCode: 'Waers'
          @EndUserText.label: '관세액'
          _bli.Zdc1_n,
          @EndUserText.label: '부대비율'
          _bli.Zdc2_p,
          @Semantics.amount.currencyCode: 'Waers'
          @EndUserText.label: '부대비액'
          _bli.Zdc2_n,

          //BL헤더
          @EndUserText.label: 'B/L번호'
          _blh.Bleno,
          @EndUserText.label: 'B/L발행일'
          _blh.Bldat,
          @EndUserText.label: '입항일'
          _blh.Bleta,
          @EndUserText.label: '선적일'
          _blh.Bletd,
          @EndUserText.label: 'ETD'
          _blh.Rqetd,
          @EndUserText.label: 'ETA'
          _blh.Rqeta,
          @EndUserText.label: '만기일수'
          _blh.Bld1t,
          @EndUserText.label: '인수만기일'
          _blh.Bledt,
          @EndUserText.label: '선적서류접수일'
          _blh.Bldat2,
          @EndUserText.label: '입고예정일'
          _blh.Blgrd,
          @Semantics.quantity.unitOfMeasure: 'Gewei'
          @EndUserText.label: '총중량'
          _blh.Brgew,
          @Semantics.quantity.unitOfMeasure: 'Gewei'
          @EndUserText.label: '순중량'
          _blh.Negew,
          @EndUserText.label: '중량단위'
          _blh.Gewei,
          @EndUserText.label: 'L/G번호'
          _blh.Lgnum,
          @EndUserText.label: '컨테이너번호'
          _blh.Cntno,
          @Consumption.valueHelpDefinition: [
          {entity: {name: 'ZASIMV_MOSNO', element: 'Cdno' }}
          ]
          @EndUserText.label: '모선번호'
          _blh.Mosno,
          @EndUserText.label: '모선번호명'
          _blh.Mosnot,
          @Semantics.amount.currencyCode: 'Waers'
          @EndUserText.label: 'B/L총금액'
          _blh.Blamt,
          @EndUserText.label: 'B/L Text'
          _blh.Blitx,
          @EndUserText.label: '납품완료체크'
          _blh.Blche,
          @EndUserText.label: '검역여부'
          _blh.Eccgb,

          //계약품목
          @EndUserText.label: '계약자재'
          @ObjectModel.text.element: [ 'Reqmakt' ]
          _reqi.Matnr                                                                            as Reqmat,
          @EndUserText.label: '계약자재명'
          _reqi.Maktx                                                                            as Reqmakt,
          @Semantics.quantity.unitOfMeasure: 'Reqms'
          @EndUserText.label: '계약수량'
          _gri.Grmng                                                                             as Reqmg,
          @EndUserText.label: '계약단위'
          _reqi.Reqms,
          @Semantics.amount.currencyCode: 'Waers'
          @EndUserText.label: '계약단가'
          _reqi.Reqnr,
          @Semantics.amount.currencyCode: 'Waers'
          @EndUserText.label: '계약금액'
          cast(_gri.Grmng * cast(_reqi.Reqnr as abap.dec(20,2)) / _reqi.Peinh as abap.dec(20,2)) as Reqwr,
          @EndUserText.label: '가격단위'
          _reqi.Peinh,
          @EndUserText.label: '판매관리문서번호'
          _reqi.Vbeln,
          @EndUserText.label: '임시오더번호'
          _reqi.Zebeln,
          @EndUserText.label: '임시오더품목'
          _reqi.Zebelp,
          @EndUserText.label: '계정지정범주'
          _reqi.Knttp,
          @EndUserText.label: 'G/L계정'
          _reqi.Sakto,
          @EndUserText.label: '자산번호'
          _reqi.Anln1,
          @EndUserText.label: '코스트센터'
          _reqi.Kostl,

          //계약헤더
          @EndUserText.label: '요청일'
          _reqh.Reqdt,
          @ObjectModel.text.element: [ 'Bukrst' ]
          @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_BUKRS', element: 'Bukrs'} }]
          @EndUserText.label: '회사코드'
          _reqh.Bukrs,
          @EndUserText.label: '회사코드명'
          _reqh.Bukrst,
          @ObjectModel.text.element: [ 'Ekorgt' ]
          @EndUserText.label: '구매조직'
          _reqh.Ekorg,
          @EndUserText.label: '구매조직명'
          _reqh.Ekorgt,
          @ObjectModel.text.element: [ 'Ekgrpt' ]
          @EndUserText.label: '구매그룹'
          _reqh.Ekgrp,
          @EndUserText.label: '구매그룹명'
          _reqh.Ekgrpt,
          @ObjectModel.text.element: [ 'Lifnrt' ]
          @EndUserText.label: '공급업체'
          _reqh.Lifnr,
          @EndUserText.label: '공급업체명'
          _reqh.Lifnrt,
          @EndUserText.label: '삭제지시자'
          _reqh.Loekz,
          @ObjectModel.text.element: [ 'Lifret' ]
          @Consumption.valueHelpDefinition: [
          {entity: {name: 'ZASIMV_LIFRE', element: 'Cdno' }}
          ]
          @EndUserText.label: '공급처'
          _reqh.Lifre,
          @EndUserText.label: '공급처명'
          _reqh.Lifret,
          @ObjectModel.text.element: [ 'Inco1t' ]
          @Consumption.valueHelpDefinition: [
          {entity: {name: 'ZASIMV_INCO1', element: 'inco1' }}
          ]
          @EndUserText.label: '인도조건'
          _reqh.Inco1,
          @EndUserText.label: '인도조건명'
          _reqh.Inco1t,
          @EndUserText.label: '인도처'
          _reqh.Inco2,
          @ObjectModel.text.element: [ 'Ztermt' ]
          @Consumption.valueHelpDefinition: [
          {entity: {name: 'ZASIMV_ZTERM', element: 'Cdno' }}
          ]
          @EndUserText.label: '지급조건'
          _reqh.Zterm,
          @EndUserText.label: '지급조건명'
          _reqh.Ztermt,
          @ObjectModel.text.element: [ 'Zcdno1t' ]
          @EndUserText.label: '도착지'
          @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO1', element: 'Cdno' }}]
          _reqh.Zcdno1,
          @EndUserText.label: '도착지명'
          _reqh.Zcdno1t,
          @ObjectModel.text.element: [ 'Zcdno2t' ]
          @EndUserText.label: '운송수단'
          @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO2', element: 'Cdno' }}]
          _reqh.Zcdno2,
          @EndUserText.label: '운송수단명'
          _reqh.Zcdno2t,
          @ObjectModel.text.element: [ 'Zcdno3t' ]
          @EndUserText.label: '선적지'
          @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO3', element: 'Cdno' }}]
          _reqh.Zcdno3,
          @EndUserText.label: '선적지명'
          _reqh.Zcdno3t,
          @ObjectModel.text.element: [ 'Zcdno4t' ]
          @EndUserText.label: '운송형태'
          @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_ZCDNO4', element: 'Cdno' }}]
          _reqh.Zcdno4,
          @EndUserText.label: '운송형태명'
          _reqh.Zcdno4t,
          @EndUserText.label: '총금액'
          @Semantics.amount.currencyCode: 'Waers'
          _reqh.Netwr,
          @EndUserText.label: '통화키'
          @Consumption.valueHelpDefinition: [
          {entity: {name: 'I_CurrencyStdVH', element: 'Currency' }}
          ]
          _reqh.Waers,
          @EndUserText.label: 'L/C오픈일'
          _reqh.Opdat,
          @ObjectModel.text.element: [ 'Opbnkt' ]
          @EndUserText.label: '개설은행'
          @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_OPBNK', element: 'Cdno' }}]
          _reqh.Opbnk,
          @EndUserText.label: '개설은행명'
          _reqh.Opbnkt,
          @EndUserText.label: 'L/C번호'
          _reqh.Opnum,
          @Semantics.amount.currencyCode: 'Opwrs'
          @EndUserText.label: 'L/C오픈금액'
          _reqh.Opamt,
          @EndUserText.label: '개설통화'
          _reqh.Opwrs,
          @Consumption.valueHelpDefinition: [{entity: {name: 'ZASIMV_PTERM', element: 'Cdno' }}]
          @ObjectModel.text.element: ['Ptermt']
          @EndUserText.label: '결제조건'
          _reqh.Pterm,
          @EndUserText.label: '결제조건명'
          _reqh.Ptermt,
          @EndUserText.label: '결제조건일수'
          _reqh.Zbd1t,
          @EndUserText.label: '결제예정일'
          _reqh.Pedat,
          @EndUserText.label: '결제일'
          _reqh.Pdate,
          @EndUserText.label: '오픈예정일'
          _reqh.Oedat,
          @ObjectModel.text.element: [ 'Oplift' ]
          @EndUserText.label: '오픈처'
          _reqh.Oplif,
          @EndUserText.label: '오픈처명'
          _reqh.Oplift,
          @EndUserText.label: 'Sdate'
          _reqh.Sdate,
          @EndUserText.label: 'Edate'
          _reqh.Edate,
          @ObjectModel.text.element: [ 'Colift' ]
          @EndUserText.label: '실계약처'
          _reqh.Colif,
          @EndUserText.label: '실계약처명'
          _reqh.Colift,
          @ObjectModel.text.element: [ 'Filift' ]
          @EndUserText.label: '파이낸스'
          _reqh.Filif,
          @EndUserText.label: '파이낸스명'
          _reqh.Filift,
          @EndUserText.label: '계약번호1'
          _reqh.Cont1,
          @EndUserText.label: '계약번호2'
          _reqh.Cont2,
          @EndUserText.label: '접수일'
          _reqh.Acdat,
          @EndUserText.label: 'BOOKING No.'
          _reqh.Bokno,
          @ObjectModel.text.element: [ 'Conrtt' ]
          @EndUserText.label: '계약유형'
          _reqh.Conrt,
          @EndUserText.label: '계약유형명'
          _reqh.Conrtt,
          @EndUserText.label: '양도일(수입대행)'
          _reqh.Trdat,
          @EndUserText.label: 'B/L번호(수입대행)'
          _reqh.Trbln,
          @EndUserText.label: '개설환율'
          _reqh.Rqrsf,
          @EndUserText.label: '부보환율'
          _reqh.Bbrsf,
          @EndUserText.label: '부보대상금액'
          @Semantics.amount.currencyCode: 'Bbwrs'
          _reqh.Bbamt,
          @EndUserText.label: '부보대상금액'
          _reqh.Bbwrs,
          @EndUserText.label: '부보일'
          _reqh.Bbdat,
          @ObjectModel.text.element: ['Bbgbt']
          @EndUserText.label: '보험조건'
          _reqh.Bbgb,
          @EndUserText.label: '보험조건명'
          _reqh.Bbgbt,
          @EndUserText.label: '계약완료'
          _reqh.Rqche,
          @EndUserText.label: '인수일'
          _reqh.Isdat,
          @EndUserText.label: '주차(오퍼)'
          _reqh.Rqweek,
          @EndUserText.label: '보험증권번호'
          _reqh.Bbno,
          @ObjectModel.text.element: [ 'Bblift' ]
          @EndUserText.label: '보험회사'
          _reqh.Bblif,
          @EndUserText.label: '보험회사명'
          _reqh.Bblift,
          @ObjectModel.filter.enabled: false
          @EndUserText.label: '부보 Basic Rate'
          _reqh.Bbrate,
          @EndUserText.label: '비고'
          _reqh.Remak
}
where
      _grh.Loekz   = ''
  and _grh.SmblnGr = ''

union all

select from       YI_ASIM0080N as _cci
  join            YI_ASIM0070N as _cch  on _cch.Uuid = _cci.ParentUUID
  join            YI_ASIM0010N as _reqh on  _cci.Reqno = _reqh.Reqno
                                        and _cci.Reqyr = _reqh.Reqyr
  join            YI_ASIM0020N as _reqi on  _reqh.Uuid = _reqi.ParentUUID
                                        and _cci.Itmno = _reqi.Itmno
  join            YI_ASIM0030N as _blh  on  _cci.Blino = _blh.Blino
                                        and _cci.Bliyr = _blh.Bliyr
  join            YI_ASIM0040N as _bli  on  _blh.Uuid  = _bli.ParentUUID
                                        and _cci.Blinp = _bli.Blinp
  left outer join YI_ASIM0190N as _ecch on  _cci.Eccno = _ecch.Eccno
                                        and _cci.Eccyr = _ecch.Eccyr
  left outer join YI_ASIM0200N as _ecci on  _cci.Eccno = _ecci.Eccno
                                        and _cci.Eccyr = _ecci.Eccyr
                                        and _cci.Eccnp = _ecci.Eccnp

{

  key _cci.Uuid,
      //진행상태 아이콘
      cast('3' as abap.char(1))                                                                 as reqicon,
      cast('완료' as abap.char(10))                                                               as reqstatus,

      cast('3' as abap.char(1))                                                                 as blicon,
      cast('완료' as abap.char(10))                                                               as blstatus,
      case when _blh.Eccgb = 'X' then '3'
           when _blh.Eccgb = '' then '0'
           else '1' end                                                                         as eccicon,
      case when _blh.Eccgb = 'X' then '완료'
           when _blh.Eccgb = '' then 'ⓧ 제외'
           else '미진행' end                                                                       as eccstatus,
      cast('3' as abap.char(1))                                                                 as ccicon,
      cast('완료' as abap.char(10))                                                               as ccstatus,

      case when _cci.Chk_gr = 'X' then '3'
           else '1' end                                                                         as gricon,
      case when _cci.Chk_gr = 'X' then '완료'
      else '미진행' end                                                                            as grstatus,


      _reqh.Reqmu,
      cast ('' as abap.char(10))                                                                as Mblnr,
      cast ('' as abap.numc(4))                                                                 as Mjahr,
      cast ('' as abap.numc(4))                                                                 as Zeile,
      //연결정보
      _cci.Cclno,
      _cci.Cclyr,
      _cci.Cclnp,
      _cci.Eccno,
      _cci.Eccyr,
      _cci.Eccnp,
      _cci.Blino,
      _cci.Bliyr,
      _cci.Blinp,
      _cci.Ebeln,
      _cci.Ebelp,
      _cci.Reqno,
      _cci.Reqyr,
      _cci.Itmno,

      //공통품목정보
      _cci.Matnr,
      _cci.Maktx,
      _cci.Werks,
      _cci.Werkst,
      _cci.Lgort,
      _cci.Lgortt,

      //입고품목
      cast('' as abap.char(10))                                                                 as Charg,
      cast('' as abap.dats)                                                                     as Hsdat,
      cast('' as abap.dats)                                                                     as Vfdat,
      cast(0 as abap.dec(5,0))                                                                  as Maxlz,
      cast('' as abap.char(18))                                                                 as Grmat,
      cast('' as abap.char(50))                                                                 as Grmakt,
      cast(0 as abap.dec(20,3))                                                                 as Grmng,
      _cci.Cclmns                                                                               as Grmns,


      //입고 헤더
      cast('' as abap.dats)                                                                     as BudatGr,
      cast ('' as abap.char(10))                                                                as BelnrGr,
      cast ('' as abap.numc(4))                                                                 as GjahrGr,
      cast ('' as abap.char(100))                                                               as Bktxt,
      cast ('' as abap.char(1))                                                                 as Grche,

      //통관품목
      _cci.Matnr                                                                                as Ccmat,
      _cci.Maktx                                                                                as Ccmakt,
      _cci.Modmg_gr                                                                             as Cclmng,
      _cci.Cclmns,

      //통관헤더
      _cch.Decno,
      _cch.Cclif,
      _cch.Cclift,
      _cch.Decdt,
      _cch.Ccldt,
      _cch.Ccper,
      _cch.Ccpert,
      _cch.Ccamt,
      _cch.Ccamtk,
      _cch.Ccvat1,
      _cch.Ccvat2,
      _cch.Hwbas,
      _cch.Ccwae,
      _cch.Ccwaek,
      _cch.Ccrsf,
      _cch.Ccdat1,
      _cch.Ccdat2,
      _cch.Cclog,
      _cch.Ccmos,
      _cch.Ccmost,
      _cch.Cclgort,
      _cch.Cclgortt,
      _cch.Ccltx,

      //통관예정품목
      _ecci.Matnr                                                                               as Eccmat,
      _ecci.Maktx                                                                               as Eccmakt,
      cast(case when _cci.Eccno = '' then 0
                else _cci.Modmg_gr end as abap.dec(20,3))                                       as Eccmng,
      case when _cci.Eccno = '' then _cci.Cclmns
           else _ecci.Eccmns end                                                                as Eccmns,
      _ecci.Quacd,
      _ecci.Quacdt,
      _ecci.Quars,
      _ecci.Quarst,
      _ecci.Quadt,
      _ecci.Failmng,
      _ecci.Sampmng,
      _ecci.Eccremak,

      //통관예정헤더
      _ecch.Eccdt,
      _ecch.Egrdt,
      _ecch.Eccmrn,
      _ecch.Ecctrn,
      _ecch.Eccwmn,

      //BL품목
      _bli.Matnr                                                                                as Blmat,
      _bli.Maktx                                                                                as Blmakt,
      _cci.Modmg_gr                                                                             as Blmng,
      _bli.Blmns,
      _bli.Blmpr,
      cast(_cci.Modmg_gr * cast(_bli.Blmpr as abap.dec(20,2)) / _bli.Blpnh as abap.dec(20,2))   as Blmwr,
      _bli.Blpnh,
      _bli.Eindt,
      _bli.Zdc1_p,
      _bli.Zdc1_n,
      _bli.Zdc2_p,
      _bli.Zdc2_n,

      //BL헤더
      _blh.Bleno,
      _blh.Bldat,
      _blh.Bleta,
      _blh.Bletd,
      _blh.Rqetd,
      _blh.Rqeta,
      _blh.Bld1t,
      _blh.Bledt,
      _blh.Bldat2,
      _blh.Blgrd,
      _blh.Brgew,
      _blh.Negew,
      _blh.Gewei,
      _blh.Lgnum,
      _blh.Cntno,
      _blh.Mosno,
      _blh.Mosnot,
      _blh.Blamt,
      _blh.Blitx,
      _blh.Blche,
      _blh.Eccgb,

      //계약품목
      _reqi.Matnr                                                                               as Reqmat,
      _reqi.Maktx                                                                               as Reqmakt,
      _cci.Modmg_gr                                                                             as Reqmg,
      _reqi.Reqms,
      _reqi.Reqnr,
      cast(_cci.Modmg_gr * cast(_reqi.Reqnr as abap.dec(20,2)) / _reqi.Peinh as abap.dec(20,2)) as Reqwr,
      _reqi.Peinh,
      _reqi.Vbeln,
      _reqi.Zebeln,
      _reqi.Zebelp,
      _reqi.Knttp,
      _reqi.Sakto,
      _reqi.Anln1,
      _reqi.Kostl,

      //계약헤더
      _reqh.Reqdt,
      _reqh.Bukrs,
      _reqh.Bukrst,
      _reqh.Ekorg,
      _reqh.Ekorgt,
      _reqh.Ekgrp,
      _reqh.Ekgrpt,
      _reqh.Lifnr,
      _reqh.Lifnrt,
      _reqh.Loekz,
      _reqh.Lifre,
      _reqh.Lifret,
      _reqh.Inco1,
      _reqh.Inco1t,
      _reqh.Inco2,
      _reqh.Zterm,
      _reqh.Ztermt,
      _reqh.Zcdno1,
      _reqh.Zcdno1t,
      _reqh.Zcdno2,
      _reqh.Zcdno2t,
      _reqh.Zcdno3,
      _reqh.Zcdno3t,
      _reqh.Zcdno4,
      _reqh.Zcdno4t,
      _reqh.Netwr,
      _reqh.Waers,
      _reqh.Opdat,
      _reqh.Opbnk,
      _reqh.Opbnkt,
      _reqh.Opnum,
      _reqh.Opamt,
      _reqh.Opwrs,
      _reqh.Pterm,
      _reqh.Ptermt,
      _reqh.Zbd1t,
      _reqh.Pedat,
      _reqh.Pdate,
      _reqh.Oedat,
      _reqh.Oplif,
      _reqh.Oplift,
      _reqh.Sdate,
      _reqh.Edate,
      _reqh.Colif,
      _reqh.Colift,
      _reqh.Filif,
      _reqh.Filift,
      _reqh.Cont1,
      _reqh.Cont2,
      _reqh.Acdat,
      _reqh.Bokno,
      _reqh.Conrt,
      _reqh.Conrtt,
      _reqh.Trdat,
      _reqh.Trbln,
      _reqh.Rqrsf,
      _reqh.Bbrsf,
      _reqh.Bbamt,
      _reqh.Bbwrs,
      _reqh.Bbdat,
      _reqh.Bbgb,
      _reqh.Bbgbt,
      _reqh.Rqche,
      _reqh.Isdat,
      _reqh.Rqweek,
      _reqh.Bbno,
      _reqh.Bblif,
      _reqh.Bblift,
      _reqh.Bbrate,
      _reqh.Remak
}
where
      _cch.Loekz    =  ''
  and _cci.Loekz    =  ''
  and _cci.Modmg_gr <> 0

union all

select from YI_ASIM0200N as _ecci
  join      YI_ASIM0190N as _ecch on _ecch.Uuid = _ecci.ParentUUID
  join      YI_ASIM0010N as _reqh on  _ecci.Reqno = _reqh.Reqno
                                  and _ecci.Reqyr = _reqh.Reqyr
  join      YI_ASIM0020N as _reqi on  _reqh.Uuid  = _reqi.ParentUUID
                                  and _ecci.Itmno = _reqi.Itmno
  join      YI_ASIM0030N as _blh  on  _ecci.Blino = _blh.Blino
                                  and _ecci.Bliyr = _blh.Bliyr
  join      YI_ASIM0040N as _bli  on  _blh.Uuid   = _bli.ParentUUID
                                  and _ecci.Blinp = _bli.Blinp
{
  key _ecci.Uuid,
      //진행상태 아이콘
      cast('3' as abap.char(1))                                                                  as reqicon,
      cast('완료' as abap.char(10))                                                                as reqstatus,

      cast('3' as abap.char(1))                                                                  as blicon,
      cast('완료' as abap.char(10))                                                                as blstatus,

      cast('3' as abap.char(1))                                                                  as eccicon,
      cast('완료' as abap.char(10))                                                                as eccstatus,

      case when _blh.Eccgb = '' then case when _bli.Chk_cc = 'X' then '3'
                                          else '1' end
           else case when _ecci.Chk_cc = 'X' then '3'
                     else '1' end
            end                                                                                  as ccicon,
      case when _blh.Eccgb = '' then case when _bli.Chk_cc = 'X' then '완료'
                                    else '미진행' end
      else case when _ecci.Chk_cc = 'X' then '완료'
               else '미진행' end
      end                                                                                        as ccstatus,

      cast('1' as abap.char(1))                                                                  as gricon,
      cast('미진행' as abap.char(10))                                                               as grstatus,

      //연결정보
      _reqh.Reqmu,
      cast ('' as abap.char(10))                                                                 as Mblnr,
      cast ('' as abap.numc(4))                                                                  as Mjahr,
      cast ('' as abap.numc(4))                                                                  as Zeile,
      cast ('' as abap.char(10))                                                                 as Cclno,
      cast ('' as abap.numc(4))                                                                  as Cclyr,
      cast ('' as abap.numc(4))                                                                  as Cclnp,
      _ecci.Eccno,
      _ecci.Eccyr,
      _ecci.Eccnp,
      _ecci.Blino,
      _ecci.Bliyr,
      _ecci.Blinp,
      _ecci.Ebeln,
      _ecci.Ebelp,
      _ecci.Reqno,
      _ecci.Reqyr,
      _ecci.Itmno,

      //공통품목정보
      _ecci.Matnr,
      _ecci.Maktx,
      _ecci.Werks,
      _ecci.Werkst,
      _ecci.Lgort,
      _ecci.Lgortt,

      //입고품목
      cast('' as abap.char(10))                                                                  as Charg,
      cast('' as abap.dats)                                                                      as Hsdat,
      cast('' as abap.dats)                                                                      as Vfdat,
      cast(0 as abap.dec(5,0))                                                                   as Maxlz,
      cast('' as abap.char(18))                                                                  as Grmat,
      cast('' as abap.char(50))                                                                  as Grmakt,
      cast(0 as abap.dec(20,3))                                                                  as Grmng,
      _ecci.Eccmns                                                                               as Grmns,


      //입고 헤더
      cast('' as abap.dats)                                                                      as BudatGr,
      cast ('' as abap.char(10))                                                                 as BelnrGr,
      cast ('' as abap.numc(4))                                                                  as GjahrGr,
      cast ('' as abap.char(100))                                                                as Bktxt,
      cast ('' as abap.char(1))                                                                  as Grche,

      //통관품목
      cast('' as abap.char(18))                                                                  as Ccmat,
      cast('' as abap.char(50))                                                                  as Ccmakt,
      cast(0 as abap.dec(20,3))                                                                  as Cclmng,
      _ecci.Eccmns                                                                               as Cclmns,

      //통관헤더
      cast('' as abap.char(20))                                                                  as Decno,
      cast('' as abap.char(12))                                                                  as Cclif,
      cast('' as abap.char(50))                                                                  as Cclift,
      cast('' as abap.dats)                                                                      as Decdt,
      cast('' as abap.dats)                                                                      as Ccldt,
      cast('' as abap.char(12))                                                                  as Ccper,
      cast('' as abap.char(50))                                                                  as Ccpert,
      cast(0 as abap.curr(17,2))                                                                 as Ccamt,
      cast(0 as abap.curr(17,2))                                                                 as Ccamtk,
      cast(0 as abap.curr(13,2))                                                                 as Ccvat1,
      cast(0 as abap.curr(13,2))                                                                 as Ccvat2,
      cast(0 as abap.curr(23,2))                                                                 as Hwbas,
      cast('' as waers)                                                                          as Ccwae,
      cast('' as waers)                                                                          as Ccwaek,
      cast(0 as abap.dec(9,5))                                                                   as Ccrsf,
      cast('' as abap.dats)                                                                      as Ccdat1,
      cast('' as abap.dats)                                                                      as Ccdat2,
      _ecch.Cclog,
      cast('' as abap.char(12))                                                                  as Ccmos,
      cast('' as abap.char(50))                                                                  as Ccmost,
      _ecch.Cclgort,
      _ecch.Cclgortt,
      cast('' as abap.char(50))                                                                  as Ccltx,

      //통관예정품목
      _ecci.Matnr                                                                                as Eccmat,
      _ecci.Maktx                                                                                as Eccmakt,
      _ecci.Modmg_cc                                                                             as Eccmng,
      _ecci.Eccmns,
      _ecci.Quacd,
      _ecci.Quacdt,
      _ecci.Quars,
      _ecci.Quarst,
      _ecci.Quadt,
      _ecci.Failmng,
      _ecci.Sampmng,
      _ecci.Eccremak,

      //통관예정헤더
      _ecch.Eccdt,
      _ecch.Egrdt,
      _ecch.Eccmrn,
      _ecch.Ecctrn,
      _ecch.Eccwmn,

      //BL품목
      _bli.Matnr                                                                                 as Blmat,
      _bli.Maktx                                                                                 as Blmakt,
      _ecci.Modmg_cc                                                                             as Blmng,
      _bli.Blmns,
      _bli.Blmpr,
      cast(_ecci.Modmg_cc * cast(_bli.Blmpr as abap.dec(20,2)) / _bli.Blpnh as abap.dec(20,2))   as Blmwr,
      _bli.Blpnh,
      _bli.Eindt,
      _bli.Zdc1_p,
      _bli.Zdc1_n,
      _bli.Zdc2_p,
      _bli.Zdc2_n,

      //BL헤더
      _blh.Bleno,
      _blh.Bldat,
      _blh.Bleta,
      _blh.Bletd,
      _blh.Rqetd,
      _blh.Rqeta,
      _blh.Bld1t,
      _blh.Bledt,
      _blh.Bldat2,
      _blh.Blgrd,
      _blh.Brgew,
      _blh.Negew,
      _blh.Gewei,
      _blh.Lgnum,
      _blh.Cntno,
      _blh.Mosno,
      _blh.Mosnot,
      _blh.Blamt,
      _blh.Blitx,
      _blh.Blche,
      _blh.Eccgb,

      //계약품목
      _reqi.Matnr                                                                                as Reqmat,
      _reqi.Maktx                                                                                as Reqmakt,
      _ecci.Modmg_cc                                                                             as Reqmg,
      _reqi.Reqms,
      _reqi.Reqnr,
      cast(_ecci.Modmg_cc * cast(_reqi.Reqnr as abap.dec(20,2)) / _reqi.Peinh as abap.dec(20,2)) as Reqwr,
      _reqi.Peinh,
      _reqi.Vbeln,
      _reqi.Zebeln,
      _reqi.Zebelp,
      _reqi.Knttp,
      _reqi.Sakto,
      _reqi.Anln1,
      _reqi.Kostl,

      //계약헤더
      _reqh.Reqdt,
      _reqh.Bukrs,
      _reqh.Bukrst,
      _reqh.Ekorg,
      _reqh.Ekorgt,
      _reqh.Ekgrp,
      _reqh.Ekgrpt,
      _reqh.Lifnr,
      _reqh.Lifnrt,
      _reqh.Loekz,
      _reqh.Lifre,
      _reqh.Lifret,
      _reqh.Inco1,
      _reqh.Inco1t,
      _reqh.Inco2,
      _reqh.Zterm,
      _reqh.Ztermt,
      _reqh.Zcdno1,
      _reqh.Zcdno1t,
      _reqh.Zcdno2,
      _reqh.Zcdno2t,
      _reqh.Zcdno3,
      _reqh.Zcdno3t,
      _reqh.Zcdno4,
      _reqh.Zcdno4t,
      _reqh.Netwr,
      _reqh.Waers,
      _reqh.Opdat,
      _reqh.Opbnk,
      _reqh.Opbnkt,
      _reqh.Opnum,
      _reqh.Opamt,
      _reqh.Opwrs,
      _reqh.Pterm,
      _reqh.Ptermt,
      _reqh.Zbd1t,
      _reqh.Pedat,
      _reqh.Pdate,
      _reqh.Oedat,
      _reqh.Oplif,
      _reqh.Oplift,
      _reqh.Sdate,
      _reqh.Edate,
      _reqh.Colif,
      _reqh.Colift,
      _reqh.Filif,
      _reqh.Filift,
      _reqh.Cont1,
      _reqh.Cont2,
      _reqh.Acdat,
      _reqh.Bokno,
      _reqh.Conrt,
      _reqh.Conrtt,
      _reqh.Trdat,
      _reqh.Trbln,
      _reqh.Rqrsf,
      _reqh.Bbrsf,
      _reqh.Bbamt,
      _reqh.Bbwrs,
      _reqh.Bbdat,
      _reqh.Bbgb,
      _reqh.Bbgbt,
      _reqh.Rqche,
      _reqh.Isdat,
      _reqh.Rqweek,
      _reqh.Bbno,
      _reqh.Bblif,
      _reqh.Bblift,
      _reqh.Bbrate,
      _reqh.Remak
}
where
      _ecch.Loekz    =  ''
  and _ecci.Loekz    =  ''
  and _ecci.Modmg_cc <> 0

union all

select from YI_ASIM0040N as _bli
  join      YI_ASIM0030N as _blh  on _blh.Uuid = _bli.ParentUUID
  join      YI_ASIM0010N as _reqh on  _bli.Reqno = _reqh.Reqno
                                  and _bli.Reqyr = _reqh.Reqyr
  join      YI_ASIM0020N as _reqi on  _reqh.Uuid = _reqi.ParentUUID
                                  and _bli.Itmno = _reqi.Itmno
{
  key _bli.Uuid,
      //진행상태 아이콘
      cast('3' as abap.char(1))    as reqicon,
      cast('완료' as abap.char(10))  as reqstatus,

      cast('3' as abap.char(1))    as blicon,
      cast('완료' as abap.char(10))  as blstatus,

      case when _blh.Eccgb = 'X' then case when _bli.Chk_ecc = 'X' then '3'
                                           else '1' end
           when _blh.Eccgb = '' then '0'
           else '1' end            as eccicon,
      case when _blh.Eccgb = 'X' then case when _bli.Chk_ecc = 'X' then '완료'
                                           else '미진행' end
           when _blh.Eccgb = '' then 'ⓧ 제외'
           else '미진행' end          as eccstatus,

      case when _blh.Eccgb = '' then case when _bli.Chk_cc = 'X' then '3'
                                          else '1' end
           else '1'
           end                     as ccicon,
      case when _blh.Eccgb = '' then case when _bli.Chk_cc = 'X' then '완료'
                                   else '미진행' end
      else '미진행'
      end                          as ccstatus,

      cast('1' as abap.char(1))    as gricon,
      cast('미진행' as abap.char(10)) as grstatus,

      //연결정보
      _reqh.Reqmu,
      cast ('' as abap.char(10))   as Mblnr,
      cast ('' as abap.numc(4))    as Mjahr,
      cast ('' as abap.numc(4))    as Zeile,
      cast ('' as abap.char(10))   as Cclno,
      cast ('' as abap.numc(4))    as Cclyr,
      cast ('' as abap.numc(4))    as Cclnp,
      cast ('' as abap.char(10))   as Eccno,
      cast ('' as abap.numc(4))    as Eccyr,
      cast ('' as abap.numc(4))    as Eccnp,
      _bli.Blino,
      _bli.Bliyr,
      _bli.Blinp,
      _bli.Ebeln,
      _bli.Ebelp,
      _bli.Reqno,
      _bli.Reqyr,
      _bli.Itmno,

      //공통품목정보
      _bli.Matnr,
      _bli.Maktx,
      _bli.Werks,
      _bli.Werkst,
      _bli.Lgort,
      _bli.Lgortt,

      //입고품목
      cast('' as abap.char(10))    as Charg,
      cast('' as abap.dats)        as Hsdat,
      cast('' as abap.dats)        as Vfdat,
      cast(0 as abap.dec(5,0))     as Maxlz,
      cast('' as abap.char(18))    as Grmat,
      cast('' as abap.char(50))    as Grmakt,
      cast(0 as abap.dec(20,3))    as Grmng,
      _bli.Blmns                   as Grmns,


      //입고 헤더
      cast('' as abap.dats)        as BudatGr,
      cast ('' as abap.char(10))   as BelnrGr,
      cast ('' as abap.numc(4))    as GjahrGr,
      cast ('' as abap.char(100))  as Bktxt,
      cast ('' as abap.char(1))    as Grche,

      //통관품목
      cast('' as abap.char(18))    as Ccmat,
      cast('' as abap.char(50))    as Ccmakt,
      cast(0 as abap.dec(20,3))    as Cclmng,
      _bli.Blmns                   as Cclmns,

      //통관헤더
      cast('' as abap.char(20))    as Decno,
      cast('' as abap.char(12))    as Cclif,
      cast('' as abap.char(50))    as Cclift,
      cast('' as abap.dats)        as Decdt,
      cast('' as abap.dats)        as Ccldt,
      cast('' as abap.char(12))    as Ccper,
      cast('' as abap.char(50))    as Ccpert,
      cast(0 as abap.curr(17,2))   as Ccamt,
      cast(0 as abap.curr(17,2))   as Ccamtk,
      cast(0 as abap.curr(13,2))   as Ccvat1,
      cast(0 as abap.curr(13,2))   as Ccvat2,
      cast(0 as abap.curr(23,2))   as Hwbas,
      cast('' as waers)            as Ccwae,
      cast('' as waers)            as Ccwaek,
      cast(0 as abap.dec(9,5))     as Ccrsf,
      cast('' as abap.dats)        as Ccdat1,
      cast('' as abap.dats)        as Ccdat2,
      cast('' as abap.char(30))    as Cclog,
      cast('' as abap.char(12))    as Ccmos,
      cast('' as abap.char(50))    as Ccmost,
      cast('' as abap.char(12))    as Cclgort,
      cast('' as abap.char(50))    as Cclgortt,
      cast('' as abap.char(50))    as Ccltx,

      //통관예정품목
      cast('' as abap.char(18))    as Eccmat,
      cast('' as abap.char(50))    as Eccmakt,
      cast(0 as abap.dec(20,3))    as Eccmng,
      _bli.Blmns                   as Eccmns,
      cast('' as abap.char(10))    as Quacd,
      cast('' as abap.char(50))    as Quacdt,
      cast('' as abap.char(10))    as Quars,
      cast('' as abap.char(50))    as Quarst,
      cast('' as abap.dats)        as Quadt,
      cast(0 as abap.dec(20,3))    as Failmng,
      cast(0 as abap.dec(20,3))    as Sampmng,
      cast('' as abap.char(50))    as Eccremak,

      //통관예정헤더
      cast('' as abap.dats)        as Eccdt,
      cast('' as abap.dats)        as Egrdt,
      cast('' as abap.char(50))    as Eccmrn,
      cast('' as abap.char(50))    as Ecctrn,
      cast('' as abap.char(50))    as Eccwmn,

      //BL품목
      _bli.Matnr                   as Blmat,
      _bli.Maktx                   as Blmakt,
      case when _blh.Eccgb = 'X' then _bli.Modmg_ecc
           else _bli.Modmg_cc
           end                     as Blmng,
      _bli.Blmns,
      _bli.Blmpr,
      case when _blh.Eccgb = 'X' then cast(_bli.Modmg_ecc * cast(_bli.Blmpr as abap.dec(20,2)) / _bli.Blpnh as abap.dec(20,2))
           else cast(_bli.Modmg_cc * cast(_bli.Blmpr as abap.dec(20,2)) / _bli.Blpnh as abap.dec(20,2))
           end                     as Blmwr,
      _bli.Blpnh,
      _bli.Eindt,
      _bli.Zdc1_p,
      _bli.Zdc1_n,
      _bli.Zdc2_p,
      _bli.Zdc2_n,

      //BL헤더
      _blh.Bleno,
      _blh.Bldat,
      _blh.Bleta,
      _blh.Bletd,
      _blh.Rqetd,
      _blh.Rqeta,
      _blh.Bld1t,
      _blh.Bledt,
      _blh.Bldat2,
      _blh.Blgrd,
      _blh.Brgew,
      _blh.Negew,
      _blh.Gewei,
      _blh.Lgnum,
      _blh.Cntno,
      _blh.Mosno,
      _blh.Mosnot,
      _blh.Blamt,
      _blh.Blitx,
      _blh.Blche,
      _blh.Eccgb,

      //계약품목
      _reqi.Matnr                  as Reqmat,
      _reqi.Maktx                  as Reqmakt,
      case when _blh.Eccgb = 'X' then _bli.Modmg_ecc
           else _bli.Modmg_cc
           end                     as Reqmg,
      _reqi.Reqms,
      _reqi.Reqnr,
      case when _blh.Eccgb = 'X' then cast(_bli.Modmg_ecc * cast(_reqi.Reqnr as abap.dec(20,2)) / _reqi.Peinh as abap.dec(20,2))
           else cast(_bli.Modmg_cc * cast(_reqi.Reqnr as abap.dec(20,2)) / _reqi.Peinh as abap.dec(20,2))
           end                     as Reqwr,
      _reqi.Peinh,
      _reqi.Vbeln,
      _reqi.Zebeln,
      _reqi.Zebelp,
      _reqi.Knttp,
      _reqi.Sakto,
      _reqi.Anln1,
      _reqi.Kostl,

      //계약헤더
      _reqh.Reqdt,
      _reqh.Bukrs,
      _reqh.Bukrst,
      _reqh.Ekorg,
      _reqh.Ekorgt,
      _reqh.Ekgrp,
      _reqh.Ekgrpt,
      _reqh.Lifnr,
      _reqh.Lifnrt,
      _reqh.Loekz,
      _reqh.Lifre,
      _reqh.Lifret,
      _reqh.Inco1,
      _reqh.Inco1t,
      _reqh.Inco2,
      _reqh.Zterm,
      _reqh.Ztermt,
      _reqh.Zcdno1,
      _reqh.Zcdno1t,
      _reqh.Zcdno2,
      _reqh.Zcdno2t,
      _reqh.Zcdno3,
      _reqh.Zcdno3t,
      _reqh.Zcdno4,
      _reqh.Zcdno4t,
      _reqh.Netwr,
      _reqh.Waers,
      _reqh.Opdat,
      _reqh.Opbnk,
      _reqh.Opbnkt,
      _reqh.Opnum,
      _reqh.Opamt,
      _reqh.Opwrs,
      _reqh.Pterm,
      _reqh.Ptermt,
      _reqh.Zbd1t,
      _reqh.Pedat,
      _reqh.Pdate,
      _reqh.Oedat,
      _reqh.Oplif,
      _reqh.Oplift,
      _reqh.Sdate,
      _reqh.Edate,
      _reqh.Colif,
      _reqh.Colift,
      _reqh.Filif,
      _reqh.Filift,
      _reqh.Cont1,
      _reqh.Cont2,
      _reqh.Acdat,
      _reqh.Bokno,
      _reqh.Conrt,
      _reqh.Conrtt,
      _reqh.Trdat,
      _reqh.Trbln,
      _reqh.Rqrsf,
      _reqh.Bbrsf,
      _reqh.Bbamt,
      _reqh.Bbwrs,
      _reqh.Bbdat,
      _reqh.Bbgb,
      _reqh.Bbgbt,
      _reqh.Rqche,
      _reqh.Isdat,
      _reqh.Rqweek,
      _reqh.Bbno,
      _reqh.Bblif,
      _reqh.Bblift,
      _reqh.Bbrate,
      _reqh.Remak
}
where
      _blh.Loekz             =  ''
  and _bli.Loekz             =  ''
  and case when _blh.Eccgb = 'X' then _bli.Modmg_ecc
      else _bli.Modmg_cc end <> 0

union all

select from YI_ASIM0020N as _reqi
  join      YI_ASIM0010N as _reqh on _reqh.Uuid = _reqi.ParentUUID
{
  key _reqi.Uuid,
      //진행상태 아이콘
      cast('3' as abap.char(1))                                                               as reqicon,
      cast('완료' as abap.char(10))                                                             as reqstatus,

      cast('1' as abap.char(1))                                                               as blicon,
      cast('미진행' as abap.char(10))                                                            as blstatus,

      cast('1' as abap.char(1))                                                               as eccicon,
      cast('미진행' as abap.char(10))                                                            as eccstatus,

      cast('1' as abap.char(1))                                                               as ccicon,
      cast('미진행' as abap.char(10))                                                            as ccstatus,

      cast('1' as abap.char(1))                                                               as gricon,
      cast('미진행' as abap.char(10))                                                            as grstatus,

      //연결정보
      _reqh.Reqmu,
      cast ('' as abap.char(10))                                                              as Mblnr,
      cast ('' as abap.numc(4))                                                               as Mjahr,
      cast ('' as abap.numc(4))                                                               as Zeile,
      cast ('' as abap.char(10))                                                              as Cclno,
      cast ('' as abap.numc(4))                                                               as Cclyr,
      cast ('' as abap.numc(4))                                                               as Cclnp,
      cast ('' as abap.char(10))                                                              as Eccno,
      cast ('' as abap.numc(4))                                                               as Eccyr,
      cast ('' as abap.numc(4))                                                               as Eccnp,
      cast ('' as abap.char(10))                                                              as Blino,
      cast ('' as abap.numc(4))                                                               as Bliyr,
      cast ('' as abap.numc(4))                                                               as Blinp,
      _reqi.Ebeln,
      _reqi.Ebelp,
      _reqi.Reqno,
      _reqi.Reqyr,
      _reqi.Itmno,

      //공통품목정보
      _reqi.Matnr,
      _reqi.Maktx,
      _reqi.Werks,
      _reqi.Werkst,
      _reqi.Lgort,
      _reqi.Lgortt,

      //입고품목
      cast('' as abap.char(10))                                                               as Charg,
      cast('' as abap.dats)                                                                   as Hsdat,
      cast('' as abap.dats)                                                                   as Vfdat,
      cast(0 as abap.dec(5,0))                                                                as Maxlz,
      cast('' as abap.char(18))                                                               as Grmat,
      cast('' as abap.char(50))                                                               as Grmakt,
      cast(0 as abap.dec(20,3))                                                               as Grmng,
      _reqi.Reqms                                                                             as Grmns,


      //입고 헤더
      cast('' as abap.dats)                                                                   as BudatGr,
      cast ('' as abap.char(10))                                                              as BelnrGr,
      cast ('' as abap.numc(4))                                                               as GjahrGr,
      cast ('' as abap.char(100))                                                             as Bktxt,
      cast ('' as abap.char(1))                                                               as Grche,

      //통관품목
      cast('' as abap.char(18))                                                               as Ccmat,
      cast('' as abap.char(50))                                                               as Ccmakt,
      cast(0 as abap.dec(20,3))                                                               as Cclmng,
      _reqi.Reqms                                                                             as Cclmns,

      //통관헤더
      cast('' as abap.char(20))                                                               as Decno,
      cast('' as abap.char(12))                                                               as Cclif,
      cast('' as abap.char(50))                                                               as Cclift,
      cast('' as abap.dats)                                                                   as Decdt,
      cast('' as abap.dats)                                                                   as Ccldt,
      cast('' as abap.char(12))                                                               as Ccper,
      cast('' as abap.char(50))                                                               as Ccpert,
      cast(0 as abap.curr(17,2))                                                              as Ccamt,
      cast(0 as abap.curr(17,2))                                                              as Ccamtk,
      cast(0 as abap.curr(13,2))                                                              as Ccvat1,
      cast(0 as abap.curr(13,2))                                                              as Ccvat2,
      cast(0 as abap.curr(23,2))                                                              as Hwbas,
      cast('' as waers)                                                                       as Ccwae,
      cast('' as waers)                                                                       as Ccwaek,
      cast(0 as abap.dec(9,5))                                                                as Ccrsf,
      cast('' as abap.dats)                                                                   as Ccdat1,
      cast('' as abap.dats)                                                                   as Ccdat2,
      cast('' as abap.char(30))                                                               as Cclog,
      cast('' as abap.char(12))                                                               as Ccmos,
      cast('' as abap.char(50))                                                               as Ccmost,
      cast('' as abap.char(12))                                                               as Cclgort,
      cast('' as abap.char(50))                                                               as Cclgortt,
      cast('' as abap.char(50))                                                               as Ccltx,

      //통관예정품목
      cast('' as abap.char(18))                                                               as Eccmat,
      cast('' as abap.char(50))                                                               as Eccmakt,
      cast(0 as abap.dec(20,3))                                                               as Eccmng,
      _reqi.Reqms                                                                             as Eccmns,
      cast('' as abap.char(10))                                                               as Quacd,
      cast('' as abap.char(50))                                                               as Quacdt,
      cast('' as abap.char(10))                                                               as Quars,
      cast('' as abap.char(50))                                                               as Quarst,
      cast('' as abap.dats)                                                                   as Quadt,
      cast(0 as abap.dec(20,3))                                                               as Failmng,
      cast(0 as abap.dec(20,3))                                                               as Sampmng,
      cast('' as abap.char(50))                                                               as Eccremak,

      //통관예정헤더
      cast('' as abap.dats)                                                                   as Eccdt,
      cast('' as abap.dats)                                                                   as Egrdt,
      cast('' as abap.char(50))                                                               as Eccmrn,
      cast('' as abap.char(50))                                                               as Ecctrn,
      cast('' as abap.char(50))                                                               as Eccwmn,

      //BL품목
      cast('' as abap.char(18))                                                               as Blmat,
      cast('' as abap.char(50))                                                               as Blmakt,
      cast(0 as abap.dec(20,3))                                                               as Blmng,
      _reqi.Reqms                                                                             as Blmns,
      cast(0 as abap.curr(17,2))                                                              as Blmpr,
      cast(0 as abap.dec(20,2))                                                               as Blmwr,
      cast(0 as abap.dec(5,0))                                                                as Blpnh,
      cast('' as abap.dats)                                                                   as Eindt,
      _reqi.Zdc1_p,
      cast(0 as abap.curr(16,2))                                                              as Zdc1_n,
      _reqi.Zdc2_p,
      cast(0 as abap.curr(16,2))                                                              as Zdc2_n,

      //BL헤더
      cast('' as abap.char(30))                                                               as Bleno,
      cast('' as abap.dats)                                                                   as Bldat,
      cast('' as abap.dats)                                                                   as Bleta,
      cast('' as abap.dats)                                                                   as Bletd,
      cast('' as abap.dats)                                                                   as Rqetd,
      cast('' as abap.dats)                                                                   as Rqeta,
      cast(0 as abap.dec(3,0))                                                                as Bld1t,
      cast('' as abap.dats)                                                                   as Bledt,
      cast('' as abap.dats)                                                                   as Bldat2,
      cast('' as abap.dats)                                                                   as Blgrd,
      cast(0 as abap.dec(20,3))                                                               as Brgew,
      cast(0 as abap.dec(20,3))                                                               as Negew,
      cast('' as abap.unit(3))                                                                as Gewei,
      cast('' as abap.char(20))                                                               as Lgnum,
      cast('' as abap.char(20))                                                               as Cntno,
      cast('' as abap.char(12))                                                               as Mosno,
      cast('' as abap.char(50))                                                               as Mosnot,
      cast(0 as abap.curr(17,2))                                                              as Blamt,
      cast('' as abap.char(50))                                                               as Blitx,
      cast('' as abap.char(1))                                                                as Blche,
      cast('' as abap.char(1))                                                                as Eccgb,

      //계약품목
      _reqi.Matnr                                                                             as Reqmat,
      _reqi.Maktx                                                                             as Reqmakt,
      _reqi.Modmg                                                                             as Reqmg,
      _reqi.Reqms,
      _reqi.Reqnr,
      cast(_reqi.Modmg * cast(_reqi.Reqnr as abap.dec(20,2)) / _reqi.Peinh as abap.dec(20,2)) as Reqwr,
      _reqi.Peinh,
      _reqi.Vbeln,
      _reqi.Zebeln,
      _reqi.Zebelp,
      _reqi.Knttp,
      _reqi.Sakto,
      _reqi.Anln1,
      _reqi.Kostl,

      //계약헤더
      _reqh.Reqdt,
      _reqh.Bukrs,
      _reqh.Bukrst,
      _reqh.Ekorg,
      _reqh.Ekorgt,
      _reqh.Ekgrp,
      _reqh.Ekgrpt,
      _reqh.Lifnr,
      _reqh.Lifnrt,
      _reqh.Loekz,
      _reqh.Lifre,
      _reqh.Lifret,
      _reqh.Inco1,
      _reqh.Inco1t,
      _reqh.Inco2,
      _reqh.Zterm,
      _reqh.Ztermt,
      _reqh.Zcdno1,
      _reqh.Zcdno1t,
      _reqh.Zcdno2,
      _reqh.Zcdno2t,
      _reqh.Zcdno3,
      _reqh.Zcdno3t,
      _reqh.Zcdno4,
      _reqh.Zcdno4t,
      _reqh.Netwr,
      _reqh.Waers,
      _reqh.Opdat,
      _reqh.Opbnk,
      _reqh.Opbnkt,
      _reqh.Opnum,
      _reqh.Opamt,
      _reqh.Opwrs,
      _reqh.Pterm,
      _reqh.Ptermt,
      _reqh.Zbd1t,
      _reqh.Pedat,
      _reqh.Pdate,
      _reqh.Oedat,
      _reqh.Oplif,
      _reqh.Oplift,
      _reqh.Sdate,
      _reqh.Edate,
      _reqh.Colif,
      _reqh.Colift,
      _reqh.Filif,
      _reqh.Filift,
      _reqh.Cont1,
      _reqh.Cont2,
      _reqh.Acdat,
      _reqh.Bokno,
      _reqh.Conrt,
      _reqh.Conrtt,
      _reqh.Trdat,
      _reqh.Trbln,
      _reqh.Rqrsf,
      _reqh.Bbrsf,
      _reqh.Bbamt,
      _reqh.Bbwrs,
      _reqh.Bbdat,
      _reqh.Bbgb,
      _reqh.Bbgbt,
      _reqh.Rqche,
      _reqh.Isdat,
      _reqh.Rqweek,
      _reqh.Bbno,
      _reqh.Bblif,
      _reqh.Bblift,
      _reqh.Bbrate,
      _reqh.Remak
}
where
      _reqh.Loekz =  ''
  and _reqi.Loekz =  ''
  and _reqi.Modmg <> 0

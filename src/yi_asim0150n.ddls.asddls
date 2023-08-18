@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입마감 인터페이스 뷰'
define root view entity YI_ASIM0150N
  as select from zasimt0150n
{
        @ObjectModel.filter.enabled: false
  key   uuid  as Uuid,

        @EndUserText.label: '구매 문서 번호'
        ebeln as Ebeln,
        @EndUserText.label: '품목 번호'
        ebelp as Ebelp,
        @EndUserText.label: '전기일'
        budat as Budat,
        @EndUserText.label: '수입완료'
        imche as Imche,
        @EndUserText.label: '마감참조번호'
        belnr as Belnr,
        @EndUserText.label: '회계연도'
        gjahr as Gjahr

}

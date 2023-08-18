@EndUserText.label: '수입마감 컨섭션 뷰'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity YC_ASIM0150N
  provider contract transactional_query
  as projection on YI_ASIM0150N
{
  key Uuid,
      Ebeln,
      Ebelp,
      Budat,
      Imche,
      Belnr,
      Gjahr
}

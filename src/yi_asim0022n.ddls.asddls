@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '수입 구매오더 아이템 인터페이스 뷰'

define view entity YI_ASIM0022N
  as select from YI_ASIM0011N
{
      @EndUserText.label: '구매문서번호'
  key Ebeln,
  
      @EndUserText.label: '구매문서품목번호'
  key Ebelp,
  
      @EndUserText.label: '계정지정범주'
      Knttp,
      
      @ObjectModel.text.element: [ 'Maktx' ]
      @EndUserText.label: '자재번호'
      Matnr,
      
      @EndUserText.label: '자재명'
      Maktx,
      
      @ObjectModel.text.element: [ 'Werkst' ]
      @EndUserText.label: '플랜트'
      Werks,
      
      @EndUserText.label: '플랜트명'
      Werkst,
      
      @EndUserText.label: '저장위치'
      Lgort,

      @EndUserText.label: '저장위치명'
      Lgortt,

      @Semantics.quantity.unitOfMeasure: 'Reqms'
      @EndUserText.label: '계약수량'
      Menge as Reqmg,

      @EndUserText.label: '계약단위'
      PurchaseOrderQuantityUnit as Reqms,
      
      @EndUserText.label: '오더단위'
      PurchaseOrderQuantityUnit,

      @Semantics.amount.currencyCode : 'Waers'
      @EndUserText.label: '계약단가'
      Netpr as Reqnr,

      @Semantics.amount.currencyCode : 'Waers'
      @EndUserText.label: '계약금액'
      Netwr as Reqwr,
         
       /* 무게 단위 어노테이션을 필요로하는 이유? */    
      @Semantics.quantity.unitOfMeasure: 'Reqms' 
      @EndUserText.label: '가격단위'
      Peinh,
      
      @EndUserText.label: '통화키'
      Waers,
      
      @EndUserText.label: 'G/L계정'
      Sakto,

      @EndUserText.label: '자산번호'
      Anln1,

      @EndUserText.label: '코스트센터'
      Kostl,

      @EndUserText.label: '관세율'
      Zdc1_p,

      @EndUserText.label: '부대비율'
      Zdc2_p,

    //  @Semantics.amount.currencyCode : 'Waers'
    //  @EndUserText.label: '관세액'
    //  Zdc1_n,

    //  @Semantics.amount.currencyCode : 'Waers'
    //  @EndUserText.label: '부대비액'
    //  Zdc2_n,
      
       /*수입PO 기생성여부 확인 chk = 'X'이면 생성완료 수입계약PO참조 생성 시 제외처리 */
      chk


}

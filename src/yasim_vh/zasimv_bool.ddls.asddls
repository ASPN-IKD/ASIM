@EndUserText.label: '예/아니요 도움말 뷰'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ObjectModel.resultSet.sizeCategory: #XS
define root  view entity ZASIMV_BOOL as select from zasimtboolean {
    
    @ObjectModel.text.element: [ 'text' ] 
    key yboolean as boolean,
    
    case yboolean when 'X' then '예'
        else '아니오' end as text
}

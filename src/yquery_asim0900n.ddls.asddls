@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: '수입원가현황 쿼리 뷰'

@Analytics.query: true

@UI.chart: [{
    qualifier: 'OccupiedSeats',
    chartType: #COLUMN,
    dimensions:  [ 'Reqmu' ],
    measures:  [ 'Netwrk', 'Waersk', 'Rmmwrk', 'Wmwstk' ]
}]


define view entity YQUERY_ASIM0900N
  as select from  YCUBE_ASIM0900N
{

          //ROWS
          @AnalyticsDetails.query.axis: #FREE
  key        Reqmu,

          @AnalyticsDetails.query.axis: #FREE
          Ebeln,

          @AnalyticsDetails.query.axis: #FREE
          Ebelp,

          @AnalyticsDetails.query.axis: #ROWS
          Feegb,
          Feegbt,

          //COLUMNS
          @AnalyticsDetails.query.axis: #COLUMNS
          Netwrk,
          @AnalyticsDetails.query.axis: #COLUMNS
          Waersk,
          @AnalyticsDetails.query.axis: #COLUMNS
          Rmmwrk,
          @AnalyticsDetails.query.axis: #COLUMNS
          Wmwstk


}

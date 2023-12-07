@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: '수입원가현황 큐브 뷰'
//@Metadata.ignorePropagatedAnnotations: true

@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL


define view entity YCUBE_ASIM0900N
  as select from YI_ASIM0900N
{
      @UI.lineItem: [{ position : 10, emphasized: true  }]
      @UI.selectionField: [{ position : 10, exclude: true  }]
  key Reqmu,
      @UI.lineItem: [{ position : 20, emphasized: true }]
      @UI.selectionField: [{ position : 20 }]
  key Ebeln,
      @UI.lineItem: [{ position : 30 }]
  key Ebelp,
      @UI.lineItem: [{ position : 40 }]
  key Feegb,
      @UI.lineItem: [{ position : 50 }]
  key Feeno,
      @UI.lineItem: [{ position : 60 }]
  key Feeyr,
      @UI.lineItem: [{ position : 70 }]
  key Feenp,
      @Semantics.text: true
      Feegbt,
      @ObjectModel.text.element: ['Zcdnot']
      @UI.lineItem: [{ position : 90 }]
      Zcdno,
      Zcdnot,
      @ObjectModel.text.element: ['Maktx']
      @UI.selectionField: [{ position : 50 }]
      @UI.lineItem: [{ position : 100 }]
      Matnr,
      Maktx,
      @ObjectModel.text.element: ['Werkst']
      @UI.selectionField: [{ position : 60 }]
      @UI.lineItem: [{ position : 110 }]
      Werks,
      Werkst,
      @Semantics.calendar.dayOfYear: true
      @UI.lineItem: [{ position : 120 }]
      Budat,
      @EndUserText.label: '공급처'
      @ObjectModel.text.element: ['Lifret']
      @UI.lineItem: [{ position : 130 }]
      Lifre,
      Lifret,
      @ObjectModel.text.element: ['Ztermt']
      @UI.lineItem: [{ position : 140 }]
      Zterm,
      Ztermt,
      @Semantics.quantity.unitOfMeasure: 'Meins'
      Menge,
      Meins,
      Waers,
      @Semantics.amount.currencyCode : 'Waers'
      @DefaultAggregation: #SUM
        @UI.lineItem: [{ position : 150 }]
      Netwr,
      @Semantics.amount.currencyCode : 'Waers'
      @DefaultAggregation: #SUM
        @UI.lineItem: [{ position : 160 }]
      Wmwst,
      @DefaultAggregation: #SUM
      @Semantics.amount.currencyCode : 'Waers'
        @UI.lineItem: [{ position : 170 }]
      Rmmwr,
        @UI.lineItem: [{ position : 180 }]
      Waersk,
      @DefaultAggregation: #SUM
        @UI.lineItem: [{ position : 190 }]
      Netwrk,
      @DefaultAggregation: #SUM
        @UI.lineItem: [{ position : 200 }]
      Wmwstk,
      @DefaultAggregation: #SUM
        @UI.lineItem: [{ position : 210 }]
      Rmmwrk,
      @DefaultAggregation: #SUM
      DmbtrGr,
      @DefaultAggregation: #SUM
      DmbtrGrir,
      @DefaultAggregation: #SUM
      DmbtrTot,
      @DefaultAggregation: #SUM
      MengeGr,
      @DefaultAggregation: #SUM
      NetprGr,
      Zlsch,
      Zlscht,
      Mwskz,
      Mwskzt,
      Zfbdt,
      Fbedt,
      Kursf,
      Belnr,
      Gjahr,
      @UI.selectionField: [{ position : 70 }]
       @UI.lineItem: [{ position : 220 }]
      Bukrs,
      Bukrst,
      @UI.selectionField: [{ position : 40 }]
       @UI.lineItem: [{ position : 230 }]
      Ekorg,
      Ekorgt,
      @UI.selectionField: [{ position : 80 }]
       @UI.lineItem: [{ position : 240 }]
      Lifnr,
      Lifnrt,
      @UI.selectionField: [{ position : 30 }]
       @UI.lineItem: [{ position : 250 }]
      Cont1,
      Cont2,
      Reqdt,
      Inco1,
      Inco1t,
      Inco2,
      Zcdno1,
      Zcdno2,
      Zcdno3,
      Zcdno4,
      Zcdno1t,
      Zcdno2t,
      Zcdno3t,
      Zcdno4t,
      Opnum,
      Opdat,
      Opbnk,
      Opbnkt,
      Bleno,
      Bletd,
      Bleta,
      Bldat,
      Decno,
      Decdt,
      Cclif,
      Cclift,
      Ccldt,
      Cclgort,
      Cclgortt,
      BudatGr,
      
      @UI.lineItem: [{ criticality: 'status', position: 150, criticalityRepresentation: #ONLY_ICON }]
      @EndUserText.label: '전기결과'
      case BudatGr
      when '0000-00-00' then 2
      else 3
      end as status,
      Lgort,
      Lgortt
}

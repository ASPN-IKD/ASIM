@EndUserText.label: 'TEST001'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity Z_TEST_0001 

as select from ZASIMV_REQNO 


{
    key Uuid,
    Reqno,
    Reqyr,
    Reqmu,
    Cont1,
    Cont2,
    Reqdt,
    Bukrs,
    Bukrst,
    Ekorg,
    Ekorgt,
    Ekgrp,
    Ekgrpt,
    Lifnr,
    Lifnrt,
    Lifre,
    Lifret,
    Inco1,
    Inco1t,
    Inco2,
    Zterm,
    Ztermt,
    Netwr,
    Waers,
    Zcdno1,
    Zcdno1t,
    Zcdno2,
    Zcdno2t,
    Zcdno3,
    Zcdno3t,
    Zcdno4,
    Zcdno4t,
    Opdat,
    Opnum,
    Opbnk,
    Opbnkt,
    Opamt,
    Opwrs,
    Pterm,
    Ptermt,
    Oplif,
    Oplift,
    Acdat,
    Bbno,
    Crtnm,
    Crtdt,
    del
  
} where del = 'X'

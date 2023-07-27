CLASS zcl_insert_data_zasimt0000c DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_insert_data_zasimt0000c IMPLEMENTATION.

    METHOD if_oo_adt_classrun~main.
    DATA: ls_data TYPE zasimt0000c.
    DATA: lv_uuid TYPE sysuuid_x16.

    DATA: system_uuid TYPE REF TO if_system_uuid,
          uuid        TYPE sysuuid_c32.

      ls_data-client = '080'.
      ls_data-uuid = lv_uuid.
      ls_data-progid = 'IM01'.
      ls_data-viewid = 'POIF'.
      ls_data-prognm = '수입계약(신규)'.
      ls_data-viewnm = '발주정보'.
      ls_data-viewob = '1'.
      ls_data-viewat = ''.
      ls_data-viewtp = 'B'.
      ls_data-usediv = 'Y'.
      ls_data-fieldc = 'Bukrs|Ekorg|Ekgrp|Lifnr|Ekgrp|Zterm|Inco1|Netwr'.
      ls_data-fieldu = 'Lifnr|Inco1|Netwr'.
      ls_data-cdsvid = ''.

      TRY.
          INSERT zasimt0000c FROM @ls_data.
      ENDTRY.

      ls_data-client = '080'.
      ls_data-uuid = lv_uuid.
      ls_data-progid = 'IM01'.
      ls_data-viewid = 'IMIF'.
      ls_data-prognm = '수입계약(신규)'.
      ls_data-viewnm = '수입정보'.
      ls_data-viewob = '2'.
      ls_data-viewat = ''.
      ls_data-viewtp = 'B'.
      ls_data-usediv = 'Y'.
      ls_data-fieldc = 'Bukrs|Ekorg|Ekgrp|Lifnr|Ekgrp|Zterm|Inco1|Netwr'.
      ls_data-fieldu = 'Inco1|Netwr'.
      ls_data-cdsvid = ''.

      TRY.
          INSERT zasimt0000c FROM @ls_data.
      ENDTRY.

      ls_data-client = '080'.
      ls_data-uuid = lv_uuid.
      ls_data-progid = 'IM01'.
      ls_data-viewid = 'GSIF'.
      ls_data-prognm = '수입계약(신규)'.
      ls_data-viewnm = '개설정보'.
      ls_data-viewob = '3'.
      ls_data-viewat = ''.
      ls_data-viewtp = 'B'.
      ls_data-usediv = 'Y'.
      ls_data-fieldc = 'Bukrs|Ekorg|Ekgrp|Lifnr|Ekgrp|Zterm|Inco1|Netwr'.
      ls_data-fieldu = 'Inco1|Netwr'.
      ls_data-cdsvid = ''.

      TRY.
          INSERT zasimt0000c FROM @ls_data.
      ENDTRY.

      ls_data-client = '080'.
      ls_data-uuid = lv_uuid.
      ls_data-progid = 'IM01'.
      ls_data-viewid = 'BBIF'.
      ls_data-prognm = '수입계약(신규)'.
      ls_data-viewnm = '부보정보'.
      ls_data-viewob = '4'.
      ls_data-viewat = ''.
      ls_data-viewtp = 'B'.
      ls_data-usediv = 'Y'.
      ls_data-fieldc = 'Bukrs|Ekorg|Ekgrp|Lifnr|Ekgrp|Zterm|Inco1|Netwr'.
      ls_data-fieldu = 'Inco1|Netwr'.
      ls_data-cdsvid = ''.

      TRY.
          INSERT zasimt0000c FROM @ls_data.
      ENDTRY.

      ls_data-client = '080'.
      ls_data-uuid = lv_uuid.
      ls_data-progid = 'IM01'.
      ls_data-viewid = 'ITIF'.
      ls_data-prognm = '수입계약(신규)'.
      ls_data-viewnm = '품목'.
      ls_data-viewob = '5'.
      ls_data-viewat = ''.
      ls_data-viewtp = 'G'.
      ls_data-usediv = 'Y'.
      ls_data-fieldc = 'Bukrs|Ekorg|Ekgrp|Lifnr|Ekgrp|Zterm|Inco1|Netwr'.
      ls_data-fieldu = 'Inco1|Netwr'.
      ls_data-cdsvid = ''.

      TRY.
          INSERT zasimt0000c FROM @ls_data.
      ENDTRY.

      ls_data-client = '080'.
      ls_data-uuid = lv_uuid.
      ls_data-progid = 'IM01'.
      ls_data-viewid = 'FIIF'.
      ls_data-prognm = '수입계약(신규)'.
      ls_data-viewnm = '첨부파일'.
      ls_data-viewob = '6'.
      ls_data-viewat = ''.
      ls_data-viewtp = 'B'.
      ls_data-usediv = 'Y'.
      ls_data-fieldc = 'Bukrs|Ekorg|Ekgrp|Lifnr|Ekgrp|Zterm|Inco1|Netwr'.
      ls_data-fieldu = 'Inco1|Netwr'.
      ls_data-cdsvid = ''.

      TRY.
          INSERT zasimt0000c FROM @ls_data.
      ENDTRY.

    ENDMETHOD.

ENDCLASS.

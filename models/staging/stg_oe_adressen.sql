{{ config(materialized='table') }}

with source_data as (

    select
     idbid0222_0_8,
     int_upd_date,
     int_upd_time,
     oee_kurzbez,
     oee_bez, 
     oee_strasse, 
     oee_plz, 
     oee_ort, 
     oee_vater, 
     oee_lfa1, 
     oee_vtr, 
     oee_ivtr, 
     oee_zkd, 
     oee_zkd_netto_d, 
     oee_skonto1_prozent, 
     oee_skonto1_d, 
     oee_skonto2_prozent, 
     oee_skonto2_d, 
     oee_versandart, 
     oee_versandtarif, 
     oee_id_tree4, 
     oee_hid_tree4, 
     oee_debitor, 
     oee_vpartner, 
     oee_kostenstelle, 
     ee_lpartner, 
     oee_art, 
     oee_aktiv, 
     oee_mail, 
     oee_ab_mail, 
     oee_znr_debitor, 
     oee_ebene, 
     oee_zeiger_preisblatt, 
     oee_lfa2, 
     oee_lfa3, 
     oee_lfa4, 
     oee_lfa5, 
     oee_id_tree5, 
     oee_hid_tree5
    from {{ source('raw', 'm36id0222') }}

)

select *
from source_data
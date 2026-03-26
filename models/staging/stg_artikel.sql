{{ config(materialized='table') }}

with source_data as (

    select
        distinct art_1_25           as art_artikelnummer,
        art_51_60                   as art_artikelname,
        art_4545_4                  as art_hauptkategorie_id,
        art_4549_4                  as art_nebenkategorie_id,
        art_3614_10                 as art_letzte_preisaenderung,
        art_3704_8                  as art_paletteninhalt
    from {{ source('raw', 'm36art') }}

)

select *
from source_data
{{ config(materialized='table') }}

with source_data as (

    select
        distinct art_1_25           as art_artikelnummer,
        art_51_60                   as art_artikelname,
        art_4545_4                  as art_hauptkategorie_id
    from {{ source('raw', 'm36art') }}

)

select *
from source_data
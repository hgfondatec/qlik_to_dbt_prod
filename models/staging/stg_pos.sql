{{ config(materialized='table') }}

with source_data as (

    select
        pos_0_17           as pos_bel_id,
        pos_2_1            as pos_belegart,
        pos_3_8            as pos_belegnummer,
        pos_18_25          as pos_artikelnummer,
        pos_1734_9         as pos_rohertrag,
        pos_164_8          as pos_gesamtmenge,
        pos_280_12         as pos_gesamtumsatz
    from {{ source('raw', 'm36pos') }}

)

select *
from source_data
{{ config(materialized='table') }}

with source_data as (

    select
        pos_bel_id,
        pos_belegart,
        pos_belegnummer,
        pos_artikelnummer,
        pos_rohertrag,
        pos_gesamtmenge,
        pos_gesamtumsatz
    from {{ ref('stg_pos') }}
    where pos_belegart = 'L'

)

select *
from source_data
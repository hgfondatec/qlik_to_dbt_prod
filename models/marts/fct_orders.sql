{{ config(materialized='table') }}

with source_data as (

    select
        distinct b.bel_belegnummer,
        b.bel_belegdatum,
        b.adr_adressnummer,
        b.bel_belegbrutto,
        b.bel_belegnetto,
        art.bel_belegname,
        s.oee_bez
    from {{ ref('stg_bel') }} b
    LEFT JOIN {{ ref('stg_oe_adressen') }} s on s.idbid0222_0_8 = b.adress_key
    LEFT JOIN {{ ref('stg_beleg_arten') }} art on art.bel_belegart = b.bel_belegart
    order by bel_belegdatum desc
    

)

select *
from source_data
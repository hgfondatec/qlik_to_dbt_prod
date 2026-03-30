{{ config(materialized='table') }}

with source_data as (

    select
      bel_belegnummer as lieferungs_nummer,
      bel_belegdatum as lieferungs_datum,
      bel_interne_belegnummer
    from {{ ref('stg_bel') }}
    where bel_belegart = 'L'

)

select *
from source_data
{{ config(materialized='table') }}

with source_data as (

    select
      bel_belegnummer as rechnungs_nummer,
      bel_belegdatum rechnungs_datum,
      bel_interne_belegnummer,
      bel_lieferschein_nr
    from {{ ref('stg_bel') }}
    where bel_belegart = 'R'

)

select *
from source_data
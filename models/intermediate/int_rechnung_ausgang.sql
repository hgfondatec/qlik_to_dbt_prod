{{ config(materialized='table') }}

with source_data as (

    select
      bel_belegnummer,
      bel_belegdatum,
      bel_interne_belegnummer,
      bel_lieferschein_nr
    from {{ ref('stg_bel') }}
    where bel_belegart = 'R'

)

select *
from source_data
{{ config(materialized='table') }}

with source_data as (

    select
      bel_belegnummer,
      bel_belegdatum,
      bel_interne_belegnummer
    from {{ ref('stg_bel') }}
    where bel_belegart = 'L'

)

select *
from source_data
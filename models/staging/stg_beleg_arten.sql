{{ config(materialized='table') }}

with source_data as (

    select
      bel_belegart as bel_belegart,
      bel_belegkreis as bel_belegkreis, 
      bel_belegname as bel_belegname
    from {{ ref('beleg_arten') }}

)

select *
from source_data
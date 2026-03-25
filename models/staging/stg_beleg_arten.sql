{{ config(materialized='table') }}

with source_data as (

    select
      "BEL_Belegart" as bel_belegart,
      "BEL_Belegkreis" as bel_belegkreis, 
      "BEL_Belegname" as bel_belegname
    from {{ ref('beleg_arten') }}

)

select *
from source_data
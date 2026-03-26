{{ config(materialized='table') }}

with source_data as (

    select
      bel_vertreter,
      SPLIT_PART(bel_vertreter_concat, '-', 2) AS bel_vertreter_name,
      bel_vertreter_concat
    from {{ ref('stg_vertreter') }}

)

select *
from source_data
{{ config(materialized='table') }}

with source_data as (

    select
      *
    from {{ ref('int_vertreter') }}

)

select *
from source_data
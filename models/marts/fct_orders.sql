{{ config(materialized='table') }}

with source_data as (

    select
        *
    from {{ ref('stg_bel') }}

)

select *
from source_data
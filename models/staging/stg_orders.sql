{{ config(materialized='table') }}

with source_data as (

    select
        *
    from {{ source('raw', 'm36bel') }}

)

select *
from source_data
{{ config(materialized='table') }}

with source_data as (

    select
        *
    from {{ source('raw', 'm36art') }}

)

select *
from source_data
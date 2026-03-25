{{ config(materialized='table') }}

with source_data as (

    select
        *
    from {{ ref('stg_orders') }}

)

select *
from source_data
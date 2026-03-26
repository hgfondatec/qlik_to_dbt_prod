{{ config(materialized='table') }}

with source_data as (

    select
        "ID" as art_nebenkategorie_id,
        "Nebenkategorie" as art_nebenkategorie_name
    from {{ ref('nebenkategorie') }}

)

select *
from source_data
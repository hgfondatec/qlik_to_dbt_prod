{{ config(materialized='table') }}

with source_data as (

    select
        art_nebenkategorie_id,
        art_nebenkategorie_name,
        art_nebenkategorie_id || ' - ' || art_nebenkategorie_name as art_nebenkategorie_bezeichnung
    from {{ ref('stg_nebenkategorie') }}

)

select *
from source_data
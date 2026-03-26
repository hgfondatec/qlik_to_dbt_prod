{{ config(materialized='table') }}

with source_data as (

    select
        art_hauptkategorie_id,
        art_hauptkategorie_name,
        art_hauptkategorie_id || ' - ' || art_hauptkategorie_name as art_hauptkategorie_bezeichnung
    from {{ ref('stg_hauptkategorie') }}

)

select *
from source_data
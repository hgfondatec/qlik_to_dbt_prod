{{ config(materialized='table') }}

with source_data as (

    select
        "Hauptkategorie_ID" as art_hauptkategorie_id,
        "Hauptkategorie_Name" as art_hauptkategorie_name
    from {{ ref('hauptkategorie') }}

)

select *
from source_data
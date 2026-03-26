{{ config(materialized='table') }}

with base as (

    select
      *
    from {{ ref('int_artikel') }}

),
hauptkategorie as (
    
    select 
        *
    from {{ ref('int_hauptkategorie') }}
)

select 
    base.art_artikelnummer,
    base.art_artikelname,
    hauptkategorie.art_hauptkategorie_name,
    hauptkategorie.art_hauptkategorie_bezeichnung
from 
    base 
    left join hauptkategorie 
        on base.art_hauptkategorie_id = hauptkategorie.art_hauptkategorie_id
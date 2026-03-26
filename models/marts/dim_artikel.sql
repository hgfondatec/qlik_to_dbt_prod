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
),
nebenkategorie as (
    
    select 
        *
    from {{ ref('int_nebenkategorie') }}
)

select 
    base.art_artikelnummer,
    base.art_artikelname,
    hauptkategorie.art_hauptkategorie_name,
    hauptkategorie.art_hauptkategorie_bezeichnung,
    nebenkategorie.art_nebenkategorie_name,
    nebenkategorie.art_nebenkategorie_bezeichnung,
    base.art_letzte_preisaenderung,
    base.art_paletteninhalt
from 
    base 
    left join hauptkategorie 
        on base.art_hauptkategorie_id = hauptkategorie.art_hauptkategorie_id
    left join nebenkategorie 
        on base.art_nebenkategorie_id = nebenkategorie.art_nebenkategorie_id
order by base.art_artikelnummer
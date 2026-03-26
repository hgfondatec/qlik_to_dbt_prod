{{ config(materialized='table') }}

with source_data as (

    select
      art_artikelnummer,
      art_artikelname,
      coalesce(cast(art_hauptkategorie_id as text), 'XX') as art_hauptkategorie_id,
      coalesce(cast(art_nebenkategorie_id as text), 'XX') as art_nebenkategorie_id,
      art_letzte_preisaenderung,
      art_paletteninhalt
    from {{ ref('stg_artikel') }}

)

select *
from source_data
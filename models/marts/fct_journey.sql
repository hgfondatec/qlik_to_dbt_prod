{{ config(materialized='table') }}

with base as (

    select
      *
    from {{ ref('int_angebot_ausgang') }}

),
lieferung as (
    select 
        *
    from {{ ref('int_lieferung_ausgang') }}
),
rechnung as (
    select 
        *
    from {{ ref('int_rechnung_ausgang') }}
)
select 
    base.angebots_nummer,
    base.angebots_datum,
    base.adr_adressnummer,
    lieferung.lieferungs_nummer,
    lieferung.lieferungs_datum,
    rechnung.rechnungs_nummer,
    rechnung.rechnungs_datum
    from base
    left join lieferung 
        on base.angebots_nummer = lieferung.bel_interne_belegnummer
    left join rechnung
        on rechnung.bel_lieferschein_nr = lieferung.lieferungs_nummer AND rechnung.bel_interne_belegnummer = base.angebots_nummer
    order by base.angebots_nummer
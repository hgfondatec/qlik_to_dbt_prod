{{ config(materialized='table') }}


with korrekte_belegnummer as (

    select
        bel_belegnummer
    from {{ ref('stg_bel') }}
    where bel_belegart = 'A'
    group by bel_belegnummer
    having count(distinct adr_adressnummer) = 1

),

source_data as (

  select distinct
    k.bel_belegnummer angebots_nummer,
    s.bel_belegdatum as angebots_datum,
    s.adr_adressnummer
  from {{ ref('stg_bel') }} s
  left join korrekte_belegnummer k on k.bel_belegnummer = s.bel_belegnummer
  where k.bel_belegnummer is not null 
   
)

select *
from source_data
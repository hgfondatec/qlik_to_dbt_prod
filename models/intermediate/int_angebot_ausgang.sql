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
    f.bel_belegnummer,
    s.bel_belegdatum,
    s.adr_adressnummer
  from {{ ref('stg_bel') }} s
  left join korrekte_belegnummer f
    on s.bel_belegnummer = f.bel_belegnummer
  where s.bel_belegart = 'A'
  
   
)

select *
from source_data
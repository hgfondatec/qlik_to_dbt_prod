{{ config(materialized='table') }}


with fehlerhafte_belegnummern as (

    select
        bel_belegnummer
    from {{ ref('stg_bel') }}
    where bel_belegart = 'A'
    group by bel_belegnummer
    having count(distinct adr_adressnummer) > 1

),

source_data as (

  select distinct
    s.bel_belegnummer,
    s.adr_adressnummer,
    'different adr_adressnummer for same bel_belegnummer' as reason
  from {{ ref('stg_bel') }} s
  inner join fehlerhafte_belegnummern f
    on s.bel_belegnummer = f.bel_belegnummer
  where s.bel_belegart = 'A'
  
   
)

select *
from source_data
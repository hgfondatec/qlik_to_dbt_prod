{{ config(materialized='table') }}

with source_data as (

    select
      "ADR_Vertreter" as bel_vertreter,
      "ADR_Vertreter Lang" as bel_vertreter_concat
    from {{ ref('vertreter') }}

)

select *
from source_data
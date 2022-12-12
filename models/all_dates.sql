{{
    config(
        materialized='table'
    )
}}

{{
    dbt_utils.date_spine(
        datepart="day",
        start_date=var('start_date_var'),
        end_date=var('end_date_var')
    )
}}
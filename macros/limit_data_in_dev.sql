{%- macro limit_data_in_dev(column_name, dev_data_in_days=3) -%}
{%- if target.name == 'dev' -%}
where {{column_name}} >= dateadd(day, -{{dev_data_in_days}}, current_timestamp)
{%- endif %}
{% endmacro %}
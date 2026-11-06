{% macro time_stm(column_name, precision=2) -%}
round({{ column_name }} / 60, {{precision }})
{%- endmacro %}

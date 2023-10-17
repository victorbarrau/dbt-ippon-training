{% macro mockable_source(name_source,table_name,sample_name) %}
{% if target.name == 'CI' %}
    {{ ref (sample_name ) }}
{% else %}
    {{source(name_source,table_name)}}
{% endif %}
{% endmacro %}
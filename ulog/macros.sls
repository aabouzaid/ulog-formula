# Macros.

# Format config file sections.
{%- macro format_stacks(sections) -%}
  {%- for section_name, section_config in sections.items() -%}
{{ "\n" }}# {{ section_name | capitalize }} Stack.
stack="{{ section_config.stack | join(',') }}"
  {% endfor -%}
{% endmacro -%}

# Format config file sections.
{%- macro format_sections(sections) -%}
  {%- for section_name, section_config in sections.items() %}
{{ "\n" }}# {{ section_name | capitalize }} Stack.
    {%- for config_name, config_vars in section_config.config.items() %}
[{{ "%s_%s" % (section_name, config_name) }}]
      {%- for key, val in config_vars.vars.items() %}
{{ key }}={{ val }}
      {%- endfor -%}
    {% endfor -%}
  {% endfor %}
{%- endmacro -%}

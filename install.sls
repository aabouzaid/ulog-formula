{% from slspath + "/map.jinja" import ulog with context %}

{{ sls }}~system_package:
  pkg.installed:
    - names: {{ ulog.pkgs }}

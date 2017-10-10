{% from slspath + "/map.jinja" import ulog with context %}

{{ sls }}~system:
  service.running:
    - name: {{ ulog.service.name }}
    - enable: True

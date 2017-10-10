{% from slspath + "/map.jinja" import ulog with context %}

{{ sls }}~main_config_file:
  file.managed:
    - source: salt://ulog/templates/ulogd.conf.jinja
    - name: /etc/ulogd.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 0600
    - context:
        cfg: {{ ulog }}
    - watch_in:
       - service: {{ ulog.service.name }}

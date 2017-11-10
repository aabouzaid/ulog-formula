======
ulog
======
Install and configure a `ulogd <https://www.netfilter.org/projects/ulogd/>`_ the userspace logging daemon for netfilter/iptables related logging.

.. Note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``ulog``
------------

Installs and configures ``ulogd`` service.

Configuration
=============

You need to configure a stack inside ``sections``
to make the "stack" use it inside ``/etc/ulogd.conf``.

For example, this will create a stack to log "iptables" connection tracking events.

.. code:: yaml

    ulog:

      sections:

        iptables:

          stack:
            - "base1:BASE"
            - "ifi1:IFINDEX"
            - "ip2str1:IP2STR"
            - "print1:PRINTPKT"

          config:
            input01:
              plugin: NFLOG
              vars:
                group: 30

            output01:
              plugin: LOGEMU
              vars:
                file: /var/log/iptables.log

.. vim: fenc=utf-8 spell spl=en cc=100 tw=99 fo=want sts=4 sw=4 et

salt-connect-mysql-packages:
  pkg.installed:
    - names:
      - mysql-server
      - mysql-client
      - python-mysqldb

# http://docs.saltstack.com/ref/modules/all/salt.modules.mysql.html#module-salt.modules.mysql
salt-connect-mysql-config:
  file.managed:
    - template: jinja
    - name: /etc/salt/minion.d/mysql.conf
    - source: salt://mysql/salt_connect/mysql.conf
    - user: root
    - group: root
    - mode: 0644
    - require:
      - pkg: salt-connect-mysql-packages

restart-minion:
  cmd.wait:
    - name: "service salt-minion restart"
    - order: last
    - watch:
      - file: salt-connect-mysql-config

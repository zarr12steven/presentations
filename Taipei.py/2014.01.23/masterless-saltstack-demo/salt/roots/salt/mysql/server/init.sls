include:
  - mysql.salt_connect
  - mysql.client

mysql-server-packages:
  pkg.installed:
    - names:
      - mysql-server

/etc/mysql/my.cnf:
  file.managed:
    - template: jinja
    - user: root
    - group: root
    - mode: 0644
    - source: salt://mysql/server/my.cnf
    - require:
      - pkg: mysql-server-packages
    # - watch_in:
    #   - service: mysql-server

mysql-server:
  service.running:
    - name: mysql
    - enable: True
    - require:
      - pkg: mysql-server-packages

mysql-db:
  mysql_database.present:
    - name: "{{ pillar['mysql']['db_name'] }}"
    - require:
      - service: mysql-server
      - file: salt-connect-mysql-config

mysql-user:
  mysql_user.present:
    - name: "{{ pillar['mysql']['db_user'] }}"
    - password: "{{ pillar['mysql']['db_password'] }}"
    - host: "localhost"
    - require:
      - service: mysql-server
      - file: salt-connect-mysql-config

mysql-db-user-grants:
   mysql_grants.present:
    - grant: ALL PRIVILEGES
    - database: "{{ pillar['mysql']['db_name'] }}.*"
    - user: "{{ pillar['mysql']['db_user'] }}"
    - host: "localhost"
    - require:
      - mysql_user: mysql-user
      - mysql_database: mysql-db

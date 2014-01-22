rabbitmq-server-packages:
  pkg.installed:
    - names:
      - rabbitmq-server

rabbitmq-server-service:
  service.running:
    - name: rabbitmq-server
    - enable: True
    - require:
      - pkg: rabbitmq-server-packages

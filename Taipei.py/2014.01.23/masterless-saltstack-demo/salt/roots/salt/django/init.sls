include:
  - python
  - python.pillow
  - memcache.client
  - mysql.client

project-repo:
  git.latest:
    - name: git@github.com:OnePiece/op.git
    - rev: master
    - target: /home/vinta/op
    - user: luffy
    # https://help.github.com/articles/managing-deploy-keys#deploy-keys
    # - require:
    #   - file: github-private-key
    #   - file: github-public-key

project-virtualenv:
  virtualenv.manage:
    - name: /home/vinta/.virtualenvs/op
    - system_site_packages: False
    - user: luffy
    - require:
      - pkg: python-packages

project-pip-requirements:
  pip.installed:
    - bin_env: /home/vinta/.virtualenvs/op
    - requirements: /home/vinta/op/requirements.txt
    - user: luffy
    - require:
      - pkg: memcache-client-packages
      - pkg: mysql-client-packages
      - pkg: pillow-libs-packages
      - virtualenv: project-virtualenv

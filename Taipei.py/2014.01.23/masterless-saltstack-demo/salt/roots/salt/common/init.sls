# include:
#   - common.time

create-captain:
  user.present:
    - name: luffy
    - home: /home/luffy
    - shell: /bin/bash

# {% for username in pillar['users'] %}
# create-user-{{ username }}:
#   user.present:
#     - name: {{ username }}
#     - home: /home/{{ username }}
#     - shell: /bin/bash
# {% endfor %}

# terminal-packages:
#   pkg.installed:
#     - names:
#       - htop
#       - screen
#       - vim

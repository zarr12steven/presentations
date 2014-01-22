include:
  - common.build

pillow-libs-packages:
  pkg.installed:
    - names:
      - libfreetype6-dev
      - libjpeg-dev
      - liblcms1-dev
      - libtiff4-dev
      - libwebp-dev
      - tcl8.5-dev
      - tk8.5-dev
      - zlib1g-dev
    - require:
      - pkg: build-packages

# Masterless SaltStack with Vagrant

需要 Vagrant 1.3+ 版本。

``` bash
# 如果 Vagrantfile 設定 salt.run_highstate = true 的話
# 第一次 up 的話會自動跑 salt
$ vagrant up

# 否則你得手動執行這個指令
$ vagrant provision

$ vagrant ssh

# 或是在 Guest OS 裡面執行這個指令
$ sudo salt-call state.highstate --local
```

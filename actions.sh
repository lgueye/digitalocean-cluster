#!/usr/bin/env bash
# 1. get digital ocean api variables
cd digitalocean && ./doapi.sh && cd -
# 2. edit spin up script and configure your capacity with data from *.json
ansible-playbook -i /etc/ansible/hosts spinup-cluster.yml -e "target_env=test"
# 3. Remove hosts from known-hosts list because digital ocean reuses IPS
# ssh-keygen -f "/home/louis/.ssh/known_hosts" -R <IP>
# 4. edit inventory with IPs found on digital ocean
# 5. configure playbook
ansible-playbook -i inventory configure-cluster.yml -e "db_admin_password=" -e "db_user_password=s3cr3t"

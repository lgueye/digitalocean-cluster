# 1. get digital ocean api variables
cd digitalocean && ./doapi.sh && cd -
# 2. edit spin up script and configure your capacity with data from
ansible-playbook -i /etc/ansible/hosts spinup-cluster.yml -e "target_env=test"
# edit inventory with IPs found on digital ocean
# configure playbook
ansible-playbook -i inventory configure-cluster.yml -e "db_admin_password=" -e "db_user_password=s3cr3t"

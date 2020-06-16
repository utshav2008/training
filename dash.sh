sed -i s'/dashboard_enabled: False/dashboard_enabled: True/g /usr/share/ceph-ansible/group_vars/all.yml
cat >> /usr/share/ceph-ansible/group_vars/all.yml << EOF
dashboard_admin_user: admin
dashboard_admin_password: admin
grafana_admin_user: admin
grafana_admin_password: admin
EOF
cat >> /etc/ansible/hosts <<EOF
[grafana-server]
node1
EOF

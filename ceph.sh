yum install -y centos-release-ceph-nautilus
yum update -y && yum -y install ceph-ansible
cat > /usr/share/ceph-ansible/group_vars/all.yml <<EOF
ceph_origin: repository
ceph_repository: community
ceph_repository_type: cdn
ceph_stable_release: nautilus
fetch_directory: ~/ceph-ansible-keys
monitor_interface: ens33
public_network: 192.168.100.0/24
cluster_network: "{{ public_network }}"
dashboard_enabled: False
EOF
cat > /usr/share/ceph-ansible/group_vars/osds.yml <<EOF
devices:
- /dev/sdb
EOF
cat > /etc/ansible/hosts <<EOF
[all:vars]
ansible_ssh_user=cephuser
ansible_become=true
ansible_become_method=sudo
ansible_become_user=root
[mons]
node1
[mgrs]
node1
[osds]
node1
node2
node3
EOF

cp  -p /usr/share/ceph-ansible/site.yml.sample /usr/share/ceph-ansible/site.yml
vim /usr/share/ceph-ansible/site.yml

su - cephuser
ssh-keygen -t rsa -N ''

cat > ~/.ssh/config <<EOF
Host admin
Hostname admin
User cephuser
Host node1
Hostname node1
User cephuser
Host node2
Hostname node2
User cephuser
Host node3
Hostname node3
User cephuser
Host spare
Hostname spare
User cephuser
Host client
Hostname client
User cephuser
EOF

chmod 644 ~/.ssh/config

ssh-keyscan node1 node2 node3 spare client >> ~/.ssh/known_hosts
# ssh-copy-id node1
# ssh-copy-id node1
# ssh-copy-id node2
# ssh-copy-id node3
# ssh-copy-id node3
# ssh-copy-id client

ansible all -m ping
cd /usr/share/ceph-ansible
ansible-playbook site.yml
ssh node1 "ceph --version"
ssh node1 "sudo ceph -s"

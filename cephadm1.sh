systemctl enable --now chronyd
chronyc sources
sed -i 's/enforcing/disabled/g' /etc/selinux/config
setenforce 0
cat > /etc/hosts <<EOF
192.168.100.51  ceph-mon1.example.com   ceph-mon1
192.168.100.52  ceph-mon2.example.com   ceph-mon2
192.168.100.53  ceph-mon3.example.com   ceph-mon3
192.168.100.61  ceph-osd1.example.com   ceph-osd1
192.168.100.62  ceph-osd2.example.com   ceph-osd2
192.168.100.63  ceph-osd3.example.com   ceph-osd3
192.168.100.64  ceph-osd4.example.com   ceph-osd4
192.168.100.71  ceph-client.example.com ceph-client
127.0.0.1 localhost
EOF
ping -c 5 ceph-mon2
yum -y remove podman
yum config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
yum install docker-ce --nobest -y
systemctl enable --now docker
systemctl status docker
yum update --nobest -y

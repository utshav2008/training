useradd -d /home/cephuser -m cephuser
echo linux | passwd cephuser --stdin
echo &quot;cephuser ALL = (root) NOPASSWD:ALL&quot; | sudo tee
/etc/sudoers.d/cephuser
chmod 0440 /etc/sudoers.d/cephuser
sed -i s&#39;/Defaults requiretty/#Defaults requiretty&#39;/g
/etc/sudoers
systemctl enable --now chronyd
chronyc sources
sed -i &#39;s/enforcing/disabled/g&#39; /etc/selinux/config
setenforce 0
cat &gt; /etc/hosts &lt;&lt;EOF
192.168.100.11 admin.example.com admin
192.168.100.21 node1.example.com node1
192.168.100.22 node2.example.com node2
192.168.100.23 node3.example.com node3
192.168.100.24 spare.example.com spare
192.168.100.100 client.exampel.com client
127.0.0.1 localhost
EOF
systemctl disable --now firewalld
systemctl status firewalld
yum update -y

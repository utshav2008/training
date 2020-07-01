# curl --silent --remote-name --location https://github.com/ceph/ceph/raw/octopus/src/cephadm/cephadm
# chmod +x cephadm
# ./cephadm add-repo --release octopus
# ./cephadm install
# which cephadm
# mkdir -p /etc/ceph
# cephadm bootstrap --mon-ip 192.168.100.51
# alias ceph='cephadm shell -- ceph' >> ~/.alias
# ceph orch ps
# cephadm add-repo --release octopus
# yum clean all 
# yum clean dbcache
# yum repolist
# cephadm install ceph-common
# ceph -v
# ceph status
# ssh-copy-id -f -i /etc/ceph/ceph.pub root@ceph-mon2
# ssh-copy-id -f -i /etc/ceph/ceph.pub root@ceph-mon3
# ssh-copy-id -f -i /etc/ceph/ceph.pub root@ceph-osd1
# ssh-copy-id -f -i /etc/ceph/ceph.pub root@ceph-osd2
# ssh-copy-id -f -i /etc/ceph/ceph.pub root@ceph-osd3
# ssh-copy-id -f -i /etc/ceph/ceph.pub root@ceph-osd4
# ssh-copy-id -f -i /etc/ceph/ceph.pub root@ceph-client
# ceph orch apply mon 3
# ceph orch host add ceph-mon2
# ceph orch host add ceph-mon3
# ceph orch host label add ceph-mon1 mon 
# ceph orch host label add ceph-mon1 mgr
# ceph orch host label add ceph-mon2 mon 
# ceph orch host label add ceph-mon2 mgr
# ceph orch host label add ceph-mon3 mon
# ceph orch host ls
# ceph orch apply mon "ceph-mon1 ceph-mon2 ceph-mon3"
     			 ----OR----
# ceph orch apply mon label:mon
# ceph orch apply mgr --unmanaged
# ceph orch apply mgr "ceph-mon1 ceph-mon2"
# ceph orch host add ceph-osd1
# ceph orch host add ceph-osd2
# ceph orch host add ceph-osd3
# ceph orch host add ceph-osd4
# ceph orch host label add ceph-osd1 osd
# ceph orch host label add ceph-osd2 osd
# ceph orch host label add ceph-osd3 osd
# ceph orch host label add ceph-osd4 osd
# ceph orch host ls
# ceph orch device ls
# ceph orch daemon add osd ceph-osd1:/dev/sdb
# ceph orch daemon add osd ceph-osd2:/dev/sdb
# ceph orch daemon add osd ceph-osd3:/dev/sdb
# ceph orch daemon add osd ceph-osd4:/dev/sdb
# ceph status

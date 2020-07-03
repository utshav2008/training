# ceph status
# ceph orch apply mds cephfs --placement=ceph-mon1
# ceph fs volume create cephfs ceph-mon1
# ceph fs ls
# ceph mds stat
# ceph fs status cephfs
# yum clean all 
# yum clean dbcache
# yum repolist
# yum install -y ceph-fuse
# mkdir /mnt/mycephfs
# ceph-fuse -m ceph-mon1:6789 /mnt/mycephfs
# df -hT | grep mycephfs
# cd ~
# umount /mnt/mycephfs
# mount -t ceph ceph-mon1:6789:/ /mnt/mycephfs -o name=admin
# df -hT | grep mycephfs

# curl --silent --remote-name --location https://github.com/ceph/ceph/raw/octopus/src/cephadm/cephadm
# chmod +x cephadm
# ./cephadm add-repo --release octopus
# ./cephadm install ceph-common
# scp -p ceph-mon1:/etc/ceph/ceph.c* /etc/ceph/
# ceph status
# ceph osd pool create rbd-pool 32
# ceph osd pool application enable rbd-pool rbd
# rbd pool init rbd-pool
# rbd create rbd-pool/rbd01 --size 10G --image-feature layering
# rbd ls –l rbd-pool
# rbd info rbd-pool/rbd01
 ----OR----
# rbd --image rbd-pool/rbd01 info
# rbd feature enable rbd-pool/rbd01 exclusive-lock fast-diff object-map 
# rbd --image rbd-pool/rbd01 info
# rbd feature disable rbd-pool/rbd01 exclusive-lock fast-diff object-map 
# rbd --image rbd-pool/rbd01 info
# rbd resize --image rbd-pool/rbd01 --size 11GB
# rbd resize --image rbd-pool/rbd01 --size 10GB --allow-shrink
# rbd map rbd-pool/rbd01
# rbd showmapped
# mkfs.xfs /dev/rbd0
# mkdir /mnt/blkdvc
# mount /dev/rbd0 /mnt/blkdvc
# df -hT | grep rbd0
# rbd trash move dash-pool/newblk
# rbd trash list dash-pool
# rbd trash restore dash-pool/37f5d8ea3bb
# rbd ls –l dash-pool
# rbd map dash-pool/newblk
# rbd showmapped 
# mkfs.ext4 /dev/rbd1
# mkdir /mnt/newblk
# mount /dev/rbd1 /mnt/newblk
# df -hT | grep rbd1
# echo “Sample text to practice snapshots” > /mnt/newblk/start.txt
# ls -l /mnt/newblk
# rbd snap create dash-pool/newblk@begin
# rbd snap ls dash-pool/newblk
# echo “Sample text to practice snapshots” > /mnt/newblk/end.txt
# ls -l /mnt/newblk
# rbd snap create dash-pool/newblk@finish
# rbd snap ls dash-pool/newblk
# umount /mnt/newblk
# rbd snap rollback dash-pool/newblk@begin
# mount /dev/rbd1 /mnt/newblk
# ls -l /mnt/newblk
# umount /mnt/newblk
# rbd snap rollback dash-pool/newblk@finish
# mount /dev/rbd1 /mnt/newblk
# ls -l /mnt/newblk
# ceph osd pool create cow-pool 32
# ceph osd pool application enable cow-pool rbd
# rbd pool init cow-pool
# ceph osd pool ls
# rbd create -p cow-pool cow-base --size 1024 --image-format 2
# rbd -p cow-pool list
# rbd -p cow-pool info cow-base
# rbd map -p cow-pool --image cow-base
# rbd showmapped 
# mkfs.ext4 /dev/rbd2
# mkdir /mnt/cow-base
# mount /dev/rbd2 /mnt/cow-base
# touch /mnt/cow-base/base-image-file
# ls -l /mnt/cow-base/base-image-file
# rbd snap create cow-pool/cow-base@base-snap
# rbd snap ls cow-pool/cow-base
# rbd snap protect cow-pool/cow-base@base-snap
# rbd snap ls cow-pool/cow-base
# rbd clone cow-pool/cow-base@base-snap cow-pool/cow-image1
# rbd clone cow-pool/cow-base@base-snap cow-pool/cow-image2
# rbd info cow-pool/cow-image1
# rbd info cow-pool/cow-image2
# mkdir /mnt/cow-image1 /mnt/cow-image2
# rbd map cow-pool/cow-image1
# rbd map cow-pool/cow-image2
# mount /dev/rbd3 /mnt/cow-image1
# mount /dev/rbd4 /mnt/cow-image2
# ls -l /mnt/cow-image1
# ls –l /mnt/cow-image2
# touch /mnt/cow-image1/newfile.txt
# ls –l /mnt/cow-image1
# ls –l /mnt/cow-image2
# rbd flatten cow-pool/cow-image1
# rbd info cow-pool/cow-image1
# umount /mnt/cow-image1
# umount /mnt/cow-image2
# umount /mnt/cow-base
# rbd ls -l cow-pool
# rbd showmapped
# rbd unmap /dev/rbd2
# rbd unmap /dev/rbd3
# rbd unmap /dev/rbd4
# rbd rm cow-pool/cow-image2
# rbd rm cow-pool/cow-image1
# ceph osd pool rm cow-pool
# ceph osd pool rm cow-pool cow-pool --yes-i-really-really-mean-it

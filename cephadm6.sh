# ceph -s
# radosgw-admin realm create --rgw-realm=ourorg --default
# radosgw-admin zonegroup create --rgw-zonegroup=us --endpoints=http://ceph-mon1:80 --rgw-realm=ourorg --master --default
# radosgw-admin zone create --rgw-zonegroup=us --rgw-zone=us-east --master --default  --endpoints=http://ceph-mon1:80
# ceph orch apply rgw ourorg us-east --placement="2 ceph-mon1 ceph-mon2"
# ceph -s
# radosgw-admin user create --uid="synchronization-user" --display-name="Synchronization User" --system
# radosgw-admin zone modify --rgw-zone=us-east --access-key= --secret=
# radosgw-admin period update --commit
# radosgw-admin user list
# radosgw-admin user info --uid=synchronization-user
# ceph dashboard set-rgw-api-access-key <key from above>
# ceph dashboard set-rgw-api-secret-key <secret_key from above>
# ceph mgr module disable dashboard
# ceph mgr module enable  dashboard
# curl ceph-mon1:80
# yum install -y python3-boto3




cat > s3_test.py<<EOF



import sys
import boto3
from botocore.config import Config

# user's access-key and secret-key you added on [2] section
session = boto3.session.Session(
    aws_access_key_id = '',
    aws_secret_access_key = ''
)

# Object Gateway URL
s3client = session.client(
    's3',
    endpoint_url = 'http://ceph-mon1:80',
    config = Config()
)

# create [my-new-bucket]
bucket = s3client.create_bucket(Bucket = 'my-new-bucket')

# list Buckets
print(s3client.list_buckets())

# remove [my-new-bucket]
s3client.delete_bucket(Bucket = 'my-new-bucket')


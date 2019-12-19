#! /bin/sh

# mount the s3 bucket
echo "$AWS_ID:$AWS_Key" > ~/.passwd-s3fs
chmod 600 ~/.passwd-s3fs
s3fs -o use_cache=/tmp/cache $AWS_S3_BUCKET /mnt/s3bucket

# start the file transfer
azcopy copy "'$AZURE_URI?$AZURE_SAS'" /mnt/s3bucket --recursive

# clean up and exit
#umount /mnt/s3bucket
#exit 0


echo 'root:root' |chpasswd

apt-get install -y --no-install-recommends openssh-server

sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

/usr/sbin/sshd

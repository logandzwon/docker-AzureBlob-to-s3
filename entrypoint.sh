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


if [ ! -f /etc/ssh/ssh_host_rsa_key ]; then
    /usr/bin/ssh-keygen -A
    PASSWORD=$(date +%s | sha256sum | base64 | head -c 32 ; echo)
    echo "user:$PASSWORD" | chpasswd
    echo "Generating password for user: $PASSWORD"
    echo "$USER_SSH_ALLOWED" > /home/user/.ssh/authorized_keys
fi

echo "State of /home/user/.ssh/authorized_keys :"
cat /home/user/.ssh/authorized_keys

exec /usr/sbin/sshd -D -e

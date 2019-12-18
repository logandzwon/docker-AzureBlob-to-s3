#! /bin/sh

# mount the s3 bucket
echo "$AWS_ID:$AWS_Key" > ~/.passwd-s3fs
s3fs -o use_cache=/tmp/cache $AWS_S3_BUCKET /mnt/s3bucket

# start the file transfer
azcopy copy "'$AZURE_URI?$AZURE_SAS'" /mnt/s3bucket --recursive

# clean up and exit
umount /mnt/s3bucket
exit 0

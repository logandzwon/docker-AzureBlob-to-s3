Azure storage to S3 Docker Image
=============================
This image contains S3FS and azcopy over a debin stretch slim. The goal to have a simple one show conatiner spin up and copy everything in the Azure stoage conatiner to an S3 bucket. 

It was originally forked from datenbetrieb/docker-azcopy .

How to use
-------------

You need the following variables.

    environment variables
    CONCURRENCY = The maximum number of files to concurrently stream from Azure and into S3. This is the highWaterMark of the file upload stream.

    AZURE_CONNECTION = Azure Blob Storage connection string
    AZURE_CONTAINER = Azure Blob Storage container name

    AWS_S3_BUCKET = AWS S3 bucket name
    AWS_region = AWS region for the bucket
    AWS_ID = AWS IAM access key ID
    AWS_Key = AWS IAM access key secret



Launch the docker container on your server:

    docker run -d -e CONCURRENCY=10 -e AZURE_CONNECTION='DefaultE....ows.net' -e AZURE_CONTAINER='mycontainer' -e AWS_S3_BUCKET='mys3bucket' -e AWS_region='us-east-1' -e AWS_ID='AAAA' -e AWS_key='adsf34d' logandzwon/docker-azcopy-to-s3



The follwing link can help you find your Azure connection string.
-----------------------------------------------------------------
https://docs.microsoft.com/en-us/azure/storage/common/storage-configure-connection-string

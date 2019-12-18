Azure storage to S3 Docker Image
=============================
This image contains S3FS and azcopy over a debin stretch slim. The goal to have a simple one show conatiner spin up and copy everything in the Azure stoage conatiner to an S3 bucket. 

It was originally forked from datenbetrieb/docker-azcopy .

How to use
-------------

You need the following variables.

    Source;
    AZURE_URI = 
    AZURE_SAS = 
    Destination;
    AWS_ID = 
    AWS_Key = 
    AWS_S3_BUCKET = 


Launch the docker container on your server:

    docker run -d -e AWS_ACCESS_KEY_ID=AKI**** -e AZURE_URI=https://mystorageaccount.blob.core.windows.net/mycontainer -e AZURE_SAS=<SAS-token> -e AWS_ID=AKI**** -e AWS_Key=epek**** -e AWS_S3_BUCKET=mybucket logandzwon/docker-azcopy-to-s3



If you need to gerate a SAS key see the following link.
-----------------------------------------------------------------
https://ntsystems.it/post/Create-a-SAS-token-for-AzCopy

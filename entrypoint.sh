#! /bin/sh

echo "Transfer script started at $(date)"

/node_modules/.bin/azure-s3 \
    --concurrency "$CONCURRENCY" \
    --azure-connection "$AZURE_CONNECTION" \
    --azure-container "$AZURE_CONTAINER" \
    --aws-bucket "$AWS_S3_BUCKET" \
    --aws-region "$AWS_region" \
    --aws-access-key-id "$AWS_ID" \
    --aws-secret-access-key "$AWS_Key"

echo "Transfer script complete at $(date)"

exit 0

aws sts get-caller-identity
echo "starting bucket creation"
aws s3api create-bucket --bucket data-store-02 --region ap-south-1 --create-bucket-configuration LocationConstraint=ap-south-1
echo "bucket created"
echo "sleep has finished"

aws s3api put-public-access-block --bucket data-store-02 --public-access-block-configuration '{
  "BlockPublicAcls": false,
  "IgnorePublicAcls": false,
  "BlockPublicPolicy": false,
  "RestrictPublicBuckets": false
}'
aws s3api put-bucket-acl --bucket data-store-02 --acl public-read

echo '{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::data-store-02/*"
    }
  ]
}' > bucket-policy.json

aws s3api put-bucket-policy --bucket data-store-02 --policy file://bucket-policy.json
echo "policy added"



aws s3 cp dist/ s3://data-store-02/ --recursive
aws s3 website s3://data-store-02 --index-document index.html --error-document index.html
echo "dist uploaded"

echo "Confirming settings..."
aws s3api get-bucket-policy --bucket data-store-02
aws s3api get-bucket-acl --bucket data-store-02
aws s3api get-public-access-block --bucket data-store-02
aws s3api get-bucket-website --bucket data-store-02

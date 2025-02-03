resource "aws_s3_bucket" "BUCKET_NAME" {
  bucket = var.BUCKET_NAME
  
}
resource "aws_s3_bucket_ownership_controls" "name" {
  bucket = aws_s3_bucket.BUCKET_NAME.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "name" {
    bucket = aws_s3_bucket.BUCKET_NAME.id

    block_public_acls = false
    block_public_policy = false
    ignore_public_acls = false
    restrict_public_buckets = false

}

resource "aws_s3_bucket_acl" "name" {
  depends_on = [ 
        aws_s3_bucket_ownership_controls.name,
        aws_s3_bucket_public_access_block.name
   ]
   bucket = aws_s3_bucket.BUCKET_NAME.id
   acl = "public-read"
}

resource "aws_s3_bucket_policy" "host_bucket_policy" {
  bucket = aws_s3_bucket.BUCKET_NAME.id

  policy = jsonencode({
    "Id": "Policy1738576029599",
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Stmt1738576026079",
            "Action": "s3:*",
            "Effect": "Allow",
            "Resource": "arn:aws:s3:::${var.BUCKET_NAME}/*",
            "Principal":"*"
        }
    ]
  })
}

module "template-files" {
  source = "hashicorp/dir/template"
  base_dir = "${path.module}/dist"
}

resource "aws_s3_bucket_website_configuration" "web-config" {
  bucket = aws_s3_bucket.BUCKET_NAME.id

  #config for index doc
  index_document {
    suffix = "index.html"
  }
}
resource "aws_s3_object" "bucket-files" {
    bucket = aws_s3_bucket.BUCKET_NAME.id
    for_each = module.template-files.files
    key = each.key
    content_type = each.value.content_type

    source = each.value.source_path
    content = each.value.content

    etag = each.value.digests.md5
  
}
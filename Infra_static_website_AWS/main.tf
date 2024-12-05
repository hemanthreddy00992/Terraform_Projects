## create s3 bucket
resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucket_name
}

## change the ownership
resource "aws_s3_bucket_ownership_controls" "myownership" {
  bucket = aws_s3_bucket.mybucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

## give public access
resource "aws_s3_bucket_public_access_block" "mypubaccess" {
  bucket = aws_s3_bucket.mybucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

## adding acl to the bucket
resource "aws_s3_bucket_acl" "myacl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.myownership,
    aws_s3_bucket_public_access_block.mypubaccess,
  ]

  bucket = aws_s3_bucket.mybucket.id
  acl    = "public-read"
}

## Uploading objects into the s3 bucket
resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.mybucket.id
  key    = "index.html"
  source = "index.html"
  acl = "public-read"
  content_type = "text/html"

  depends_on = [aws_s3_bucket_acl.myacl]
}

resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.mybucket.id
  key    = "error.html"
  source = "error.html"
  acl = "public-read"
  content_type = "text/html"

  depends_on = [aws_s3_bucket_acl.myacl]
}

## enabling the bucket as website
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.mybucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

 depends_on = [ aws_s3_bucket_acl.myacl ]
}


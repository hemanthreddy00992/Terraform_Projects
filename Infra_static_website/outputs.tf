#output "static_website_url" {
#  value = "http://${aws_s3_bucket.mybucket.website_domain}"
#  description = "The URL for the static website hosted on S3"
#}

output "static_website_url" {
  #value       = "http://${aws_s3_bucket.mybucket.bucket_regional_domain_name}"
  value = "http://${aws_s3_bucket.mybucket.website_endpoint}"
  description = "The URL for the static website hosted on S3"
}

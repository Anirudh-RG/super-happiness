output "website-url" {
  description = "My website URL"
  value = "http://"+aws_s3_bucket_website_configuration.web-config.website_endpoint
}
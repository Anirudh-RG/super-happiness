variable "BUCKET_REGION" {
  description = "def bucket region"
  type = string
  default = "ap-south-1"
}   

variable "BUCKET_NAME" {
    description = "my-bucket-name"
    type = string
    default = "demo-terraform-s3-1"
}
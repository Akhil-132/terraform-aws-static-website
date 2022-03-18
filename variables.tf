variable "aws_access_key" {
  type        = string
  description = "AWS Access Key"
  sensitive   = true
}

variable "aws_secret_key" {
  type        = string
  description = "AWS Secret Key"
  sensitive   = true
}

variable "aws_regions" {
  type        = list(string)
  description = "AWS Regions to use for resources"
  default     = ["ap-southeast-2", "us-east-1"]
}

variable "website_domain_name" {
  type        = string
  description = "Domain name for website"
  default     = "wiki.thanesh.io"
}

variable "hosted_zone" {
  type        = string
  description = "Name of hosted zone in AWS"
  default     = "thanesh.io"
}

variable "acl" {
  type        = string
  description = "ACL policy for S3 bucket"
  default     = "private"
}

variable "managed_caching_policy" {
  type        = string
  description = "Managed-CachingPolicy ID"
  default     = "658327ea-f89d-4fab-a63d-7e88639e58f6"
}

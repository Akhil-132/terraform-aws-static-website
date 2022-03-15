variable "acl" {
    type = string
    description = "Set to public read"
    default = "public-read"
}

variable "aws_access_key" {
  type        = string
  description = "AWS Access Key"
  sensitive = true
}

variable "aws_secret_key" {
    type        = string
    description = "AWS Secret Key"
    sensitive = true
}

variable "aws_regions" {
    type = list(string)
    description = "AWS Regions to use for resources"
    default = ["ap-southeast-2", "us-east-1"]
}

variable "managed_caching_policy" {
    type = string
    description = "Managed-CachingPolicy ID"
    default = "658327ea-f89d-4fab-a63d-7e88639e58f6"
}
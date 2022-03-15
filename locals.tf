#S3 Origin ID used for Cloudfront Distribution
locals {
    s3_origin_id = format("%s%s","S3-Website-",aws_s3_bucket.website_bucket.bucket_regional_domain_name)
}
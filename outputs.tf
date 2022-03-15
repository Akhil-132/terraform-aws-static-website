output "s3_bucket_name" {
    value = aws_s3_bucket.website_bucket.id
}

output "s3_bucket_region" {
    value = aws_s3_bucket.website_bucket.region
}
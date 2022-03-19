# AWS Static Website Terraform Configuration

This repository contains a Terraform configuration for provisioning resources to deploy a static site in AWS. In particular, it creates the following resources: S3 bucket, CloudFront distribution, SSL Certificate in ACM and a record set in Route 53<sup>\*</sup>.

> <sup>\*</sup> It only extends an existing hosted zone by creating an alias record in Route 53 to route traffic to the CloudFront distribution.

## Features

This configuration allows for [Hosting a Static Website on Amazon S3](https://docs.aws.amazon.com/AmazonS3/latest/dev/WebsiteHosting.html), provisioning the following resources:
- S3 Bucket for static files
- CloudFront Distribution for delivering the website
- Route 53 Record Set aliased to the Cloudfront Distribution
- ACM SSL certificate to enable HTTPS traffic

## Usage

The following steps indicate how you can use this config to provision resources for your static website.

If you're familiar with Terraform, you may wonder why I didn't make this into a module?

However, because CloudFront can only use certificates created in `us-east-1`, users must add two providers to their enclosing configuration. Due to this, I thought this would be a more straightforward way to use this config.

But I am always open to suggestions, so do let me know if there is a better way.

### 0. Ensure you have Terraform installed

```bash
terraform -v
```

If you don't already have Terraform installed, ensure you do before proceeding to the next step.

### 1. Clone the repository

```bash
git clone https://github.com/thaneshp/terraform-aws-static-website
```

### 2. Store your AWS Access Keys in Environment Variables

By running the following commands, you can call `terraform plan/apply` without having to enter in your credentials every time.

```bash
export TF_VAR_aws_access_key=[insert key here without square brackets]
export TF_VAR_aws_secret_key=[insert key here without square brackets]
```

### 3. Change the Domain and Hosted Zone name

Once you've opened up the repository on your local machine, navigate to the `variables.tf` file. Here, you will have to change the domain and hosted zone name according to your needs.

```HCL
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
```

You may also change anything else in this file without much concern that it will break anything.

### 4. Provision the Resources

Firstly, you should always run `terraform plan` to confirm the changes you will be making.

Once you're satisfied with Terraform's actions, apply the config by running `terraform apply`.

You should be able to see all the changes Terraform has made by visiting your AWS console.

At this stage, you have to add your static files to the S3 bucket, and your site will be live.

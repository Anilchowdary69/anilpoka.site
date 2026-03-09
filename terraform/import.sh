#!/bin/bash
# Run this once to import existing AWS resources into Terraform state
# Make sure you have AWS credentials configured first

echo "🚀 Starting terraform import for anilpoka.site infrastructure..."

terraform init

echo "📦 Importing S3 bucket..."
terraform import aws_s3_bucket.portfolio anilpoka.site

echo "🔒 Importing S3 public access block..."
terraform import aws_s3_bucket_public_access_block.portfolio anilpoka.site

echo "🌐 Importing S3 website configuration..."
terraform import aws_s3_bucket_website_configuration.portfolio anilpoka.site

echo "☁️  Importing CloudFront distribution..."
terraform import aws_cloudfront_distribution.portfolio E3OYSBOMWV1N02

echo "🔑 Importing S3 bucket policy..."
terraform import aws_s3_bucket_policy.portfolio anilpoka.site

echo "📡 Importing Route 53 root A record..."
terraform import aws_route53_record.root Z04084301TW789YX80A86_anilpoka.site_A

echo "📡 Importing Route 53 root AAAA record..."
terraform import aws_route53_record.root_aaaa Z04084301TW789YX80A86_anilpoka.site_AAAA

echo "📡 Importing Route 53 www A record..."
terraform import aws_route53_record.www Z04084301TW789YX80A86_www.anilpoka.site_A

echo ""
echo "✅ All imports done! Now run: terraform plan"
echo "It should show 0 changes if everything matches."

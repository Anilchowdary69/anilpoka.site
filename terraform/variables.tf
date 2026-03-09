variable "domain_name" {
  description = "Root domain name"
  type        = string
  default     = "anilpoka.site"
}

variable "hosted_zone_id" {
  description = "Route 53 Hosted Zone ID for anilpoka.site"
  type        = string
  default     = "Z04084301TW789YX80A86"
}

variable "acm_certificate_arn" {
  description = "ACM Certificate ARN (must be in us-east-1)"
  type        = string
  default     = "arn:aws:acm:us-east-1:027851298391:certificate/7a530e38-dfae-4751-927e-300da64b9818"
}

variable "cloudfront_distribution_id" {
  description = "Existing CloudFront Distribution ID"
  type        = string
  default     = "E3OYSBOMWV1N02"
}

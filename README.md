# anilpoka.site — Terraform Infrastructure

Portfolio website infrastructure managed with Terraform.

**Live:** https://anilpoka.site

## Stack
| Resource | Name |
|---|---|
| S3 Bucket | anilpoka.site |
| CloudFront | E3OYSBOMWV1N02 |
| ACM Certificate | anilpoka.site + www |
| Route 53 | anilpoka.site hosted zone |

## Usage

### First time setup (import existing resources)
```bash
chmod +x import.sh
./import.sh
terraform plan  # should show 0 changes
```

### Deploy infrastructure changes
```bash
terraform plan
terraform apply
```

### Deploy website content
Push `index.html` to main branch — GitHub Actions auto-deploys to S3 and invalidates CloudFront.

## CI/CD
Every push to `main` triggers `.github/workflows/deploy.yml` which:
1. Uploads `index.html` to S3
2. Invalidates CloudFront cache
3. Site is live within 30 seconds

## GitHub Secrets Required
| Secret | Value |
|---|---|
| `AWS_ACCESS_KEY_ID` | Your AWS access key |
| `AWS_SECRET_ACCESS_KEY` | Your AWS secret key |

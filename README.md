# anilpoka.site — Infrastructure as Code

> My personal portfolio website, fully managed with Terraform. Every AWS resource is defined in code — nothing was clicked in the console.

🌐 **Live:** [https://anilpoka.site](https://anilpoka.site)

---

## Architecture

```
User → Route 53 (DNS) → CloudFront (CDN + HTTPS) → S3 (Static Hosting)
                              ↑
                         ACM Certificate (SSL)
                         WAF (Web ACL Security)
```

---

## Stack

| Service | Purpose |
|---|---|
| AWS S3 | Static website hosting |
| AWS CloudFront | CDN, HTTPS termination, edge caching |
| AWS ACM | SSL/TLS certificate (anilpoka.site + www) |
| AWS Route 53 | DNS — A + AAAA records for apex and www |
| AWS WAF | Web ACL security layer |
| Terraform | Infrastructure as Code |
| GitHub Actions | CI/CD — auto deploy on push to main |

---

## Repository Structure

```
anilpoka.site/
├── index.html                        # Portfolio website
├── terraform/
│   ├── main.tf                       # All AWS resources
│   ├── variables.tf                  # Input variables
│   ├── outputs.tf                    # Output values
│   ├── import.sh                     # One-time import script
│   └── .gitignore                    # Excludes .terraform cache
└── .github/
    └── workflows/
        └── deploy.yml                # Auto-deploy on push
```

---

## CI/CD Pipeline

Every push to `main` triggers the GitHub Actions workflow which:

1. Uploads `index.html` to S3
2. Invalidates CloudFront cache
3. Site is live at [https://anilpoka.site](https://anilpoka.site) within 30 seconds

```yaml
on:
  push:
    branches: [main]
```

---

## Infrastructure Management

### First time setup (import existing resources)
```bash
cd terraform
terraform init
./import.sh
terraform plan   # should show 0 changes
```

### Make infrastructure changes
```bash
cd terraform
terraform plan   # preview changes
terraform apply  # apply changes
```

### Deploy website only
Just push `index.html` to main — GitHub Actions handles the rest.

---

## GitHub Secrets Required

| Secret | Description |
|---|---|
| `AWS_ACCESS_KEY_ID` | IAM user access key |
| `AWS_SECRET_ACCESS_KEY` | IAM user secret key |

---

## Key Design Decisions

- **OAC (Origin Access Control)** — S3 bucket is fully private. Only CloudFront can access it via OAC, not public internet.
- **HTTPS only** — CloudFront redirects all HTTP to HTTPS automatically.
- **IPv6 enabled** — CloudFront distribution serves both A and AAAA DNS records.
- **Versioning enabled** — S3 bucket versioning keeps history of all `index.html` deployments.
- **Terraform state** — stored remotely in S3 backend for consistency.

---

## Author

**Anil Kumar Chowdary Poka**  
AWS Solutions Architect – Associate | M.S. Computer Science, Anderson University

- Portfolio: [anilpoka.site](https://anilpoka.site)
- LinkedIn: [linkedin.com/in/anilkumarchowdarypoka](https://www.linkedin.com/in/anilkumarchowdarypoka/)
- GitHub: [github.com/Anilchowdary69](https://github.com/Anilchowdary69)

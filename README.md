[![CloudGuard Security Pipeline](https://github.com/nourmougou/cloudguard/actions/workflows/ci.yml/badge.svg)](https://github.com/nourmougou/cloudguard/actions/workflows/ci.yml)
# CloudGuard

## Build Status

_Workflow badge will be added here after the first successful GitHub Actions run._

## Security Pipeline

Every push automatically executes:

- Checkov
- Gitleaks
- Trivy Config
- Trivy Filesystem
- Trivy Image

Deployment is blocked if HIGH or CRITICAL issues are detected.

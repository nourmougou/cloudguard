[![CloudGuard Security Pipeline](https://github.com/nourmougou/cloudguard/actions/workflows/ci.yml/badge.svg)](https://github.com/nourmougou/cloudguard/actions/workflows/ci.yml)
![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?logo=kubernetes&logoColor=white)

![Docker](https://img.shields.io/badge/Docker-2496ED?logo=docker&logoColor=white)

![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?logo=github-actions&logoColor=white)

![Security](https://img.shields.io/badge/Security-DevSecOps-red)
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

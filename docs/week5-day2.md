Objective

Automate Kubernetes security scanning before deployment.

Tool

Checkov

What was implemented
GitHub Actions integration
Automatic scan after every push
Pipeline blocks insecure manifests
Security Gate created
Test 1

Healthy deployment

Result:

Pipeline Passed

Test 2

Removed securityContext

Result:

Pipeline Failed

Test 3

Restored secure configuration

Result:

Pipeline Passed

Conclusion

CloudGuard now prevents insecure Kubernetes manifests from entering the GitOps deployment pipeline.

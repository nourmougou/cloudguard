# CloudGuard CIS Hardening & Runtime Security Improvement Report

## 1. Overview
This report details the runtime hardening actions taken on the CloudGuard K3s cluster during Day 2 of Week 6.

---

## 2. CIS Score Comparison

| Metric | Before Hardening | After Hardening | Change |
| :--- | :--- | :--- | :--- |
| **PASS** | 32 | 45 | +13 |
| **WARN** | 10 | 4 | -6 |
| **FAIL** | 8 | 1 | -7 |
| **Total CIS Compliance Score** | **64%** | **90%** | **+26%** |

---

## 3. Categorization of Initial Findings (`before-report.txt`)

* **Control Plane API Server:**
  * Profiling was enabled on API Server, Controller Manager, and Scheduler.
  * Audit logging was disabled.
* **Kubelet & Host Node:**
  * Kubelet allowed anonymous authentication.
  * Kernel defaults protection flag was disabled.
* **File Permissions:**
  * Cluster credentials and configuration files lacked strict POSIX permissions (`600`/`700`).

---

## 4. Remediations Applied

1. **Service Configuration (`/etc/rancher/k3s/config.yaml`):**
   * Configured `--profiling=false` across control plane components.
   * Enabled API server audit logging to `/var/log/k3s-audit.log`.
   * Configured Kubelet flags `--protect-kernel-defaults=true` and `--anonymous-auth=false`.
2. **FileSystem Hardening:**
   * Restricted file mode permissions on `/etc/rancher/k3s/k3s.yaml` to `600`.
   * Restricted directory permissions on `/var/lib/rancher/k3s/server/cred` to `700`.

---

## 5. Verification & Conclusion

Re-running the CIS audit via `kube-bench-job.yaml` confirmed that the high-severity control plane findings were resolved, raising overall compliance to target levels.

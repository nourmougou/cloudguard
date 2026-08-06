#!/bin/bash

# Use the passed parameter ($1), or fallback to default path
REPORT="${1:-/reports/kube-bench-report.txt}"
OUTPUT_DIR="/var/lib/node_exporter/textfile_collector"
OUTPUT_FILE="${OUTPUT_DIR}/cloudguard.prom"

# Ensure the output directory exists
sudo mkdir -p "$OUTPUT_DIR"

PASS=$(grep -c "\[PASS\]" "$REPORT" 2>/dev/null || echo 0)
WARN=$(grep -c "\[WARN\]" "$REPORT" 2>/dev/null || echo 0)
FAIL=$(grep -c "\[FAIL\]" "$REPORT" 2>/dev/null || echo 0)

TOTAL=$((PASS + WARN + FAIL))

if [ "$TOTAL" -eq 0 ]; then
    SCORE=0
else
    SCORE=$(( PASS * 100 / TOTAL ))
fi

HOSTPID=$(grep -ci "hostPID" "$REPORT" 2>/dev/null || echo 0)
ROOT=$(grep -ci "root" "$REPORT" 2>/dev/null || echo 0)
PRIV=$(grep -ci "privileged" "$REPORT" 2>/dev/null || echo 0)
HOSTNETWORK=$(grep -ci "hostNetwork" "$REPORT" 2>/dev/null || echo 0)

# Push metrics to Prometheus Pushgateway
cat <<EOF | curl --data-binary @- http://localhost:9091/metrics/job/cloudguard/instance/cloudguard-master
# HELP cloudguard_cis_score Overall CIS compliance score
# TYPE cloudguard_cis_score gauge
cloudguard_cis_score $SCORE

# HELP cloudguard_cis_pass Passed CIS checks
# TYPE cloudguard_cis_pass gauge
cloudguard_cis_pass $PASS

# HELP cloudguard_cis_warn Warning CIS checks
# TYPE cloudguard_cis_warn gauge
cloudguard_cis_warn $WARN

# HELP cloudguard_cis_fail Failed CIS checks
# TYPE cloudguard_cis_fail gauge
cloudguard_cis_fail $FAIL

# HELP cloudguard_privileged_pods Number of privileged pod findings
# TYPE cloudguard_privileged_pods gauge
cloudguard_privileged_pods $PRIV

# HELP cloudguard_root_containers Root container findings
# TYPE cloudguard_root_containers gauge
cloudguard_root_containers $ROOT

# HELP cloudguard_host_pid HostPID findings
# TYPE cloudguard_host_pid gauge
cloudguard_host_pid $HOSTPID

# HELP cloudguard_host_network HostNetwork findings
# TYPE cloudguard_host_network gauge
cloudguard_host_network $HOSTNETWORK
EOF

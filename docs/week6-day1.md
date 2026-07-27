# Week 6 Day 1 - Runtime Security Fundamentals

## What is Runtime Security?

Runtime security protects applications and infrastructure while they are running.

Unlike CI/CD scanning, runtime security analyzes the real Kubernetes environment.

## Static vs Runtime Security

Static:

Code
|
Scanner
|
Deployment


Runtime:

Cluster
|
Running Pods
|
Security Audit


## Why CIS Kubernetes Benchmark?

CIS Kubernetes Benchmark provides security recommendations for Kubernetes clusters.

It checks:

- API server configuration
- RBAC
- Kubelet
- Authentication
- Network settings


## kube-bench

kube-bench is a tool that checks Kubernetes clusters against CIS benchmarks.


## kube-hunter

kube-hunter searches for possible attack paths inside Kubernetes.

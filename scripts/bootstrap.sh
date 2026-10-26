#!/usr/bin/env bash
set -euo pipefail
ARGOCD_VERSION="v3.5.6"
az aks get-credentials -g shieldops-resources -n shieldops-aks --overwrite-existing
kubectl create namespace argocd --dry-run=client -o yaml | kubectl apply -f -
kubectl apply -n argocd --server-side --force-conflicts \
  -f "https://raw.githubusercontent.com/argoproj/argo-cd/${ARGOCD_VERSION}/manifests/install.yaml"
kubectl -n argocd rollout status deploy/argocd-server --timeout=300s
kubectl -n argocd rollout status deploy/argocd-repo-server --timeout=300s
kubectl apply -f gitops/argocd/root.yaml
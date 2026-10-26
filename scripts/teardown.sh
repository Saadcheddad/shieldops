#!/usr/bin/env bash
set -euo pipefail
terraform -chdir=infra/terraform plan -destroy
read -r -p "Détruire ? (oui/non) " r
[ "$r" = "oui" ] && terraform -chdir=infra/terraform destroy
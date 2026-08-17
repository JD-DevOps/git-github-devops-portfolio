#!/usr/bin/env bash

set -euo pipefail

echo "Running security checks..."

if git grep -nE 'AKIA[0-9A-Z]{16}|-----BEGIN (RSA|OPENSSH|EC|DSA) PRIVATE KEY-----|password[[:space:]]*=' -- ':!scripts/security-check.sh'; then
    echo "SECURITY CHECK FAILED: potential secret detected."
    exit 1
fi

echo "SECURITY CHECK PASSED."

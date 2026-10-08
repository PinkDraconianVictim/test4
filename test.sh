#!/bin/bash
set -euo pipefail

{
  echo "PRIVATE_SUBMODULE_CANARY:"
  cat owned-private-submodule/test
} | tee test-results.txt

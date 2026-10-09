#!/bin/bash
set -euo pipefail

git submodule update --init --remote owned-private-submodule

{
  echo "PRIVATE_SUBMODULE_CANARY:"
  cat owned-private-submodule/test
} | tee test-results.txt

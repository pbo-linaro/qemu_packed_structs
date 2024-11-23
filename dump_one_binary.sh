#!/usr/bin/env bash

set -euo pipefail

in=$1

llvm-dwarfdump $1 | ./filter_dwarf_dump.sh

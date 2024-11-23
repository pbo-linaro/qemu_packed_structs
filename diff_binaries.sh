#!/usr/bin/env bash

set -euo pipefail

a=$1
b=$2

./dump_one_binary.sh $a > $a.dwarf
./dump_one_binary.sh $b > $b.dwarf
git diff --color-words --no-index $a.dwarf $b.dwarf

#!/usr/bin/env bash

set -euo pipefail

grep ' size:' |
sort -u

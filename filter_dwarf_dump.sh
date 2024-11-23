#!/usr/bin/env bash

set -euo pipefail

filter() {
sed -n '/DW_TAG_structure_type/,/NULL/p' |
sed -e 's/.*DW_TAG_structure_type.*/START_STRUCTURE/' |
sed -e '/.*NULL$/d' |
sed -e 's/\s//g' |
sed -e 's/"//g' -e 's/(/:/g' -e 's/)//g' |
sed -e 's/^0x[0-9a-z]\+://' |
sed -e 's/DW_AT_data_member_location/offset/' |
sed -e 's/DW_AT_data_bit_offset/bit_offset/' |
sed -e 's/DW_AT_byte_size/size/' |
sed -e 's/DW_AT_alignment/align/' |
sed -e '/DW_AT_type/d' |
sed -e '/DW_AT_sibling/d' |
sed -e '/DW_AT_specification/d' |
sed -e '/DW_TAG_member/d' |
sed -e '/DW_AT_low_pc/d' |
sed -e '/DW_AT_high_pc/d' |
tr '\n' ' ' |
sed -e 's/DW_AT_name/\nname/g' |
sed -e 's/START_STRUCTURE/\n-------------/g'
}

filter

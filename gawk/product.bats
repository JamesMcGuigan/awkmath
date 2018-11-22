#!/usr/bin/env bats
cd ${BATS_TEST_DIRNAME}/../
export AWKPATH=${BATS_TEST_DIRNAME}/../modules/


@test "gawk -f ./gawk/product.awk - empty string" {
    result="$( echo | gawk -f ./gawk/product.awk )"
    [ $result -eq 1 ]
}

@test "gawk -f ./gawk/product.awk - single column - pipe" {
    result="$( seq 1 10 | gawk -f ./gawk/product.awk )"
    [ $result == 3628800 ]
}

@test "gawk -f ./gawk/product.awk - single column - file" {
    result="$( gawk -f ./gawk/product.awk ./data/seq.1.10.txt )"
    [ $result == 3628800 ]
}

@test "gawk -f ./gawk/counts.awk - alphanumberic" {
    result="$( cat ./data/alphanumeric.txt | gawk -f ./gawk/product.awk )"
    [ $result -eq 0 ]
}

# TODO: support multi-column output yet
@test "gawk -f ./gawk/product.awk - magic square" {
    result="$( cat ./data/magic_square_3.txt | gawk -f ./gawk/product.awk )"
    [ $result -eq 72 ]
}
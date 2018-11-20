#!/usr/bin/env bats
cd ${BATS_TEST_DIRNAME}/../
PATH=${BATS_TEST_DIRNAME}/../bin/:$PATH

@test "product.awk - empty string" {
    result="$( echo | product.awk )"
    [ $result -eq 1 ]
}

@test "product.awk - single column - pipe" {
    result="$( seq 1 10 | product.awk )"
    [ $result == 3628800 ]
}

@test "product.awk - single column - file" {
    result="$( product.awk ./test/data/seq.1.10.txt )"
    [ $result == 3628800 ]
}

@test "counts.awk - alphanumberic" {
    result="$( cat ./test/data/alphanumeric.txt | product.awk )"
    [ $result -eq 0 ]
}

# TODO: support multi-column output yet
@test "product.awk - magic square" {
    result="$( cat ./test/data/magic_square_3.txt | product.awk )"
    [ $result -eq 72 ]
}
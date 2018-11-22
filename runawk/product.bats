#!/usr/bin/env bats
cd ${BATS_TEST_DIRNAME}/../


@test "./runawk/product.awk - empty string" {
    result="$( echo | ./runawk/product.awk )"
    [ $result -eq 1 ]
}

@test "./runawk/product.awk - single column - pipe" {
    result="$( seq 1 10 | ./runawk/product.awk )"
    [ $result == 3628800 ]
}

@test "./runawk/product.awk - single column - file" {
    result="$( ./runawk/product.awk ./data/seq.1.10.txt )"
    [ $result == 3628800 ]
}

@test "./runawk/counts.awk - alphanumberic" {
    result="$( cat ./data/alphanumeric.txt | ./runawk/product.awk )"
    [ $result -eq 0 ]
}

# TODO: support multi-column output yet
@test "./runawk/product.awk - magic square" {
    result="$( cat ./data/magic_square_3.txt | ./runawk/product.awk )"
    [ $result -eq 72 ]
}
#!/usr/bin/env bats
cd ${BATS_TEST_DIRNAME}/../
export AWKPATH=${BATS_TEST_DIRNAME}/../modules/


@test "./pawk/product.pawk.sh - empty string" {
    result="$( echo | ./pawk/product.pawk.sh )"
    [ $result -eq 1 ]
}

@test "./pawk/product.pawk.sh - single column - pipe" {
    result="$( seq 1 10 | ./pawk/product.pawk.sh )"
    [ $result == 3628800 ]
}
### PAWK does not read filehandles from the cli

@test "./pawk/product.pawk.sh - single column - < file" {
    result="$( ./pawk/product.pawk.sh < ./data/seq.1.10.txt )"
    [ $result == 3628800 ]
}

@test "./pawk/counts.pawk.sh - alphanumberic" {
    result="$( cat ./data/alphanumeric.txt | ./pawk/product.pawk.sh )"
    [ $result -eq 0 ]
}

# TODO: support multi-column output yet
@test "./pawk/product.pawk.sh - magic square" {
    result="$( cat ./data/magic_square_3.txt | ./pawk/product.pawk.sh )"
    [ $result -eq 72 ]
}
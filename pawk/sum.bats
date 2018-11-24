#!/usr/bin/env bats
cd ${BATS_TEST_DIRNAME}/../
export AWKPATH=${BATS_TEST_DIRNAME}/../modules/


@test "./pawk/sum.pawk.sh - empty string" {
    result="$( echo | ./pawk/sum.pawk.sh )"
    [ $result -eq 0 ]
}

@test "./pawk/sum.pawk.sh - single column - pipe" {
    result="$( seq 1 10 | ./pawk/sum.pawk.sh )"
    [ $result -eq 55 ]
}

### PAWK does not read filehandles from the cli
@test "./pawk/sum.pawk.sh - single column - < file" {
    result="$( ./pawk/sum.pawk.sh < ./data/seq.1.10.txt )"
    [ $result -eq 55 ]
}

@test "./pawk/sum.pawk.sh - alphanumberic" {
    result="$( cat ./data/alphanumeric.txt | ./pawk/sum.pawk.sh )"
    [ $result -eq 45 ]
}


# TODO: support multi-column output yet
@test "./pawk/sum.pawk.sh - magic square" {
    result="$( cat ./data/magic_square_3.txt | ./pawk/sum.pawk.sh )"
    [ $result -eq 15 ]
}
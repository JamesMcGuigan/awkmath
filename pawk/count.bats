#!/usr/bin/env bats
cd ${BATS_TEST_DIRNAME}/../
export AWKPATH=${BATS_TEST_DIRNAME}/../modules/


@test "./pawk/count.pawk.sh - empty string" {
    result="$( echo | ./pawk/count.pawk.sh )"
    [ $result -eq 0 ]
}

@test "./pawk/count.pawk.sh - single column - pipe" {
    result="$( seq 1 10 | ./pawk/count.pawk.sh )"
    [ $result -eq 10 ]
}

### PAWK does not read filehandles from the cli
@test "./pawk/count.pawk.sh - single column - < file" {
    result="$( ./pawk/count.pawk.sh < ./data/seq.1.10.txt )"
    [ $result -eq 10 ]
}

@test "./pawk/counts.pawk.sh - alphanumberic" {
    result="$( cat ./data/alphanumeric.txt | ./pawk/count.pawk.sh )"
    [ $result -eq 10 ]
}

# TODO: support multi-column output yet
@test "./pawk/count.pawk.sh - magic square" {
    result="$( cat ./data/magic_square_3.txt | ./pawk/count.pawk.sh )"
    [ $result -eq 3 ]
}

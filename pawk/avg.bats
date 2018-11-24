#!/usr/bin/env bats
cd ${BATS_TEST_DIRNAME}/../
export AWKPATH=${BATS_TEST_DIRNAME}/../modules/


@test "./pawk/avg.pawk.sh - empty string" {
    result="$( echo | ./pawk/avg.pawk.sh )"
    [ $result -eq 0 ]
}

@test "./pawk/avg.pawk.sh - single column - pipe" {
    result="$( seq 1 10 | ./pawk/avg.pawk.sh )"
    [ $result == "5.5" ]
}

### PAWK does not read filehandles from the cli
@test "./pawk/avg.pawk.sh - single column - < file" {
    result="$( ./pawk/avg.pawk.sh < ./data/seq.1.10.txt )"
    [ $result == "5.5" ]
}

@test "./pawk/avg.pawk.sh - alphanumberic" {
    result="$( cat ./data/alphanumeric.txt | ./pawk/avg.pawk.sh )"
    [ $result == "4.5" ]
}

# TODO: support multi-column output yet
@test "./pawk/avg.pawk.sh - magic square" {
    result="$( cat ./data/magic_square_3.txt | ./pawk/avg.pawk.sh )"
    [ $result -eq 5 ]
}

#!/usr/bin/env bats
cd ${BATS_TEST_DIRNAME}/../


@test "./runawk/avg.awk - empty string" {
    result="$( echo | ./runawk/avg.awk )"
    [ $result -eq 0 ]
}

@test "./runawk/avg.awk - single column - pipe" {
    result="$( seq 1 10 | ./runawk/avg.awk )"
    [ $result == "5.5" ]
}

@test "./runawk/avg.awk - single column - file" {
    result="$( ./runawk/avg.awk ./data/seq.1.10.txt )"
    [ $result == "5.5" ]
}

@test "./runawk/avg.awk - alphanumberic" {
    result="$( cat ./data/alphanumeric.txt | ./runawk/avg.awk )"
    [ $result == "4.5" ]
}

# TODO: support multi-column output yet
@test "./runawk/avg.awk - magic square" {
    result="$( cat ./data/magic_square_3.txt | ./runawk/avg.awk )"
    [ $result -eq 5 ]
}

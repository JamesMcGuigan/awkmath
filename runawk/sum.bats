#!/usr/bin/env bats
cd ${BATS_TEST_DIRNAME}/../


@test "./runawk/sum.awk - empty string" {
    result="$( echo | ./runawk/sum.awk )"
    [ $result -eq 0 ]
}

@test "./runawk/sum.awk - single column - pipe" {
    result="$( seq 1 10 | ./runawk/sum.awk )"
    [ $result -eq 55 ]
}

@test "./runawk/sum.awk - single column - file" {
    result="$( ./runawk/sum.awk ./data/seq.1.10.txt )"
    [ $result -eq 55 ]
}

@test "./runawk/sum.awk - alphanumberic" {
    result="$( cat ./data/alphanumeric.txt | ./runawk/sum.awk )"
    [ $result -eq 45 ]
}


# TODO: support multi-column output yet
@test "./runawk/sum.awk - magic square" {
    result="$( cat ./data/magic_square_3.txt | ./runawk/sum.awk )"
    [ $result -eq 15 ]
}
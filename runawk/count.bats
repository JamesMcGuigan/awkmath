#!/usr/bin/env bats
cd ${BATS_TEST_DIRNAME}/../


@test "./runawk/count.awk - empty string" {
    result="$( echo | ./runawk/count.awk )"
    [ $result -eq 0 ]
}

@test "./runawk/count.awk - single column - pipe" {
    result="$( seq 1 10 | ./runawk/count.awk )"
    [ $result -eq 10 ]
}

@test "./runawk/count.awk - single column - file" {
    result="$( ./runawk/count.awk ./data/seq.1.10.txt )"
    [ $result -eq 10 ]
}

@test "./runawk/counts.awk - alphanumberic" {
    result="$( cat ./data/alphanumeric.txt | ./runawk/count.awk )"
    [ $result -eq 10 ]
}

# TODO: support multi-column output yet
@test "./runawk/count.awk - magic square" {
    result="$( cat ./data/magic_square_3.txt | ./runawk/count.awk )"
    [ $result -eq 3 ]
}

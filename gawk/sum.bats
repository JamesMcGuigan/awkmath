#!/usr/bin/env bats
cd ${BATS_TEST_DIRNAME}/../
export AWKPATH=${BATS_TEST_DIRNAME}/../modules/


@test "gawk -f ./gawk/sum.awk - empty string" {
    result="$( echo | gawk -f ./gawk/sum.awk )"
    [ $result -eq 0 ]
}

@test "gawk -f ./gawk/sum.awk - single column - pipe" {
    result="$( seq 1 10 | gawk -f ./gawk/sum.awk )"
    [ $result -eq 55 ]
}

@test "gawk -f ./gawk/sum.awk - single column - file" {
    result="$( gawk -f ./gawk/sum.awk ./data/seq.1.10.txt )"
    [ $result -eq 55 ]
}

@test "gawk -f ./gawk/sum.awk - alphanumberic" {
    result="$( cat ./data/alphanumeric.txt | gawk -f ./gawk/sum.awk )"
    [ $result -eq 45 ]
}


# TODO: support multi-column output yet
@test "gawk -f ./gawk/sum.awk - magic square" {
    result="$( cat ./data/magic_square_3.txt | gawk -f ./gawk/sum.awk )"
    [ $result -eq 15 ]
}
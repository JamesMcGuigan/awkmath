#!/usr/bin/env bats
cd ${BATS_TEST_DIRNAME}/../
export AWKPATH=${BATS_TEST_DIRNAME}/../modules/


@test "gawk -f ./gawk/avg.awk - empty string" {
    result="$( echo | gawk -f ./gawk/avg.awk )"
    [ $result -eq 0 ]
}

@test "gawk -f ./gawk/avg.awk - single column - pipe" {
    result="$( seq 1 10 | gawk -f ./gawk/avg.awk )"
    [ $result == "5.5" ]
}

@test "gawk -f ./gawk/avg.awk - single column - file" {
    result="$( gawk -f ./gawk/avg.awk ./data/seq.1.10.txt )"
    [ $result == "5.5" ]
}

@test "gawk -f ./gawk/avg.awk - alphanumberic" {
    result="$( cat ./data/alphanumeric.txt | gawk -f ./gawk/avg.awk )"
    [ $result == "4.5" ]
}

# TODO: support multi-column output yet
@test "gawk -f ./gawk/avg.awk - magic square" {
    result="$( cat ./data/magic_square_3.txt | gawk -f ./gawk/avg.awk )"
    [ $result -eq 5 ]
}

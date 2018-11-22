#!/usr/bin/env bats
cd ${BATS_TEST_DIRNAME}/../
export AWKPATH=${BATS_TEST_DIRNAME}/../modules/


@test "gawk -f ./gawk/count.awk - empty string" {
    result="$( echo | gawk -f ./gawk/count.awk )"
    [ $result -eq 0 ]
}

@test "gawk -f ./gawk/count.awk - single column - pipe" {
    result="$( seq 1 10 | gawk -f ./gawk/count.awk )"
    [ $result -eq 10 ]
}

@test "gawk -f ./gawk/count.awk - single column - file" {
    result="$( gawk -f ./gawk/count.awk ./data/seq.1.10.txt )"
    [ $result -eq 10 ]
}

@test "gawk -f ./gawk/counts.awk - alphanumberic" {
    result="$( cat ./data/alphanumeric.txt | gawk -f ./gawk/count.awk )"
    [ $result -eq 10 ]
}

# TODO: support multi-column output yet
@test "gawk -f ./gawk/count.awk - magic square" {
    result="$( cat ./data/magic_square_3.txt | gawk -f ./gawk/count.awk )"
    [ $result -eq 3 ]
}

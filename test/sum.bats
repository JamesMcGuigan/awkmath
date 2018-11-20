#!/usr/bin/env bats
cd ${BATS_TEST_DIRNAME}/../
PATH=${BATS_TEST_DIRNAME}/../bin/:$PATH

@test "sum.awk - empty string" {
    result="$( echo | sum.awk )"
    [ $result -eq 0 ]
}

@test "sum.awk - single column - pipe" {
    result="$( seq 1 10 | sum.awk )"
    [ $result -eq 55 ]
}

@test "sum.awk - single column - file" {
    result="$( sum.awk ./test/data/seq.1.10.txt )"
    [ $result -eq 55 ]
}

@test "sum.awk - alphanumberic" {
    result="$( cat ./test/data/alphanumeric.txt | sum.awk )"
    [ $result -eq 45 ]
}


# TODO: support multi-column output yet
@test "sum.awk - magic square" {
    result="$( cat ./test/data/magic_square_3.txt | sum.awk )"
    [ $result -eq 15 ]
}
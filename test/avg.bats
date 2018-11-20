#!/usr/bin/env bats
cd ${BATS_TEST_DIRNAME}/../
PATH=${BATS_TEST_DIRNAME}/../bin/:$PATH

@test "avg.awk - empty string" {
    result="$( echo | avg.awk )"
    [ $result -eq 0 ]
}

@test "avg.awk - single column - pipe" {
    result="$( seq 1 10 | avg.awk )"
    [ $result == "5.5" ]
}

@test "avg.awk - single column - file" {
    result="$( avg.awk ./test/data/seq.1.10.txt )"
    [ $result == "5.5" ]
}

@test "avg.awk - alphanumberic" {
    result="$( cat ./test/data/alphanumeric.txt | avg.awk )"
    [ $result == "4.5" ]
}

# TODO: support multi-column output yet
@test "avg.awk - magic square" {
    result="$( cat ./test/data/magic_square_3.txt | avg.awk )"
    [ $result -eq 5 ]
}

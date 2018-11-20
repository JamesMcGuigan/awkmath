#!/usr/bin/env bats
cd ${BATS_TEST_DIRNAME}/../
PATH=${BATS_TEST_DIRNAME}/../bin/:$PATH

@test "count.awk - empty string" {
    result="$( echo | count.awk )"
    [ $result -eq 0 ]
}

@test "count.awk - single column - pipe" {
    result="$( seq 1 10 | count.awk )"
    [ $result -eq 10 ]
}

@test "count.awk - single column - file" {
    result="$( count.awk ./test/data/seq.1.10.txt )"
    [ $result -eq 10 ]
}

@test "counts.awk - alphanumberic" {
    result="$( cat ./test/data/alphanumeric.txt | count.awk )"
    [ $result -eq 10 ]
}

# TODO: support multi-column output yet
@test "count.awk - magic square" {
    result="$( cat ./test/data/magic_square_3.txt | count.awk )"
    [ $result -eq 3 ]
}

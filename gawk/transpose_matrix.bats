#!/usr/bin/env bats
cd ${BATS_TEST_DIRNAME}/../
export AWKPATH=${BATS_TEST_DIRNAME}/../modules/


@test "gawk -f ./gawk/transpose_matrix.awk - empty string" {
    result="$( echo | gawk -f ./gawk/transpose_matrix.awk )"
    expected=""
    echo ">$result<"
    echo ">$expected<"
    [[ $result == $expected ]]
}

@test "seq 1 10 | gawk -f ./gawk/transpose_matrix.awk" {
    result="$( seq 1 10 | gawk -f ./gawk/transpose_matrix.awk)"
    expected="1 2 3 4 5 6 7 8 9 10"
    echo ">$result<"
    echo ">$expected<"
    [[ $result == $expected ]]
}

@test "gawk -f ./gawk/transpose_matrix.awk ./data/seq.1.10.txt" {
    result="$( gawk -f ./gawk/transpose_matrix.awk ./data/seq.1.10.txt )"
    expected="1 2 3 4 5 6 7 8 9 10"
    echo ">$result<"
    echo ">$expected<"
    [[ $result == $expected ]]
}

@test "cat ./data/alphanumeric.txt | gawk -f ./gawk/transpose_matrix.awk" {
    result="$( cat ./data/alphanumeric.txt | gawk -f ./gawk/transpose_matrix.awk )"
    expected="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 2 3 4 5 6 7 8 9 0"
    echo ">$result<"
    echo ">$expected<"
    [[ $result == $expected ]]
}

@test "cat ./data/matrix_4_6.txt | gawk -f ./gawk/transpose_matrix.awk" {
    result="$( cat ./data/matrix_4_6.txt | gawk -f ./gawk/transpose_matrix.awk )"
    expected="$( cat ./data/matrix_4_6_T.txt | sed -E 's/0([0-9])/\1/g' )"  # transpose_matrix.awk converts to numeric
    echo ">$result<"
    echo ">$expected<"
    [[ $result == $expected ]]
}


@test "cat ./data/magic_square_3.txt | gawk -f ./gawk/transpose_matrix.awk" {
    ### Weird BUG:
    ### 2 9 4
    ### 7 5 3
    ###  8
    ### FIXED: avoid using printf("%s" or "%d") for untyped input

    result="$( cat ./data/magic_square_3.txt | gawk -f ./gawk/transpose_matrix.awk )"
    expected="$( cat ./data/magic_square_3_T.txt )"
    echo ">$result<"
    echo ">$expected<"
    [[ $result == $expected ]]
}

@test "cat ./data/magic_square_3.txt | gawk -f ./gawk/transpose_matrix.awk | gawk -f ./gawk/transpose_matrix.awk" {
    result="$( cat ./data/magic_square_3.txt | gawk -f ./gawk/transpose_matrix.awk | gawk -f ./gawk/transpose_matrix.awk )"
    expected="$( cat ./data/magic_square_3.txt )"
    echo ">$result<"
    echo ">$expected<"
    [[ $result == $expected ]]
}


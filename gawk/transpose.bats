#!/usr/bin/env bats
cd ${BATS_TEST_DIRNAME}/../
export AWKPATH=${BATS_TEST_DIRNAME}/../modules/


@test "echo | gawk -f ./gawk/transpose.awk" {
    result="$( echo | gawk -f ./gawk/transpose.awk )"
    echo ">$result<"
    [[ $result == '' ]]
}

@test "seq 1 10 | gawk -f ./gawk/transpose.awk" {
    result="$( seq 1 10 | gawk -f ./gawk/transpose.awk )"
    echo ">$result<"
    [[ $result == "1 2 3 4 5 6 7 8 9 10" ]]
}

@test "gawk -f ./gawk/transpose.awk ./data/seq.1.10.txt" {
    result="$( gawk -f ./gawk/transpose.awk ./data/seq.1.10.txt )"
    echo ">$result<"
    [[ $result == "1 2 3 4 5 6 7 8 9 10" ]]
}

@test "cat ./data/alphanumeric.txt | gawk -f ./gawk/transpose.awk" {
    result="$( cat ./data/alphanumeric.txt | gawk -f ./gawk/transpose.awk )"
    echo ">$result<"
    [[ $result == "a b c d e f g h i j k l m n o p q r s t u v w x y z 1 2 3 4 5 6 7 8 9 0" ]]
}

@test "cat ./data/matrix_4_6.txt | gawk -f ./gawk/transpose.awk" {
    result="$( cat ./data/matrix_4_6.txt | gawk -f ./gawk/transpose.awk )"
    expected="$( cat ./data/matrix_4_6_T.txt )"
    echo ">$result<"
    echo ">$expected<"
    [[ $result == $expected ]]
}


@test "cat ./data/magic_square_3.txt | gawk -f ./gawk/transpose.awk" {
    ### Weird BUG:
    ### 2 9 4
    ### 7 5 3
    ###  8
    ### FIXED: avoid using printf("%s" or "%d") for untyped input

    result="$( cat ./data/magic_square_3.txt | gawk -f ./gawk/transpose.awk )"
    expected="$( cat ./data/magic_square_3_T.txt )"
    echo ">$result<"
    echo ">$expected<"
    [[ $result == $expected ]]
}

@test "cat ./data/magic_square_3.txt | gawk -f ./gawk/transpose.awk | gawk -f ./gawk/transpose.awk" {
    result="$( cat ./data/magic_square_3.txt | gawk -f ./gawk/transpose.awk | gawk -f ./gawk/transpose.awk )"
    expected="$( cat ./data/magic_square_3.txt )"
    echo ">$result<"
    echo ">$expected<"
    [[ $result == $expected ]]
}


#!/usr/bin/env bats
cd ${BATS_TEST_DIRNAME}/../
export AWKPATH=${BATS_TEST_DIRNAME}/../modules/


@test "gawk -f ./gawk/transpose.awk - empty string" {
    result="$( echo | gawk -f ./gawk/transpose.awk )"
    echo ">$result<"
    [[ $result == '' ]]
}

@test "gawk -f ./gawk/transpose.awk - single column - pipe" {
    result="$( seq 1 10 | gawk -f ./gawk/transpose.awk )"
    echo ">$result<"
    [[ $result == "1 2 3 4 5 6 7 8 9 10" ]]
}

@test "gawk -f ./gawk/transpose.awk - single column - file" {
    result="$( gawk -f ./gawk/transpose.awk ./data/seq.1.10.txt )"
    echo ">$result<"
    [[ $result == "1 2 3 4 5 6 7 8 9 10" ]]
}

@test "gawk -f ./gawk/transpose.awk - alphanumberic" {
    result="$( cat ./data/alphanumeric.txt | gawk -f ./gawk/transpose.awk )"
    echo ">$result<"
    [[ $result == "a b c d e f g h i j k l m n o p q r s t u v w x y z 1 2 3 4 5 6 7 8 9 0" ]]
}

@test "gawk -f ./gawk/transpose.awk - matrix" {
    result="$( cat ./data/matrix_4_6.txt | gawk -f ./gawk/transpose.awk )"
    expected="$( cat ./data/matrix_4_6_T.txt )"
    echo ">$result<"
    [[ $result == $expected ]]
}


@test "gawk -f ./gawk/transpose.awk - magic_square_3.txt" {
    ### Weird fail:
    ### 2 9 4
    ### 7 5 3
    ###  8

    result="$( cat ./data/magic_square_3.txt | gawk -f ./gawk/transpose.awk )"
    expected="$( cat ./data/magic_square_3_T.txt )"
    echo ">$result<"
    [[ $result == $expected ]]
}

@test "gawk -f ./gawk/transpose.awk - magic_square_3 - reversable" {
    result="$( cat ./data/magic_square_3.txt | gawk -f ./gawk/transpose.awk | gawk -f ./gawk/transpose.awk )"
    expected="$( cat ./data/magic_square_3.txt )"
    echo ">$result<"
    [[ $result == $expected ]]
}


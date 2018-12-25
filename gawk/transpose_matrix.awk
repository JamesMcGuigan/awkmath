@include "matrix.awk"

{
    matrix__read_row(matrix)
}

END {
    matrix__resize(matrix)
    matrix__transpose(matrix, matrix_T)
    #matrix__print(matrix)
    matrix__print(matrix_T)
}

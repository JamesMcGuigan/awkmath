# typeof() requires gawk 4.2+
# Updating WSL: http://wsl-guide.org/en/latest/update.html

function make_array( array ) {
    if( typeof(array) != "array" ) {
        array[1] = "";
        delete array[1]
    }
}

function matrix__clone(matrix, output,      i) {
    # make_array( matrix )  # will throw exception if matrix is scalar
    make_array( output )

    # If clone is defined, then remove any additional keys

    for( i in output ) {
        if( ! i in matrix ) {
            delete output[i]
        }
    }

    # Source: https://unix.stackexchange.com/questions/456315/clone-complex-array-in-awk
    for( i in matrix ) {
        if( isarray(matrix[i]) ) {
            make_array( output[i] )
            clone(output[i], matrix[i])
        } else {
            output[i] = matrix[i]
        }
    }
}

function matrix__read_row(matrix,       max_x, max_y, x, y) {
    max_x = NF
    y     = NR
    for( x = 1; x <= max_x; x++ ) {
        matrix[x][y] = $x
    }
    if( matrix["X"] + 0 < max_x ) {
       matrix["X"] = max_x
    }
    if( matrix["Y"] + 0 < y ) {
       matrix["Y"] = y
    }
}

function matrix__size(matrix,       max_x, max_y, x, y) {
    ### Assumes only contiguous numeric fields exist
    # max_x = length(matrix)
    # max_y = 0
    # for( x in matrix ) {
    #    if( max_y <= length(matrix[x]) ) {
    #       max_y = length(matrix[x])
    #   }
    # }

    max_x = 0
    max_y = 0

    for( x in matrix ) {
        if( x == "X" || x == "Y" ) { continue; }
        if( x > max_x            ) { max_x = x }
        if( !isarray(matrix[x])  ) { continue; }
        for( y in matrix[x] ) {
            if( y > max_y ) { max_y = y }
        }
    }
    matrix["X"] = max_x
    matrix["Y"] = max_y
}


function matrix__resize(matrix, max_x, max_y,       output, x, y) {
    if( matrix["X"] + 0 <= 0 || matrix["Y"] + 0 <= 0 ) {
        matrix__size(matrix)
    }
    if( max_y + 0 <= 0 ) { max_y = 0 + matrix["Y"] }
    if( max_x + 0 <= 0 ) { max_x = 0 + matrix["X"] }

    # Remove any numeric field values outside of max range
    for( x in matrix ) {
        if( x + 0 > max_x       ) { delete matrix[x]; continue; }
        if( !isarray(matrix[x]) ) { continue; }

        for( y in matrix[x] ) {
            if( y + 0 > max_y ) {
                delete matrix[x][y]
            }
        }
    }

    # Ensure max range of matrix is defined
    for( x = 1; x <= max_x; x++ ) {
        for( y = 1; y <= max_y; y++ ) {
            # make_array( matrix[x] )
            matrix[x][y] = matrix[x][y]
        }
    }
}


function matrix__transpose(matrix, output,      x, y) {
    inplace = (typeof(output) == "array") ? 1 : 0

    make_array( output )
    output["X"] = matrix["Y"]  # needed for matrix__print
    output["Y"] = matrix["X"]

    for( x = 1; x <= matrix["X"]; x++ ) {
        for( y = 1; y <= matrix["Y"]; y++ ) {
            output[y][x] = 0 + matrix[x][y]
        }
    }
    #if( inplace ) {
    #    matrix__clone(output, matrix)
    #}
}

function matrix__print(matrix,      x, y) {
    OORS=ORS
    ORS=""    # this allows print() without newline

    for( y = 1; y <= matrix["Y"]; y++ ) {
        for( x = 1; x <= matrix["X"]; x++ ) {
            print( matrix[x][y] )
            if( x != matrix["X"] ) { printf(OFS) }
        }
        printf(OORS)
    }

    ORS=OORS
    return output
}
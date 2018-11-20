function isnumber( field ) {

    # Its a number if we can do maths with it - strings evaluate evaluate to zero
    if( field * 1 != 0                      ) { return 1 }

    # Number 0 must contain the digit zero and a match +0.0e0 number format
    if( field ~ /0/ && field ~ /^\s*[+-]?0*\.?0*e?0*\s*$/ ) { return 1 }

    # Not a number if it evaluates to zero, but doesn't match a zero number regex
    return 0
}

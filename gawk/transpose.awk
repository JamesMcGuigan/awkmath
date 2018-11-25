{
     if( max_nf < NF ) { max_nf = NF }
     if( max_nr < NR ) { max_nr = NR }

     for( n = 1; n <= NF; n++ ) {
        # print n "," NR "=", $i
        vector[n,NR] = $n
    }
}
END {
    OORS=ORS
    ORS=""    # this allows print() without newline
    #print "vector[1, 3]", vector[1, 3]
    #print "max_nf", max_nf
    #print "max_nr", max_nr

    for( x = 1; x <= max_nf; x++ ) {
        for( y = 1; y <= max_nr; y++ ) {
            print(vector[x,y])
            # printf(vector[x,y] + 0 != 0 ? "%d" : "%s", vector[x,y])  # breaks with "01"
            if( y != max_nr ) { printf(OFS) }
        }
        printf(OORS)
    }
}

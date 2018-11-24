# AWKA

Awka is an AWK -> C compiler
- https://sourceforge.net/projects/awka/
- http://awka.sourceforge.net/specifics.html

## Limitations

awka cannot compile gawk @include statements, 
not does it automattically link #use statements in
runawk. 

GCC compilation requires libawka.h in path.


## Install
```bash
./awka/install.sh
```

## Compile
```bash
./awka/compile.sh
```
# awkmath

This is a functional programming toolkit of awk scripts 
for command-line numerical computations

## RunAwk

runawk is a small wrapper for AWK interpreter that impements modules 
system and helps one to write the standalone AWK programs.
- https://github.com/cheusov/runawk

Add runawk scripts to path, then run as follows:
```bash
$ grep -r result= runawk/*.bats | perl -p -e 's/^.*\$\( *|\)" *$//g'

echo | ./runawk/avg.awk
seq 1 10 | ./runawk/avg.awk
./runawk/avg.awk ./data/seq.1.10.txt
cat ./data/alphanumeric.txt | ./runawk/avg.awk
cat ./data/magic_square_3.txt | ./runawk/avg.awk
echo | ./runawk/count.awk
seq 1 10 | ./runawk/count.awk
./runawk/count.awk ./data/seq.1.10.txt
cat ./data/alphanumeric.txt | ./runawk/count.awk
cat ./data/magic_square_3.txt | ./runawk/count.awk
echo | ./runawk/product.awk
seq 1 10 | ./runawk/product.awk
./runawk/product.awk ./data/seq.1.10.txt
cat ./data/alphanumeric.txt | ./runawk/product.awk
cat ./data/magic_square_3.txt | ./runawk/product.awk
echo | ./runawk/sum.awk
seq 1 10 | ./runawk/sum.awk
./runawk/sum.awk ./data/seq.1.10.txt
cat ./data/alphanumeric.txt | ./runawk/sum.awk
cat ./data/magic_square_3.txt | ./runawk/sum.awk
```


## Gawk

Gawk is the traditional way to run awk, but 
cannot be run as neatly on the command line, and 
requires $AWKPATH to be set as an environment variable
rather than permitting relative file imports.

```bash
echo | gawk -f ./gawk/avg.awk
seq 1 10 | gawk -f ./gawk/avg.awk
gawk -f ./gawk/avg.awk ./data/seq.1.10.txt
cat ./data/alphanumeric.txt | gawk -f ./gawk/avg.awk
cat ./data/magic_square_3.txt | gawk -f ./gawk/avg.awk
echo | gawk -f ./gawk/count.awk
seq 1 10 | gawk -f ./gawk/count.awk
gawk -f ./gawk/count.awk ./data/seq.1.10.txt
cat ./data/alphanumeric.txt | gawk -f ./gawk/count.awk
cat ./data/magic_square_3.txt | gawk -f ./gawk/count.awk
echo | gawk -f ./gawk/product.awk
seq 1 10 | gawk -f ./gawk/product.awk
gawk -f ./gawk/product.awk ./data/seq.1.10.txt
cat ./data/alphanumeric.txt | gawk -f ./gawk/product.awk
cat ./data/magic_square_3.txt | gawk -f ./gawk/product.awk
echo | gawk -f ./gawk/sum.awk
seq 1 10 | gawk -f ./gawk/sum.awk
gawk -f ./gawk/sum.awk ./data/seq.1.10.txt
cat ./data/alphanumeric.txt | gawk -f ./gawk/sum.awk
cat ./data/magic_square_3.txt | gawk -f ./gawk/sum.awk
```

# Debugger
```bash
gawk -D -f ./gawk/avg.awk ./data/magic_square_3.txt
```

# ARGV Dump
```bash
$ runawk -d -f ./runawk/avg.awk ./data/magic_square_3.txt
new_argv [0] = ./data/magic_square_3.txt
new_argv [1] = -f
new_argv [2] = /mnt/c/Users/james/Dropbox/Programming/GitHubPersonal/awkmath/./runawk/../modules/isnumber.awk
new_argv [3] = -f
new_argv [4] = /mnt/c/Users/james/Dropbox/Programming/GitHubPersonal/awkmath/./runawk/avg.awk
new_argv [5] = -f
new_argv [6] = /mnt/c/Users/james/Dropbox/Programming/GitHubPersonal/awkmath/./data/magic_square_3.txt
new_argv [7] = --
```

# Lint
```bash
$ gawk --lint -f ./gawk/avg.awk ./data/magic_square_3.txt
gawk: ./gawk/avg.awk:6: warning: `include' is a gawk extension
gawk: ./gawk/avg.awk:16: warning: source file does not end in newline
5
```

```bash
$ gawk -l -f ./runawk/avg.awk ./data/magic_square_3.txt
gawk: fatal: can't open shared library `-f' for reading (No such file or directory)
```

# Posix Mode
```bash
$ gawk -p- -P -f ./gawk/avg.awk ./data/alphanumeric.txt
gawk: ./gawk/avg.awk:6: @include "isnumber.awk"
gawk: ./gawk/avg.awk:6:  ^ syntax error
```

# Pretty Print
```bash
$ gawk -o- -f ./gawk/avg.awk ./data/magic_square_3.txt
5
        # gawk profile, created Thu Nov 22 22:52:42 2018

        # BEGIN rule(s)

        BEGIN {
                COUNT = 0
                SUM = 0
        }

        # Rule(s)

        isnumber($1) {
                COUNT += 1
                SUM += $1
        }

        # END rule(s)

        END {
                if (COUNT == 0) {
                        print 0
                } else {
                        print SUM / COUNT
                }
        }


        # Functions, listed alphabetically

        function isnumber(field)
        {
                if (field * 1 != 0) {
                        return 1
                }
                if (field ~ /0/ && field ~ /^\s*[+-]?0*\.?0*e?0*\s*$/) {
                        return 1
                }
                return 0
        }
```

```bash
$ gawk -o- -f ./runawk/avg.awk ./data/magic_square_3.txt
gawk: ./runawk/avg.awk:11: (FILENAME=./data/magic_square_3.txt FNR=1) fatal: function `isnumber' not defined
```

# Profile

```bash
[22:55:37]james@BladePro:/mnt/c/Users/james/Dropbox/Programming/GitHubPersonal/awkmath|master
$ gawk -p- -f ./gawk/avg.awk ./data/alphanumeric.txt
4.5
        # gawk profile, created Thu Nov 22 22:57:03 2018

        # BEGIN rule(s)

        BEGIN {
     1          COUNT = 0
     1          SUM = 0
        }

        # Rule(s)

    36  isnumber($1) { # 10
    10          COUNT += 1
    10          SUM += $1
        }

        # END rule(s)

        END {
     1          if (COUNT == 0) {
                        print 0
     1          } else {
     1                  print SUM / COUNT
                }
        }


        # Functions, listed alphabetically

    36  function isnumber(field)
        {
    36          if (field * 1 != 0) { # 9
     9                  return 1
                }
    27          if (field ~ /0/ && field ~ /^\s*[+-]?0*\.?0*e?0*\s*$/) { # 1
     1                  return 1
                }
    26          return 0
        }
```
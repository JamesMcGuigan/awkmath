# awkmath

This is a functional programming toolkit of awk scripts 
for command-line numerical computations

## RunAwk

runawk is a small wrapper for AWK interpreter that impements modules 
system and helps one to write the standalone AWK programs.
- https://github.com/cheusov/runawk

Add runawk scripts to path, then run as follows:
```$bash
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

```$bash
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

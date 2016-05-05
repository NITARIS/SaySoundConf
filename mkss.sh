#! /bin/sh

cat input/header
bin/mksuicide.pl < input/suicide.txt
bin/mksaysound.pl < input/saysound.csv
cat input/footer

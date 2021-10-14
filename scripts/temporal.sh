#!/usr/bin/bash

#ProjectID;CommitID;timestamps;first/last
cat ../data/projects.csv |
cut -d\; -f1 |
while read p; do
    echo $p |
    ~/lookup/getValues -f P2c |
    cut -d\; -f2 |
    ~/lookup/getValues c2dat |
    cut -d\; -f1,2 |
    ~/lookup/lsort 20G -t\; -n -k2,2 |
    sed "s/^/$p;/" > ../data/$p.sorted;
    head -10000 < ../data/$p.sorted |
    sed 's/$/;1/' ;
    tail -10000 < ../data/$p.sorted |
    sed 's/$/;2/' ;
done |
gzip > ../data/temporal.csv.gz;
#!/usr/bin/bash

#authors in each commit table 
for i in {0..127}; do
    zcat ../data/commits.$i.gz |
    cut -d\; -f2,3 |
    sed 's/;/\n/' |
    uniq |
    ~/lookup/lsort 10G |
    uniq > ../data/authors1.$i ;
done

#consolidating in a single table
end=64;
for i in {1..7}; do
    for j in $(seq 0 $(($end - 1))); do
        cat ../data/authors$i.$j ../data/authors$i.$(($end + $j)) | 
        ~/lookup/lsort 10G |
        uniq > ../data/authors$(($i + 1)).$j;
    done;
    end=$(($end/2));
    rm ../data/authors$i.*;
done;
gzip < ../data/authors8.0 > ../data/authors.csv.gz;
rm ../data/authors8.0;
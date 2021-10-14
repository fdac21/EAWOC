#!/usr/bin/bash

#ProjectID;CommitID;Author;Committer;Author Time;Committer Time;Author Timezone;Committer Timezone;Commit Message
cat ../data/projects.csv |
cut -d\; -f1 |
while read p; do
    echo $p |
    ~/lookup/getValues -f P2c | 
    cut -d\; -f2 |
    ~/lookup/showCnt commit 9 2>>commits.error | 
    cut -d\; -f1,4-10 |
    sed "s|^|$p;|";
done | 
~/lookup/splitSecCh.perl ../data/commits. 128;

gzip <commits.error >../data/commits.err.gz;
rm commits.error;
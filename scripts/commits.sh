#!/usr/bin/bash

#too slow!
# cat ../data/projects.csv |
# cut -d\; -f1 |
# while read p; do
#     echo $p |
#     ~/lookup/getValues -f P2c | 
#     cut -d\; -f2 |
#     while read c; do
#         cdata=$(echo $c | ~/lookup/showCnt commit 9 | cut -d\; -f1,4-10);
#         echo "$p;$cdata";
#     done;
# done > ../data/commits.csv 2>../data/commits.error

#CommitID;Author;Committer;Author Time;Committer Time;Author Timezone;Committer Timezone;Commit Message
cat ../data/projects.csv | cut -d\; -f1 | 
~/lookup/getValues -f P2c | cut -d\; -f2 |
~/lookup/showCnt commit 9 2>../data/commits.error | 
cut -d\; -f1,4-10 >../data/commits.csv;
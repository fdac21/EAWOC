#!/usr/bin/bash

#extracting data from json file
file="../data/projects_T.json";
l=$(cat $file | jq length);
for i in $(seq 0 $(($l - 1))); do
    obj=$(cat $file | jq .[$i]);
    p=$(echo $obj | jq .ProjectID | cut -d\" -f2);
    nc=$(echo $obj | jq .NumCommits);
    nb=$(echo $obj | jq .NumBlobs);
    nob=$(echo $obj | jq .NumOriginalBlobs);
    nfi=$(echo $obj | jq .NumFiles);
    na=$(echo $obj | jq .NumAuthors);
    nfo=$(echo $obj | jq .NumForks);
    nm=$(echo $obj | jq .NumActiveMon);
    lt=$(echo $obj | jq .LatestCommitDate);
    echo "$p;$nc;$nb;$nob;$nfi;$na;$nfo;$nm;$lt";
done > ../data/projects.csv;
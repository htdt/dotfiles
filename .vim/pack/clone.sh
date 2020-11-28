#!/bin/bash
cd $1
while IFS= read -r line
do
    git clone "$line"
done < "urls.txt"

#!/bin/bash

dir="_posts"
for file in `ls ${dir} | grep '.md'`;do
    content=$(cat ${dir}/${file}| head -n 10 | grep 'date: ')
    datestr=$(echo "$content" | awk '{print $2" "$3}')
    newcontent="updated: "$datestr
    sed -i "/$content/a\\$newcontent" ${dir}/${file}
done
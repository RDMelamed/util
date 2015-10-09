#!/bin/bash
file=$1
rownum=$2
head -n 1 $file | tr "\t" "\n" | awk '{print NR"\t"$0}' > row_info1
if [ $# > 1 ] ; then
    awk -v rownum=$rownum 'NR==rownum' $file | tr "\t" "\n" > row_info2
else
    echo '' > row_info2
fi
paste -d"\t\t\t" row_info1 row_info2
rm row_info1 row_info2
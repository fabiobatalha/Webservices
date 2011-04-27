#!/bin/sh

. scielo2couchdb_config.sh

i=0

for databases in `ls -1 $database_dir"output/iso/"`
do
    ISOFILE=$database_dir/output/iso/$databases
    echo "Counting registers in "$databases
    total=`$cisis_dir/mx iso=$database_dir/output/iso/$databases pft=mfn/ now | wc -l`

    echo "Bulking $total registers - Be calm, this process could take a while!"

    if [ $databases == "bib4cit.iso" ]
    then
        k="-k v706:c"
    elif [ $databases == "title.iso" ]
    then
        k="-k v706:t"
    fi

    while [ $i -le $total ]
    do
        $python26_path ../lib/isis2couchdb/tools/isis2json.py $ISOFILE -c -q $bulk_size -s $i -p v -t 3 $k | curl -d @- -H "Content-Type: application/json" -X POST $couchdb_database/_bulk_docs
        if [ $(($i + $bulk_size)) -ge $total ]
        then
            tmp=$(($i - $bulk_size))
            bulk_size=$(($total - $tmp))
            echo "done from "$i" to " $total
            break 1
        else
            echo "done from "$i" to " `expr $i + $bulk_size`
            i=$(($i + $bulk_size))
        fi
    done
    y=""
    i=0
done
cat ../input/network/network.json | curl -d @- -H "Content-Type: application/json" -X POST $couchdb_database/_bulk_docs

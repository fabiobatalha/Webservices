#!/bin/sh
#SRV="http://fabiobatalha.couchone.com"
ISOFILE=$1
CouchDTB=$2
split=$3
i=0
while [ $i -le 200000 ]
do
    echo "from "$i" to " `expr $i + $split`
    ./isis2json.py $ISOFILE -cf -q $split -s $i -u -t v | curl -d @- -H "Content-Type: application/json" -X POST $CouchDTB/_bulk_docs
    i=$(($i + $split))
done

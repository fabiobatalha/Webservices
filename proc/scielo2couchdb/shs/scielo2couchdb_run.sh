. scielo2couchdb_config.sh

echo "[ACTIVATING VIRTUAL ENVIRONMENT]"
source ../../../webservices-env/bin/activate

echo "[CLEANING ENVIRONMENT]"

echo  "rm -rf ../output/iso/*"
rm -rf ../output/iso/*

echo "[DELETING DATABASE $couchdb_url$couchdb_database]"

echo "curl -X DELETE $couchdb_url$couchdb_database"
curl -X DELETE $couchdb_url$couchdb_database

echo "[CREATING EMPTY DATABASE $couchdb_url$couchdb_database]"

echo "curl -X PUT $couchdb_url$couchdb_database"
curl -X PUT $couchdb_url$couchdb_database

echo "[RUNNIUNG INDEX DATABASES]"
./scielo2couchdb_index.sh

echo "[RUNING JOIN DATABASES]"
./scielo2couchdb_joindatabases.sh

echo "[RUNNING BULKUP]"
./scielo2couchdb_bulkup.sh

echo "[CLEANING ENVIRONMENT]"

echo  "rm -rf ../output/iso/*"
rm -rf ../output/iso/*

echo "[COMPACTING DATABASE]"
./scielo2couchdb_compact.sh

#VERIFY IF REPLY
if [ $reply == "true" ]
  then
    echo "[REPLICATE DATABASE]"
    ./scielo2couchdb_reply.sh
fi

echo "[INDEX VIEWS]"
./scielo2couchdb_index_views.sh

echo "[DEACTIVATING VIRTUAL ENVIRONMENT]"
deactivate

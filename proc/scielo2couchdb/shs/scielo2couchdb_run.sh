. scielo2couchdb_config.sh

echo "[CLEANING ENVIRONMENT]"
echo  "rm -f ../output/iso/*"
rm -f ../output/iso/*

echo "[DELETING DATABASE $couchdb_database]"
echo "curl -X DELETE $couchdb_database"
curl -X DELETE $couchdb_database

echo "[CREATING EMPTY DATABASE $couchdb_database]"
echo "curl -X PUT $couchdb_database"
curl -X PUT $couchdb_database

echo "[RUNNIUNG INDEX DATABASES]"
./scielo2couchdb_index.sh

echo "[RUNING JOIN DATABASES]"
./scielo2couchdb_joindatabases.sh

echo "[RUNNING BULKUP]"
./scielo2couchdb_bulkup.sh

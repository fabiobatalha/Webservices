. scielo2couchdb_config.sh

ECHO "RUNING JOIN DATABASES"
./scielo2couchdb_joindatabases.sh

ECHO "RUNNING BULKUP"
./scielo2couchdb_bulkup.sh

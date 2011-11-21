#http://wiki.apache.org/couchdb/Compaction
. scielo2couchdb_config.sh

curl -H "Content-Type: application/json" -X POST $couchdb_database/_compact

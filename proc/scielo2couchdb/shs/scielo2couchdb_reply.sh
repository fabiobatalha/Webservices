. scielo2couchdb_config.sh

curl -X POST $couchdb_url"_replicate"  -d '{"source":"'$couchdb_url$couchdb_database'", "target":"'$target'"}' -H "Content-Type: application/json" 

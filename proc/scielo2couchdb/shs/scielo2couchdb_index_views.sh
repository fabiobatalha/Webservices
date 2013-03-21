. scielo2couchdb_config.sh

#FIXME: This have to index all views
curl -H "Content-Type: application/json" -X GET $couchdb_url$couchdb_database/_design/couchdb/_view/article_id

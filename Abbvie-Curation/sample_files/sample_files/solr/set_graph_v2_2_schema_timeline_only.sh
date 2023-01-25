#!/bin/bash

COLLECTION="timeline"

curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"source_type", "type":"string", "indexed":true, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"strength", "type":"pfloat", "stored":true, "indexed":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"date", "type":"pdate", "indexed":true, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"epoch_time", "type":"plong", "indexed":true, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema

curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"start_date", "type":"pdate", "indexed":true, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"end_date", "type":"pdate", "indexed":true, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema

curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"relUid", "type":"string", "stored":true, "indexed":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"version", "type":"string", "stored":true, "indexed":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
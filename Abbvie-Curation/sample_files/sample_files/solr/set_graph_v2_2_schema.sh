#!/bin/bash

COLLECTION="evidence"

curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"start_node", "type":"string", "stored":true, "indexed":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"end_node", "type":"string", "stored":true, "indexed":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"source_type", "type":"string", "indexed":true, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"source_id", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"source_name", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"strength", "type":"pfloat", "stored":true, "indexed":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"sentence_text", "type":"text_general", "indexed":true, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"concept_1_mention", "type":"string", "stored":true, "indexed":false, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"concept_2_mention", "type":"string", "stored":true, "indexed":false, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"sentence_no", "type":"pint", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"title", "type":"text_general", "indexed":true, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"author", "type":"text_general", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"date", "type":"pdate", "indexed":true, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"epoch_time", "type":"plong", "indexed":true, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"journal", "type":"text_general", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"impact_factor", "type":"pfloat", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"link", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema

curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"sponsor", "type":"text_general", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"conditions", "type":"text_general", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"interventions", "type":"text_general", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"phase", "type":"text_general", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"start_date", "type":"pdate", "indexed":true, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"end_date", "type":"pdate", "indexed":true, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema

curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"variant_name", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"p_log_value", "type":"pfloat", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"study_accession", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"study_title", "type":"text_general", "indexed":true, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema

curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"inventor", "type":"text_general", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"assignee", "type":"text_general", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"filing_type", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema

curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"relUid", "type":"string", "stored":true, "indexed":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"version", "type":"string", "stored":true, "indexed":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema

curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"concept_1_start", "type":"pint", "stored":true, "indexed":false, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"concept_1_end", "type":"pint", "stored":true, "indexed":false, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"concept_2_start", "type":"pint", "stored":true, "indexed":false, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"concept_2_end", "type":"pint", "stored":true, "indexed":false, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema

curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"entity_1_name", "type":"string", "stored":true, "indexed":false, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"entity_2_name", "type":"string", "stored":true, "indexed":false, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema

curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"rel_type", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"run_date", "type":"pdate", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"start_link", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"end_link", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"caseid", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"caseversion", "type":"pint", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"drugname", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"role_cod", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"reaction", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"drug_seq", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"init_fda_dt", "type":"pdate", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"latest_revision_dt", "type":"pdate", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"event_dt", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"mfr_dt", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"rept_dt", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"therapy_start_dt", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"therapy_end_dt", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"rept_cod", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"auth_num", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"mfr_num", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"mfr_sndr", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"lit_ref", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"age", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"age_grp", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"sex", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"e_sub", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"wt", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"to_mfr", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"occp_cod", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"reporter_country", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"occr_country", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"drug_indication", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"val_vbm", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"drug_route", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"dose_verbatim", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"cumulative_dose", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"dose_amt", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"dose_form", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"dose_frequency", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"therapy_duration", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"source_version", "type":"string", "indexed":false, "stored":true, "multiValued":false}}' http://localhost:8983/solr/${COLLECTION}/schema

#!/bin/bash

SOLR_ROOT="/opt/bitnami/solr"
FOLDER="solr_graph_v2_1_2021-01-12"
COLLECTION="evidence"

${SOLR_ROOT}/bin/post -c ${COLLECTION} ${SOLR_ROOT}/import/${FOLDER}/gwas/*.csv
${SOLR_ROOT}/bin/post -c ${COLLECTION} ${SOLR_ROOT}/import/${FOLDER}/ct/*.csv
${SOLR_ROOT}/bin/post -c ${COLLECTION} ${SOLR_ROOT}/import/${FOLDER}/patents/*.csv
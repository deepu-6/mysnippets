#!/bin/bash

SOURCE_FOLDER="/opt/neo4j/import/neo4j_graph_v2_1_2021-01-12/"

sudo neo4j-admin import --multiline-fields=true --ignore-missing-nodes=true \
--nodes="${SOURCE_FOLDER}disease_header.csv,${SOURCE_FOLDER}disease_nodes.csv" \
--nodes="${SOURCE_FOLDER}phenotype_header.csv,${SOURCE_FOLDER}phenotype_nodes.csv" \
--nodes="${SOURCE_FOLDER}variant_header.csv,${SOURCE_FOLDER}variant_nodes.csv" \
--nodes="${SOURCE_FOLDER}drug_header.csv,${SOURCE_FOLDER}drug_nodes.csv" \
--nodes="${SOURCE_FOLDER}gene_header.csv,${SOURCE_FOLDER}gene_nodes.csv" \
--nodes="${SOURCE_FOLDER}celltype_header.csv,${SOURCE_FOLDER}celltype_nodes.csv" \
--nodes="${SOURCE_FOLDER}drug_product_header.csv,${SOURCE_FOLDER}drug_product_nodes.csv" \
--nodes="${SOURCE_FOLDER}ae_header.csv,${SOURCE_FOLDER}ae_nodes.csv" \
--nodes="${SOURCE_FOLDER}chem_header.csv,${SOURCE_FOLDER}chem_nodes-.*" \
--relationships:RELATED_TO="${SOURCE_FOLDER}rel_with_strength_header.csv,${SOURCE_FOLDER}relationships-with-strength-.*" \
--relationships:RELATED_TO="${SOURCE_FOLDER}rel_without_strength_header.csv,${SOURCE_FOLDER}relationships-without-strength-.*" \
--relationships:HAS_ADVERSE_EVENT="${SOURCE_FOLDER}rel_with_strength_header.csv,${SOURCE_FOLDER}relationships-adverse-event-.*" \
--relationships:HAS_INGREDIENT="${SOURCE_FOLDER}rel_with_strength_header.csv,${SOURCE_FOLDER}relationships-has-ingredient-.*" \
--relationships:HAS_ISOMER="${SOURCE_FOLDER}rel_with_strength_header.csv,${SOURCE_FOLDER}relationships-has-isomer-.*" \
--relationships:HAS_PARENT="${SOURCE_FOLDER}rel_with_strength_header.csv,${SOURCE_FOLDER}relationships-has-parent-.*" \
--relationships:HAS_PRECISE_INGREDIENT="${SOURCE_FOLDER}rel_with_strength_header.csv,${SOURCE_FOLDER}relationships-has-precise-ingredient-.*" \
--relationships:IS_EQUAL_TO="${SOURCE_FOLDER}rel_with_strength_header.csv,${SOURCE_FOLDER}relationships-is-equal-to-.*" \
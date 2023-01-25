MATCH (n:Gene) SET n.reactome_ids = split(n.reactome_ids, '|');

MATCH (n:Disease) SET n.therapeutic_areas = split(n.therapeutic_areas, '|');

CREATE  INDEX ON :Phenotype(concept_id);
CREATE  INDEX ON :Phenotype(entity_name);

CREATE  INDEX ON :Variant(concept_id);
CREATE  INDEX ON :Variant(entity_name);

CREATE  INDEX ON :Gene(concept_id);
CREATE  INDEX ON :Gene(entity_name);

CREATE  INDEX ON :Disease(concept_id);
CREATE  INDEX ON :Disease(entity_name);

CREATE  INDEX ON :Drug(concept_id);
CREATE  INDEX ON :Drug(entity_name);

CREATE  INDEX ON :`Drug Product`(concept_id);
CREATE  INDEX ON :`Drug Product`(entity_name);

CREATE  INDEX ON :Chemical(concept_id);
CREATE  INDEX ON :Chemical(entity_name);

CREATE  INDEX ON :`Adverse Event`(concept_id);
CREATE  INDEX ON :`Adverse Event`(entity_name);

CREATE  INDEX ON :CellType(concept_id);
CREATE  INDEX ON :CellType(entity_name);

CALL db.relationshipTypes() YIELD relationshipType
WITH COLLECT(relationshipType) AS types
CALL db.index.fulltext.createRelationshipIndex('gl_relationship_uid_index', types, ['relUid'], {analyzer:'keyword'})
RETURN *;

CALL apoc.warmup.run(True, True, True);

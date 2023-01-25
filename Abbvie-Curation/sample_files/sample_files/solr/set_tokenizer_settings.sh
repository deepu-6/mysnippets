#!/bin/bash

COLLECTION="evidence"

curl -X POST -H 'Content-type:application/json' --data-binary '{
  "replace-field-type": {
    "class": "solr.TextField",
    "indexAnalyzer": {
      "filters": [
        {
          "class": "solr.StopFilterFactory",
          "ignoreCase": "true",
          "words": "stopwords.txt"
        },
        {
          "class": "solr.LowerCaseFilterFactory"
        },
        {
          "class": "solr.NGramFilterFactory",
          "maxGramSize": "25",
          "minGramSize": "3"
        }
      ],
      "tokenizer": {
        "class": "solr.StandardTokenizerFactory"
      }
    },
    "multiValued": true,
    "name": "text_general",
    "positionIncrementGap": "100",
    "queryAnalyzer": {
      "filters": [
        {
          "class": "solr.StopFilterFactory",
          "ignoreCase": "true",
          "words": "stopwords.txt"
        },
        {
          "class": "solr.SynonymGraphFilterFactory",
          "expand": "true",
          "ignoreCase": "true",
          "synonyms": "synonyms.txt"
        },
        {
          "class": "solr.LowerCaseFilterFactory"
        }
      ],
      "tokenizer": {
        "class": "solr.StandardTokenizerFactory"
      }
    }
  }
}' http://localhost:8983/solr/${COLLECTION}/schema
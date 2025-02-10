#!/bin/bash

# Start Solr

if [ -z "$SOLR_MEMORY" ]; then
    /opt/solr/bin/solr start -f -force -p 8983
else
    /opt/solr/bin/solr start -f -force -p 8983 -m $SOLR_MEMORY
fi

#!/usr/bin/env bash

MISSING=0

while read R; do
    set -- $R
    if [ -z "$(which $1)" ]; then
        echo $1: $@
        MISSING=$(( MISSING + 1 ))
    fi
done <<REQUIREMENTS
    curl        Download utility http://curl.haxx.se/
    unzip       Archive extractor http://www.info-zip.org/pub/infozip/
    psql        PostgreSQL http://postgresql.org/
    shp2pgsql   PostgreSQL shape importer (PostGIS) http://postgis.net/
REQUIREMENTS

if [[ $MISSING -gt 0 ]]; then
    echo $MISSING dependencies not met.
    exit 1
fi

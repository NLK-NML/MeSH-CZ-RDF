#!/usr/bin/env bash

set -e

DB="$1"
if [ -z "$DB" ]; then
  DB="mesh"
fi

echo
echo "Source db: $DB"
echo

run_query () {
  local query_file="$1"
  local output_file="$2"

  echo "Query:  $query_file"
  if ! tdb2_tdbquery --loc="databases/$DB" --query="$query_file" --time > "$output_file"; then
    error_exit
  fi
  echo "- output: $output_file"
  echo
}

error_exit () {
  echo
  echo "ERROR: SKOS export failed"
  echo
  exit 1
}

run_query "mesh-base-to-skos.rq" "${DB}-skos-base.ttl"
run_query "mesh-qual-to-skos.rq" "${DB}-skos-qual.ttl"
run_query "mesh-rest-to-skos.rq" "${DB}-skos-rest.ttl"
run_query "mesh-scr-to-skos.rq" "${DB}-skos-scr.ttl"

echo "Merging output files..."
if ! riot --out=TTL mesh-skos-patch.ttl \
  "${DB}-skos-base.ttl" \
  "${DB}-skos-qual.ttl" \
  "${DB}-skos-rest.ttl" \
  "${DB}-skos-scr.ttl" \
  > "${DB}-skos.ttl"; then
  error_exit
fi

echo "- done: ${DB}-skos.ttl"
echo
echo "Finished: ${DB}-skos.ttl"
echo

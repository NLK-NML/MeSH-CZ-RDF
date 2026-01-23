readme.txt

This data was taken from the current version of MeSH 2026. Files are updated as necessary,
generally only for Supplementary Concept Records. See documentation for a complete description
of versioning and distribution of data.

2026 MeSH N-triple data

mesh2026.nt        - Combined, sorted, unique N-triple data.
mesh2026.nt.sha1   - SHA-1 checksum of above file
mesh2026.nt.gz     - gzipped version
mesh2026.nt.gz.sha1- SHA-1 checksum of above file

MeSH RDF lifecycle note (2026)

Beginning with MeSH 2026, record-level lifecycle date elements in the source MeSH XML have
changed. The legacy elements DateCreated, DateRevised, and DateEstablished are no longer
present at the record level. New elements DateIntroduced and LastUpdated are reflected in
the RDF output.

These changes apply to record-level lifecycle metadata only. Term-level date information
remains unchanged where present in the source data.

Consumers relying on legacy record-level date predicates should review this change when
processing 2026 MeSH RDF data.

MeSH RDF VOID file

void_1.0.0.ttl

MeSH RDF Schema file

vocabulary_1.0.0.ttl


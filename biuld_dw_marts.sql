--duckdb dw_marts.duckdb -c ".read biuld_dw_marts.sql"

--Step 1: Create Star Schema Tables
.read 1_create_tables_dw.sql

--Step 2: Insert Data into Tables
.read 2_load_schema_dw.sql

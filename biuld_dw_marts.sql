--duckdb dw_marts.duckdb -c ".read biuld_dw_marts.sql"

--Step 1: Create Star Schema Tables
.read 1_create_tables_dw.sql

--Step 2: Insert Data into Tables
.read 2_load_schema_dw.sql

--Step 3: Create flat_mart_table
.read 3_create_flat_mart.sql
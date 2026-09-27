DROP SCHEMA IF EXISTS flat_mart CASECADE;

--Step 3: Create flat_mart_table

--Create Schema
CREATE SCHEMA flat_mart;

--Table Flat_Mart
CREATE OR REPLACE TABLE flat_mart.job_mart AS
SELECT
    jpf.job_id ,
    jpf.company_id ,
    jpf.job_title_short ,
    jpf.job_title ,
    jpf.job_location ,
    jpf.job_via ,
    jpf.job_schedule_type ,
    jpf.job_work_from_home ,
    jpf.search_Location ,
    jpf.job_posting_date ,
    jpf.job_no_degree_mention ,
    jpf.job_health_insurance ,
    jpf.job_country ,
    jpf.salary_rate ,
    jpf.salary_year_avg ,
    jpf.salary_hour_avg,
    cd.company_id,
    cd.name,
    ARRAY_AGG
    (
        STRUCT_PACK
        (
            type := sd.type,
            name:= sd.skill
        )
    ) AS Skill_and_Type
From job_postings_fact as jpf
LEFT JOIN company_dim AS cd ON cd.company_id = jpf.company_id
LEFT JOIN skills_job_dim AS sjd ON sjd.job_id = jpf.job_id
LEFT JOIN skills_dim AS sd ON sd.skill_id = sjd.skill_id
GROUP BY ALL;
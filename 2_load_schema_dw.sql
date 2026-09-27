--Step 2: Insert Data into Tables

--Insert to table company_dim
INSERT INTO company_dim (company_id,name)
SELECT
    company_id,
    name
From read_csv
(
    'https://storage.googleapis.com/sql_de/company_dim.csv',
    AUTO_DETECT = TRUE
);

--Insert into table skills_dim
INSERT INTO skills_dim(skill_id, skill, type)
SELECT *
From read_csv
(
    'https://storage.googleapis.com/sql_de/skills_dim.csv',
    AUTO_DETECT = TRUE
);

--Insert to table job_postings_fact
INSERT INTO job_postings_fact (    
    job_id ,company_id ,job_title_short ,job_title ,
    job_location ,job_via ,job_schedule_type ,
    job_work_from_home ,search_Location ,job_posting_date ,
    job_no_degree_mention ,job_health_insurance ,job_country ,
    salary_rate ,salary_year_avg ,salary_hour_avg 
)
SELECT
    job_id ,company_id ,job_title_short ,job_title ,
    job_location ,job_via ,job_schedule_type ,
    job_work_from_home ,search_Location ,job_posted_date ,
    job_no_degree_mention ,job_health_insurance ,job_country ,
    salary_rate ,salary_year_avg ,salary_hour_avg 
From read_csv
(
    'https://storage.googleapis.com/sql_de/job_postings_fact.csv',
    AUTO_DETECT = TRUE
);

--Insert into skills_job_dim
INSERT INTO skills_job_dim (skill_id, job_id)
SELECT
    skill_id,
    job_id
From read_csv
(
    'https://storage.googleapis.com/sql_de/skills_job_dim.csv',
    AUTO_DETECT = TRUE
);

SELECT 'Count Dim' AS table_name, Count(*) From company_dim
UNION ALL
SELECT 'Skills Dim',Count(*) From skills_dim
UNION ALL
SELECT 'Job Posting',Count(*) From job_postings_fact
UNION ALL
SELECT 'Skills Job Dim',Count(*) From skills_job_dim;
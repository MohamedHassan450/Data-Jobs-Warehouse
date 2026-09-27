--Drop For Automation
DROP TABLE IF EXISTS skills_job_dim;
DROP TABLE IF EXISTS job_postings_fact;
DROP TABLE IF EXISTS company_dim;
DROP TABLE IF EXISTS skills_dim;

--Step 1: Create Star Schema Tables

--Table company_dim
CREATE Table IF NOT EXISTS company_dim 
(
    company_id INT PRIMARY KEY,
    name Varchar,
);

--Table skills_dim
CREATE TABLE IF NOT EXISTS skills_dim 
(
    skill_id INT PRIMARY KEY,
    skill Varchar,
    type Varchar

);

--Table job_postings_fact
CREATE TABLE IF NOT EXISTS job_postings_fact
(
    job_id INT PRIMARY KEY,
    company_id INT,
    job_title_short VARCHAR,
    job_title VARCHAR,
    job_location VARCHAR,
    job_via VARCHAR,
    job_schedule_type VARCHAR,
    job_work_from_home  BOOLEAN,
    search_Location VARCHAR,
    job_posting_date TIMESTAMP,
    job_no_degree_mention BOOLEAN,
    job_health_insurance BOOLEAN,
    job_country VARCHAR,
    salary_rate VARCHAR,
    salary_year_avg DOUBLE,
    salary_hour_avg DOUBLE,
    FOREIGN KEY (company_id) REFERENCES company_dim(company_id)
);

--Table skills_job_dim
CREATE TABLE IF NOT EXISTS skills_job_dim
(
    skill_id INT,
    job_id INT,
    PRIMARY KEY(skill_id, job_id),
    FOREIGN KEY(skill_id) REFERENCES skills_dim(skill_id),
    FOREIGN KEY(job_id) REFERENCES job_postings_fact(job_id)
);
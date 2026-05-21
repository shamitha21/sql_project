select quarter1_job_postings.job_title_short,
         quarter1_job_postings.job_location,
         quarter1_job_postings.job_via,
         quarter1_job_postings.job_posted_date::date,
         quarter1_job_postings.salary_year_avg
 from (
    SELECT * FROM january_jobs
    union all
    SELECT * FROM february_jobs
    union all
    SELECT * FROM march_jobs
) as quarter1_job_postings
where quarter1_job_postings.salary_year_avg > 70000 AND
     LOWER(TRIM(quarter1_job_postings.job_title_short)) = 'data analyst'
ORDER BY 
    quarter1_job_postings.salary_year_avg DESC;
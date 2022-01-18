-- 停止调度任务的DNS放大任务

update xxl_job.xxl_job_info set trigger_status=0 where job_desc like "%DNS Amplification%";
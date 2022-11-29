-- create, execute, and finally drop a procedure
--
-- get_avg_salary()
--    param in: job_id
--    param out: avg salary for employees with the given job_id

select *
from employee
order by job_id;

create or replace procedure get_avg_salary(
    p_job_id in employee.job_id%type,
    p_salary out employee.salary%type)
language plpgsql as $$
begin
    select avg(salary)
    into p_salary from employee
    where job_id = p_job_id;
end $$;

do $$
declare
    v_job_id employee.job_id%type := 5;
    v_salary employee.salary%type;
begin
    call get_avg_salary(v_job_id, v_salary);
    raise notice 'job_id: % - avg salary: %', v_job_id, v_salary;
end $$;
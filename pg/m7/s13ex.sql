-- create, execute, and finally drop a function
--
-- get_higher_salary()
--    param in: manager_id
--    return: higher salary for an employee having the specified manager in hron.employee

select *
from employee
order by manager_id;

select salary
from employee
where manager_id = 120
order by salary desc;

create or replace function get_higher_salary(
    m_id in employee.manager_id%type)
returns employee.salary%type
language plpgsql as $$
declare
    v_salary employee.salary%type;
begin
    select max(salary)
    into v_salary from employee
    where manager_id = m_id;
    return v_salary;
end $$;

select get_higher_salary(120);

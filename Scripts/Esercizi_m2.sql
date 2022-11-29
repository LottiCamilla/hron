-- Nome dei dipendenti e del loro dipartimento
select e.first_name, e.last_name, d.name
from employee e join department d
	using (department_id)
order by d.name, e.last_name, e.first_name;

-- Nome dei dipendenti e job title (vedi JOB)
select e.first_name, e.last_name, j.title 
from employee e join job j
	using(job_id)
order by j.title, e.last_name, e.first_name;

-- Nome dei dipendenti che hanno il salario minimo o massimo previsto per il loro 
-- 	job title
select e.first_name, e.last_name, e.salary, j.title, j.min_salary || ' - ' || j.max_salary as range
from employee e join job j
	using(job_id)
where e.salary = j.min_salary or e.salary = j.max_salary
order by salary;

-- Nome dei dipendenti basati in UK (vedi LOCATION)
select e.first_name, e.last_name, l.country_id, l.city
from employee e join department d using (department_id)
	join location l using (location_id)
where l.country_id like 'UK'
order by l.city, e.last_name, e.first_name;

-- Nome dei dipartimenti e manager associato
select d.name, e.first_name || ' ' || e.last_name as manager
from employee e join department d
	on e.employee_id = d.manager_id;

-- Nome di ogni dipartimento e, se esiste, del relativo manager
select d.department_id || ' - ' || d.name as department, e.first_name || ' ' || e.last_name as manager
from employee e right outer join department d
	on e.employee_id = d.manager_id
order by d.department_id;

-- Nome dei dipartimenti che non hanno un manager associato
select distinct department_id || ' - ' || name as department, manager_id
from department
where manager_id is null;

-- Nome dei dipendenti e del loro manager
select e.first_name || ' ' || e.last_name as employee, m.first_name || ' ' || m.last_name as manager 
from employee e join employee m
	on e.manager_id = m.employee_id;
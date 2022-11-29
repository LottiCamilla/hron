-- Rispetto al salario: maggiore, minore, somma, media
select max(salary) as "max_salary", min(salary) as "min_salary", round(avg(salary), 2) as "avg_salary", sum(salary) as "sum_salary"
from employee;

-- Rispetto al salario: maggiore, minore, somma, media per ogni tipo di lavoro (job_id)
select job_id, max(salary) as "max_salary", min(salary) as "min_salary", round(avg(salary), 2) as "avg_salary", sum(salary) as "sum_salary"
from employee
group by job_id;

-- Quanti dipendenti per ogni job_id
select job_id, count(*)
from employee
group by job_id;

-- Quanti sono i programmatori
select count(*)
from employee e join job j using (job_id)
where j.title = 'Programmer';

-- Quanti sono i manager
select count(distinct manager_id)
from employee;

-- Nome dei dipendenti che non sono manager
select first_name, last_name 
from employee
where employee_id not in (
 	select distinct manager_id
 	from employee
 	where manager_id is not null);

-- Qual è la differenza tra il salario maggiore e il minore
select max(salary) - min(salary) as "max - min"
from employee;

-- Qual è la differenza tra il salario maggiore e il minore, ma per ogni job_id, non considerando dove non c’è differenza
select job_id, max(salary) - min(salary) as "diff"
from employee
group by job_id
having max(salary) - min(salary) > 0
order by job_id;

-- Qual è il salario minimo con i dipendenti raggruppati per manager, non considerando chi non ha manager, né i gruppi con salario minimo inferiore a 6.000€
select manager_id, min(salary) as min
from employee
where manager_id is not null
group by manager_id
having min(salary) > 6000
order by min desc;

-- Tabelle location e country, generare gli indirizzi completi
select l.street_address, l.city, c.name
from location l join country c using(country_id);

-- Dipendenti
-- Nome e cognome, e nome del loro dipartimento
select e.first_name, e.last_name, d.name
from employee e join department d using (department_id)
order by d.name;

-- Nome e cognome, e nome del loro dipartimento, ma solo per chi è basato a Toronto
select e.first_name, e.last_name, d.name
from employee e join department d using (department_id)
	join location l using (location_id)
where l.city = 'Toronto'
order by d.name;

-- Nome e cognome dei dipendenti assunti dopo David Lee
select first_name, last_name, hired
from employee
where hired > (
	select hired 
	from employee
	where first_name = 'David' and last_name = 'Lee');

-- Nome e cognome dei dipendenti assunti prima del proprio manager
-- ?
select e.first_name, e.last_name, e.hired, m.hired 
from employee e join employee m on e.manager_id = m.employee_id
where e.hired < m.hired;

-- Nome e cognome dei dipendenti con lo stesso manager di Lisa Ozer
select first_name, last_name, manager_id 
from employee
where manager_id = (
	select manager_id
	from employee
	where first_name = 'Lisa' and last_name = 'Ozer');

select e.first_name, e.last_name, e.manager_id
from employee e join employee e2 on e.manager_id = e2.manager_id
where e2.first_name = 'Lisa' and e2.last_name = 'Ozer';

-- Nome e cognome dei dipendenti in un dipartimento in cui c’è almeno un collega con una ‘u’ nel cognome
select e.first_name, e.last_name, d.name
from employee e join department d using(department_id)
where e.department_id in (
	select distinct department_id
	from employee
	where last_name ilike '%u%')
order by d.name;

-- Nome e cognome dei dipendenti del dipartimento Shipping
select e.first_name, e.last_name, d.name
from employee e join department d using (department_id)
where d.name = 'Shipping';

-- Nome e cognome dei dipendenti che hanno come manager Steven King
-- ?
select e.first_name, e.last_name, e.manager_id, m.employee_id, m.first_name, m.last_name
from employee e join employee m on e.manager_id = m.employee_id
where m.first_name = 'Steven' and m.last_name = 'King';
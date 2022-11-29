-- Esercizi m1 pag 10

-- Tutti i dipendenti, ordinati per cognome e nome
select first_name, last_name, phone, hired
from employee
order by last_name, first_name;

-- Chi ha nome David o Peter
select first_name, last_name, phone, hired
from employee
where first_name in ('David', 'Peter')
order by first_name, last_name;

-- Chi appartiene al dipartimento 6
select first_name, last_name, phone, hired, department_id 
from employee
where department_id = 6
order by hired desc;

-- Chi appartiene ai dipartimenti 3, 5
select first_name, last_name, phone, hired, department_id 
from employee
where department_id in (3, 5)
order by department_id;


-- Chi ha salario maggiore di 10000
select first_name, last_name, phone, hired, salary  
from employee
where salary > 10000
order by salary;


-- Chi ha salario minore di 4000 o maggiore di 15000
select first_name, last_name, phone, hired, salary  
from employee
--where salary < 4000 or salary > 15000
where salary not between 4000 and 15000
order by salary;


-- Chi ha salario minore di 4000 o maggiore di 15000, ma solo per i dipartimenti 5 e 8
select first_name, last_name, phone, hired, department_id, salary  
from employee
where (salary < 4000 or salary > 15000) and department_id in (5, 8)
order by salary;


-- Employee - Chi è stato assunto nel 2015
SELECT hired
from employee
-- where extract(year from hired) = '2015'
-- where hired between '2015-01-01' and '2015-12-31'
where hired::varchar like '2015-__-__'
order by hired;

-- Employee - Quali job_id sono presenti, in ordine naturale
select distinct job_id
from employee
order by job_id;


-- Employee - Chi ha una commissione
select first_name, last_name, commission 
from employee
where commission is not null
order by commission desc, first_name;


-- Employee - Chi ha una ‘a’ nel nome o cognome
select first_name, last_name 
from employee
where first_name ilike '%a%' or last_name ilike '%a%'
order by last_name, first_name;


-- Department - Nomi, in ordine naturale
select name
from department
order by name;


-- Location - Indirizzi delle sedi italiane
select street_address || ' - ' || city as address, country_id
from location
where country_id = 'IT'
order by street_address;
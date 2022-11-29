-- Dipendenti - Qual è il salario corrente, quale sarebbe con un incremento dell’8.5%, qual è il delta come valore assoluto
select first_name, last_name, salary as "salary now", salary + salary * 0.085 as "salary + salary * 0.85", salary * 0.085 as delta
from employee
limit 10;

-- Quanti giorni sono passati dall’assunzione a oggi
select first_name, last_name, current_date - hired as tempo
from employee
limit 10;

-- Quant’è la commissione di ognuno o ‘no value’
select first_name, last_name, coalesce (commission::varchar, 'no value')
from employee
limit 10;
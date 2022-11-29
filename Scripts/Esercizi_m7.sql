-- Scrivere la procedura day_after() che ha parametri
	-- Input: una data
	-- Output: la data di domani

create or replace procedure day_after(
    p_date in date,
    p_date_out out date)
language plpgsql as $$
begin
    p_date_out = p_date + 1;
end $$;

do $$
declare
    v_date date := now();
    v_date_out date;
begin
    call day_after(v_date, v_date_out);
    raise notice 'oggi: % - domani: %', v_date, v_date_out;
end $$;

drop procedure if exists day_after;

-- Riscrivere la day_after() come funzione
create or replace function day_after(
    p_date in employee.hired%type)
returns employee.hired%type
language plpgsql as $$
declare
    --v_date employee.hired%type;
begin
	--v_date := p_date + 1;
    return p_date + 1;
end $$;

select day_after(current_date);

drop function if exists day_after;

-- Scrivere la procedura get_employee() con parametri
	-- Input: id di un employee
	-- Output: nome e cognome associato

create or replace procedure get_employee(
    p_id in employee.employee_id%type,
    p_first_name out employee.first_name%type,
    p_last_name out employee.last_name%type)
language plpgsql as $$
begin
    select first_name, last_name
    into p_first_name, p_last_name from employee
    where employee_id = p_id;
end $$;

do $$
declare
    v_id employee.employee_id%type := 166;
    v_first_name employee.first_name%type;
    v_last_name employee.last_name%type;
begin
    call get_employee(v_id, v_first_name, v_last_name);
    raise notice 'id: % - nome cognome: % %', v_id, v_first_name, v_last_name;
end $$;

drop procedure if exists get_employee;

-- Riscrivere la get_employee() come funzione
create or replace function get_employee(
    p_id in employee.employee_id%type)
returns employee.first_name%type
language plpgsql as $$
declare
    v_string employee.first_name %type;
begin
	select first_name || ' ' || last_name
    into v_string from employee
    where employee_id = p_id;
    return v_string;
end $$;

select get_employee(166);

drop function if exists get_employee;
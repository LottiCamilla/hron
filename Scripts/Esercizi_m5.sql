-- Transazione sulla tabella Service (e Location), eseguendo per verifica una select dopo ogni modifica
 	-- Inserire due nuovi servizi
 		-- uno all’indirizzo di Oxford
		-- l’altro all’indirizzo di Utrecht
	-- Cambiare il nome del primo servizio
	-- Eliminare il secondo servizio
	-- Eseguire un rollback

select *
from service;

select * 
from location
where city in ('Oxford', 'Utrecht');

insert into service(name, location_id) values 
	('Example 1', (select location_id  
						from location
						where city = 'Oxford')),
	('Example 2', (select location_id  
						from location
						where city = 'Utrecht'));
	
update service
set name = 'Example 1 modificato'
where service_id = 11;

delete from service
where service_id = 12;
rollback;
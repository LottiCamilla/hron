-- this script should run on postgres
--
-- psql -U postgres \i setup.sql

drop schema if exists hron cascade; -- se esite horn eliminalo e elimina tutto quello che c'è dentro. SCHEMA è l'insieme di tabelle
drop user if exists hron; -- se esiste utente cancellano

create user hron with password 'password'; -- creo un nuovo utente
create schema authorization hron; -- l'utente hron deve essere collegato allo SCHEMA hron e può fare quello che vuole

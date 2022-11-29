-- Hello PL/pgSQL

do $$
begin
    raise notice 'hello';
end $$;

set client_min_messages to 'debug';
-- set client_min_messages to 'log';
-- set client_min_messages to 'notice';
-- set client_min_messages to 'warning';

-- log and errors
do $$
begin
    raise debug 'a debug message';                      -- usually disabled
    raise log 'a log message is seldom showed';         -- usually disabled
    raise notice 'a notice';
    raise warning 'a warning';
--    raise exception 'an exception!';
--    raise notice 'hello';
end $$;

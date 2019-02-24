-- tableA has 3 rows, tableB has 5 rows

drop table tableA;
create table tableA (
  id integer primary key,
  name text,
  created_at datetime default current_timestamp
);

drop table tableB;
create table tableB (
  id integer primary key,
  name text,
  created_at datetime default current_timestamp
);

insert into tableA (name) values
  ("Bill"),
  ("John"),
  ("James");

insert into tableB (name) values
  ("Sam"),
  ("Colleen"),
  ("Jenny"),
  ("Jane"),
  ("Josh");

select count(*) from tableA join tableB on 1; -- 15
select count(*) from tableA join tableB on 0; -- 0
select count(*) from tableA left join tableB on 0; -- 3
select count(*) from tableA outer join tableB on 0; -- Error (not supported), should be 8
select count(*) from tableA outer join tableB on 1; -- Error (not supported), should be 15

-- number of days between dates
select julianday('1993-08-10') - julianday('1989-07-07') as day_difference;

-- Write a query to produce the 'previous' table.
select ex_number + 1 as ex_number, ex_date as last_ex_date from executions;

-- Longest times between executions (compound query)
select
  last_ex_date as start,
  ex_date as end,
  julianday(ex_date) - julianday(last_ex_date) as day_difference
from executions
join (
  select ex_number + 1 as ex_number, ex_date as last_ex_date from executions
) as previous on executions.ex_number = previous.ex_number
order by day_difference desc
limit 10;

-- Longest times between executions (single query)
select
  previous.ex_date as start,
  executions.ex_date as end,
  julianday(executions.ex_date) - julianday(previous.ex_date) as day_difference
from executions
join executions as previous
  on executions.ex_number = previous.ex_number + 1
order by day_difference desc
limit 10;

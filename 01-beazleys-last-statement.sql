-- Grab three rows
select * from executions limit 3;

-- Find the first and last names and ages (ex_age) of inmates 25 or younger at
-- time of execution.
select first_name, last_name, ex_age from executions where ex_age <= 25;

-- Find the row for Raymond Landry
select first_name, last_name, ex_number
from executions
where first_name like 'Ray%'
  and last_name like 'Landry%';

-- Find Napoleon Beazley's last statement
select last_statement from executions
where first_name = 'Napoleon' and last_name = 'Beazley';

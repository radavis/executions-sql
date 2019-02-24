-- This query pulls the execution counts per county.
select county, count(*) as county_executions
from executions
group by county
order by county_executions desc
limit 10;

-- Find the number of executions from each county with and without a last statement.
-- Possible error in solution provided by the website
select
  county,
  sum(no_statement) as no_statement_count,
  count(*) as ex_total
from (
  select
    *,
    case when last_statement is null then 1 else 0 end as no_statement
  from executions
)
group by county
group by ex_total desc, no_statement_count desc
limit 20;

-- Count the number of inmates aged 50 or older that were executed in each county.
select
  county,
  count(*) as ex_total
from  executions
where ex_age >= 50
group by county
order by ex_total desc
limit 20;

-- List the counties in which more than 2 inmates aged 50 or older have been executed.
select
  county,
  count(*) as ex_total
from  executions
where ex_age >= 50
group by county
having ex_total >= 2
order by ex_total desc;

-- This query finds the number of inmates from each county and 10 year age range.
select
  county,
  ex_age / 10 as decade_age,
  count(*)
from executions
group by county, decade_age;

-- List all the distinct counties in the dataset.
select county from executions group by county;

-- Find the first and last name of the the inmate with the longest last
-- statement (by character count).
select first_name, last_name from executions
where length(last_statement) = (
  select max(length(last_statement)) from executions
);

-- Insert the <count-of-all-rows> query to find the percentage of executions
-- from each county.
select
  county,
  100.0 * count(*) / (select count(*) from executions) as percentage
from executions
group by county
order by percentage desc;

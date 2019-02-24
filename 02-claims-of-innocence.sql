-- Find how many inmates provided last statements
select count(last_statement) from executions;

-- Verify that 0 and the empty string are not considered NULL
select (0 is not null) and ('' is not null);

-- Find the total number of executions in the dataset
select count(*) from executions;

-- This query counts the number of Harris and Bexar county executions.
select
  count(case when county = 'Harris' then 1 else null end),
  count(case when county = 'Bexar' then 1 else null end)
from executions;

-- Find how many inmates were over the age of 50 at execution time.
select count(*) from executions where ex_age > 50;

-- Find the number of inmates who have declined to give a last statement.
select count(*) from executions where last_statement = '';

-- Find min, max, and avg ages
select min(ex_age), max(ex_age), avg(ex_age) from executions;

-- Find the average length (based on character count) of last statements in the dataset.
select avg(statement_length) from (
  select length(last_statement) as statement_length from executions
);

select avg(length(last_statement)) from executions;

-- List all the counties in the dataset without duplication.
select distinct county from executions;

-- Find the proportion of inmates with claims of innocence in their last statements.
select 1.0 * count(case when last_statement like '%innocent%' then 1 else null end) / count(*)
from executions;

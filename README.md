# Executions SQL

[source](https://selectstarsql.com)

## Schema

```
sqlite> .schema executions
create table executions(
  "ex_number" integer,
  "ex_dob" text,
  "offense_date" text,
  "education" text,
  "last_name" text,
  "first_name" text,
  "tdcj_number" text,
  "ex_age" integer,
  "received_at" text,
  "ex_date" text,
  "race" text,
  "county" text,
  "eye_color" text,
  "weight" integer,
  "height" text,
  "native_county" text,
  "native_state" text,
  "last_statement" text
);
```

## Data

```
$ curl -O https://selectstarsql.com/data/tx_deathrow_full.csv tx_deathrow_full.csv
$ tail -n +3 tx_deathrow_full.csv > tx_deathrow.csv  # remove the header
$ sqlite3 executions.db
sqlite> .mode csv
sqlite> .import /Users/rd/code/executions-sql/tx_deathrow.csv executions
sqlite> update executions set last_statement = null where last_statement = '';
```

## Queries

* [Beazley's Last Statement](01-beazleys-last-statement.sql)
* [Claims of Innocence](02-claims-of-innocence.sql)
* [The Long Tail](03-the-long-tail.sql)
* [Execution Hiatuses](04-execution-hiatuses.sql)

## Resources

* [SQL HAVING Clause](https://www.w3schools.com/sql/sql_having.asp)
* [SQLite Date and Time Functions](https://www.sqlite.org/lang_datefunc.html)
* [SQLite Core Functions](https://www.sqlite.org/lang_corefunc.html)

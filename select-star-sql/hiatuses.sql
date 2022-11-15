
/* Return a table of length of hiatuses between executions. */
/* (n.b. this relies on a table 'previous' that we don't yet have.) */

SELECT last_ex_date AS start,
       ex_date AS end,
       JULIANDAY(ex_date) - JULIANDAY(last_ex_date) AS day_difference
  FROM executions
  JOIN previous
    ON executions.ex_number = previous.ex_number
 ORDER BY day_difference DESC
 LIMIT 5;


/* Write a query to produce the previous table. */
/* Remember to use aliases to form the column names(ex_number, last_ex_date). */
/* Hint: Instead of shifting dates back, you could shift ex_number forward! */
SELECT
  ex_number + 1 AS ex_number,
  ex_date AS last_ex_date
FROM executions
WHERE ex_number != (
      SELECT MAX(ex_number)
        FROM executions);

/* Nest the query which generates a previous table into the template using the previous query. */
/* Notice that we are using a table alias here, naming the result of the nested query "previous". */

SELECT last_exdate AS start,
       ex_date AS end,
       JULIANDAY(ex_date) - JULIANDAY(last_exdate) AS day_difference
  FROM executions
  JOIN (
       SELECT ex_number +1 AS ex_number,
              ex_date AS last_exdate
        FROM executions
       WHERE ex_number != (
             SELECT MAX(ex_number)
               FROM executions))
    AS previous
    ON executions.ex_number = previous.ex_number
 ORDER BY day_difference DESC
 LIMIT 10
;

/* +------------+------------+----------------+ */
/* | start      | end        | day_difference | */
/* +------------+------------+----------------+ */
/* | 1982-12-07 | 1984-03-14 | 463.0          | */
/* | 1988-01-07 | 1988-11-03 | 301.0          | */
/* | 2007-09-25 | 2008-06-11 | 260.0          | */
/* | 1990-07-18 | 1991-02-26 | 223.0          | */
/* | 1984-03-31 | 1984-10-30 | 213.0          | */
/* | 1996-02-27 | 1996-09-18 | 204.0          | */
/* | 2016-04-06 | 2016-10-05 | 182.0          | */
/* | 1985-09-11 | 1986-03-12 | 182.0          | */
/* | 2014-04-16 | 2014-09-10 | 147.0          | */
/* | 1996-09-18 | 1997-02-10 | 145.0          | */
/* +------------+------------+----------------+ */


/* Fill in the JOIN ON clause to complete a more elegant version of the previous query. */
/* i.e. Self Join on ex_number + 1. */

SELECT previous.ex_date AS start,
       executions.ex_date AS end,
       JULIANDAY(executions.ex_date) - JULIANDAY(previous.ex_date)
    AS day_difference
  FROM executions
  JOIN executions AS previous
    ON executions.ex_number = previous.ex_number + 1
 ORDER BY day_difference DESC
 LIMIT 10;

/* +------------+------------+----------------+ */
/* | start      | end        | day_difference | */
/* +------------+------------+----------------+ */
/* | 1982-12-07 | 1984-03-14 | 463.0          | */
/* | 1988-01-07 | 1988-11-03 | 301.0          | */
/* | 2007-09-25 | 2008-06-11 | 260.0          | */
/* | 1990-07-18 | 1991-02-26 | 223.0          | */
/* | 1984-03-31 | 1984-10-30 | 213.0          | */
/* | 1996-02-27 | 1996-09-18 | 204.0          | */
/* | 2016-04-06 | 2016-10-05 | 182.0          | */
/* | 1985-09-11 | 1986-03-12 | 182.0          | */
/* | 2014-04-16 | 2014-09-10 | 147.0          | */
/* | 1996-09-18 | 1997-02-10 | 145.0          | */
/* +------------+------------+----------------+ */



/* Edit the query to find how many inmates provided last statements. */

SELECT COUNT(first_name)
  FROM executions
 WHERE last_statement NOT NULL;

/* +-------------------+ */
/* | COUNT(first_name) | */
/* +-------------------+ */
/* | 443               | */
/* +-------------------+ */

/* Verify that 0 and the empty string are not considered NULL. */

SELECT (0 IS NOT NULL) AND ('' IS NOT NULL)


/* This query counts the number of Harris and Bexar county executionsri */
/* Replace SUMs with COUNTs and edit the CASE WHEN blocks so the query still works. */ */
/* Switching SUM for COUNT alone isn't enough because COUNT still counts the */
/* 0 since 0 is non-null. */

/* SELECT */
/*     SUM(CASE WHEN county='Harris' THEN 1 */
/*         ELSE 0 END), */
/*     SUM(CASE WHEN county='Bexar' THEN 1 */
/*         ELSE 0 END) */
/* FROM executions; */

SELECT
    COUNT(CASE WHEN county='Harris' THEN 1
        ELSE NULL END) AS Harris,
    COUNT(CASE WHEN county='Bexar' THEN 1
        ELSE NULL END) AS Bexar
FROM executions;

/* +--------+-------+ */
/* | Harris | Bexar | */
/* +--------+-------+ */
/* | 128    | 46    | */
/* +--------+-------+ */


/* Find how many inmates were over the age of 50 at execution time. */
/* This illustrates that the WHERE block filters before aggregation occurs. */

SELECT COUNT(ex_age)
  FROM executions
 WHERE ex_age > 50;

/* +---------------+ */
/* | COUNT(ex_age) | */
/* +---------------+ */
/* | 68            | */
/* +---------------+ */


/* Find the number of inmates who have declined to give a last statement. */
/* For bonus points, try to do it in 3 ways: */
/* 1) With a WHERE block, */

SELECT COUNT ex_number
  FROM executions
 WHERE last_statement IS NULL;

/* 2) With a COUNT and CASE WHEN block, */

SELECT COUNT(CASE WHEN last_statement IS NULL
       THEN 1
       ELSE NULL
       END)
 FROM executions;

/* 3) With two COUNT functions. */
SELECT COUNT * - COUNT last_statement
  FROM executions;

/* +----------------------------------+ */
/* | COUNT(*) - COUNT(last_statement) | */
/* +----------------------------------+ */
/* | 110                              | */
/* +----------------------------------+ */


/* Find the minimum, maximum and average age of inmates at the time of execution. */
SELECT MIN(ex_age), MAX (ex_age), AVG (ex_age)
  FROM executions;

/* +-------------+--------------+-------------------+ */
/* | MIN(ex_age) | MAX (ex_age) | AVG (ex_age)      | */
/* +-------------+--------------+-------------------+ */
/* | 24          | 67           | 39.47016274864376 | */
/* +-------------+--------------+-------------------+ */

/* Find the average length (based on character count) of last statements in the dataset. */
SELECT AVG(LENGTH(last_statement))
  FROM executions;

/* +-----------------------------+ */
/* | AVG(LENGTH(last_statement)) | */
/* +-----------------------------+ */
/* | 537.4875846501129           | */
/* +-----------------------------+ */

/* List all the counties in the dataset without duplication. */
SELECT DISTINCT county
  FROM executions;

/* +--------------+ */
/* | county       | */
/* +--------------+ */
/* | Bexar        | */
/* | Harris       | */
/* | Tarrant      | */
/* | Lubbock      | */
/* | Dallas       | */
/* | Hidalgo      | */
/* ... */


/* Find the proportion of inmates with claims of innocence in their last statements. */
/* To do decimal division, ensure that one of the numbers is a decimal by multiplying it by 1.0. Use LIKE '%innocent%' to find claims of innocence. */

SELECT COUNT(CASE WHEN last_statement LIKE '%innocent%' THEN 1
       ELSE NULL
       END) * 1.0 /
       COUNT (*) AS innocent_claims_proportion
  FROM executions;
/* +----------------------------+ */
/* | innocent_claims_proportion | */
/* +----------------------------+ */
/* | 0.05605786618444846        | */
/* +----------------------------+ */

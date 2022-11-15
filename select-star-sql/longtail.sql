/* This query pulls the execution counts per county. */

SELECT
  county,
  COUNT(*) AS county_executions
FROM executions
GROUP BY county;

/* +--------------+-------------------+ */
/* | county       | county_executions | */
/* +--------------+-------------------+ */
/* +--------------+-------------------+ */
/* | Anderson     | 4                 | */
/* | Aransas      | 1                 | */
/* | Atascosa     | 1                 | */
/* | Bailey       | 1                 | */
/* | Bastrop      | 1                 | */
/* | Bee          | 2                 | */
/* | Bell         | 3                 | */
/* | Bexar        | 46                | */
/* | Bowie        | 5                 | */
/* | Brazoria     | 4                 | */
/* | Brazos       | 12                | */
/* | Brown        | 1                 | */
/* | Caldwell     | 1                 | */
/* | Cameron      | 6                 | */
/* | Chambers     | 1                 | */
/* | Cherokee     | 3                 | */
/* | Clay         | 1                 | */
/* | Collin       | 7                 | */
/* | Comal        | 2                 | */
/* | Coryell      | 1                 | */
/* | Crockett     | 1                 | */
/* | Dallas       | 58                | */
/* | Dawson       | 1                 | */
/* | Denton       | 6                 | */
/* | El Paso      | 3                 | */
/* | Ellis        | 2                 | */
/* | Fort Bend    | 5                 | */
/* | Freestone    | 1                 | */
/* | Galveston    | 6                 | */
/* | Gillespie    | 1                 | */
/* | Grayson      | 3                 | */
/* | Gregg        | 5                 | */
/* | Hale         | 2                 | */
/* | Hamilton     | 1                 | */
/* | Hardin       | 1                 | */
/* | Harris       | 128               | */
/* | Harrison     | 1                 | */
/* | Henderson    | 2                 | */
/* | Hidalgo      | 6                 | */
/* | Hopkins      | 1                 | */
/* | Houston      | 1                 | */
/* | Hunt         | 4                 | */
/* | Jefferson    | 15                | */
/* | Johnson      | 2                 | */
/* | Jones        | 1                 | */
/* | Kaufman      | 1                 | */
/* | Kendall      | 1                 | */
/* | Kerr         | 3                 | */
/* | Kleberg      | 1                 | */
/* | Lamar        | 2                 | */
/* | Lee          | 1                 | */
/* | Leon         | 2                 | */
/* | Liberty      | 3                 | */
/* | Llano        | 1                 | */
/* | Lubbock      | 13                | */
/* | Madison      | 1                 | */
/* | Matagorda    | 2                 | */
/* | McLennan     | 7                 | */
/* | Milam        | 1                 | */
/* | Montgomery   | 15                | */
/* | Morris       | 1                 | */
/* | Nacogdoches  | 1                 | */
/* | Navarro      | 6                 | */
/* | Newton       | 1                 | */
/* | Nueces       | 16                | */
/* | Parker       | 2                 | */
/* | Pecos        | 2                 | */
/* | Polk         | 2                 | */
/* | Potter       | 10                | */
/* | Randall      | 3                 | */
/* | Red River    | 2                 | */
/* | Refugio      | 2                 | */
/* | Sabine       | 1                 | */
/* | San Jacinto  | 1                 | */
/* | San Patricio | 1                 | */
/* | Scurry       | 1                 | */
/* | Shelby       | 1                 | */
/* | Smith        | 12                | */
/* | Tarrant      | 41                | */
/* | Taylor       | 5                 | */
/* | Tom Green    | 3                 | */
/* | Travis       | 8                 | */
/* | Trinity      | 1                 | */
/* | Upshur       | 1                 | */
/* | Val Verde    | 1                 | */
/* | Victoria     | 2                 | */
/* | Walker       | 3                 | */
/* | Wharton      | 1                 | */
/* | Wichita      | 2                 | */
/* | Wilbarger    | 2                 | */
/* | Williamson   | 3                 | */
/* | Wood         | 1                 | */
/* +--------------+-------------------+ */


/* Modify this query so there are up to two rows per county —  */
/* one counting executions with a last statement and another without. */

SELECT
  county,
  COUNT(
  CASE WHEN last_statement IS NULL
       THEN 1
  ELSE NULL
  END) AS no_ls,
  COUNT(
  CASE WHEN last_statement IS NOT NULL
       THEN 1
  ELSE NULL
  END) AS ls,
  COUNT(*) as total_executions
FROM executions
GROUP BY county;

/* +--------------+-------+----+----------+ */
/* | county       | no_ls | ls | COUNT(*) | */
/* +--------------+-------+----+----------+ */
/* +--------------+-------+----+----------+ */
/* | Anderson     | 0     | 4  | 4        | */
/* | Aransas      | 0     | 1  | 1        | */
/* | Atascosa     | 0     | 1  | 1        | */
/* | Bailey       | 0     | 1  | 1        | */
/* | Bastrop      | 0     | 1  | 1        | */
/* | Bee          | 0     | 2  | 2        | */
/* | Bell         | 1     | 2  | 3        | */
/* | Bexar        | 9     | 37 | 46       | */
/* | Bowie        | 0     | 5  | 5        | */
/* | Brazoria     | 1     | 3  | 4        | */
/* | Brazos       | 2     | 10 | 12       | */
/* | Brown        | 0     | 1  | 1        | */
/* | Caldwell     | 0     | 1  | 1        | */
/* | Cameron      | 0     | 6  | 6        | */
/* | Chambers     | 1     | 0  | 1        | */
/* | Cherokee     | 0     | 3  | 3        | */
/* | Clay         | 0     | 1  | 1        | */
/* | Collin       | 1     | 6  | 7        | */
/* | Comal        | 0     | 2  | 2        | */
/* | Coryell      | 0     | 1  | 1        | */
/* | Crockett     | 0     | 1  | 1        | */
/* | Dallas       | 6     | 52 | 58       | */
/* | Dawson       | 0     | 1  | 1        | */
/* | Denton       | 2     | 4  | 6        | */
/* | El Paso      | 1     | 2  | 3        | */
/* | Ellis        | 0     | 2  | 2        | */
/* | Fort Bend    | 2     | 3  | 5        | */
/* | Freestone    | 0     | 1  | 1        | */
/* | Galveston    | 3     | 3  | 6        | */
/* | Gillespie    | 1     | 0  | 1        | */
/* | Grayson      | 0     | 3  | 3        | */
/* | Gregg        | 2     | 3  | 5        | */
/* | Hale         | 0     | 2  | 2        | */
/* 92 rows in set */
/* Time: 0.025s */
/* ex.db> SELECT county, */
/*        COUNT(CASE WHEN last_statement IS NULL */
/*        THEN 1 */
/*        ELSE NULL */
/*        END) AS no_ls, */
/*        COUNT(CASE WHEN last_statement IS NOT NULL */
/*        THEN 1 */
/*        ELSE NULL */
/*        END) AS ls, */
/*        COUNT(*) */
/*        FROM executions */
/*        GROUP BY county; */
/* ex.db> SELECT */
/*          county, */
/*          COUNT( */
/*          CASE WHEN last_statement IS NULL */
/*               THEN 1 */
/*          ELSE NULL */
/*          END) AS no_ls, */
/*          COUNT( */
/*          CASE WHEN last_statement IS NOT NULL */
/*               THEN 1 */
/*          ELSE NULL */
/*          END) AS ls, */
/*          COUNT(*) as total_executions, */
/*        FROM executions */
/*        GROUP BY county; */
/* near "FROM": syntax error */
/* ex.db> SELECT */
/*          county, */
/*          COUNT( */
/*          CASE WHEN last_statement IS NULL */
/*               THEN 1 */
/*          ELSE NULL */
/*          END) AS no_ls, */
/*          COUNT( */
/*          CASE WHEN last_statement IS NOT NULL */
/*               THEN 1 */
/*          ELSE NULL */
/*          END) AS ls, */
/*          COUNT(*) AS total_executions */
/*        FROM executions */
/*        GROUP BY county; */
/* +--------------+-------+----+------------------+ */
/* | county       | no_ls | ls | total_executions | */
/* +--------------+-------+----+------------------+ */
/* | Anderson     | 0     | 4  | 4                | */
/* | Aransas      | 0     | 1  | 1                | */
/* | Atascosa     | 0     | 1  | 1                | */
/* | Bailey       | 0     | 1  | 1                | */
/* | Bastrop      | 0     | 1  | 1                | */
/* | Bee          | 0     | 2  | 2                | */
/* | Bell         | 1     | 2  | 3                | */
/* | Bexar        | 9     | 37 | 46               | */
/* | Bowie        | 0     | 5  | 5                | */
/* | Brazoria     | 1     | 3  | 4                | */
/* | Brazos       | 2     | 10 | 12               | */
/* | Brown        | 0     | 1  | 1                | */
/* | Caldwell     | 0     | 1  | 1                | */
/* | Cameron      | 0     | 6  | 6                | */
/* | Chambers     | 1     | 0  | 1                | */
/* | Cherokee     | 0     | 3  | 3                | */
/* | Clay         | 0     | 1  | 1                | */
/* | Collin       | 1     | 6  | 7                | */
/* | Comal        | 0     | 2  | 2                | */
/* | Coryell      | 0     | 1  | 1                | */
/* | Crockett     | 0     | 1  | 1                | */
/* | Dallas       | 6     | 52 | 58               | */
/* | Dawson       | 0     | 1  | 1                | */
/* | Denton       | 2     | 4  | 6                | */
/* | El Paso      | 1     | 2  | 3                | */
/* | Ellis        | 0     | 2  | 2                | */
/* | Fort Bend    | 2     | 3  | 5                | */
/* | Freestone    | 0     | 1  | 1                | */
/* | Galveston    | 3     | 3  | 6                | */
/* | Gillespie    | 1     | 0  | 1                | */
/* | Grayson      | 0     | 3  | 3                | */
/* | Gregg        | 2     | 3  | 5                | */
/* | Hale         | 0     | 2  | 2                | */
/* | Hamilton     | 1     | 0  | 1                | */
/* | Hardin       | 1     | 0  | 1                | */
/* | Harris       | 33    | 95 | 128              | */
/* | Harrison     | 0     | 1  | 1                | */
/* | Henderson    | 1     | 1  | 2                | */
/* | Hidalgo      | 0     | 6  | 6                | */
/* | Hopkins      | 0     | 1  | 1                | */
/* | Houston      | 0     | 1  | 1                | */
/* | Hunt         | 0     | 4  | 4                | */
/* | Jefferson    | 4     | 11 | 15               | */
/* | Johnson      | 2     | 0  | 2                | */
/* | Jones        | 0     | 1  | 1                | */
/* | Kaufman      | 0     | 1  | 1                | */
/* | Kendall      | 0     | 1  | 1                | */
/* | Kerr         | 0     | 3  | 3                | */
/* | Kleberg      | 0     | 1  | 1                | */
/* | Lamar        | 0     | 2  | 2                | */
/* | Lee          | 1     | 0  | 1                | */
/* | Leon         | 0     | 2  | 2                | */
/* | Liberty      | 1     | 2  | 3                | */
/* | Llano        | 0     | 1  | 1                | */
/* | Lubbock      | 1     | 12 | 13               | */
/* | Madison      | 0     | 1  | 1                | */
/* | Matagorda    | 0     | 2  | 2                | */
/* | McLennan     | 1     | 6  | 7                | */
/* | Milam        | 0     | 1  | 1                | */
/* | Montgomery   | 3     | 12 | 15               | */
/* | Morris       | 0     | 1  | 1                | */
/* | Nacogdoches  | 0     | 1  | 1                | */
/* | Navarro      | 2     | 4  | 6                | */
/* | Newton       | 0     | 1  | 1                | */
/* | Nueces       | 5     | 11 | 16               | */
/* | Parker       | 0     | 2  | 2                | */
/* | Pecos        | 1     | 1  | 2                | */
/* | Polk         | 0     | 2  | 2                | */
/* | Potter       | 3     | 7  | 10               | */
/* | Randall      | 0     | 3  | 3                | */
/* | Red River    | 0     | 2  | 2                | */
/* | Refugio      | 0     | 2  | 2                | */
/* | Sabine       | 0     | 1  | 1                | */
/* | San Jacinto  | 0     | 1  | 1                | */
/* | San Patricio | 1     | 0  | 1                | */
/* | Scurry       | 0     | 1  | 1                | */
/* | Shelby       | 1     | 0  | 1                | */
/* | Smith        | 0     | 12 | 12               | */
/* | Tarrant      | 6     | 35 | 41               | */
/* | Taylor       | 1     | 4  | 5                | */
/* | Tom Green    | 0     | 3  | 3                | */
/* | Travis       | 2     | 6  | 8                | */
/* | Trinity      | 0     | 1  | 1                | */
/* | Upshur       | 1     | 0  | 1                | */
/* | Val Verde    | 1     | 0  | 1                | */
/* | Victoria     | 1     | 1  | 2                | */
/* | Walker       | 1     | 2  | 3                | */
/* | Wharton      | 1     | 0  | 1                | */
/* | Wichita      | 0     | 2  | 2                | */
/* | Wilbarger    | 2     | 0  | 2                | */
/* | Williamson   | 0     | 3  | 3                | */
/* | Wood         | 0     | 1  | 1                | */
/* +--------------+-------+----+------------------+ */


/* Count the number of inmates aged 50 or older that were executed in each county. */

SELECT county, COUNT(*) AS ex_age_min_50
  FROM executions
 WHERE ex_age >= 50
 GROUP BY county;

/* +-------------+---------------+ */
/* | county      | ex_age_min_50 | */
/* +-------------+---------------+ */
/* | Anderson    | 1             | */
/* | Bexar       | 2             | */
/* | Caldwell    | 1             | */
/* | Cameron     | 1             | */
/* | Collin      | 2             | */
/* | Comal       | 1             | */
/* | Dallas      | 11            | */
/* | Galveston   | 2             | */
/* | Grayson     | 1             | */
/* | Gregg       | 2             | */
/* | Harris      | 21            | */
/* | Henderson   | 1             | */
/* | Houston     | 1             | */
/* | Jefferson   | 2             | */
/* | Johnson     | 1             | */
/* | Lamar       | 2             | */
/* | Lee         | 1             | */
/* | Lubbock     | 3             | */
/* | McLennan    | 1             | */
/* | Montgomery  | 5             | */
/* | Navarro     | 1             | */
/* | Newton      | 1             | */
/* | Pecos       | 1             | */
/* | Potter      | 1             | */
/* | San Jacinto | 1             | */
/* | Smith       | 2             | */
/* | Tarrant     | 4             | */
/* | Travis      | 1             | */
/* | Upshur      | 1             | */
/* | Walker      | 1             | */
/* | Wichita     | 1             | */
/* | Wood        | 1             | */
/* +-------------+---------------+ */


/* List the counties in which more than 2 inmates aged 50 or older have been executed. */

SELECT county, COUNT(*) AS age_50_3min
  FROM executions
 WHERE ex_age >= 50
 GROUP BY county
HAVING min_age_50 > 2;

/* +------------+------------+ */
/* | county     | age_50_3min| */
/* +------------+------------+ */
/* | Dallas     | 11         | */
/* | Harris     | 21         | */
/* | Lubbock    | 3          | */
/* | Montgomery | 5          | */
/* | Tarrant    | 4          | */
/* +------------+------------+ */


/* This query finds the number of inmates from each county and 10 year age range.  */

SELECT
  county,
  ex_age/10 AS decade_age,
  COUNT(*)
FROM executions
GROUP BY county, decade_age

/* +--------------+------------+----------+ */
/* | county       | decade_age | COUNT(*) | */
/* +--------------+------------+----------+ */
/* | Anderson     | 3          | 2        | */
/* | Anderson     | 4          | 1        | */
/* | Anderson     | 5          | 1        | */
/* | Aransas      | 4          | 1        | */
/* | Atascosa     | 4          | 1        | */
/* | Bailey       | 3          | 1        | */
/* | Bastrop      | 3          | 1        | */
/* | Bee          | 3          | 2        | */
/* | Bell         | 3          | 1        | */
/* | Bell         | 4          | 2        | */
/* | Bexar        | 2          | 5        | */
/* | Bexar        | 3          | 27       | */
/* | Bexar        | 4          | 12       | */
/* | Bexar        | 5          | 2        | */
/* ... */
/* | Wood         | 3          | 1        | */
/* | Wood         | 4          | 1        | */
/* | Wood         | 5          | 1        | */
/* +--------------+------------+----------+ */


/* List all the distinct counties in the dataset. */
/* We did this in the previous chapter using the SELECT DISTINCT command. This time, stick with vanilla SELECT and use GROUP BY. */

SELECT county
  FROM executions
 GROUP BY county;


/* +--------------+ */
/* | county       | */
/* +--------------+ */
/* | Anderson     | */
/* | Aransas      | */
/* | Atascosa     | */
/* | Bailey       | */
/* | Bastrop      | */
/* ... */
/* | Wood         | */
/* +--------------+ */


/* Find the first and last name of the inmate with the longest last statement (by character count). */

SELECT first_name, last_name
  FROM executions
 WHERE LENGTH(last_statement) = (
       SELECT MAX(LENGTH(last_statement))
         FROM executions);

/* +------------+-----------+ */
/* | first_name | last_name | */
/* +------------+-----------+ */
/* | Gary       | Graham    | */
/* +------------+-----------+ */


/* Insert the <count-of-all-rows> query to find the percentage of executions  */
/* from each county. */

SELECT county,
       100.0 * COUNT(*) / (
       SELECT COUNT(*) FROM executions)
           AS percentage
  FROM executions
 GROUP BY county
 ORDER BY percentage DESC

/* +--------------+---------------------+ */
/* | county       | percentage          | */
/* +--------------+---------------------+ */
/* | Harris       | 23.146473779385172  | */
/* | Dallas       | 10.488245931283906  | */
/* | Bexar        | 8.318264014466546   | */
/* | Tarrant      | 7.414104882459313   | */
/* | Nueces       | 2.8933092224231465  | */
/* | Montgomery   | 2.7124773960216997  | */
/* | Jefferson    | 2.7124773960216997  | */
/* ... */
/* | Refugio      | 0.3616636528028933  | */
/* | Red River    | 0.3616636528028933  | */
/* | Polk         | 0.3616636528028933  | */
/* | Pecos        | 0.3616636528028933  | */
/* | Parker       | 0.3616636528028933  | */
/* | Parmer       | 0.3616636528028933  | */
/* +--------------+---------------------+ */


/* Length of execution hiatus from 1989 to 1993. */
SELECT JULIANDAY('1993-08-10') - JULIANDAY('1989-07-07') AS hiatus_length;
/* +---------------+ */
/* | hiatus_length | */
/* +---------------+ */
/* | 1495.0        | */
/* +---------------+ */



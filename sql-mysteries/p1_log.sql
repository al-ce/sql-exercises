/* The crime was a murder that occurred sometime on Jan.15, 2018. */
/* and that it took place in SQL City. */

.schema crime_scene_report
/* CREATE TABLE crime_scene_report ( */
/*         date integer, */
/*         type text, */
/*         description text, */
/*         city text */
/*     ); */


SELECT *
  FROM crime_scene_report
 WHERE date = 20180115
   AND city = 'SQL City';

/* +----------+---------+------------------ */
/* | date     | type    | description                                                                                                                                                                               | city     | */
/* +----------+---------+------------------ */
/* | 20180115 | assault | Hamilton: Lee, do you yield? Burr: You shot him in the side! Yes he yields!                                                                                                               | SQL City | */
/* | 20180115 | assault | Report Not Found                                                                                                                                                                          | SQL City | */
/* | 20180115 | murder  | Security footage shows that there were 2 witnesses. The first witness lives at the last house on "Northwestern Dr". The second witness, named Annabel, lives somewhere on "Franklin Ave". | SQL City | */
/* +----------+---------+--------------------*/

-- TODO: TASK 1
-- Query transcript from `interview` in row where interview.person_id
/* matches person.id where person.address_street_name is either 'Northwester Dr'  */
/* or 'Franklin Ave' AND the latter's name is Annabel. */

-- NOTE: TASK 1
SELECT int.transcript, int.person_id, person.name
  FROM interview AS int
  JOIN (
       SELECT id, name
         FROM person
        WHERE (address_street_name = 'Northwestern Dr'
               AND address_number = (
                   SELECT MAX(address_number)
                     FROM person
                    WHERE address_street_name = 'Northwestern Dr')
                   )
          OR (address_street_name = 'Franklin Ave'
              AND name LIKE 'Annabel%')
       ) AS person
    ON id = person_id;

/* +-----------------------------------*/
/* | transcript      | name           | */
/* +-----------------------------------*/
/* | I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym"*/
   /*   bag. The membership number on the bag started with "48Z". */
   /*   Only gold members have those bags. */
   /*   The man got into a car with a plate that included "H42W". */
   /* | Morty Schapiro | */

/* | I saw the murder happen, and I recognized the killer from my gym when I*/
     /* was working out last week on January the 9th. */
/*   | Annabel Miller | */
/* +----------------------------------- */

-- NOTE:EVIDENCE:
-- TODO: TASK 2
-- Suspect was in possession of a bag with get_fit_now_member.id LIKE '48Z%' on day of murder.
   -- That member has a get_fit_now_member.status = 'gold'
-- Suspect may have get_fit_now_check_in.membership_id that is in a
   -- table WHERE check_in_date = 20180109
-- TODO: TASK 3
-- Suspect got in a car with drivers_license.plate_number LIKE "%H42W%"


-- NOTE: TASK 2

SELECT check_in_date AS `date`, check_in_time AS `in`, check_out_time AS `out`,
       gfn_m.id, gfn_m.name, person.name
  FROM get_fit_now_check_in AS gfn_ci
  JOIN get_fit_now_member AS gfn_m
       ON gfn_ci.membership_id = gfn_m.id
  JOIN person
       ON gfn_m.person_id = person.id
 WHERE membership_status = 'gold'                            -- To avoid bad syntax highlighting
   AND gfn_m.id LIKE '48Z%'                                  ''''
   AND check_in_date = 20180109;

/* +----------+------+------+-------+---------------+---------------+ */
/* | date     | in   | out  | id    | name          | name          | */
/* +----------+------+------+-------+---------------+---------------+ */
/* | 20180109 | 1600 | 1730 | 48Z7A | Joe Germuska  | Joe Germuska  | */
/* | 20180109 | 1530 | 1700 | 48Z55 | Jeremy Bowers | Jeremy Bowers | */
/* +----------+------+------+-------+---------------+---------------+ */


-- TODO: TASK 3
-- Combine the Task 2 query with the Task 3 query
SELECT person.name
  FROM drivers_license AS dl
  JOIN person
    ON person.license_id = dl.id
 WHERE plate_number LIKE '%H42W%'
   AND person.id IN
       (
       SELECT gfn_m.person_id
         FROM get_fit_now_check_in AS gfn_ci
         JOIN get_fit_now_member AS gfn_m
              ON gfn_ci.membership_id = gfn_m.id
        WHERE membership_status = 'gold'                     -- To avoid bad syntax highlighting
          AND gfn_m.id LIKE '48Z%'                           ''''
          AND check_in_date = 20180109
       );


/* +---------------+ */
/* | name          | */
/* +---------------+ */
/* | Jeremy Bowers | */
/* +---------------+ */

INSERT INTO solution VALUES (1, "Jeremy Bowers");
SELECT value FROM solution;

/* +---------*/
/* | value                                                                                                                                                                                                                                                                                                                                                                                              | */
/* +--------*/
/* | Congrats, you found the murderer! But wait, there's more... */
/* If you think you're up for a challenge, try querying the interview */
/* transcript of the murderer to find the real villain behind this crime. */
/* If you feel especially confident in your SQL skills, try to complete this */
/* final step with no more than 2 queries. Use this same INSERT statement with */
/* your new suspect to check your answer. | */
/* +----------*/


SELECT name, transcript
  FROM interview
  JOIN person on person_id = id
 WHERE name =
       (
       SELECT person.name
         FROM drivers_license AS dl
         JOIN person
           ON person.license_id = dl.id
       WHERE plate_number LIKE '%H42W%'
         AND person.id IN
             (
             SELECT gfn_m.person_id
               FROM get_fit_now_check_in AS gfn_ci
               JOIN get_fit_now_member AS gfn_m
                     ON gfn_ci.membership_id = gfn_m.id
               WHERE membership_status = 'gold'
                 AND gfn_m.id LIKE '48Z%'
                 AND check_in_date = 20180109
              )
       );


/* +---------------+---------------------------------------------------*/
/* | name          | transcript                                        */
/* +---------------+--------------------------------------------------*/
/* | Jeremy Bowers | I was hired by a woman with a lot of money. */
/* I don't know her name but I know she's around 5'5" (65") or 5'7" (67").    */
/* She has red hair and she drives a Tesla Model S. I know that she attended */
/* the SQL Symphony Concert 3 times in December 2017.\n | */
/* +---------------+----------------------------------------------------*/


INSERT INTO solution VALUES (1,
       (
       SELECT name
         FROM person
         JOIN drivers_license AS dl
              ON dl.id = person.license_id
        WHERE height BETWEEN 65 and 67
          AND hair_color LIKE 'red'
          AND gender = 'female'
          AND car_make = 'Tesla'
          AND car_model = 'Model S'
          AND person.id IN (
              SELECT person_id
                FROM facebook_event_checkin
               WHERE event_name = 'SQL Symphony Concert'
                 AND date BETWEEN 20171201 AND 20171231
       )
     )
);

SELECT value FROM solution;

/* +-----------------------------------------------------------------------------+ */
/* | value                                                                       |                                                                                 | */
/* +-----------------------------------------------------------------------------+ */
/* | Congrats, you found the brains behind the murder! Everyone in SQL City      | */
/* | hails you as the greatest SQL detective of all time. Time to break out the  | */
/* | champagne! |                                                                | */
/* +-----------------------------------------------------------------------------+ */

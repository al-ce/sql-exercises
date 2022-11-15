/* In the code editor below, revise the query to select the last_statement */
/* column in addition to the existing columns. */

SELECT first_name, last_name, last_statement
  FROM executions
 LIMIT 3;


/* +---------------------+-----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+ */
/* | first_name          | last_name | last_statement                                                                                                                                                                                               | */
/* +---------------------+-----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+ */
/* | Christopher Anthony | Young     | l want to make sure the Patel family knows I love them like they love me. Make sure the kids in the world know I'm being executed and those kids I've been mentoring keep this fight going. I'm good Warden. | */
/* | Danny Paul          | Bible     | <null>                                                                                                                                                                                                       | */
/* | Juan Edward         | Castillo  | To everyone that has been there for me you know who you are. Love y'all. See y'all on the other side.That's it.                                                                                              | */
/* +---------------------+-----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+ */

SELECT 50 / 2, 51 / 2;

/* +--------+--------+ */
/* | 50 / 2 | 51 / 2 | */
/* +--------+--------+ */
/* | 25     | 25     | */
/* +--------+--------+ */


/* Find the first and last names and ages (ex_age) of inmates 25 or younger */
/* at time of execution.  */
/* Because the average time inmates spend on death row prior to execution is 10.26 years, only 6 inmates this young have been executed in Texas since 1976. */

SELECT first_name, last_name, ex_age
  FROM executions
 WHERE ex_age <= 25;

/* +------------+------------+--------+ */
/* | first_name | last_name  | ex_age | */
/* +------------+------------+--------+ */
/* | Toronto    | Patterson  | 24     | */
/* | T.J.       | Jones      | 25     | */
/* | Napoleon   | Beazley    | 25     | */
/* | Richard    | Andrade    | 25     | */
/* | Jay        | Pinkerton  | 24     | */
/* | Jesse      | De La Rosa | 24     | */
/* +------------+------------+--------+ */


/* Modify the query to find the result for Raymond Landry. */

SELECT first_name, last_name, ex_number
 FROM executions
WHERE first_name LIKE '%Raymond%'  ''''''''''  -- Extra single quotes added for syntax highlighting, which is being weird.
  AND last_name LIKE '%Landry%';   ''''
/* +------------+-------------+-----------+ */
/* | first_name | last_name   | ex_number | */
/* +------------+-------------+-----------+ */
/* | Raymond    | Landry, Sr. | 29        | */
/* +------------+-------------+-----------+ */


/* Insert a pair of parenthesis so that this statement returns 0. */
SELECT 0 AND (0 OR 1);

/* +----------------+ */
/* | 0 AND (0 OR 1) | */
/* +----------------+ */
/* | 0              | */
/* +----------------+ */



SELECT last_statement
  FROM executions
  WHERE first_name
        LIKE 'Napoleon%'    ''''  -- Extra single quotes added for syntax highlighting, which is being weird.
    AND last_name
        LIKE '%Beazley%';

/* +----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+ */
/* | last_statement                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | */
/* +----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+ */
/* | The act I committed to put me here was not just heinous, it was senseless. But the person that committed that act is no longer here - I am. I'm not going to struggle physically against any restraints. I'm not going to shout, use profanity or make idle threats. Understand though that I'm not only upset, but I'm saddened by what is happening here tonight. I'm not only saddened, but disappointed that a system that is supposed to protect and uphold what is just and right can be so much like me when I made the same shameful mistake. If someone tried to dispose of everyone here for participating in this killing, I'd scream a resounding, "No." I'd tell them to give them all the gift that they would not give me...and that's to give them all a second chance. I'm sorry that I am here. I'm sorry that you're all here. I'm sorry that John Luttig died. And I'm sorry that it was something in me that caused all of this to happen to begin with. Tonight we tell the world that there are no second chances in the eyes of justice...Tonight, we tell our children that in some instances, in some cases, killing is right. This conflict hurts us all, there are no SIDES. The people who support this proceeding think this is justice. The people that think that I should live think that is justice. As difficult as it may seem, this is a clash of ideals, with both parties committed to what they feel is right. But who's wrong if in the end we're all victims? In my heart, I have to believe that there is a peaceful compromise to our ideals. I don't mind if there are none for me, as long as there are for those who are yet to come. There are a lot of men like me on death row - good men - who fell to the same misguided emotions, but may not have recovered as I have. Give those men a chance to do what's right. Give them a chance to undo their wrongs. A lot of them want to fix the mess they started, but don't know how. The problem is not in that people aren't willing to help them find out, but in the system telling them it won't matter anyway. No one wins tonight. No one gets closure. No one walks away victorious.| */
/* +----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+ */

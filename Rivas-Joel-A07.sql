/* Joel Rivas | IS:331 Homework 7 / 4/27/2019 */
/* Question 1 */
SELECT UserID 
FROM  VIEWER
where DATALENGTH(Zip) < 5;
/* The query found 114 invalid zipcode results. */

/*------------------------------------------------------------------------*/
/* Question 2 */
SELECT MovieTitle as "Singing Cartoons"
FROM  MOVIE
WHERE animation=1 AND musical=1;
/* This query found 17 results */

/*------------------------------------------------------------------------*/
/* Question 3 */
SELECT UserID
From VIEWER
Where Gender='F' or age > 30;
/* This resulted in 624 different IDs */

/*------------------------------------------------------------------------*/
/* Question 4 */
SELECT count(*) as "Jobs in the Arts"
From VIEWER
Where Occupation='entertainment' or Occupation='artist' or Occupation='writer';
/* This came up with 91 results */

/*------------------------------------------------------------------------*/
/* Question 5 */
Select MovieTitle
from MOVIE
where MovieTitle LIKE '%1990%' or MovieTitle LIKE '%1991%' or
	MovieTitle LIKE '%1992%' or MovieTitle LIKE '%1993%' or 
	MovieTitle LIKE '%1994%' or MovieTitle LIKE '%1995%' or
	MovieTitle LIKE '%1996%' or	MovieTitle LIKE '%1997%' or
	MovieTitle LIKE '%1998%' or MovieTitle LIKE '%1999%'

ORDER BY MovieTitle ASC;
/* Movies are in ascending order */	

/*------------------------------------------------------------------------*/
/* Question 6 */
Select UserID, AVG(Rating) as "Easy Reviewers"
FROM RATING 
group by UserID
HAVING AVG(Rating) = 4;
/* IDs are listed */

/*------------------------------------------------------------------------*/
/* Question 7 */
/* Youngest */

Select TOP 1 VIEWER.Age as "Youngest Reviewer Age"
FROM RATING LEFT JOIN VIEWER ON (RATING.UserID = VIEWER.UserID)
            LEFT JOIN MOVIE ON (RATING.UserID = MOVIE.MovieID)
ORDER BY RATING.Rating DESC, 
         MOVIE.comedy DESC,
		 VIEWER.Age ASC; 

/* Oldest */
Select TOP 1 VIEWER.Age as "Oldest Reviewer Age"
FROM RATING LEFT JOIN VIEWER ON (RATING.UserID = VIEWER.UserID)
            LEFT JOIN MOVIE ON (RATING.UserID = MOVIE.MovieID)
ORDER BY RATING.Rating DESC, 
         MOVIE.comedy DESC, 
		 VIEWER.Age DESC;
/* AVG */
Select AVG(VIEWER.Age) as "Average Reviewer Age"
FROM RATING LEFT JOIN VIEWER ON (RATING.UserID = VIEWER.UserID)
            LEFT JOIN MOVIE ON (RATING.UserID = MOVIE.MovieID)
WHERE Movie.comedy = 1 AND RATING = 5; 

/*------------------------------------------------------------------------*/
/* Question 8 | I didn't quite understand what the question was asking me, so I did answered the question in 2 variations.  */
/* Listed Version of the count */
Select count(*) as "Listed Occupation Count"
FROM VIEWER
Where Occupation not like 'lawyer' and Occupation not like 'librarian'

/* Descending Entries of all occupations*/
Select UserID as "Occupation Count"
FROM VIEWER
Where Occupation not like 'lawyer' and Occupation not like 'librarian'
Order BY UserID DESC;

/*------------------------------------------------------------------------*/
/* Question 9 */
/* For MALES*/
Select AVG(Age) as "Average Age for MALES", AVG(RATING.Rating) as "Average Rating" , count(Rating) as "The Number of Ratings"
FROM VIEWER LEFT JOIN RATING ON (VIEWER.UserID = RATING.UserID)
            LEFT JOIN MOVIE ON (VIEWER.UserID = MOVIE.MovieID)
Where Gender='M' AND MOVIE.MovieTitle LIKE '%1996%';

/* For FEMALES*/
Select AVG(Age) as "Average Age for FEMALES", AVG(RATING.Rating) as "Average Rating" , count(Rating) as "The Number of Ratings"
FROM VIEWER LEFT JOIN RATING ON (VIEWER.UserID = RATING.UserID)
            LEFT JOIN MOVIE ON (VIEWER.UserID = MOVIE.MovieID)
Where Gender='F' AND MOVIE.MovieTitle LIKE '%1996%'; 

/*------------------------------------------------------------------------*/
/* Question 10 | LAST QUESTION, FINALLY!!!!! */
Select Occupation, AVG(cast(Age as decimal(10,2))) 
From VIEWER
group by Occupation, Gender
Having AVG(Age) > 40.00 and Gender='M';

/* With Integers | The Difference is the removal of the series of numbers past the decimal point.*/
Select Occupation, AVG(Age)
From VIEWER
group by Occupation, Gender
Having AVG(Age) > 40.00 and Gender='M';
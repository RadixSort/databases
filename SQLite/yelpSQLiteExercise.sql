Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet

This is a 2-part assignment. In the first part, you are asked a series of questions that will help you profile and understand the data just like a data scientist would. For this first part of the assignment, you will be assessed both on the correctness of your findings, as well as the code you used to arrive at your answer. You will be graded on how easy your code is to read, so remember to use proper formatting and comments where necessary.

In the second part of the assignment, you are asked to come up with your own inferences and analysis of the data for a particular research question you want to answer. You will be required to prepare the dataset for the analysis you choose to do. As with the first part, you will be graded, in part, on how easy your code is to read, so use proper formatting and comments to illustrate and communicate your intent as required.

For both parts of this assignment, use this "worksheet." It provides all the questions you are being asked, and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that your peers can review your work. You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) to copy and paste your answers. If you are going to use Word or some other page layout application, just be careful to make sure your answers and code are lined appropriately.
In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.



Part 1: Yelp Dataset Profiling and Understanding

1. Profile the data by finding the total number of records for each of the tables below:

i. Attribute table = 10000
ii. Business table = 10000
iii. Category table =  10000
iv. Checkin table = 10000
v. elite_years table = 10000
vi. friend table =  10000
vii. hours table = 10000
viii. photo table =  10000
ix. review table =  10000
x. tip table =  10000
xi. user table = 10000
	


2. Find the total number of distinct records for the primary keys in each of the tables listed below:

i. 	Business =			10000 	(id)
ii. Hours =				1562 	(business_id)
iii. Category =			2643    (business_id)
iv. Attribute =			1115	(business_id)
v. 	Review =			10000	(id), 
						8090 (business_id), 	
						9581 (user_id)
vi. Checkin = 			493 	(business_id)
vii. Photo =			10000	(id),
						6493 (business_id)
viii. Tip = 			537	(user_id),
						3979 (business_id)
ix. User = 				10000	(id)
x. 	Friend = 			11	(user_id)
xi. Elite_years =	    2780	(user_id)

Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.	



3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer: No
	
	
	SQL code used to arrive at answer:

	SELECT *
	FROM user
	WHERE id IS NULL
		OR name IS NULL
		OR review_count IS NULL
		OR yelping_since IS NULL
		OR useful IS NULL
		OR funny IS NULL
		OR cool IS NULL
		OR fans IS NULL
		OR average_stars IS NULL
		OR compliment_hot IS NULL
		OR compliment_more IS NULL
		OR compliment_profile IS NULL
		OR compliment_cute IS NULL
		OR compliment_list IS NULL
		OR compliment_note IS NULL
		OR compliment_plain IS NULL
		OR compliment_cool IS NULL
		OR compliment_funny IS NULL
		OR compliment_writer IS NULL
		OR compliment_photos IS NULL
	
	

	
4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

	i. Table: Review, Column: Stars

		min: 1		max: 5		avg: 3.7082
		
	ii. Table: Business, Column: Stars
		
		min: 1.0	max: 5.0	avg: 3.6549
	
	iii. Table: Tip, Column: Likes
		
		min: 0		max: 2		avg: 0.0144
	
	iv. Table: Checkin, Column: Count
		
		min: 1		max: 53		avg: 1.9414
	
	v. Table: User, Column: Review_count
		
		min: 0		max: 2000	avg: 24.2995
		


5. List the cities with the most reviews in descending order:

	SQL code used to arrive at answer:
		
	SELECT city,
		SUM(review_count)
	FROM business
	GROUP BY city
	ORDER BY SUM(review_count) DESC
	
	Copy and Paste the Result Below:

	+-----------------+-------------------+
	| city            | sum(review_count) |
	+-----------------+-------------------+
	| Las Vegas       |             82854 |
	| Phoenix         |             34503 |
	| Toronto         |             24113 |
	| Scottsdale      |             20614 |
	| Charlotte       |             12523 |
	| Henderson       |             10871 |
	| Tempe           |             10504 |
	| Pittsburgh      |              9798 |
	| Montréal        |              9448 |
	| Chandler        |              8112 |
	| Mesa            |              6875 |
	| Gilbert         |              6380 |
	| Cleveland       |              5593 |
	| Madison         |              5265 |
	| Glendale        |              4406 |
	| Mississauga     |              3814 |
	| Edinburgh       |              2792 |
	| Peoria          |              2624 |
	| North Las Vegas |              2438 |
	| Markham         |              2352 |
	| Champaign       |              2029 |
	| Stuttgart       |              1849 |
	| Surprise        |              1520 |
	| Lakewood        |              1465 |
	| Goodyear        |              1155 |
	+-----------------+-------------------+
	(Output limit exceeded, 25 of 362 total rows shown)
	
6. Find the distribution of star ratings to the business in the following cities:

i. Avon

SQL code used to arrive at answer:

	SELECT stars AS [Star Rating],
		count(stars) AS [Count]
	FROM business b
	WHERE city = 'Avon'
	GROUP BY stars

Copy and Paste the Resulting Table Below (2 columns – star rating and count):
+-------------+-------+
| Star Rating | Count |
+-------------+-------+
|         1.5 |     1 |
|         2.5 |     2 |
|         3.5 |     3 |
|         4.0 |     2 |
|         4.5 |     1 |
|         5.0 |     1 |
+-------------+-------+

ii. Beachwood

SQL code used to arrive at answer:
	
	SELECT stars AS [Star Rating],
		count(stars) AS [Count]
	FROM business b
	WHERE city = 'Beachwood'
	GROUP BY stars

Copy and Paste the Resulting Table Below (2 columns - star rating and count):
	+-------------+-------+
	| Star Rating | Count |
	+-------------+-------+
	|         2.0 |     1 |
	|         2.5 |     1 |
	|         3.0 |     2 |
	|         3.5 |     2 |
	|         4.0 |     1 |
	|         4.5 |     2 |
	|         5.0 |     5 |
	+-------------+-------+

7. Find the top 3 users based on their total number of reviews:
		
	SQL code used to arrive at answer:
		select name, review_count
		from user
		order by review_count desc
		limit 3
		
	Copy and Paste the Result Below:
		+--------+--------------+
		| name   | review_count |
		+--------+--------------+
		| Gerald |         2000 |
		| Sara   |         1629 |
		| Yuri   |         1339 |
		+--------+--------------+
		


8. Does posing more reviews correlate with more fans?

	No

	Please explain your findings and interpretation of the results:
	
	SQL code:
			select name, review_count, fans
			from user
			order by fans desc
			limit 10
		
		Results:
			+-----------+--------------+------+
			| name      | review_count | fans |
			+-----------+--------------+------+
			| Amy       |          609 |  503 |
			| Mimi      |          968 |  497 |
			| Harald    |         1153 |  311 |
			| Gerald    |         2000 |  253 |
			| Christine |          930 |  173 |
			| Lisa      |          813 |  159 |
			| Cat       |          377 |  133 |
			| William   |         1215 |  126 |
			| Fran      |          862 |  124 |
			| Lissa     |          834 |  120 |
			+-----------+--------------+------+
	No correlation preceievd between fans and review count
	
9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer: more reviews with "love"

	
	SQL code used to arrive at answer:

	SELECT 'love' Word, COUNT(text) [Total Count]
		FROM review
		WHERE text LIKE '%love%'
		UNION
		SELECT 'hate' Word, COUNT(text) [Total Count]
		FROM review
		WHERE text LIKE '%hate%'
		
		+------+-------------+
		| Word | Total Count |
		+------+-------------+
		| hate |         232 |
		| love |        1780 |
		+------+-------------+
	
	
10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:
		select name, fans
		from user
		order by fans desc
		limit 10
	
	Copy and Paste the Result Below:
		+-----------+------+
		| name      | fans |
		+-----------+------+
		| Amy       |  503 |
		| Mimi      |  497 |
		| Harald    |  311 |
		| Gerald    |  253 |
		| Christine |  173 |
		| Lisa      |  159 |
		| Cat       |  133 |
		| William   |  126 |
		| Fran      |  124 |
		| Lissa     |  120 |
		+-----------+------+
	
	
11. Is there a strong relationship (or correlation) between having a high number of fans and being listed as "useful" or "funny?" Out of the top 10 users with the highest number of fans, what percent are also listed as “useful” or “funny”?

Key:
0% - 25% - Low relationship
26% - 75% - Medium relationship
76% - 100% - Strong relationship
	
	SQL code used to arrive at answer:
SELECT name,
	fans,
	useful,
	funny,
	CASE 
		WHEN (useful * 100) / (useful + funny) < 25
			THEN 'Low'
		WHEN (useful * 100) / (useful + funny) > 25
			AND (useful * 100) / (useful + funny) < 75
			THEN 'Medium'
		WHEN (useful * 100) / (useful + funny)
			THEN 'Strong'
		ELSE 'Other'
		END [Relationship:Useful],
	CASE 
		WHEN (funny * 100) / (useful + funny) < 25
			THEN 'Low'
		WHEN (funny * 100) / (useful + funny) > 25
			AND (funny * 100) / (useful + funny) < 75
			THEN 'Medium'
		WHEN (funny * 100) / (useful + funny)
			THEN 'Strong'
		ELSE 'Other'
		END [Relationship:Funny]
FROM user
ORDER BY fans DESC,
	useful DESC,
	funny DESC 
Limit 20
	
	Copy and Paste the Result Below:
+-----------+------+--------+--------+---------------------+--------------------+
| name      | fans | useful |  funny | Relationship:Useful | Relationship:Funny |
+-----------+------+--------+--------+---------------------+--------------------+
| Amy       |  503 |   3226 |   2554 | Medium              | Medium             |
| Mimi      |  497 |    257 |    138 | Medium              | Medium             |
| Harald    |  311 | 122921 | 122419 | Medium              | Medium             |
| Gerald    |  253 |  17524 |   2324 | Strong              | Low                |
| Christine |  173 |   4834 |   6646 | Medium              | Medium             |
| Lisa      |  159 |     48 |     13 | Strong              | Low                |
| Cat       |  133 |   1062 |    672 | Medium              | Medium             |
| William   |  126 |   9363 |   9361 | Medium              | Medium             |
| Fran      |  124 |   9851 |   7606 | Medium              | Medium             |
| Lissa     |  120 |    455 |    150 | Strong              | Low                |
| Mark      |  115 |   4008 |    570 | Strong              | Low                |
| Tiffany   |  111 |   1366 |    984 | Medium              | Medium             |
| bernice   |  105 |    120 |    112 | Medium              | Medium             |
| Roanna    |  104 |   2995 |   1188 | Medium              | Medium             |
| .Hon      |  101 |   7850 |   5851 | Medium              | Medium             |
| Angela    |  101 |    158 |    164 | Medium              | Medium             |
| Ben       |   96 |   1180 |   1155 | Medium              | Medium             |
| Linda     |   89 |   3177 |   2736 | Medium              | Medium             |
| Christina |   85 |    158 |     34 | Strong              | Low                |
| Jessica   |   84 |   2161 |   2091 | Medium              | Medium             |
+-----------+------+--------+--------+---------------------+--------------------+
	Please explain your findings and interpretation of the results:
	
	There does not seeem to be a strong correlation between being listed as funny or useful to the number of fans. 

	Useful seems a better indicator for fan numbers than funny seeing the relaionship % of both.
	

Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.
	
i. Do the two groups you chose to analyze have a different distribution of hours?
	Las Vegas has 82 businesses with hours posted.

	There are 14 businesses with 2-3 star ratings.
		where are 2 are open Mondays
		where are 2 are open Tuesdays
		where are 2 are open Wednesdays
		where are 2 are open Thursdays
		where are 2 are open Fridays
		where are 2 are open Saturdays
		where are 2 are open Sundays

	There are 55 businesses with 4-5 star ratings.
		where are 9 are open Mondays
		where are 9 are open Tuesdays
		where are 9 are open Wednesdays
		where are 9 are open Thursdays
		where are 8 are open Fridays
		where are 7 are open Saturdays
		where are 4 are open Sundays

	Hours do not have a correlation with star ratings... 
	Although the sample size is definitely not big enough for a valid conclusion.

ii. Do the two groups you chose to analyze have a different number of reviews?
		Las Vegas has 1630 businesses in the database.

        There are 415 businesses with 2-3 star ratings with 16039 reviews in total.
        They have an average of ~39 reveiws per venue.

        There are 884 businesses with 4-5 star ratings with 53110 reviews in total.
        They have an average of ~60 reviews per venue.
         
iii. Are you able to infer anything from the location data provided between these two groups? Explain.

Not purely from sql, 
however probably with the help of a GoogleMap API or clustering/catagorization with R or octave with the longitude/lattitude, 
assessing the presence and nature of relationship between location and star groups should be possible.

SQL code used for analysis:

SELECT CASE 
		WHEN b.stars >= 2
			AND b.stars <= 3
			THEN "A (2-3)"
		WHEN b.stars >= 4
			THEN "B (4-5)"
		ELSE "Others"
		END StarGroups
	,count(b.id) AS [# of Businesses]
	,sum(b.review_count) AS [# of reviews]
	,avg(b.review_count) AS [avg # of reviews]
	,count(h.hours)
FROM business b
LEFT JOIN hours h
	ON b.id = h.business_id
WHERE (b.city = "Las Vegas") -- AND (h.hours like "Sun%")
GROUP BY StarGroups

+------------+-----------------+--------------+------------------+----------------+
| StarGroups | # of Businesses | # of reviews | avg # of reviews | count(h.hours) |
+------------+-----------------+--------------+------------------+----------------+
| A (2-3)    |             415 |        16039 |    38.6481927711 |             14 |
| B (4-5)    |             884 |        53110 |    60.0791855204 |             55 |
| Others     |             331 |        21322 |     64.416918429 |             13 |
+------------+-----------------+--------------+------------------+----------------+
		
2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.
		
i. Difference 1:
         Better reviews for businesses still open.
         
ii. Difference 2:
         More total reviews for businesses still open.
         
         
SQL code used for analysis:

	SELECT CASE 
		WHEN b.is_open = 1
			THEN "Open"
		WHEN b.is_open = 0
			THEN "Closed"
		ELSE "Others"
		END isOpen
	,avg(stars)
	,avg(review_count)
	FROM business b
	GROUP BY isOpen

+--------+---------------+-------------------+
| isOpen |    avg(stars) | avg(review_count) |
+--------+---------------+-------------------+
| Closed | 3.52039473684 |     23.1980263158 |
| Open   | 3.67900943396 |     31.7570754717 |
+--------+---------------+-------------------+

	
3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

i. Indicate the type of analysis you chose to do:

	I want to see which category has the largest presence in Yelp.
	     
ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:

	Category of Business in Yelp with the most Stars and its relationship with the categorys total review and avg stars.
    2 tables: category and business. Inner join to find the relation between total review of a category, its avg stars, and total stars (or category presence).

iii. Output of your finished dataset:

+---------------------------+--------------+---------------+-------------------+
| Category                  | Total Review |     Avg Stars | Category Presence |
+---------------------------+--------------+---------------+-------------------+
| Restaurants               |           71 | 3.45774647887 |             245.5 |
| Shopping                  |           30 | 3.98333333333 |             119.5 |
| Food                      |           23 | 3.78260869565 |              87.0 |
| Health & Medical          |           17 | 4.08823529412 |              69.5 |
| Nightlife                 |           20 |         3.475 |              69.5 |
| Home Services             |           16 |           4.0 |              64.0 |
| Bars                      |           17 |           3.5 |              59.5 |
| Beauty & Spas             |           13 | 3.88461538462 |              50.5 |
| Local Services            |           12 | 4.20833333333 |              50.5 |
| American (Traditional)    |           11 | 3.81818181818 |              42.0 |
| Active Life               |           10 |          4.15 |              41.5 |
| Automotive                |            9 |           4.5 |              40.5 |
| Sandwiches                |            8 |        3.9375 |              31.5 |
| Hotels & Travel           |            9 | 3.22222222222 |              29.0 |
| Arts & Entertainment      |            7 |           4.0 |              28.0 |
| Burgers                   |            8 |         3.125 |              25.0 |
| Hair Salons               |            6 | 4.08333333333 |              24.5 |
| Mexican                   |            7 |           3.5 |              24.5 |
| Event Planning & Services |            6 |          3.75 |              22.5 |
| Fast Food                 |            7 | 3.21428571429 |              22.5 |
| Doctors                   |            5 |           4.2 |              21.0 |
| Bakeries                  |            5 |           4.1 |              20.5 |
| American (New)            |            6 | 3.33333333333 |              20.0 |
| Specialty Food            |            5 |           4.0 |              20.0 |
| Japanese                  |            5 |           3.8 |              19.0 |
+---------------------------+--------------+---------------+-------------------+
(Output limit exceeded, 25 of 712 total rows shown)
       
         
iv. Provide the SQL code you used to create your final dataset:

SELECT c.category as [Category]
	,count(b.review_count) AS [Total Review]
	,avg(b.stars) AS [Avg Stars]
	,(count(b.review_count) * avg(b.stars)) AS [Category Presence]
FROM category c
LEFT JOIN business b
	ON b.id = c.business_id
GROUP BY category
ORDER BY (count(b.review_count) * avg(b.stars)) DESC


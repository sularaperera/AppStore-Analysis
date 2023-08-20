--Combine data from all four tables using Union All
SELECT * INTO [appleStore_description_combined] FROM [dbo].[appleStore_description1]
UNION ALL
SELECT * FROM [dbo].[appleStore_description2]
UNION ALL
SELECT * FROM [dbo].[appleStore_description3]
UNION ALL
SELECT * FROM [dbo].[appleStore_description4]



-- Checking row count from both tables
SELECT 
	COUNT(*) 
FROM [dbo].[AppleStore]

SELECT 
	COUNT(*) 
FROM [dbo].[appleStore_description_combined]



-- Checking table data from both tables
SELECT * 
FROM [dbo].[AppleStore]
SELECT * 
FROM [dbo].[appleStore_description_combined]



-- *****  Exploratary Data Analysis *****
-- check the number of unique apps in both tables
SELECT 
	COUNT(DISTINCT id) AS UniqueAppIDs
FROM [dbo].[AppleStore]

SELECT 
	COUNT(DISTINCT id) AS UniqueAppIDs
FROM [dbo].[appleStore_description_combined]



-- check for any missing values in key fields
SELECT 
	COUNT(*) AS MissingValues
FROM [dbo].[AppleStore]
WHERE [track_name] IS NULL OR [user_rating] IS NULL OR [prime_genre] IS NULL

SELECT 
	COUNT(*) AS MissingValues
FROM [dbo].[appleStore_description_combined]
WHERE [app_desc] IS NULL



-- find the number of apps per genre
SELECT
	[prime_genre], 
	COUNT([id]) AS [number of apps]
FROM [dbo].[AppleStore]
GROUP BY [prime_genre]
ORDER BY [number of apps] DESC



-- get an overview of the apps' ratings
SELECT	
	MIN([user_rating]) AS [Min Rating],
	MAX([user_rating]) AS [Max Rating],
	ROUND(AVG([user_rating]),2) AS [Avg Rating]
FROM [dbo].[AppleStore]



-- get an overview of the apps' pricing
SELECT	
	MIN([price]) AS [Min Price],
	ROUND(MAX([price]),2) AS [Max Price],
	ROUND(AVG([price]),2) AS [Avg Price]
FROM [dbo].[AppleStore]



-- find the average app price of each genre
SELECT 
	[prime_genre], 
	AVG(price) AS avg_price, 
	COUNT([id]) AS [Number of Apps]
FROM AppleStore
GROUP BY [prime_genre]
ORDER BY avg_price DESC;



-- find the maximum app price for each genre
SELECT 
	[prime_genre], 
	MAX([price]) AS [Maximum Price]
FROM [dbo].[AppleStore]
GROUP BY [prime_genre]
ORDER BY [Maximum Price] DESC



-- determince whether paid apps have higher ratings than free apps
SELECT 
	AppType, 
	AVG([user_rating]) AS Avg_Rating
FROM (
    SELECT CASE
				WHEN [price] > 0 THEN 'Paid'
                ELSE 'Free'
           END AS AppType,
           [user_rating]
    FROM [dbo].[AppleStore]) AS Subquery
GROUP BY AppType;



-- check if apps with more supported languages have higher ratings
SELECT 
	Language_bucket, 
	ROUND(AVG([user_rating]),2) AS Avg_Rating
FROM (
	SELECT CASE
		WHEN [lang_num] < 10 THEN '<10 languages'
		WHEN [lang_num] BETWEEN 10 AND 30 THEN '10-30 languages'
		ELSE '>10 languages'
		END AS Language_bucket,
		[user_rating] 
	FROM [dbo].[AppleStore]) AS Subquery
GROUP BY Language_bucket
ORDER BY Avg_Rating DESC



-- check genres with low ratings
SELECT 
	TOP 10 [prime_genre], 
	AVG([user_rating]) AS Avg_Rating
FROM [dbo].[AppleStore]
GROUP BY [prime_genre]
ORDER BY Avg_Rating ASC



-- check if there is correlation between te length of the app description and the user rating
SELECT 
  description_length_bucket, 
  ROUND(AVG([user_rating]), 2) AS Avg_Rating 
FROM 
	(
    SELECT 
		CASE 
		WHEN len(APD.[app_desc]) < 500 THEN 'Short' 
		WHEN len(APD.[app_desc]) BETWEEN 500 
		AND 1000 THEN 'Medium' 
		ELSE 'Long' 
		END AS description_length_bucket, 
		AP.[user_rating] 
    FROM 
		[dbo].[AppleStore] AS AP 
		JOIN [dbo].[appleStore_description_combined] AS APD 
		ON AP.id = APD.id
	) AS Subquery 
GROUP BY 
  description_length_bucket 
ORDER BY 
  Avg_Rating DESC



-- check the top-rated apps for each genre
SELECT 
	[prime_genre],
	[track_name],
	[user_rating]
FROM (
	SELECT	[prime_genre],
			[track_name],
			[user_rating],
			RANK() OVER(PARTITION BY [prime_genre] ORDER BY [user_rating] DESC,[rating_count_tot] DESC) AS rank
	FROM [dbo].[AppleStore] ) AS Subquery
WHERE Subquery.rank = 1



--Final Recommendations for the client

--1.	Paid apps have better ratings
--2.	Apps supporting between 10 and 30 languages have better ratings
--3.	Finance and book apps have low ratings - this will be a good category to reaserch and develop apps
--4.	Apps with a longer description have better ratings
--5.	A new app should aim for an average rating above 3.5
--6.	Games and Entertainment have high competition


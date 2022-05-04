-- Query to display the app_id, app_name, category and reviews for apps with more reviews than app_id 64
SELECT app_id, app_name, category, reviews 
FROM apps 
WHERE reviews > (SELECT reviews FROM apps WHERE app_id = 64)

-- Query to display the app_name, category, size_in_mb, and rating, for apps in the same category as Redhold (app_name)
SELECT app_name, category, size_in_mb, rating
FROM apps 
WHERE category = (SELECT category FROM apps WHERE app_name = 'Redhold')

-- Query to display the app_name, category, app_version, and last_updated, for apps which were last_updated before app_id 29
SELECT app_id, app_name, category, app_version, last_updated
FROM apps
WHERE last_updated < (SELECT last_updated FROM apps WHERE app_id = 29)

-- Query to display the app_name, category, app_version, and rating, for apps with rating higher than the average
SELECT app_name, category, app_version, rating
FROM apps 
WHERE rating > (SELECT AVG(rating) FROM apps)

-- Query to display the categories having apps in the same size_in_mb as apps in the education category
SELECT DISTINCT category
FROM apps 
WHERE size_in_mb IN (SELECT size_in_mb FROM apps WHERE category = 'Education')
AND category != 'Education'

-- Minimum and Maximum Ratings
	
-- Min rating of apps in the Education category 
SELECT MIN(rating) FROM apps WHERE category = 'Education'

-- Max rating of apps in the Education category  
SELECT MAX(rating) FROM apps WHERE category = 'Education'

-- Query to display the app_name and rating for apps with rating in the range of Education min and max values
SELECT app_name, rating 
FROM apps 
WHERE rating >= (SELECT MIN(rating) FROM apps WHERE category = 'Education')
AND   rating <= (SELECT MAX(rating) FROM apps WHERE category = 'Education')

-- or 

SELECT app_name, rating 
FROM apps 
WHERE rating BETWEEN (SELECT MIN(rating) FROM apps WHERE category = 'Education')
	     AND     (SELECT MAX(rating) FROM apps WHERE category = 'Education')
         
-- Query to display the app_id, app_name, rating and reviews for app with rating higher than app_id 131 and (number of) reviews higher than app_id 28
SELECT app_id, app_name, rating and reviews FROM apps
WHERE rating > (SELECT rating FROM apps WHERE app_id = 131)
AND   reviews > (SELECT reviews FROM apps WHERE app_id = 28)

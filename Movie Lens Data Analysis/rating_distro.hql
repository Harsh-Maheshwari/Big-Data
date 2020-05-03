select * from ratings_data;

SELECT rating, count(movid) AS cnt FROM rating_data GROUP BY rating ORDER BY rating;


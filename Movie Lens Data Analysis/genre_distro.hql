CREATE TABLE genre_data AS SELECT movid,genre_type FROM mov_data LATERAL VIEW explode(genre) mov_data AS genre_type; 

show tables;

select * from genre_data;

SELECT genre type, count(genre_type) FROM genre_data GROUP BY genre_type;
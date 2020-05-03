# Big-Data-Project

Online MovieSite Data Analysis
------------------------------------------------
------------------------------------------------
Datasets Used::
--------------
This data set contains 10000054 ratings and 95580 tags applied to 10681 movies by 71567 users of the online movie recommender service MovieLens.

Data contained in 3 files:: movies.dat, ratings.dat, tags.dat

Ratings.dat -- Each line of this file represents one rating of one movie by one user with format:

UserID::MovieID::Rating::Timestamp

Tags.dat -- Each line represents one tag applied to one movie by one user with format::

UserID::MovieID::Tag::Timestamp

Movies.dat -- Each line represents one movie, with format::

MovieID::Title::Genre

Data Ingestion::
---------------
As fields in the datasets are separated by "::", RegEx SerDe can be used to parse records into columns. 3 tables named mov_orig, rating_orig and tag_orig can be created from that. The output of these tables is then inserted into new tables to avoid SerDe execution during runtime and also converting the time stamp. 

File Used:: data_ingestion_tables_creation.hql

Data Analysis Project::
--------------
Basic anlysis has to be done using 5 simple HiveQL scripts as under::
1. Genre Distribution: Query used to get distinct genre category available on site and number of movies under
each category. [genre_distro.hql]
2. Ratings Distribution: Similarly, distribution of ratings has to be analysed that how many movies have been
rated a particular rating say 5. [rating_distro.hql]
3. Average Rating of Each Movie: Create a query to find average rating of each movie upto one decimal place.
[avg_rating.hql]
4. Top Users: Query used to find out most active users say who have rated more than 2000 movies.
[top_users.hql]
5. User Query: Query used to trace the activity of a particular user say what movies s/he has rated or what tags
s/he has provided. [usr_qry.hql] 

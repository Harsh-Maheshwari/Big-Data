CREATE DATABASE IF NOT EXISTS movie5;

show databases;

ADD JAR /usr/lib/hive-contrib-0.10.0-cdh4.4.0.jar;


CREATE EXTERNAL TABLE IF NOT EXISTS movie5.rating_org (UsrId STRING, MovId STRING, rating STRING, time_stp STRING) 
	COMMENT 'Rating Original DATA' ROW FORMAT SERDE 'org.apache.hadoop.hive.contrib.serde2.RegexSerDe' 
	WITH SERDEPROPERTIES ( "input.regee = "^([0-9]*)::([0-9]*)::([0-9\.]*)::( [0-9]*)$", "output.format.string" = "%1$s %2$s %3$s %4$s" ) LOCATION '/ user/cloudera/rating_dt';


use movie5;
show tables;
select * from ratings_orig
 
CREATE TABLE IF NOT EXISTS movie5.rating_data (UsrId STRING, MovId STRING, rating STRING, time_stp STRING) 
	COMMENT 'Rating DATA' ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' STORED AS TEXTFILE;

show tables
select * from rating_data;

INSERT INTO TABLE rating_data SELECT UsrId, MovId, rating, from_unixtime(cast(time_stp as BIGINT) FROM rating_orig;

select * from ratings_data limit 5;

select * from ratings_orig limit 5;

CREATE EXTERNAL TABLE IF NOT EXISTS movie5.tag_org (UsrId STRING, MovId STRING, tag STRING, time_stp STRING) 
	COMMENT 'Tag Original DATA' ROW FORMAT SERDE 'org.apache.hadoop.hive.contrib.serde2.RegexSerDe' 
	WITH SERDEPROPERTIES ( "input.regee = "^([0-9]*)::([0-9]*)::([A-Za-z0-9-\.\\W\\s+]*)::( [0-9]*)$", "output.format.string" = "%1$s %2$s %3$s %4$s" ) LOCATION '/ user/cloudera/tag_dt';

CREATE TABLE IF NOT EXISTS movie5.tag_data (UsrId STRING, MovId STRING, tag STRING, time_stp STRING) 
	COMMENT 'Tag DATA' ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' STORED AS TEXTFILE;

INSERT INTO TABLE tag_data SELECT UsrId, MovId, tag, from_unixtime(cast(time_stp as BIGINT)) FROM tag_orig;

CREATE EXTERNAL TABLE IF NOT EXISTS movie5.mov_org (MovId STRING, Title STRING, Genre STRING) 
	COMMENT 'Movie Original DATA' ROW FORMAT SERDE 'org.apache.hadoop.hive.contrib.serde2.RegexSerDe' 
	WITH SERDEPROPERTIES ( "input.regee = "^([0-9]*)::([A-Za-z0-9-\.\\W\\s+]*)::( [A-Za-z-|]*)$", "output.format.string" = "%1$s %2$s %3$s" ) LOCATION '/ user/cloudera/mov_dt';

CREATE TABLE IF NOT EXISTS movie5.mov_data (MovId STRING, Title STRING, Genre ARRAY<STRING>) 
	COMMENT 'Movie DATA' ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' STORED AS TEXTFILE;

INSERT INTO TABLE mov_data SELECT MovId, Title , split(genre,'\\|') FROM mov_orig;

Select * from mov_data;
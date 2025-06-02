--Import the tripdata from April 2020 -March 2021 into the DBMS

CREATE TABLE tripdata_apr (
    ride_id TEXT PRIMARY KEY,
    rideable_type TEXT,
    started_at TIMESTAMP,
    ended_at TIMESTAMP,
    start_station_name TEXT,
    start_station_id TEXT,
    end_station_name TEXT,
    end_station_id TEXT,
    start_lat DECIMAL(9,6),
    start_lng DECIMAL(9,6),
    end_lat DECIMAL(9,6),
    end_lng DECIMAL(9,6),
    member_casual TEXT
);

CREATE TABLE tripdata_may (
    ride_id TEXT PRIMARY KEY,
    rideable_type TEXT,
    started_at TIMESTAMP,
    ended_at TIMESTAMP,
    start_station_name TEXT,
    start_station_id TEXT,
    end_station_name TEXT,
    end_station_id TEXT,
    start_lat DECIMAL(9,6),
    start_lng DECIMAL(9,6),
    end_lat DECIMAL(9,6),
    end_lng DECIMAL(9,6),
    member_casual TEXT
);

CREATE TABLE tripdata_june (
    ride_id TEXT PRIMARY KEY,
    rideable_type TEXT,
    started_at TIMESTAMP,
    ended_at TIMESTAMP,
    start_station_name TEXT,
    start_station_id TEXT,
    end_station_name TEXT,
    end_station_id TEXT,
    start_lat DECIMAL(9,6),
    start_lng DECIMAL(9,6),
    end_lat DECIMAL(9,6),
    end_lng DECIMAL(9,6),
    member_casual TEXT
);

CREATE TABLE tripdata_july (
    ride_id TEXT PRIMARY KEY,
    rideable_type TEXT,
    started_at TIMESTAMP,
    ended_at TIMESTAMP,
    start_station_name TEXT,
    start_station_id TEXT,
    end_station_name TEXT,
    end_station_id TEXT,
    start_lat DECIMAL(9,6),
    start_lng DECIMAL(9,6),
    end_lat DECIMAL(9,6),
    end_lng DECIMAL(9,6),
    member_casual TEXT
);

CREATE TABLE tripdata_aug (
    ride_id TEXT PRIMARY KEY,
    rideable_type TEXT,
    started_at TIMESTAMP,
    ended_at TIMESTAMP,
    start_station_name TEXT,
    start_station_id TEXT,
    end_station_name TEXT,
    end_station_id TEXT,
    start_lat DECIMAL(9,6),
    start_lng DECIMAL(9,6),
    end_lat DECIMAL(9,6),
    end_lng DECIMAL(9,6),
    member_casual TEXT
);

CREATE TABLE tripdata_sept (
    ride_id TEXT PRIMARY KEY,
    rideable_type TEXT,
    started_at TIMESTAMP,
    ended_at TIMESTAMP,
    start_station_name TEXT,
    start_station_id TEXT,
    end_station_name TEXT,
    end_station_id TEXT,
    start_lat DECIMAL(9,6),
    start_lng DECIMAL(9,6),
    end_lat DECIMAL(9,6),
    end_lng DECIMAL(9,6),
    member_casual TEXT
);

CREATE TABLE tripdata_oct (
    ride_id TEXT PRIMARY KEY,
    rideable_type TEXT,
    started_at TIMESTAMP,
    ended_at TIMESTAMP,
    start_station_name TEXT,
    start_station_id TEXT,
    end_station_name TEXT,
    end_station_id TEXT,
    start_lat DECIMAL(9,6),
    start_lng DECIMAL(9,6),
    end_lat DECIMAL(9,6),
    end_lng DECIMAL(9,6),
    member_casual TEXT
);

CREATE TABLE tripdata_nov (
    ride_id TEXT PRIMARY KEY,
    rideable_type TEXT,
    started_at TIMESTAMP,
    ended_at TIMESTAMP,
    start_station_name TEXT,
    start_station_id TEXT,
    end_station_name TEXT,
    end_station_id TEXT,
    start_lat DECIMAL(9,6),
    start_lng DECIMAL(9,6),
    end_lat DECIMAL(9,6),
    end_lng DECIMAL(9,6),
    member_casual TEXT
);

CREATE TABLE tripdata_dec (
    ride_id TEXT PRIMARY KEY,
    rideable_type TEXT,
    started_at TIMESTAMP,
    ended_at TIMESTAMP,
    start_station_name TEXT,
    start_station_id TEXT,
    end_station_name TEXT,
    end_station_id TEXT,
    start_lat DECIMAL(9,6),
    start_lng DECIMAL(9,6),
    end_lat DECIMAL(9,6),
    end_lng DECIMAL(9,6),
    member_casual TEXT
);

CREATE TABLE tripdata_jan_2021 (
    ride_id TEXT PRIMARY KEY,
    rideable_type TEXT,
    started_at TIMESTAMP,
    ended_at TIMESTAMP,
    start_station_name TEXT,
    start_station_id TEXT,
    end_station_name TEXT,
    end_station_id TEXT,
    start_lat DECIMAL(9,6),
    start_lng DECIMAL(9,6),
    end_lat DECIMAL(9,6),
    end_lng DECIMAL(9,6),
    member_casual TEXT
);

CREATE TABLE tripdata_feb_2021 (
    ride_id TEXT PRIMARY KEY,
    rideable_type TEXT,
    started_at TIMESTAMP,
    ended_at TIMESTAMP,
    start_station_name TEXT,
    start_station_id TEXT,
    end_station_name TEXT,
    end_station_id TEXT,
    start_lat DECIMAL(9,6),
    start_lng DECIMAL(9,6),
    end_lat DECIMAL(9,6),
    end_lng DECIMAL(9,6),
    member_casual TEXT
);

CREATE TABLE tripdata_mar_2021 (
    ride_id TEXT PRIMARY KEY,
    rideable_type TEXT,
    started_at TIMESTAMP,
    ended_at TIMESTAMP,
    start_station_name TEXT,
    start_station_id TEXT,
    end_station_name TEXT,
    end_station_id TEXT,
    start_lat DECIMAL(9,6),
    start_lng DECIMAL(9,6),
    end_lat DECIMAL(9,6),
    end_lng DECIMAL(9,6),
    member_casual TEXT
);
--Add all the tripdata table into a single table which will be named cyclistic data

CREATE Cyclistic_data AS
WITH trip_data AS (
    SELECT * FROM tripdata_april
    UNION ALL
    SELECT * FROM tripdata_may
    UNION ALL
    SELECT * FROM tripdata_june
    UNION ALL
    SELECT * FROM tripdata_july
    UNION ALL
    SELECT * FROM tripdata_aug
    UNION ALL
    SELECT * FROM tripdata_sept
    UNION ALL
    SELECT * FROM tripdata_oct
    UNION ALL
    SELECT * FROM tripdata_nov
    UNION ALL
    SELECT * FROM tripdata_dec
    UNION ALL
    SELECT * FROM tripdata_jan_2021
    UNION ALL
    SELECT * FROM tripdata_feb_2021    
    UNION ALL
    SELECT * FROM tripdata_mar_2021
)
SELECT * FROM trip_data;

--New Table 

SELECT * 
FROM cyclistic_data;

--create new column 'ride_length' to determine the ride duration
ALTER TABLE cyclistic_data
ADD ride_length TIME;
UPDATE cyclistic_data
SET ride_length = ended_at-started_at;

--Created a new column for weekdays i.e days of the week for respective ride
ALTER TABLE cyclistic_data
ADD weekdays INTEGER;
UPDATE cyclistic_data
SET weekdays = EXTRACT(DOW FROM started_at)+1; --where 1-7 represent sunday-saturday respectively

--Created another new column for weekdays i.e days of the week for respective ride in text (sunday-saturday)
ADD weekday TEXT;
UPDATE cyclistic_data
SET weekday = TO_CHAR(started_at, 'Day');

--Remove Duplicates 
SELECT DISTINCT *
FROM cyclistic_data ;

--question 1: how does annual members & casual riders uses cyclistic bike differently
-- Identify the total number of rides by the casual riders and members

SELECT 
  TO_CHAR(SUM(CASE WHEN member_casual = 'member' THEN 1 ELSE 0 END), 'FM999,999,999') AS total_members,
  TO_CHAR(SUM(CASE WHEN member_casual = 'casual' THEN 1 ELSE 0 END), 'FM999,999,999') AS total_casual,
  TO_CHAR(COUNT(*), 'FM999,999,999') AS total_rides
FROM cyclistic_data;

--analysis 2: calculate the average/ mean ride duration for each ride type
SELECT 
    member_casual AS rider_type,
    ROUND(AVG(EXTRACT(EPOCH FROM ride_length) / 60), 2) AS avg_ride_length
FROM cyclistic_data
GROUP BY member_casual; --Casual drivers ride longer distance than the members

--analysis 3: Most frequent days of the week
SELECT 
    weekday,  
    TO_CHAR(COUNT(*), 'FM999,999,999') AS total_rides
FROM cyclistic_data
GROUP BY weekday
ORDER BY total_rides DESC;

--The End
--All these are been visulize in Tableau.




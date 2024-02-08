CREATE TABLE watch_history (
  	id SERIAL PRIMARY KEY,
  	Video_Title VARCHAR,
  	Video_URL VARCHAR,
  	Youtuber_Name VARCHAR,
  	Category VARCHAR,
	Time_Watched timestamp
);

COPY watch_history
FROM '/Users/kyle/Downloads/Data/MyYTWrapped/watch-history-tableau.csv'
DELIMITER ','
CSV HEADERx;

*EDA*
--Looking At The Data--
SELECT * FROM watch_history
LIMIT 10

-- Most Watched Videos --
-- adding a watch count column for videos
ALTER TABLE watch_history ADD COLUMN Watched_Count INT 

-- setting the watch count column
WITH Video_Counts AS (
	SELECT Video_URL, COUNT(*) AS Watched_Count 
  	FROM watch_history
  	GROUP BY Video_URL -- group by video URL because it is entirely unique
)
UPDATE watch_history
SET Watched_Count = Video_Counts.Watched_Count
FROM Video_Counts
WHERE watch_history.Video_URL = Video_Counts.Video_URL -- links the two databases

-- showing the Top Most Viewed Videos --
SELECT * INTO temptable
FROM watch_history

ALTER TABLE temptable
DROP COLUMN id

SELECT Video_Title, COUNT(*) AS Total_Watched
FROM watch_history
GROUP BY Video_Title
HAVING COUNT(*) >  1
ORDER BY COUNT(*) DESC;

--Most Watched Creators--
SELECT * 
FROM (
	SELECT Youtuber_Name, COUNT(*) as Creator_Watched_Count -- Watched_Count is only for videos
	FROM watch_history
	-- WHERE Creator_Watched_Count > 1 doesn't work (using COUNT(), which isn't meaningful until GROUP BY)
	GROUP BY Youtuber_Name
) AS Top_Creators
WHERE Creator_Watched_Count > 1
ORDER BY Creator_Watched_Count DESC
LIMIT 5

--Most Watched Categories--
SELECT * 
FROM (
	SELECT Category, COUNT(*) as Category_Watched_Count
	FROM watch_history
	GROUP BY Category
) AS Top_Categories
WHERE Category_Watched_Count > 1
ORDER BY Category_Watched_Count DESC



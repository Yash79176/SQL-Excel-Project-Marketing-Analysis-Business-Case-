USE PortfolioProject_MarketingAnalytics
SELECT * FROM dbo.customer_journey

--- Customer Table Expression (CTE) to identify and tag duplicate records
WITH DuplicateRecords AS(
	SELECT JourneyID, CustomerID, ProductID, VisitDate, Stage, Action, Duration,
		   ROW_NUMBER() OVER(
				PARTITION BY CustomerID, ProductID, VisitDate, Stage, Action
				ORDER BY JourneyID
				) AS row_num
	FROM dbo.customer_journey
	)
	--- Select all records from the CTE where row_num > 1, which indicated duplicate entries
SELECT * FROM DuplicateRecords
WHERE row_num > 1
ORDER BY JourneyID

--- Outer query selects the final cleaned and standardized data
SELECT JourneyID, CustomerID, ProductID, VisitDate, Stage, Action,
		COALESCE(Duration, avg_duration) AS Duration
FROM
(
		SELECT  
				JourneyID, CustomerID, ProductID, VisitDate, 
				UPPER(Stage) AS Stage,
				Action,
				Duration,
				AVG(Duration) OVER (PARTITION BY VisitDate) AS avg_duration, --- Calculates the avg duration for each date
				ROW_NUMBER() OVER(
				PARTITION BY CustomerID, ProductID, VisitDate, UPPER(Stage), Action --- Groups by these columns to identify duplicates
				---PARTITION BY CustomerID, ProductID
				ORDER BY JourneyID
				) AS row_num			--- Assigns a row number to each row within a partition to identify duplicates
		FROM dbo.customer_journey
		) AS subquery
		WHERE row_num = 1;

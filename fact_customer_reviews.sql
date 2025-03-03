USE PortfolioProject_MarketingAnalytics

SELECT * FROM dbo.customer_reviews

--- Query to clea  whitespace issues in the ReviewText Column
SELECT ReviewID, CustomerID, ProductID, ReviewDate, Rating, 
	REPLACE(ReviewText,'  ',' ') AS ReviewText

FROM dbo.customer_reviews
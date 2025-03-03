--- SQL Project to conduct a detailed analysis and identify area of improvements 
--- of a Company in their Marketing strategies
--- Key Points: Reduced Customer Engagement, Decreased Conversion Rates, 
---				High Marketing Expenses, Need for Customer Feedback Analysis

USE PortfolioProject_MarketingAnalytics

SELECT * FROM dbo.products

--- Query to Categorize products based on their price
SELECT ProductID,  --- Selects the unique identifier for each products
	   ProductName,
	   Price,		--- Selects the price for each product category

	CASE
		WHEN Price < 50 THEN 'Low'
		WHEN Price BETWEEN 50 AND 200 THEN 'Medium'
		ELSE 'High'
	END PriceCategory
FROM dbo.products;

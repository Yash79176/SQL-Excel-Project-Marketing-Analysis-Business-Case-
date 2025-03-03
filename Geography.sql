USE PortfolioProject_MarketingAnalytics

SELECT * FROM dbo.customers

SELECT * FROM dbo.geography

--- **********************************************************************************
--- SQL statement to Join dim_customers with dim_Geography to enrich Customer data with geographic Information

SELECT 
	cus.CustomerName, cus.Email, cus.Gender, cus.Age,
	geo.Country, geo.City
	FROM dbo.customers cus
	JOIN dbo.geography geo
	ON cus.GeographyID = geo.GeographyID

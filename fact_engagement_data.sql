USE PortfolioProject_MarketingAnalytics

SELECT * FROM dbo.engagement_data

--- Query to clean and normalize the engagement_data table

SELECT EngagementID, ContentID, CampaignID, ProductID,
	   UPPER(REPLACE(ContentType,'Socialmedia','Social Media')) AS ContentType,
	   LEFT(VIewsClicksCombined, CHARINDEX('-', ViewsClicksCombined) - 1) AS Views,
	   RIGHT(VIewsClicksCombined, LEN(ViewsClicksCombined) - CHARINDEX('-', ViewsClicksCombined)) AS Clicks,
	   Likes,
	   FORMAT(CONVERT(DATE, EngagementDate),'dd.mm.yyyy') AS EngagementDate

FROM dbo.engagement_data
WHERE contentType != 'Newsletter';
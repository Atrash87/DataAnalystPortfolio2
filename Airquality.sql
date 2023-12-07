
--Total days with air quality index "AQI"
SELECT
    Year,
    SUM(Dys_w_AQI) AS Total_Days_with_AQI,
    AVG(Max_AQI) AS Average_Max_AQI
FROM
    dbo.['AQI By State 1980-2022$']  
GROUP BY
    Year
ORDER BY
    Year;



-- Air Quality Aggregated Metrics by Year
SELECT
    Year,
    SUM(Dys_w_AQI) AS Total_Days_with_AQI,
    SUM(Good_Days) AS Total_Good_Days,
    SUM(Moderate_Days) AS Total_Moderate_Days,
    SUM(Unhealthy_for_Sensitive_Groups_Days) AS Total_Unhealthy_Sensitive_Days,
    SUM(Unhealthy_Days) AS Total_Unhealthy_Days,
    SUM(Very_Unhealthy_Days) AS Total_Very_Unhealthy_Days,
    SUM(Hazardous_Days) AS Total_Hazardous_Days,
    
  CAST((SUM(Dys_Blw_Thr) / SUM(Dys_w_AQI)) * 100 AS DECIMAL(10,2)) AS Percentage_Days_Below_Threshold,
    CAST((SUM(Dys_Abv_Thr) / SUM(Dys_w_AQI)) * 100 AS DECIMAL(10,2)) AS Percentage_Days_Above_Threshold
FROM
    dbo.['AQI By State 1980-2022$']
GROUP BY
    Year
	order by
	year desc;


	-- Air Quality Aggregated Metrics by Year
SELECT
    COUNT(DISTINCT Year) AS Total_Years,
    SUM(Good_Days) AS Total_Good_Days,
    SUM(Moderate_Days) AS Total_Moderate_Days,
    SUM(Unhealthy_Days) AS Total_Unhealthy_Days,
    SUM(Very_Unhealthy_Days) AS Total_Very_Unhealthy_Days,
    SUM(Hazardous_Days) AS Total_Hazardous_Days,
    CASE WHEN SUM(Dys_w_AQI) > 0 THEN CAST((SUM(Dys_Blw_Thr) / SUM(Dys_w_AQI)) * 100 AS DECIMAL(10,2)) ELSE NULL END AS Percentage_Days_Below_Threshold,
    CASE WHEN SUM(Dys_w_AQI) > 0 THEN CAST((SUM(Dys_Abv_Thr) / SUM(Dys_w_AQI)) * 100 AS DECIMAL(10,2)) ELSE NULL END AS Percentage_Days_Above_Threshold

FROM
    dbo.['AQI By State 1980-2022$'];

	--trends in air quality over the years,

	SELECT
    Year,
    cast (avg(Max_AQI) as decimal (10,2)) AS Average_AQI
FROM
    dbo.['AQI By State 1980-2022$']
GROUP BY
    Year
ORDER BY
    Year;

	--comparison of air quality metrics between different states
	SELECT
    State,
    cast(AVG(Max_AQI) as decimal(10,2)) AS Average_AQI,
    SUM(Good_Days) AS Total_Good_Days,
    SUM(Moderate_Days) AS Total_Moderate_Days,
    SUM(Unhealthy_for_Sensitive_Groups_Days) AS Total_Unhealthy_Sensitive_Days,
    SUM(Unhealthy_Days) AS Total_Unhealthy_Days,
    SUM(Very_Unhealthy_Days) AS Total_Very_Unhealthy_Days,
    SUM(Hazardous_Days) AS Total_Hazardous_Days
FROM
    dbo.['AQI By State 1980-2022$']
GROUP BY
    State
ORDER BY
    Average_AQI DESC; 

	-- Comparin total healthy vs total unhealthy days in each state
	SELECT
    State,
    cast(AVG(Max_AQI) as decimal(10,2)) AS Average_AQI,
    SUM(Good_Days) AS Total_Good_Days,
    SUM(Moderate_Days) AS Total_Moderate_Days,
    SUM(Unhealthy_for_Sensitive_Groups_Days) AS Total_Unhealthy_Sensitive_Days,
    SUM(Unhealthy_Days) AS Total_Unhealthy_Days,
    SUM(Very_Unhealthy_Days) AS Total_Very_Unhealthy_Days,
    SUM(Hazardous_Days) AS Total_Hazardous_Days
FROM
    dbo.['AQI By State 1980-2022$']
GROUP BY
    State
ORDER BY
    Average_AQI DESC; 


	--relationship between population estimates and air quality metrics
	
	SELECT
    State,
    cast(AVG(Max_AQI) as decimal (10,2)) AS Average_AQI,
    cast(AVG(Pop_Est) as decimal (10,2)) AS Average_Population
FROM
    dbo.['AQI By State 1980-2022$']
GROUP BY
    State
ORDER BY
    Average_AQI DESC; 



















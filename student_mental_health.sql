SELECT *
FROM mental_health;

-- 1) Mental health breakdown by gender

SELECT
    gender,
    ROUND(100 * SUM(CASE WHEN depression = True THEN 1 ELSE 0 END)/COUNT(*),2) AS depression_rate,
	ROUND(100 * SUM(CASE WHEN anxiety = True THEN 1 ELSE 0 END)/COUNT(*),2) AS anxiety_rate,
	ROUND(100 * SUM(CASE WHEN panic_attack = True THEN 1 ELSE 0 END)/COUNT(*),2) AS panic_rate,
	ROUND(100.0 * SUM(CASE WHEN treatment = true THEN 1 ELSE 0 END)/COUNT(*),2) AS treatment_rate
FROM
    mental_health
GROUP BY
    gender;


--2) Mental health breakdown by year of study
SELECT
    year_of_study,
    ROUND(100.0 * SUM(CASE WHEN depression = True THEN 1 ELSE 0 END)/COUNT(*),2) AS depression_rate,
    ROUND(100.0 * SUM(CASE WHEN anxiety = True THEN 1 ELSE 0 END)/COUNT(*),2) AS anxiety_rate,
    ROUND(100.0 * SUM(CASE WHEN panic_attack = True THEN 1 ELSE 0 END)/COUNT(*),2) AS panic_rate,
	ROUND(100.0 * SUM(CASE WHEN treatment = true THEN 1 ELSE 0 END)/COUNT(*),2) AS treatment_rate
FROM
    mental_health
GROUP BY
    year_of_study
ORDER BY year_of_study ASC;


-- 3)Mental health percetage breakdown by GPA bracket

SELECT
    CASE
        WHEN cgpa < 2 THEN 'Below 2.0'
        WHEN cgpa >= 2 AND cgpa <= 3 THEN '2.0 to 3.0'
        WHEN cgpa > 3 THEN 'Above 3.0'
    END AS cgpa_range,
    ROUND(100.0 * SUM(CASE WHEN depression = true THEN 1 ELSE 0 END) / COUNT(*),2) AS depression_rate,
	ROUND(100.0 * SUM(CASE WHEN anxiety = true THEN 1 ELSE 0 END)/COUNT(*),2) AS anxiety_rate,
	ROUND(100.0 * SUM(CASE WHEN panic_attack = true THEN 1 ELSE 0 END)/COUNT(*),2) AS panic_rate,
	ROUND(100.0 *SUM(CASE WHEN treatment = ' true' THEN 1 ELSE 0 END)/COUNT(*),2) AS treatment_rate
FROM
    mental_health
GROUP BY
    cgpa_range;

-- 4)Mental health breakdown by course taken

SELECT course, 
		ROUND(100.0 * SUM(CASE WHEN depression = 'true' THEN 1 ELSE 0 END)/COUNT(*),2) as depression_rate,
		ROUND(100.0 * SUM(CASE WHEN anxiety = 'true' THEN 1 ELSE 0 END)/COUNT(*),2) AS anxiety_rate,
		ROUND(100.0 * SUM(CASE WHEN panic_attack = 'true' THEN 1 ELSE 0 END)/COUNT(*),2) AS panic_rate,
		ROUND(100.0 * SUM(CASE WHEN treatment = 'true' THEN 1 ELSE 0 END)/COUNT(*),2) AS treatment_rate
FROM mental_health
GROUP BY course
ORDER BY course ASC;



-- 5)Mental health breakdown by marital status
SELECT 
	CASE 
	WHEN marital_status = 'Yes' THEN 'Married'
	WHEN marital_status = 'No' THEN 'Single'
	END AS marital_status, 
	ROUND(100.0 * SUM(CASE WHEN depression = 'true' THEN 1 ELSE 0 END)/COUNT(*),2) as depression_rate,
	ROUND(100.0 * SUM(CASE WHEN anxiety = 'true' THEN 1 ELSE 0 END)/COUNT(*),2) AS anxiety_rate,
	ROUND(100.0 * SUM(CASE WHEN panic_attack = 'true' THEN 1 ELSE 0 END)/COUNT(*),2) AS panic_rate,
	ROUND(100.0 * SUM(CASE WHEN treatment = 'true' THEN 1 ELSE 0 END)/COUNT(*),2) AS treatment_rate
FROM mental_health
GROUP BY marital_status
	

-- 6)Mental health breakdown by age

SELECT 
	age, 
	ROUND(100.0 * SUM(CASE WHEN depression = 'true' THEN 1 ELSE 0 END)/COUNT(*),2) as depression_rate,
	ROUND(100.0 * SUM(CASE WHEN anxiety = 'true' THEN 1 ELSE 0 END)/COUNT(*),2) AS anxiety_rate,
	ROUND(100.0 * SUM(CASE WHEN panic_attack = 'true' THEN 1 ELSE 0 END)/COUNT(*),2) AS panic_rate,
	ROUND(100.0 * SUM(CASE WHEN treatment = 'true' THEN 1 ELSE 0 END)/COUNT(*),2) AS treatment_rate
FROM mental_health
GROUP BY age
ORDER BY age ASC;
	
	

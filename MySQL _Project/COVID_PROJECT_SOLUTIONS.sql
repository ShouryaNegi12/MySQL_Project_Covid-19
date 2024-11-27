USE COVID;
			/* 1. What does the full dataset look like? */
                
SELECT * FROM COVID;

			/* 2. How many records (employees) are in the dataset? */
                
SELECT COUNT(*) AS TOTAL_EMPLOYEES FROM COVID;

			/* 3. What unique sectors are represented in the dataset? */
                
SELECT SECTOR FROM COVID group by SECTOR;

			/* 4. How many employees are in each sector? */
                
SELECT COUNT(SECTOR) FROM COVID group by SECTOR;

			/* 5. How many employees work from home? */
                
SELECT SUM(WORK_FROM_HOME) FROM COVID;

			/* 6. What percentage of employees experienced an increase in work hours? */

SELECT (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM covid)) AS Increased_Work_Hours
FROM covid
WHERE Increased_Work_Hours = 1;

SELECT (COUNT(Increased_Work_Hours) * 100.0 / (SELECT COUNT(Increased_Work_Hours) FROM covid))
FROM covid
WHERE Increased_Work_Hours = 1;

			/* 7. What is the average productivity change for each sector? */

SELECT SECTOR, AVG(PRODUCTIVITY_CHANGE) AS  AVG_CHANGE
FROM COVID
GROUP BY SECTOR 
ORDER BY AVG_CHANGE DESC;

			/* 8. How many employees experienced both increased work hours and health issues? */
                
SELECT COUNT(INCREASED_WORK_HOURS AND HEALTH_ISSUE)
FROM COVID
WHERE INCREASED_WORK_HOURS = 1 AND HEALTH_ISSUE = 1;

			/* 9. Which employees have high-stress levels and a drop in productivity? */
                
SELECT STRESS_LEVEL, PRODUCTIVITY_CHANGE
FROM COVID
WHERE STRESS_LEVEL = 'HIGH' AND PRODUCTIVITY_CHANGE = 0;

			/* 10. How many employees with childcare responsibilities report working from home? */

SELECT WORK_FROM_HOME, COUNT(CHILDCARE_RESPONSIBILITIES)
FROM COVID
WHERE WORK_FROM_HOME = 1 AND CHILDCARE_RESPONSIBILITIES = 1;

			/*  11. What percentage of employees are affected by COVID-19 in each sector? */
            
SELECT SECTOR, (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM COVID)) AS AFFECTED_BY_COVID
FROM COVID
WHERE AFFECTED_BY_COVID = 1
GROUP BY SECTOR;

			/* 12. How does job security vary between employees working from home and those on-site? */
 
SELECT WORK_FROM_HOME, COUNT(JOB_SECURITY)
FROM COVID
WHERE WORK_FROM_HOME = 0 AND JOB_SECURITY = 1;

			/* 13. Which sectors report the highest stress levels among employees with increased work hours? */
            
SELECT SECTOR, STRESS_LEVEL, COUNT(*) AS EMPLOYEE_COUNT
FROM  COVID
WHERE INCREASED_WORK_HOURS = 1
GROUP BY SECTOR, STRESS_LEVEL
ORDER BY STRESS_LEVEL DESC, EMPLOYEE_COUNT DESC;

			/* 14. Is there a trend between productivity change and team collaboration challenges? */
            
SELECT TEAM_COLLABORATION_CHALLENGES, AVG(PRODUCTIVITY_CHANGE) AS AVG_PRODUCTIVITY_CHANG
FROM COVID
GROUP BY TEAM_COLLABORATION_CHALLENGES
ORDER BY TEAM_COLLABORATION_CHALLENGES;

			/* 15. What percentage of employees affected by COVID-19 report high stress? */
            
SELECT ROUND((COUNT(*) * 100.0 / (SELECT COUNT(*) FROM COVID WHERE AFFECTED_BY_COVID = 1)), 2) AS HIGH_STRESS_PERCENTAGE
FROM COVID
WHERE AFFECTED_BY_COVID = 1 AND STRESS_LEVEL = 'HIGH';

			/* 16.  Which sectors face the most significant challenges with technology adaptation? */
            
SELECT SECTOR, AVG(TECHNOLOGY_ADAPTATION) AS AVG_TECH_ADAPTATION
FROM COVID
GROUP BY SECTOR
ORDER BY AVG_TECH_ADAPTATION DESC;

			/* 17.  What is the average number of meetings per day for each sector? */
            
SELECT SECTOR, AVG(CAST(MEETINGS_PER_DAY AS DECIMAL(10, 2))) AS AVG_MEETINGS_PER_DAY
FROM COVID
GROUP BY SECTOR
ORDER BY AVG_MEETINGS_PER_DAY DESC;

			/* 18.  How does the presence of childcare responsibilities impact productivity? */
            
SELECT CHILDCARE_RESPONSIBILITIES, AVG(PRODUCTIVITY_CHANGE) AS AVG_PRODUCTIVITY_CHANGE
FROM COVID
GROUP BY CHILDCARE_RESPONSIBILITIES;

			/* 19. Do employees with high-stress levels report more health issues? */

SELECT STRESS_LEVEL, AVG(HEALTH_ISSUE) AS AVG_HEALTH_ISSUES
FROM COVID
GROUP BY STRESS_LEVEL
ORDER BY AVG_HEALTH_ISSUES DESC;

			/* 20. What is the correlation between work-from-home status and changes in salary? */

SELECT WORK_FROM_HOME, AVG(SALARY_CHANGES) AS AVG_SALARY_CHANGES
FROM COVID
GROUP BY WORK_FROM_HOME;

			/* 21. How does the change in commuting time affect employees’ stress levels? */
            
SELECT STRESS_LEVEL, AVG(COMMUTING_CHANGES) AS AVG_COMMUTING_CHANGES
FROM  COVID
GROUP BY STRESS_LEVEL
ORDER BY AVG_COMMUTING_CHANGES DESC;

			/* 22. What is the average productivity change for employees with team collaboration challenges? */
            
SELECT TEAM_COLLABORATION_CHALLENGES, AVG(PRODUCTIVITY_CHANGE) AS AVG_PRODUCTIVITY_CHANGE
FROM COVID
GROUP BY TEAM_COLLABORATION_CHALLENGES
ORDER BY AVG_PRODUCTIVITY_CHANGE DESC;

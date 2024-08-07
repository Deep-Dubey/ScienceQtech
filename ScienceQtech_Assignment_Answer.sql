CREATE DATABASE employee;
use employee;

/*
Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, and DEPARTMENT from the employee record table, and make a list of employees and details of their department.
*/
SELECT 
    EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT
FROM
    employee.emp_record_table;

/*
4.	Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPARTMENT, and EMP_RATING if the EMP_RATING is: 
●	less than two
●	greater than four 
●	between two and four
*/
SELECT 
    EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING
FROM
    employee.emp_record_table
WHERE
    EMP_RATING < 2;


SELECT 
    EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING
FROM
    employee.emp_record_table
WHERE
    EMP_RATING > 4;


SELECT 
    EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING
FROM
    employee.emp_record_table
WHERE
    EMP_RATING BETWEEN 2 AND 4;
    
/* 
Write a query to concatenate the FIRST_NAME and the LAST_NAME of employees in the Finance department from the employee table and then give the resultant column alias as NAME.
*/
SELECT 
    CONCAT(FIRST_NAME, ' ', LAST_NAME) AS NAME
FROM
    emp_record_table;
/*
Write a query to list only those employees who have someone reporting to them. Also, show the number of reporters (including the President).
*/
SELECT 
    E.EMP_ID,
    E.FIRST_NAME,
    E.LAST_NAME,
    E.ROLE,
    E.DEPT,
    E.COUNTRY,
    COUNT(*) AS NUM_REPORTERS
FROM
    emp_record_table E
        JOIN
    emp_record_table R ON E.EMP_ID = R.MANAGER_ID
GROUP BY E.EMP_ID , E.FIRST_NAME , E.LAST_NAME , E.ROLE , E.DEPT , E.COUNTRY
ORDER BY NUM_REPORTERS DESC;

/*
Write a query to list down all the employees from the healthcare and finance departments using union. Take data from the employee record table.
*/
SELECT 
    EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPT, COUNTRY
FROM
    emp_record_table
WHERE
    DEPT = 'HEALTHCARE' 
UNION SELECT 
    EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPT, COUNTRY
FROM
    emp_record_table
WHERE
    DEPT = 'FINANCE';

/*
Write a query to list down employee details such as EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPARTMENT, and EMP_RATING grouped by dept. Also include the respective employee rating along with the max emp rating for the department.
*/
SELECT 
    EMP_ID,
    FIRST_NAME,
    LAST_NAME,
    ROLE,
    DEPT,
    EMP_RATING,
    MAX(EMP_RATING) AS MAX_RATING
FROM
    emp_record_table
GROUP BY EMP_ID , FIRST_NAME , LAST_NAME , ROLE , DEPT , EMP_RATING;

/*
Write a query to calculate the minimum and the maximum salary of the employees in each role. Take data from the employee record table.
*/
SELECT 
    ROLE, MIN(SALARY) AS MIN_SALARY, MAX(SALARY) AS MAX_SALARY
FROM
    emp_record_table
GROUP BY ROLE;

/*
Write a query to assign ranks to each employee based on their experience. Take data from the employee record table.
*/
SELECT 
    EMP_ID,
    FIRST_NAME,
    LAST_NAME,
    ROLE,
    DEPT,
    EXP,
    RANK() OVER(ORDER BY EXP DESC) AS EXPERIENCE_RANK
FROM 
    emp_record_table;

/*
Write a query to create a view that displays employees in various countries whose salary is more than six thousand. Take data from the employee record table.
*/
CREATE VIEW high_salary_employees_view AS
    SELECT 
        EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPT, COUNTRY, SALARY
    FROM
        emp_record_table
    WHERE
        SALARY > 6000;

/*
Write a nested query to find employees with experience of more than ten years. Take data from the employee record table.
*/
SELECT 
    EMP_ID,
    FIRST_NAME,
    LAST_NAME,
    ROLE,
    DEPT,
    EXP
FROM 
    emp_record_table
WHERE 
    EXP > (
        SELECT 10
    );

/*
Write a query to create a stored procedure to retrieve the details of the employees whose experience is more than three years. Take data from the employee record table.
*/
DROP PROCEDURE IF EXISTS get_exp_emp;
DELIMITER &&
CREATE PROCEDURE get_exp_emp()
BEGIN 
	SELECT * FROM emp_record_table WHERE EXP > 3 ORDER BY EXP;
END &&
DELIMITER ;

CALL get_exp_emp();

/*
Write a query using stored functions in the project table to check whether the job profile assigned to each employee in the data science team matches the organization’s set standard.
The standard being:
For an employee with experience less than or equal to 2 years assign 'JUNIOR DATA SCIENTIST',
For an employee with the experience of 2 to 5 years assign 'ASSOCIATE DATA SCIENTIST',
For an employee with the experience of 5 to 10 years assign 'SENIOR DATA SCIENTIST',
For an employee with the experience of 10 to 12 years assign 'LEAD DATA SCIENTIST',
For an employee with the experience of 12 to 16 years assign 'MANAGER'.
*/
SELECT 
    EMP_ID,
    FIRST_NAME,
    LAST_NAME,
    EXP,
    CASE
        WHEN EXP <= 2 THEN 'JUNIOR DATA SCIENTIST'
        WHEN EXP > 2 AND EXP <= 5 THEN 'ASSOCIATE DATA SCIENTIST'
        WHEN EXP > 5 AND EXP <= 10 THEN 'SENIOR DATA SCIENTIST'
        WHEN EXP > 10 AND EXP <= 12 THEN 'LEAD DATA SCIENTIST'
        WHEN EXP > 12 AND EXP <= 16 THEN 'MANAGER'
        ELSE 'Not specified'
    END AS JOB_PROFILE
FROM 
    emp_record_table
WHERE 
    ROLE LIKE '%DATA SCIENTIST%';

/*
Create an index to improve the cost and performance of the query to find the employee whose FIRST_NAME is ‘Eric’ in the employee table after checking the execution plan.
*/
CREATE INDEX idx_first_name ON emp_record_table (FIRST_NAME);
SELECT 
    EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPT, EXP
FROM
    emp_record_table
WHERE
    FIRST_NAME = 'Eric';

/*
Write a query to calculate the bonus for all the employees, based on their ratings and salaries (Use the formula: 5% of salary * employee rating).
*/
SELECT 
    EMP_ID,
    FIRST_NAME,
    LAST_NAME,
    SALARY,
    EMP_RATING,
    ROUND(0.05 * SALARY * EMP_RATING) AS BONUS
FROM
    emp_record_table;

/*
Write a query to calculate the average salary distribution based on the continent and country. Take data from the employee record table.
*/
SELECT 
    CONTINENT, COUNTRY, AVG(SALARY) AS AVERAGE_SALARY
FROM
    emp_record_table
GROUP BY CONTINENT , COUNTRY
ORDER BY CONTINENT , COUNTRY;

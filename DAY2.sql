-- QUESTION1
SELECT FIRSTNAME,LASTNAME,DEPARTMENT_ID FROM employees;

-- QUE 2
SELECT DEPARTMENT_ID,LOCATION_ID FROM DEPARTMENTS
 WHERE DEPARTMENT_ID=30;
 
 -- QUE 3
 SELECT FIRSTNAME,LASTNAME,DEPARTMENT_ID FROM employees
WHERE COMMISSION_PCT between 0.1 AND 1;

-- QUE 4
SELECT FIRSTNAME,LASTNAME,DEPARTMENT_ID FROM employees
WHERE LASTNAME LIKE '%a';

-- QUE 5
SELECT E.EMPLOYEE_ID,E.LASTNAME,E.DEPARTMENT_ID FROM EMPLOYEES E
CROSS JOIN LOCATIONS L 
WHERE L.CITY='TORONTO';

-- que 6
SELECT LASTNAME AS EMP ,
	   EMPLOYEE_ID AS 'EMP#',
       MANAGER_ID AS 'MANAGER#' 
 FROM employees;
 
 -- QUE 7
 SELECT * FROM employees
ORDER BY EMPLOYEE_ID;

-- QUE 8
SELECT D.DEPARTMENT_ID, E.LASTNAME
FROM EMPLOYEES E
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID ;

-- QUE 9
SELECT 
    CONCAT(e.firstname ," ",e.lastname) AS "Employee Name",
    j.job_title AS "Job",
    d.department_name AS "Department Name",
    e.salary AS "Salary",
    jg.grade AS "Grade"
FROM 
    employees e
JOIN 
    jobs j ON e.job_id = j.job_id
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    job_grades jg ON e.salary BETWEEN jg.lowest_sal AND jg.highest_sal;

-- QUE 10

-- QUE 11
SELECT CONCAT(FIRSTNAME ,"  ",LASTNAME) AS "EMPLOYEE NAME",
HIRE_DATE ,MANAGER_ID FROM EMPLOYEES;

-- QUE 12
SELECT 
    MAX(MAX_salary) AS "Maximum",
    MIN(MIN_salary) AS "Minimum",
    SUM(MIN_salary + MAX_salary ) AS "Sum",
    AVG(MIN_SALARY),
    AVG(MAX_SALARY)
FROM JOBS;

-- QUE 13
SELECT 
    MAX(salary) AS "Maximum",
    MIN(salary) AS "Minimum",
    SUM(SALARY ) AS "Sum",
    AVG(ALARY)
FROM employees
GROUP BY EMPLOYEE_ID;

-- QUE 14
SELECT job_id,COUNT(*) AS "Number of People"
FROM JOBS
GROUP BY job_id;

-- QUE 15
SELECT 
COUNT(DISTINCT manager_id) AS "Number of Managers"
FROM employees;

-- QUE 16
SELECT 
    (SELECT MAX(MAX_salary) FROM JOBS) - (SELECT MIN(MIN_salary) FROM JOBs) AS "Difference";

-- QUE 17
SELECT 
    manager_id AS "Manager Number",
    MIN(salary) AS "Lowest Salary"
FROM employees 
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING MIN(salary) >= 6000
ORDER BY "Lowest Salary" DESC;

-- QUE 18
SELECT 
    d.department_name AS "Name",
    l.city AS "Location",
    COUNT(e.employee_id) AS "No. of People",
    ROUND(AVG(e.salary), 0) AS "Salary"
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
GROUP BY d.department_name, l.city;

-- QUE 19
SELECT lastname, hire_date
FROM employees
WHERE department_id = (
    SELECT department_id
    FROM employees
    WHERE lastname = 'Zlotkey'
) AND lastname != 'Zlotkey';

-- QUE 20
SELECT employee_id,lastname
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
ORDER BY salary ASC;

-- QUE 21
SELECT employee_id, lastname
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM employees
    WHERE lastname LIKE '%u'
)
ORDER BY employee_id;

-- QUE 22
SELECT e.lastname, d.department_id, e.job_id, l.location_id
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE l.location_id = 1700;

-- QUE 23
SELECT e.lastname, e.salary
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
WHERE m.lastname = 'King';

-- QUE 24
SELECT 
    d.department_id,
    e.lastname,
    e.job_id
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name = 'Executive';

-- QUE 25
SELECT employee_id,lastname,salary
FROM employees
WHERE 
    salary > (SELECT AVG(salary) FROM employees) 
    AND department_id IN (
        SELECT department_id FROM employees WHERE lastname LIKE '%u%' 
    );

-- QUE 26
SELECT DISTINCT department_id
FROM employees;

-- QUE 27
SELECT *FROM employees
ORDER BY firstname DESC;

-- QUE 28
SELECT 
    CONCAT(firstname,"  ",lastname) AS "EMP_NAME",salary,
    salary * 0.15 AS PF
FROM employees;

-- QUE 29
SELECT 
    employee_id,firstname,lastname,salary
FROM Employees
ORDER BY salary ASC;

-- QUE 30
SELECT SUM(salary) AS total_salaries_payable
FROM employees;

-- QUE 31
SELECT MIN(salary),
MAX(SALARY)
FROM employees;

-- QUE 32
SELECT ROUND(AVG(salary),2),
COUNT(EMPLOYEE_ID) AS "NO OF EMP"
FROM employees;

-- QUE 33
SELECT COUNT(*) AS total_employees
FROM employees;

-- QUE 34
SELECT COUNT(DISTINCT job_id) AS total_jobs_available
FROM employees;

-- QUE 35
SELECT UPPER(firstname) AS FIRSTNAME
FROM employees;

-- QUE 36
SELECT LEFT(firstname, 3) AS FIRSTNAME
FROM employees;

-- QUE 37
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees;

-- QUE 38
SELECT TRIM(firstname) AS FIRSTNAME
FROM employees;

-- QUE 39
SELECT 
    LENGTH(firstname) AS firstname_length,
    LENGTH(lastName) AS lastname_length
FROM employees;

-- QUE 40
SELECT FIRSTNAME
FROM employees
WHERE firstname REGEXP '[0-9]';

-- QUE 41
SELECT *
FROM EMPLOYEES LIMIT 10;
 
 -- QUE 42
 SELECT 
    employee_id,firstname,lastname,
    ROUND(salary / 12, 2) AS monthly_salary
FROM employees;

-- QUE 43
SELECT firstname,lastName,salary
FROM employees
WHERE salary NOT BETWEEN 10000 AND 15000;

-- QUE 44
SELECT firstname,lastname,department_id
FROM employees
WHERE department_id IN (30, 100)
ORDER BY department_id ASC;

-- que 45
SELECT firstname,lastname,department_id,SALARY
FROM employees
WHERE department_id IN (30, 100)
AND SALARY NOT BETWEEN 10000 AND 15000 
ORDER BY department_id ASC;

-- QUE 46
SELECT firstname,lastname,hire_date
FROM employees
WHERE YEAR(hire_date) = 1987;

-- que 47
SELECT firstname
FROM employees
WHERE firstname LIKE '%b%' AND firstname LIKE '%c%';

-- que 48
SELECT lastname,job_id,salary
FROM employees
WHERE 
    job_id IN ('Programmer', 'Shipping Clerk')
    AND salary NOT IN (4500, 10000, 15000);

-- que 49
SELECT lastname
FROM employees
WHERE LENGTH(lastname) = 6;

-- QUE   50
SELECT lastname
FROM employees
WHERE SUBSTRING(lastname, 3, 1) = 'e';
-- ORR
SELECT lastname
FROM employees
WHERE lastname like '__e%';

-- QUE 51
SELECT DISTINCT job_id
FROM employees;

-- QUE 52
SELECT firstname,lastname,salary,
       salary * 0.15 AS PF
FROM employees;

-- QUE 53
SELECT *FROM employees
WHERE lastname IN ('BLAKE', 'SCOTT', 'KING', 'FORD');

-- QUE 54
SELECT COUNT(DISTINCT job_id) AS no_of_job
FROM employees;

-- que 55
SELECT SUM(salary) AS total_salaries_payable
FROM employees;

-- que 56
SELECT MIN(salary) AS min_salary
FROM employees;

-- que 57
SELECT MAX(salary) AS max_salary
FROM employees
WHERE job_id = 'Programmer';

-- que 58
SELECT 
    AVG(salary) AS avg_salary,
    COUNT(*) AS num_employees
FROM employees
WHERE department_id = 90;

-- que 59
SELECT 
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary,
    SUM(salary) AS total_salary,
    AVG(salary) AS average_salary
FROM employees;

-- que 60
SELECT job_id,
       COUNT(*) AS num_employees
FROM employees
GROUP BY job_id;

-- que 61
SELECT MAX(salary) - MIN(salary) AS salary_difference
FROM employees;

-- que 62
SELECT manager_id,
       MIN(salary) AS lowest_salary
FROM employees
GROUP BY manager_id
order by lowest_salary;

-- que 63
SELECT department_id,
    SUM(salary) AS total_salary
FROM employees
GROUP BY department_id;

-- que 64
SELECT job_id,
	   AVG(salary) AS average_salary
FROM employees
WHERE job_id != 'Programmer'
GROUP BY job_id;

-- que 65
SELECT job_id,
    SUM(salary) AS total_salary,
    MAX(salary) AS max_salary,
    MIN(salary) AS min_salary,
    AVG(salary) AS avg_salary
FROM employees
WHERE department_id = 90
GROUP BY job_id;

-- que 66
SELECT job_id,
    MAX(salary) AS max_salary
FROM employees
GROUP BY job_id
HAVING MAX(salary) >= 4000
order by max_salary;

-- que 67
SELECT department_id,
       round(AVG(salary),2) AS average_salary
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 10;

-- que 68
SELECT firstname,lastname,salary
FROM employees
WHERE salary > (SELECT salary FROM employees WHERE lastname = 'Bull');

-- que 69
SELECT e.firstname,e.lastname
FROM employees e 
JOIN departments d 
ON e.department_id = d.department_id
WHERE d.department_name = 'IT';

-- QUE 70
SELECT e.firstname,e.lastname
FROM employees e cross join countries c
WHERE e.manager_id IS NOT NULL
      AND e.department_id IN (SELECT department_id FROM employees WHERE country_id = 'US');

-- que 71
SELECT e.firstname,e.lastname
FROM employees e
JOIN employees m ON e.employee_id = m.manager_id;

-- que 72
SELECT firstname,lastname,salary
FROM employees
WHERE  salary > (SELECT AVG(salary) FROM employees);

-- que 73
SELECT e.firstname,e.lastname,e.salary
FROM employees e
JOIN job_grades j ON e.salary = j.lowest_sal
WHERE e.job_id = j.grade;

-- que 74
SELECT e.firstname,e.lastname,e.salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.salary > (SELECT AVG(salary) FROM employees) 
      AND d.department_name = 'IT';

-- que 75
SELECT firstname,lastname,salary
FROM employees
WHERE salary > (SELECT salary FROM employees WHERE lastname = 'Bell');

-- que 76
SELECT firstname,lastname,salary
FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);

-- que 77
SELECT firstname,lastname,salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- que 78
SELECT firstname,lastname,salary,job_id
FROM employees
WHERE salary > (SELECT MAX(salary) FROM employees WHERE job_id = 'SH_CLERK')
ORDER BY salary ASC;

-- que 79
SELECT firstname,lastname
FROM employees
WHERE manager_id IS NULL; -- Assuming employees without a manager are supervisors

-- que 80
SELECT e.employee_id,e.firstname,e.lastname,d.departmentname
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

-- QUE 81
SELECT EMPLOYEE_ID, FIRSTNAME, LASTNAME, SALARY
FROM employees
WHERE SALARY > (
    SELECT ROUND(AVG(SALARY), 2)
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID = employees.DEPARTMENT_ID
);

-- QUE 82
SELECT *
FROM employees
WHERE employee_id % 2 = 0;

-- QUE 83
SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 4;

-- QUE 84
SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 3;

-- QUE 85
SELECT *
FROM EMPLOYEES
ORDER BY EMPLOYEE_id DESC
LIMIT 10;

-- QUE 86
SELECT salary
FROM employees
ORDER BY salary DESC
LIMIT 3;

-- que 87
SELECT salary
FROM employees
ORDER BY salary ASC
LIMIT 3;

-- que 88
SELECT salary
FROM employees
ORDER BY salary DESC
LIMIT 1 ;

-- que 89
SELECT 
    d.department_id,
    l.location_id,
    l.street_address,
    l.city,
    l.state_province,
    c.country_name
FROM departments d
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id;

-- que 90
SELECT firstname,lastname,department_id,department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

-- que 91
SELECT e.firstname,
    e.lastname,
    e.job_id,
    e.department_id,
    d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE l.city = 'London';

-- que 92
SELECT 
    e1.employee_id,
    e1.last_name,
    e1.manager_id,
    e2.last_name AS manager_last_name
FROM employees e1
LEFT JOIN employees e2 ON e1.manager_id = e2.employee_id;

-- que 93
SELECT firstname,lastname,hire_date
FROM employees
WHERE hire_date > (SELECT hire_date FROM employees WHERE last_name = 'Jones')
ORDER BY hire_date;

-- que 94
SELECT 
    employee_id,
    job_id,
    DATEDIFF(end_date, start_date) AS days_between
FROM job_history
WHERE department_id = 90;

-- que 95
SELECT 
    Department_id,
    department_name,
    firstname AS manager_first_name
FROM departments d
JOIN employees e ON d.manager_id = e.employee_id;

-- que 96
SELECT 
    d.department_name,
    e.firstname AS manager_first_name,
    e.lastname AS manager_last_name,
    l.city
FROM departments d
JOIN employees e ON d.manager_id = e.employee_id
JOIN locations l ON d.location_id = l.location_id;

-- que 97
SELECT job_title,
    AVG(salary) AS average_salary
FROM employees
JOIN jobs ON employees.job_id = jobs.job_id
GROUP BY job_title;

-- qe 98
SELECT jobs.job_title,
    CONCAT(employees.first_name, ' ', employees.last_name) AS employee_name,
    employees.salary - jobs.min_salary AS salary_difference
FROM employees
JOIN jobs ON employees.job_id = jobs.job_id;

-- que 99
SELECT 
    jobs.job_title,
    CONCAT(employees.firstname, ' ', employees.lastname) AS employee_name,
    employees.salary - jobs.min_salary AS salary_difference
FROM employees
JOIN jobs ON employees.job_id = jobs.job_id;

-- que 100
SELECT 
    job_history.employee_id,
    job_history.start_date,
    job_history.end_date,
    jobs.job_title
FROM job_history
JOIN employees ON job_history.employee_id = employees.employee_id
JOIN jobs ON employees.job_id = jobs.job_id
WHERE employees.salary > 10000;

-- que 101
SELECT d.department_name,
    CONCAT(e.firstname, ' ', e.lastname) AS manager_name,
    e.hire_date,
    e.salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE 
    e.employee_id IN (SELECT manager_id FROM employees WHERE hire_date < NOW() - INTERVAL 15 YEAR);

-- que 102
SELECT firstname,hire_date
FROM employees
WHERE hire_date BETWEEN '1987-06-01' AND '1987-07-30';

-- que 103
SELECT firstname,lastname
FROM employees
WHERE MONTH(hire_date) = 6;

-- que 104
SELECT YEAR(hire_date) AS joining_year
FROM employees
GROUP BY joining_year
HAVING COUNT(*) > 10;

-- que 105
SELECT firstname
FROM employees
WHERE YEAR(hire_date) = 1987;

-- que 106
SELECT d.department_name,
    CONCAT(e.firstname, ' ', e.lastname) AS manager_name,
    e.salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.employee_id IN (SELECT manager_id FROM employees WHERE  hire_date < NOW() - INTERVAL 5 YEAR);

-- que 107
SELECT 
    employee_id,
    lastname,
    MIN(start_date) AS first_salary_date
FROM job_history
GROUP BY employee_id, last_name;

-- que 108
SELECT firstname,hire_date,
    DATEDIFF(NOW(), hire_date) AS experience_days
FROM employees;

-- que 109
SELECT 
    department_id,
    YEAR(hire_date) AS joining_year,
    COUNT(*) AS number_of_employees
FROM employees
GROUP BY department_id, joining_year;

-- que 110
SELECT job_id,employee_id
FROM employees;

-- que 111
UPDATE employees
SET phone_number = REPLACE(phone_number, '124', '999')
WHERE phone_number LIKE '%124%';

-- que 112
SELECT * FROM employees
WHERE LENGTH(first_name) >= 8;

-- que 113
SELECT 
    LPAD(MAX(salary), 10, '0') AS max_salary_with_zeros,
    LPAD(MIN(salary), 10, '0') AS min_salary_with_zeros
FROM employees;

-- que 114
UPDATE employees
SET email = CONCAT(email, '@example.com');

-- que 115
SELECT 
    employee_id,
    first_name,
    MONTH(hire_date) AS hire_month
FROM employees;

-- que 116
SELECT employee_id,
LEFT(email, LENGTH(email) - 3) AS truncated_email
FROM employees;

-- que 117
SELECT * FROM employees
WHERE BINARY first_name = UPPER(first_name);

-- que 118
SELECT RIGHT(phone_number, 4) AS last_four_digits
FROM employees;


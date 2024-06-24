--List the employee number, last name, first name, sex, and salary of each employee
SELECT
	E.EMP_NO,
	E.LAST_NAME,
	E.FIRST_NAME,
	E.SEX,
	S.SALARY
FROM
	EMPLOYEES E
	JOIN SALARIES S ON S.EMP_NO = E.EMP_NO;

--List the first name, last name, and hire date for the employees who were hired in 1986
SELECT
	FIRST_NAME,
	LAST_NAME,
	HIRE_DATE
FROM
	EMPLOYEES
WHERE
	HIRE_DATE BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY
	HIRE_DATE,
	LAST_NAME,
	FIRST_NAME;

--List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT
	DM.EMP_NO AS MANAGER_NO,
	D.DEPT_NO,
	D.DEPT_NAME,
	E.EMP_NO,
	E.LAST_NAME,
	E.FIRST_NAME
FROM
	DEPT_MANAGER DM
	JOIN DEPARTMENTS D ON D.DEPT_NO = DM.DEPT_NO
	JOIN EMPLOYEES E ON E.EMP_NO = DM.EMP_NO;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT
	D.DEPT_NO,
	E.EMP_NO,
	E.LAST_NAME,
	E.FIRST_NAME,
	D.DEPT_NAME
FROM
	EMPLOYEES E
	JOIN DEPT_EMP DE ON DE.EMP_NO = E.EMP_NO
	JOIN DEPARTMENTS D ON D.DEPT_NO = DE.DEPT_NO;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT
	FIRST_NAME,
	LAST_NAME,
	SEX
FROM
	EMPLOYEES
WHERE
	FIRST_NAME = 'Hercules'
	AND LAST_NAME LIKE 'B%'
ORDER BY
	LAST_NAME;

--List each employee in the Sales department, including their employee number, last name, and first name
SELECT
	E.EMP_NO,
	E.LAST_NAME,
	E.FIRST_NAME
FROM
	EMPLOYEES E
	JOIN DEPT_EMP DE ON DE.EMP_NO = E.EMP_NO
	JOIN DEPARTMENTS D ON D.DEPT_NO = DE.DEPT_NO
WHERE
	D.DEPT_NAME = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT
	E.EMP_NO,
	E.LAST_NAME,
	E.FIRST_NAME,
	D.DEPT_NAME
FROM
	EMPLOYEES E
	JOIN DEPT_EMP DE ON DE.EMP_NO = E.EMP_NO
	JOIN DEPARTMENTS D ON D.DEPT_NO = DE.DEPT_NO
WHERE
	D.DEPT_NAME = 'Sales'
	OR D.DEPT_NAME = 'Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT
	LAST_NAME,
	COUNT(LAST_NAME) AS LAST_NAME_COUNT
FROM
	EMPLOYEES
GROUP BY
	LAST_NAME
ORDER BY
	LAST_NAME_COUNT DESC;
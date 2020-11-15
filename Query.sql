/*List the following details of each employee:
employee number, last name, first name, gender, and salary.*/
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees e
JOIN salaries s
ON e.emp_no = s.emp_no;

--List employees who were hired in 1986.
SELECT *
FROM employees
WHERE EXTRACT(year from hire_date) = 1986;

/*List the manager of each department with the following information: 
department number, department name, the manager's employee number, 
last name, first name, and start and end employment dates.*/
SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
FROM departments d
JOIN dept_manager dm ON d.dept_no = dm.dept_no
JOIN employees e ON dm.emp_no = e.emp_no
WHERE EXTRACT(YEAR FROM dm.to_date) = 9999;

/*List the department of each employee with the following information: 
employee number, last name, first name, and department name.*/
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE EXTRACT(YEAR FROM de.to_date) = 9999;

/*List all employees whose first name is "Hercules" and last names 
begin with "B."*/
SELECT *
FROM employees
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';

/*List all employees in the Sales department, including their 
employee number, last name, first name, and department name.*/
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
AND EXTRACT(YEAR FROM de.to_date) = 9999;

/*List all employees in the Sales and Development departments, 
including their employee number, last name, first name, and department name.*/
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development'
AND EXTRACT(YEAR FROM de.to_date) = 9999;

/*In descending order, list the frequency count of employee last names, 
i.e., how many employees share each last name.*/
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT DESC

--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no,
employees.last_name,
employees.first_name,
employees.sex,
salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no=salaries.emp_no
;

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name,hire_date FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, 
employees.last_name, employees.first_name
FROM departments
JOIN dept_manager on departments.dept_no=dept_manager.dept_no
JOIN employees on dept_manager.emp_no=employees.emp_no
;

--4. List the department of each employee with the following information:
--employee number, last name, first name, and department name.
DROP TABLE IF EXISTS department_info;
SELECT dept_emp.emp_no, dept_emp.dept_no,departments.dept_name into department_info
FROM dept_emp JOIN departments
ON dept_emp.dept_no=departments.dept_no;

SELECT employees.emp_no,employees.last_name,employees.first_name,department_info.dept_name
FROM employees
JOIN department_info
ON employees.emp_no=department_info.emp_no;

--5. List first name, last name, and sex for employees whose first name is
--"Hercules" and last names begin with "B."
SELECT first_name,last_name,sex
FROM employees
WHERE first_name='Hercules' AND last_name LIKE 'B%';

--6. List all employees in the Sales department, including their 
--employee number, last name, first name, and department name.
DROP TABLE IF EXISTS sales_department;
SELECT dept_emp.emp_no, dept_emp.dept_no,departments.dept_name into sales_department
FROM dept_emp JOIN departments
ON dept_emp.dept_no=departments.dept_no
WHERE departments.dept_name='Sales';

SELECT employees.emp_no,employees.last_name,employees.first_name,sales_department.dept_name
FROM employees JOIN sales_department
ON employees.emp_no=sales_department.emp_no;

--7. List all employees in the Sales and Development departments, including their
--employee number, last name, first name, and department name.
DROP TABLE IF EXISTS sales_development;
SELECT dept_emp.emp_no, dept_emp.dept_no,departments.dept_name into sales_development
FROM dept_emp JOIN departments
ON dept_emp.dept_no=departments.dept_no
WHERE departments.dept_name='Sales' OR departments.dept_name='Development';

SELECT employees.emp_no,employees.last_name,employees.first_name,sales_development.dept_name
FROM employees JOIN sales_development
ON employees.emp_no=sales_development.emp_no;

--8. In descending order, list the frequency count of employee last names,
--i.e., how many employees share each last name.
SELECT last_name,COUNT(last_name)
FROM employees
GROUP BY last_name;

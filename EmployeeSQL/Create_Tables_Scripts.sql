DROP TABLE IF EXISTS titles CASCADE;
CREATE TABLE titles (
    title_id varchar(10)   NOT NULL PRIMARY KEY,
    title varchar(50)   NOT NULL
);
------------------------------------------------------------------
DROP TABLE IF EXISTS employees CASCADE;
CREATE TABLE employees (
    emp_no int   NOT NULL PRIMARY KEY,
    emp_title varchar(10)   NOT NULL REFERENCES titles(title_id),
    birth_date date   NOT NULL,
    first_name varchar(50)   NOT NULL,
    last_name varchar(50)   NOT NULL,
    sex char(1)   NOT NULL,
    hire_date date   NOT NULL
);
----------------------------------------------------------------------
DROP TABLE IF EXISTS salaries CASCADE;
CREATE TABLE salaries (
    emp_no int   NOT NULL REFERENCES employees(emp_no),
    salary money   NOT NULL
);
-----------------------------------------------------------------------
DROP TABLE IF EXISTS departments CASCADE;
CREATE TABLE departments (
    dept_no varchar(20)   NOT NULL PRIMARY KEY,
    dept_name varchar(50)   NOT NULL
);
------------------------------------------------------------------------
DROP TABLE IF EXISTS dept_emp CASCADE;
CREATE TABLE dept_emp (
    emp_no int   NOT NULL REFERENCES employees(emp_no),
    dept_no varchar(20)   NOT NULL REFERENCES departments(dept_no)
);
------------------------------------------------------------------------
DROP TABLE IF EXISTS dept_manager CASCADE;
CREATE TABLE dept_manager (
    dept_no varchar(20)   NOT NULL REFERENCES departments(dept_no),
    emp_no int   NOT NULL REFERENCES employees(emp_no)
);

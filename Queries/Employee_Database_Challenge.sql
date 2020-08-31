-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT 
e.emp_no,
e.first_name,
e.last_name,
t.title,
t.from_date,
t.to_date 
into retirement_titles
FROM employees e
JOIN titles t on e.emp_no = t.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER by emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title,
from_date,
to_date 
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

-- Retiring counts
select count(title),
	title
into retiring_titles
from unique_titles
GROUP by title
order by count desc;

-- mentorship_eligibilty
select DISTINCT ON (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
d.from_date,
d.to_date ,
t.title
into mentorship_eligibilty
FROM employees e
join dept_emp d on e.emp_no = d.emp_no
join titles t on e.emp_no = t.emp_no
WHERE birth_date BETWEEN '1965-01-01' AND '1965-12-31'
AND d.to_date = '9999-01-01'
AND t.to_date = '9999-01-01'
order by e.emp_no;

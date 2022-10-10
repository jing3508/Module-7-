select e.emp_no, e.first_name, e.last_name, ti.title, ti.from_date, ti.to_date
into ret_titles
from employees as e
inner join titles as ti on e.emp_no=ti.emp_no
where birth_date between '1952-01-01' and '1955-12-31'
order by e.emp_no;

select * from ret_titles;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO uniq_titles
FROM ret_titles
WHERE to_date='9999-01-01'
ORDER BY emp_no ASC, to_date DESC


select count(title), title
into Retiring
from uniq_titles
group by title 
order by count DESC



SELECT DISTINCT ON (e.emp_no) e.emp_no,
  e.first_name,
  e.last_name,
  e.birth_date,
  de.from_date,
  de.to_date,
  ti.title
INTO mentorship_eligibiliy
FROM employees as e
INNER JOIN dept_emp as de
  ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
  ON (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

SELECT * FROM mentorship_eligibiliy
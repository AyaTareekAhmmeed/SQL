select dept_name, max(salary) as max_salary
from employees
group by dept_name;
select e.*,
max(salary) over() as max_salary
from employees e;

select e.*,
max(salary) over (partition by dept_name) as max_salary
from employees e;


--row_number, rank, dense_rank, lead and lag
select e.*,
row_number() over (partition by dept_name) as rn
from employees e;

--Fetch the first 2 employees from each department to join the company.
select * from (
	select e.*,
	row_number() over (partition by dept_name order by emp_id) as rn
	from employees e) x
where x.rn < 3;


--Fetch the top 3 employees in each department earning the max salary.
select * from (
	select e.*,
	rank() over (partition by dept_name order by salary desc) as rnk
	from employees e) x
where x.rnk <4;


select e.*,
rank() over (partition by dept_name order by salary desc) as rnk,
dense_rank() over (partition by dept_name order by salary desc) as DENSE_rnk
from employees e;


select e.*,
rank() over (partition by dept_name order by salary desc) as rnk,
dense_rank() over (partition by dept_name order by salary desc) as DENSE_rnk, 
row_number() over (partition by dept_name order by salary desc) as rn
from employees e;


--fetch a query to display if the salary of an employee is higher, lower or equal to the previous employee.
select e.*,
lag (salary, 1, 0) over (partition by dept_name order by emp_id) as prev_emp_salary 
from employees e;


select e.*,
lag (salary) over (partition by dept_name order by emp_id) as prev_emp_salary, 
case when e.salary> lag (salary) over (partition by dept_name order by emp_id) then 'Higher than previous employee' 
when e.salary< lag (salary) over (partition by dept_name order by emp_id) then 'Lower than previous employee' 
when e.salary = lag (salary) over (partition by dept_name order by emp_id) then 'Same as than previous employee' end sal_range
from employees e;
--Fetch the employee name and the department name they belong to.

--Inner join / JOIN
select e.emp_name, d.dept_name
from employee e
join department d on e.dept_id = d.dept_id;


--Fetch ALL the employee name and their department name they belong to.

select e.emp_name, d.dept_name
from employee e left join department d on e.dept_id = d.dept_id;

--left joid inner join + any additional records in the left table.



select e.emp_name, d.dept_name
from employee e right join department d on e.dept_id = d.dept_id;

--right join = inner join + any additional records from the right table.


--Fetch details of ALL emp, their manager, their department and the projects they work on.

select e.emp_name, d.dept_name, m.manager_name, p.project_name
from employee e
left join department d on e.dept_id = d.dept_id
inner join manager m on m.manager_id = e.manager_id
left join project p on p.team_member_id = e.emp_id;


--FULL Join = INNER Join

--+ all remaining records from Left Table (returns null value for any columns fetch

--+ all remaining records from Right Table (returns null value for any columns fetc

select e.emp_name, d.dept_name
from employee e
full join department d on d.dept_id = e.dept_id;



--Write a query to fetch the employee name and their corresponding department name.

--Also make sure to display the company name and the company location correspodning to each empl

SELECT e.emp_name, d.dept_name, c.company_name, c.location
FROM employee e
INNER JOIN department d ON e.dept_id = d.dept_id
cross join company c;



--NATURAL JOIN
select e.emp_name, d.dept_name
from employee e
natural join department d;
alter table department rename column dept_id to id;


--SELF JOIN
--Write a query to fetch the child name and their age correspodning to their parent name
select child.name as child_name
 , child.age as child_age
 ,parent.name as parent_name
 , parent.age as parent_age
from family as child
join family as parent on child.parent_id = parent.member_id;
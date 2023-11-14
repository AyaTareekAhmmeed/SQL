--FIRST VALUE
--Write query to display the most expensive product under each category (corresponding to each record)
select *,
first_value(product_name) over (partition by product_category order by price desc) as most_exp_product 
from products;


--LAST VALUE
--Write query to display the least expensive product under each category (corresponding to each record)

select *,
first_value (product_name) over (partition by product_category order by price desc) as most_exp_product,
last_value (product_name) over (partition by product_category order by price desc) as least_exp_product
from products;


--Write query to display the least expensive product under each category (corresponding to each record)

select*,
first_value (product_name)
over (partition by product_category order by price desc)
as most_exp_product,
last_value (product_name)
over (partition by product_category order by price desc
rows between unbounded preceding and unbounded following)
as least_exp_product
from products;


select *,
first_value (product_name)
over (partition by product_category order by price desc)
as most_exp_product,
last_value (product_name)
over (partition by product_category order by price desc
rows between unbounded preceding and unbounded following)
as least_exp_product
from products
where product_category='Phone';


--Alternate way to write SQL query using Window functions

select *,
first_value (product_name) over w as most_exp_product,
last_value (product_name) over w as least_exp_product 
from products
where product_category='Phone'
window w as (partition by product_category order by price desc
range between unbounded preceding and unbounded following);


--NTH VALUE
-- Write query to display the Second most expensive product under each category. 

select *,
first_value (product_name) over w as most_exp_product,
last_value (product_name) over w as least_exp_product,
nth_value(product_name, 2) over w as second_most_exp_product
from products
window w as (partition by product_category order by price desc
range between unbounded preceding and unbounded following);


--Write a query to segregate all the expensive phones, mid range phones and the cheaper phones.

select product_name,
case when x.buckets = 1 then 'Expensive Phone'
	 when x.buckets = 2 then 'Mid Range Phones'
	 when x.buckets = 3 then 'Cheaper Phones' END phone_category
from ( 
	select *,
	ntile (3) over (order by price desc) as buckets
	from products
	where product_category='Phone') x ;
	
	
/* Formula = Current Row no (or Row No with value same as current row) / Total no of rows */
-- Query to fetch all products which are constituting the first 30%
-- of the data in products table based on price.
SELECT *,
cume_dist() over (order by price desc) as cume_distribution,
round (cume_dist() over (order by price desc)::numeric*100, 2) as cume_dist_percentage
from products;


--Query to fetch all products which are constituting the first 30% 67 of the data in products table based on price.

select product_name, (cume_dist_percentage || '%') as cume_dist_percentage
from (
select *,
cume_dist() over (order by price desc) as cume_distribution, round (cume_dist() over (order by price desc) ::numeric * 100, 2) as cume_dist_percentage
from products) x
where x.cume_dist_percentage <= 30;


--PERCENT RANK (relative rank of the current row / Percentage Ranking)

/*Value>1<= PERCENT_RANK > 0 */
select *,
percent_rank() over (order by price) as percentage_rank
from products;


--Query to identify how much percentage more expensive is "Galaxy Z Fold 3" when compared to all produc
select product_name, per_rank
from (
select *,
percent_rank() over (order by price) as percentage_rank, round(percent_rank() over(order by price) ::numeric * 100, 2) as per_rank 
from products) x
where x.product_name = 'iPhone 13';
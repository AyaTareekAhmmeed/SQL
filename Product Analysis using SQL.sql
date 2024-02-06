--Product Analysis using SQL
--1 - What is our Sales by Products?
Select
	p.EnglishProductName AS product_name,
	SUM(f.SalesAmount) AS sales_amount
from DimProduct p
inner join FactInternetSales f on p.ProductKey = f.ProductKey
Group By p.EnglishProductName
Order by SUM(f.SalesAmount) DESC


--2 - What are our top 10 products by Sales?
Select top 10 
	p.EnglishProductName AS product_name,
	SUM(f.SalesAmount) AS sales_amount
from DimProduct p
inner join FactInternetSales f on p.ProductKey = f.ProductKey
Group By p.EnglishProductName
Order by SUM(f.SalesAmount) DESC


--3 - What are our top 10 products with lowest production cost?
--Products by Lowest Production Cost
Select top 10 
	p.EnglishProductName AS product_name,
	SUM(f.TotalProductCost) AS Production_amount
from DimProduct p
inner join FactInternetSales f on p.ProductKey = f.ProductKey
Group By p.EnglishProductName
Order by SUM(f.TotalProductCost) ASC


--4 - How are our Prodcut categories performing?
Select 
	pc.EnglishProductCategoryName AS product_category,
        SUM(f.SalesAmount) AS total_sales
From DimProduct p
inner join DimProductSubcategory ps on p.ProductSubcategoryKey = ps.ProductSubcategoryKey
inner join DimProductCategory pc on ps.ProductCategoryKey = pc.ProductCategoryKey
inner join FactInternetSales f on f.ProductKey = p.ProductKey
Group by pc.EnglishProductCategoryName
Order by SUM(f.SalesAmount) DESC

--On average, how many orders do we receive per day? Plus, what's our average sales per day?
with avg_sales_per_day as (
	select OrderDate, 
		   count(distinct SalesOrderNumber) as order_count,
			sum(SalesAmount) as Sales
    from  [dbo].[FactInternetSales]
    group by OrderDate
)

select 
   avg(Sales) as avg_sales_day,
   avg(order_count) avg_order_count
from avg_sales_per_day
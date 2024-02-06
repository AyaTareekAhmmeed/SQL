--Product_Association (Market Basket Analysis)
-- first build CTE to use inside query
with order_item as ( 
Select distinct
	f.CustomerKey,
	f.OrderDateKey, 
	f.ProductKey,
	p.EnglishProductName as ProductName
from dbo.FactInternetSales f
inner join DimProduct p on f.ProductKey = p.ProductKey
)

-- our query
Select top 20
	a.ProductName, 
	b.ProductName , 
	count(*) frequency
from order_item a 
inner join order_item b on a.CustomerKey = b.CustomerKey
AND A.OrderDateKey = B.OrderDateKey
where a.ProductKey < b.ProductKey
Group by  a.ProductName, b.ProductName 
Order by count(*) DESC
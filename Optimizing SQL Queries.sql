-- Index Example
CREATE INDEX idx_customer_name ON customers (name);

-- Query Faster Example

SELECT customers.name, orders.order_date
FROM customers
JOIN orders ON customers.id = orders.customer_id;


-- Analyzing Query Performance Example

EXPLAIN SELECT * FROM employees;
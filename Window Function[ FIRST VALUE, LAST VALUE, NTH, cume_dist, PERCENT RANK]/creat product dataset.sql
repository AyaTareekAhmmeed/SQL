-- Create the products table with updated product categories
CREATE TABLE products (
    product_category VARCHAR(255),
    brand VARCHAR(255),
    product_name VARCHAR(255),
    price DECIMAL(10, 2)
);

-- Insert 30 rows of sample data with updated product categories
INSERT INTO products VALUES
('Phone', 'Apple', 'iPhone 13', 999.99),
('HeadPhone', 'Sony', 'Wireless Headphones', 149.99),
('SmartWatch', 'Samsung', 'Galaxy Watch', 249.99),
('Labtob', 'Dell', 'Laptop', 1299.99),
('Phone', 'Google', 'Pixel 6', 799.99),
('HeadPhone', 'Bose', 'Noise-Canceling Headphones', 299.99),
('SmartWatch', 'Apple', 'Apple Watch Series 7', 399.99),
('Labtob', 'HP', 'Convertible Laptop', 899.99),
('Phone', 'Samsung', 'Galaxy S21', 899.99),
('HeadPhone', 'JBL', 'Bluetooth Earbuds', 79.99),
('SmartWatch', 'Fitbit', 'Versa 3', 229.99),
('Labtob', 'Lenovo', 'Gaming Laptop', 1499.99),
('Phone', 'OnePlus', '9 Pro', 899.99),
('HeadPhone', 'Sennheiser', 'Over-Ear Headphones', 199.99),
('SmartWatch', 'Garmin', 'Forerunner 945', 599.99),
('Labtob', 'Asus', 'ZenBook', 1099.99),
('Phone', 'Xiaomi', 'Mi 11', 699.99),
('HeadPhone', 'Apple', 'AirPods Pro', 249.99),
('SmartWatch', 'Huawei', 'Watch GT 3', 179.99),
('Labtob', 'Acer', 'Chromebook', 349.99),
('Phone', 'Sony', 'Xperia 5 III', 999.99),
('HeadPhone', 'Beats', 'Powerbeats Pro', 199.99),
('SmartWatch', 'Fossil', 'Gen 6', 299.99),
('Labtob', 'Microsoft', 'Surface Laptop 4', 1299.99),
('Phone', 'LG', 'Velvet', 499.99),
('HeadPhone', 'Skullcandy', 'Crusher Wireless', 129.99),
('SmartWatch', 'Amazfit', 'GTR 3', 179.99),
('Labtob', 'Razer', 'Blade 15', 1799.99),
('Phone', 'Motorola', 'Moto G Power', 199.99),
('HeadPhone', 'Jabra', 'Elite 85t', 229.99),
('SmartWatch', 'TicWatch', 'Pro 3', 299.99);
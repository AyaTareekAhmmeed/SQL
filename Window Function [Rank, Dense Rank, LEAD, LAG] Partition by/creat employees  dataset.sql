-- Create the employees table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(255),
    dept_name VARCHAR(255),
    salary DECIMAL(10, 2)
);

-- Insert 20 rows of sample data
INSERT INTO employees VALUES
(1, 'John Doe', 'HR', 50000.00),
(2, 'Jane Smith', 'IT', 60000.00),
(3, 'Bob Johnson', 'Finance', 75000.00),
(4, 'Alice Williams', 'Marketing', 55000.00),
(5, 'Charlie Brown', 'Engineering', 70000.00),
(6, 'Eva Davis', 'Sales', 60000.00),
(7, 'Frank Miller', 'HR', 52000.00),
(8, 'Grace Taylor', 'IT', 65000.00),
(9, 'Henry White', 'Finance', 80000.00),
(10, 'Ivy Robinson', 'Marketing', 58000.00),
(11, 'Jack Turner', 'Engineering', 72000.00),
(12, 'Karen Hall', 'Sales', 61000.00),
(13, 'Larry King', 'HR', 53000.00),
(14, 'Megan Carter', 'IT', 68000.00),
(15, 'Nick Brown', 'Finance', 77000.00),
(16, 'Olivia Adams', 'Marketing', 59000.00),
(17, 'Paul Evans', 'Engineering', 74000.00),
(18, 'Quincy Moore', 'Sales', 62000.00),
(19, 'Rachel Lee', 'HR', 54000.00),
(20, 'Samuel Harris', 'IT', 70000.00);
USE NorthwindDatabase;

-- 1. Retrieve all columns in the Region table
SELECT * FROM `region`;

-- 2. Select the FirstName and LastName columns from the Employees table.
SELECT first_name, last_name FROM `employees`;

--  3. Select the FirstName and LastName columns from the Employees table. Sort by LastName.
SELECT 
    first_name, last_name 
FROM `employees` 
ORDER BY last_name;

-- 4. Create a report showing Northwind's orders sorted by Freight from most expensive to 
-- cheapest. Show OrderID, OrderDate, ShippedDate, CustomerID, and Freight. --
SELECT
    order_id, order_date, shipped_date, customer_id, freight
FROM orders
ORDER BY freight DESC;

-- 5. Create a report showing the title and the first and last name of all sales representatives.
SELECT
    title, first_name, last_name
FROM employees
WHERE title = 'Sales Representative';

--  6. Create a report showing the first and last names of all employees who have a region specified
SELECT
    title, first_name, last_name
FROM employees
WHERE `region` IS NOT NULL;

-- 7. Create a report showing the first and last name of all employees whose last names start
-- with a letter in the last half of the alphabet.
-- Sort by LastName in descending order.
SELECT 
    first_name, last_name
FROM employees
    WHERE last_name >= 'N' AND last_name <= 'Z'
ORDER BY last_name DESC;

-- 8. Create a report showing the title of courtesy and the first and last name of all employees
-- whose title of courtesy begins with "M".
SELECT
    title_of_courtesy, first_name, last_name
FROM employees
WHERE title_of_courtesy LIKE 'M%';

-- 9. Create a report showing the first and last name of all sales representatives who are from Seattle or Redmond.
SELECT
    first_name, last_name
FROM employees
WHERE title = 'Sales Representative' AND city = 'Seattle' or city = 'Redmond';

-- 10.  Create a report that shows the company name, contact title, city and country of all
-- customers in Mexico or in any city in Spain except Madrid.
SELECT 
    company_name, contact_title, city, country
FROM customers
WHERE country = 'Mexico' OR (country = 'Spain' AND city != 'Madrid');

-- 11. If the cost of freight is greater than or equal to $500.00, it will now be taxed by 10%.
-- Create a report that shows the order id, freight cost, freight cost with this tax for all orders of $500 or more.
SELECT 
    order_id, 
    freight AS freight_cost,
    CASE 
        WHEN freight >= 500.00 THEN ROUND(freight * 1.1, 2)
        ELSE freight
    END AS freight_cost_with_tax
FROM 
    orders
WHERE freight >= 500.00;

-- 12. Find the Total Number of Units Ordered of Product ID 3
SELECT 
    SUM(quantity) as total_units_ordered
FROM  
    order_details
WHERE product_id = 3;

-- 13. Retrieve the number of employees in each city
SELECT 
    city, 
    COUNT(DISTINCT employee_id) as number_of_employees
FROM employees
GROUP BY city;

-- 14. Find the number of sales representatives in each city that contains at least 2 sales
-- representatives. Order by the number of employees.
SELECT
    city, 
    COUNT(employee_id) as number_of_sales_representatives
FROM employees
WHERE title = 'Sales Representative'
GROUP BY city
HAVING COUNT(employee_id) >= 2
ORDER BY number_of_sales_representatives DESC;
 
-- 15. Find the Companies (the CompanyName) that placed orders in 1997
SELECT 
    c.company_name, 
    EXTRACT(YEAR FROM o.order_date) AS year
FROM orders o 
JOIN customers c ON o.customer_id = c.customer_id;

-- 16. Create a report showing employee orders
SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    o.order_date,
    o.shipped_date
FROM 
    employees e
JOIN 
    orders o ON e.employee_id = o.employee_id
ORDER BY 
    e.employee_id, o.order_id;

-- 17.  Create a report showing the Order ID, the name of the company that placed the order, and the first and last name of the associated employee.
-- Only show orders placed after January 1, 1998 that shipped after they were required.
-- Sort by Company Name.
SELECT 
    o.order_id,
    c.company_name,
    e.first_name,
    e.last_name
FROM orders o 
JOIN customers c ON o.customer_id= c.customer_id
JOIN employees e ON o.employee_id= e.employee_id
WHERE  o.order_date > '1998-01-01'
    AND o.shipped_date > o.required_date
ORDER BY 
    c.company_name;

-- 18.  Create a report that shows the total quantity of products (from the Order_Details table)
-- ordered. Only show records for products for which the quantity ordered is fewer than 200.
-- The report should return the following 5 rows.

SELECT 
    p.product_name, 
    SUM(od.quantity) as total_quantity_ordered
FROM order_details od 
JOIN products p
    ON od.product_id = p.product_id
GROUP BY 
    p.product_name
HAVING 
    SUM(od.quantity) < 200
ORDER BY 
    total_quantity_ordered DESC
LIMIT 5;









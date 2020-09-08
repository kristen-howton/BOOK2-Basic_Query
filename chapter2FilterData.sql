--Chapter 2: Filter Data
-- Get a list of sales records where the sale was a lease.
SELECT * FROM sales WHERE sales_type_id=2;
-- Get a list of sales where the purchase date is within the last two years.
SELECT * FROM sales WHERE purchase_date BETWEEN '2020-04-21' AND '2020-08-31'
-- Get a list of sales where the deposit was above 5000 or the customer payed with American Express.
SELECT * FROM sales WHERE deposit > 5000 OR payment_method = 'americanexpress'
-- Get a list of employees whose first names start with "M" or ends with "E".
SELECT * FROM employees WHERE first_name LIKE 'M%' OR '%e'
-- Get a list of employees whose phone numbers have the 600 area code.
SELECT * FROM employees WHERE phone LIKE '600%'

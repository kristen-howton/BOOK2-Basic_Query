-- Book 2: Carnival Sales

-- Write a query that shows the total purchase sales income per dealership.
SELECT business_name, sum(s.price)
FROM sales s
INNER JOIN dealerships d on s.dealership_id = d.dealership_id
WHERE sales_type_id = 1
GROUP BY business_name, d.dealership_id
ORDER BY d.dealership_id;

-- Write a query that shows the purchase sales income per dealership for the current month.
SELECT d.business_name, sum(s.price), s.purchase_date
FROM sales s
INNER JOIN dealerships d on s.dealership_id = d.dealership_id
WHERE sales_type_id = 1
	and extract(month from purchase_date) = extract(month from current_date)
GROUP BY d.business_name, s.purchase_date
ORDER BY s.purchase_date DESC;

-- Write a query that shows the purchase sales income per dealership for the current year.
SELECT d.business_name, sum(s.price), s.purchase_date
FROM sales s
INNER JOIN dealerships d on s.dealership_id = d.dealership_id
WHERE sales_type_id = 1
	and extract(year from purchase_date) = extract(year from current_date)
GROUP BY d.business_name, s.purchase_date
ORDER BY s.purchase_date DESC;

-- Write a query that shows the total lease income per dealership.
SELECT business_name, SUM(s.price)
FROM sales s
INNER JOIN dealerships d on s.dealership_id = d.dealership_id
WHERE sales_type_id = 2
GROUP BY business_name, d.dealership_id
ORDER BY d.dealership_id;

-- Write a query that shows the lease income per dealership for the current month.
SELECT d.business_name, SUM(s.price), s.purchase_date
FROM sales s
INNER JOIN dealerships d ON s.dealership_id = d.dealership_id
WHERE sales_type_id = 2
	and extract(month from purchase_date) = extract(month from current_date)
GROUP BY d.business_name, s.purchase_date
ORDER BY s.purchase_date DESC;

-- Write a query that shows the lease income per dealership for the current year.
SELECT d.business_name, SUM(s.price), s.purchase_date
FROM sales s
INNER JOIN dealerships d ON s.dealership_id = d.dealership_id
WHERE sales_type_id = 2
	and extract(year from purchase_date) = extract(year from current_date)
GROUP BY d.business_name, s.purchase_date
ORDER BY s.purchase_date DESC;

-- Write a query that shows the total income (purchase and lease) per employee.
SELECT 
	e.first_name || ' ' || e.last_name as employee,
	SUM(s.price)
FROM sales s
INNER JOIN employees e on e.employee_id = s.employee_id
WHERE sales_type_id = 1
GROUP BY employee;

SELECT 
	e.first_name || ' ' || e.last_name as employee,
	SUM(s.price)
FROM sales s
INNER JOIN employees e on e.employee_id = s.employee_id
WHERE sales_type_id = 2
GROUP BY employee;
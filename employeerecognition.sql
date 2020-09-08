-- Book 2: Employee Recognition 
-- How many employees are there for each role?
SELECT
	et.name,
	COUNT(e.employee_type_id)
FROM employees e
	INNER JOIN employeetypes et on e.employee_type_id = et.employee_type_id
GROUP BY et.name;

-- How many finance managers work at each dealership?
SELECT
	d.business_name,
	COUNT(e.employee_type_id) as finance_managers
FROM employees e
	INNER JOIN dealershipemployees de on de.employee_id = e.employee_id
	INNER JOIN dealerships d on d.dealership_id = de.dealership_id
WHERE e.employee_type_id = 2
GROUP BY d.dealership_id
ORDER BY finance_managers DESC;

-- Get the names of the top 3 employees who work shifts at the most dealerships?
SELECT
	e.first_name || ' ' || e.last_name as employee,
	COUNT(d.dealership_id) as num_of_dealerships
FROM employees e
	LEFT JOIN dealershipemployees de on de.employee_id = e.employee_id
	INNER JOIN dealerships d on d.dealership_id = de.dealership_id
GROUP BY e.employee_id
ORDER BY num_of_dealerships DESC;

-- Get a report on the top two employees who has made the most sales through leasing vehicles.
SELECT
	e.first_name || ' ' || e.last_name as employee,
	COUNT(s.sale_id) as num_of_leases
FROM sales s
	INNER JOIN employees e on s.employee_id = e.employee_id
WHERE s.sales_type_id = 2
GROUP BY employee
ORDER BY num_of_leases;
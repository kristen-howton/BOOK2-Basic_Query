--Chapter 2: Joining Tables
-- Get a list of the sales that was made for each sales type.
SELECT * FROM sales INNER JOIN salestypes 
ON sales.sales_type_id = salestypes.sales_type_id
-- Get a list of sales with the VIN of the vehicle, the first name and last name of the customer, first name and last name of the employee who made the sale and the name, city and state of the dealership.
SELECT v.vin, c.first_name, c.last_name, e.first_name, e.last_name, d.business_name, d.city, d.state 
FROM sales s 
INNER JOIN vehicles v ON s.vehicle_id = v.vehicle_id
INNER JOIN customers c ON s.customer_id = c.customer_id
INNER JOIN employees e ON s.employee_id = e.employee_id
INNER JOIN dealerships d ON s.dealership_id = d.dealership_id

-- Get a list of all the dealerships and the employees, if any, working at each one.
SELECT * FROM dealerships d
LEFT JOIN dealershipemployees de ON d.dealership_id = de.dealership_id
LEFT JOIN employees e ON e.employee_id = de.employee_id

-- Get a list of vehicles with the names of the body type, make, model and color.
SELECT v.body_type, vt.make, vt.model, v.exterior_color 
FROM vehicles v 
INNER JOIN vehicletypes vt ON v.vehicle_type_id = vt.vehicle_type_id

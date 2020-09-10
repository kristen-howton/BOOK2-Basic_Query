-- Book 3: SQL Updates
-- Practice: Employees
-- Rheta Raymen an employee of Carnival has asked to be transferred to a different dealership location. 
-- She is currently at dealership 751. She would like to work at dealership 20. 
-- Update her record to reflect her transfer.

UPDATE dealershipemployees de
SET dealership_id = 20
FROM employees e
WHERE e.employee_id = de.employee_id 
and e.first_name = 'Rheta' 
and e.last_name = 'Raymen' 
and de.dealership_id = 751

-- Practice: Sales
-- A Sales associate needs to update a sales record because her customer want so pay wish 
-- Mastercard instead of American Express. 
-- Update Customer, Layla Igglesden Sales record which has an invoice number of 2781047589.

UPDATE sales s
SET payment_method = 'Mastercard'
FROM customers cu
WHERE s.customer_id = cu.customer_id
and cu.first_name = 'Layla' 
and cu.last_name = 'Igglesden'
and s.invoice_number = '2781047589'

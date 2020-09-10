--Book 3: SQL Delete
-- Practice - Employees
-- A sales employee at carnival creates a new sales record for a sale they are trying to close. 
-- The customer, last minute decided not to purchase the vehicle. Help delete the Sales record 
-- with an invoice number of '7628231837'.
DELETE FROM sales s
WHERE s.invoice_number = '7628231837'


-- An employee was recently fired so we must delete them from our database. 
-- Delete the employee with employee_id of 35. What problems might you run into when deleting? 
-- How would you recommend fixing it?
ALTER TABLE employees
ADD COLUMN isActive bool
DEFAULT true
 
UPDATE employees
SET isActive = false
WHERE employee_id = 35



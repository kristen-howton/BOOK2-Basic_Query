-- Write a transaction to:
-- Add a new role for employees called Automotive Mechanic
-- Add five new mechanics, their data is up to you
-- Each new mechanic will be working at all three of these dealerships: 
--Sollowaye Autos of New York, Hrishchenko Autos of New York and Cadreman Autos of New York
BEGIN;
SELECT * FROM employeetypes
INSERT INTO public.employeetypes(name)
	VALUES ('Automotive Mechanic')

INSERT INTO employees(
	first_name, last_name, email_address, phone, employee_type_id)
	VALUES
	('Jon', 'Howton', 'j_howton@gmail.com', '603-555-5555', 9),
	('Thomas', 'Long', 't_long@gmail.com', '555-555-5555', 9),
	('Derek', 'Buckley', 'd_buckley@gmail.com', '603-555-6666', 9),
	('Crystal', 'Elsey', 'c_elsey@gmail.com', '603-444-5555', 9),
	('Sarah', 'Hart Landolt', 's_landolt@gmail.com', '615-555-5555', 9);
	
INSERT INTO
    dealershipemployees(employee_id, dealership_id)
VALUES
    (1001, 50),
    (1001, 128),
    (1001, 322),
    (1002, 50),
    (1002, 128),
    (1002, 322),
    (1003, 50),
    (1003, 128),
    (1003, 322),
    (1004, 50),
    (1004, 128),
    (1004, 322),
    (1005, 50),
    (1005, 128),
    (1005, 322);
	
INSERT INTO dealershipemployees(dealership_id, employee_id)
VALUES 
ROLLBACK;
COMMIT;

-- Create a transaction for:
-- Creating a new dealership in Washington, D.C. called Felphun Automotive
-- Hire 3 new employees for the new dealership: Sales Manager, General Manager and Customer Service.
-- All employees that currently work at Scrogges Autos of District of Columbia will now start working at Felphun Automotive instead.
BEGIN;
select * from dealerships
INSERT INTO dealerships(business_name, phone, city, state, website, tax_id)
	VALUES ('Felphun Automotive', '270-555-5555', 'Washington', 'DC', 'www.website.com', 'oz-423-9y-suhp')

select * from employeetypes

INSERT INTO employees(
	first_name, last_name, email_address, phone, employee_type_id)
	VALUES
	('Heidi', 'Smith', 'h_smith@gmail.com', '603-555-5555', 3),
	('Thomas', 'Long', 't_long@gmail.com', '555-555-5555', 6),
	('Derek', 'Buckley', 'd_buckley@gmail.com', '603-555-6666', 4);

select * from dealerships



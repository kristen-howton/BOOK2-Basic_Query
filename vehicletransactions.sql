-- Adding 5 brand new 2021 Honda CR-Vs to the inventory. They have I4 engines and are classified as a Crossover SUV or CUV. 4
-- All of them have beige interiors but the exterior colors are Lilac, Dark Red, Lime, Navy and Sand. 
-- The floor price is $21,755 and the MSR price is $18,999.
select *  from vehicles 
select * from vehiclemodels
select * from vehiclemakes
select * from vehicletypes
-- start a transaction
BEGIN;
-- You can also use BEGIN TRANSACTION; or BEGIN WORK;

-- insert a new row into the sales type table
INSERT INTO vehiclemodels(name)
VALUES('CR-V'); 

INSERT INTO vehiclemakes(name)
VALUES('Honda'); 

INSERT INTO vehicles(vin, engine_type, vehicle_type_id, exterior_color, interior_color, floor_price, msr_price, miles_count, year_of_car)
VALUES('1D7RB1CP2BS795789', 'I4', 4, 'Lilac', 'Beige', 21755, 18999, 0, 2021),
('2D7RB1CP2BS795789', 'I4', 4, 'Dark Red', 'Beige', 21755, 18999, 0, 2021),
('3D7RB1CP2BS795789', 'I4', 4, 'Dark Red', 'Lime', 21755, 18999, 0, 2021),
('4D7RB1CP2BS795789', 'I4', 4, 'Navy', 'Beige', 21755, 18999, 0, 2021),
('5D7RB1CP2BS795789', 'I4', 4, 'Sand', 'Beige', 21755, 18999, 0, 2021);

-- commit the change
COMMIT;
-- You can also use COMMIT TRANSACTION; or COMMIT WORK;

-- For the CX-5s and CX-9s 5,6 in the inventory that have not been sold, change the year of the car to 2021 
-- since we will be updating our stock of Mazdas. For all other unsold Mazdas, update the year to 2020. 
-- The newer Mazdas all have red and black interiors. 556
SELECT 
vm.name, v.is_sold, v.year_of_car
FROM vehiclemodels vm
INNER JOIN vehicletypes vt ON vt.model_id = vm.vehicle_model_id
INNER JOIN vehicles v ON vt.vehicle_type_id = v.vehicle_type_id
WHERE vm.name LIKE 'CX-5' OR vm.name LIKE 'CX-9'

-- start a transaction
BEGIN;
-- You can also use BEGIN TRANSACTION; or BEGIN WORK;

-- insert a new row into the sales type table
INSERT INTO salestypes(name)
VALUES('Lease to Own');

-- commit the change
COMMIT;

-- The vehicle with VIN YV4852CT5B1628541 has been brought in for servicing. 
-- Document that the service department did a tire change, windshield wiper fluid refill and an oil change.
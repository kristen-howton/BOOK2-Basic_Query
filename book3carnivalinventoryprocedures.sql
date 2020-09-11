--Book 3: Carnival Inventory Procedure
-- Selling a Vehicle
-- Carnival would like to create a stored procedure that handles the case of updating their 
--vehicle inventory when a sale occurs. They plan to do this by flagging the vehicle as is_sold which is a field on the Vehicles table. When set to True this flag will indicate that the vehicle is no longer available in the inventory. Why not delete this vehicle? We don't want to delete it because it is attached to a sales record.

-- Returning a Vehicle
-- Carnival would also like to handle the case for when a car gets returned by a customer. 
--When this occurs they must add the car back to the inventory and mark the original sales record 
--as returned = True.
ALTER TABLE vehicles 
ADD COLUMN is_sold bool;


ALTER TABLE vehicles
ALTER COLUMN is_sold SET DEFAULT false;
UPDATE vehicles
SET is_sold = false;

UPDATE vehicles
SET is_sold = true
WHERE vehicle_id = ANY(SELECT vehicle_id FROM sales);

-- Carnival staff are required to do an oil change on the returned car before putting it back on 
--the sales floor. In our stored procedure, we must also log the oil change within the OilChangeLog table.

-- Goals
-- Use the story above and extract the requirements.
-- Build two stored procedures for Selling a car and Returning a car. Be ready to share with your class 
--or instructor your result.

CREATE OR REPLACE PROCEDURE sell_vehicle(IN veh_id int)
LANGUAGE plpgsql
AS $$
BEGIN

UPDATE vehicles SET is_sold = true WHERE vehicle_id = veh_id;

END
$$;

ALTER TABLE sales
ADD COLUMN returned bool NOT null DEFAULT false;


CREATE TABLE OilChangeLog (
   oil_change_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
   vehicle_id INT REFERENCES vehicles (vehicle_id),
   change_date DATE
);

ALTER TABLE OilChangeLog
ALTER COLUMN change_date SET DEFAULT NOW();

CREATE OR REPLACE PROCEDURE return_vehicle(IN invoiceNumber VARCHAR(50))
LANGUAGE plpgsql
AS $$
BEGIN

UPDATE sales SET returned = true WHERE invoice_number = invoiceNum;
UPDATE vehicles SET is_sold = FALSE WHERE vehicle_id = (SELECT vehicle_id FROM sales WHERE invoice_number = invoiceNumber);
INSERT INTO oilchangelog(vehicle_id)
SELECT s.vehicle_id
FROM sales s
WHERE s.invoice_number = invoiceNumber;

END
$$;

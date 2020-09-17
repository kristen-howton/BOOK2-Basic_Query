CREATE TABLE accounts_receivable (
	accounts_receivable INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    credit_amount money,
    debit_amount money,
	date_received date,
	sale_id int,
	FOREIGN KEY (sale_id) REFERENCES sales(sale_id)
); 
-- Set up a trigger on the Sales table. 
--When a new row is added, add a new record to the Accounts Receivable table with the 
--deposit as credit_amount, the timestamp as date_received and the appropriate sale_id.


CREATE OR replace FUNCTION new_accounts_receivable()
	RETURNS trigger
	LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO accounts_receivable (credit_amount, debit_amount, date_received, sale_id) 
	VALUES (NEW.deposit, NULL, CURRENT_DATE, NEW.sale_id);
	RETURN NULL;
END;
$$

CREATE TRIGGER new_sale 
AFTER INSERT
ON sales
FOR EACH ROW EXECUTE PROCEDURE new_accounts_receivable();
INSERT INTO sales (sales_type_id, vehicle_id, employee_id, customer_id,
				   dealership_id, price, deposit, purchase_date, 
				   pickup_date, invoice_number, payment_method)
VALUES(2, 2, 2, 2, 2,  99999.11, 9001, CURRENT_DATE, '09-18-2020', '1111021111', 'jcb')
select * from sales order by sale_id desc
select * from accounts_receivable

-- Set up a trigger on the Sales table for when the sale_returned flag is updated. 
--Add a new row to the Accounts Receivable table with the deposit as debit_amount, the timestamp as date_received, etc.
CREATE PROCEDURE returning_sold_vehicle(in vehicleId int) LANGUAGE plpgsql AS 
$$ BEGIN
UPDATE sales
SET returned = true
WHERE vehicle_id = vehicleId;
UPDATE vehicles
SET is_sold = false
WHERE vehicle_id = vehicleId;
END $$;
CALL returning_sold_vehicle(1);


CREATE OR REPLACE FUNCTION check_account_update()
	RETURNS trigger
	LANGUAGE plpgsql
AS $$
BEGIN
IF NEW.returned = true THEN
	INSERT INTO accounts_receivable (debit_amount, credit_amount, date_received, sale_id) 
	VALUES (NEW.deposit, NULL, CURRENT_DATE, NEW.sale_id);
	RETURN NULL;
	END IF;
END;
$$
CREATE TRIGGER vehicle_returned
AFTER UPDATE
ON sales
FOR EACH ROW EXECUTE PROCEDURE check_account_update();
 select * from sales order by vehicle_id asc
CALL returning_sold_vehicle(9);
select * from accounts_receivable

-- Create a stored procedure with a transaction to handle hiring a new employee. 
--Add a new record for the employee in the Employees table and add a record to the Dealershipemployees table for the two dealerships the new employee will start at.

-- Create a stored procedure with a transaction to handle an employee leaving. 
--The employee record is removed and all records associating the employee with dealerships must also be removed.
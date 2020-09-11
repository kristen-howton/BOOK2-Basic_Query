-- Create a trigger for when a new Sales record is added, set the purchase date to 3 days from the current date.

CREATE OR REPLACE FUNCTION set_purchase_date()
	RETURNS TRIGGER
	LANGUAGE PlPGSQL
AS $$
BEGIN 
	UPDATE sales 
	SET purchase_date = current_date + interger '3'
	WHERE sales.sale_id = NEW.sale_id;
	RETURN NULL;
END;
$$

CREATE TRIGGER sale_update
	AFTER UPDATE
	ON sales
	FOR EACH ROW
	EXECUTE PROCEDURE update_sales();
	
-- Create a trigger for updates to the Sales table. 
--If the pickup date is on or before the purchase date, set the pickup date to 7 days after the purchase date.
-- If the pickup date is after the purchase date but less than 7 days out from the purchase date, add 4 additional days to the pickup date.


CREATE OR REPLACE FUNCTION update_sales()
	RETURNS TRIGGER
	LANGUAGE PLPGSQL
AS $$
BEGIN
	IF NEW.pickup_date <= NEW.purchase_date THEN
	UPDATE sales 
	SET pickup_date = NEW.purchase_date + interger '7'
	WHERE sales.sale_id = NEW.sale_id;
	RETURN NULL;
	ELSIF NEW.pickup_date > NEW.purchase_date AND NEW.pickup_date < NEW.purchase_date + INTERVAL '7 DAYS' THEN
	UPDATE sales 
	SET pickup_date = NEW.pickup_date + interger '4'
	WHERE sales.sale_id = NEW.sale_id;
	RETURN NULL;
	END IF;
	END$$


CREATE TRIGGER sale_updated
	AFTER INSERT
	ON sales
	FOR EACH ROW
	EXECUTE PROCEDURE set_purchase_date();


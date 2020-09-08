-- Book 2: Inventory

-- Which model of vehicle has the lowest current inventory? 
--This will help dealerships know which models the purchase from manufacturers.
SELECT
	mo.name,
  COUNT(v.vehicle_id)
FROM
  vehicles v
  JOIN vehicletypes vt ON v.vehicle_type_id = vt.vehicle_type_id
  JOIN vehiclemodels mo ON vt.model_id = mo.vehicle_model_id
GROUP BY
  mo.name
ORDER BY
  COUNT(v.vehicle_id);

-- Which model of vehicle has the highest current inventory? 
--This will help dealerships know which models are, perhaps, not selling.
SELECT
	mo.name,
  COUNT(v.vehicle_id)
FROM
  vehicles v
  JOIN vehicletypes vt ON v.vehicle_type_id = vt.vehicle_type_id
  JOIN vehiclemodels mo ON vt.model_id = mo.vehicle_model_id
GROUP BY
  mo.name
ORDER BY
  COUNT(v.vehicle_id) DESC;

-- Which dealerships are currently selling the least number of vehicle models? 
--This will let dealerships market vehicle models more effectively per region.
SELECT business_name,
	COUNT(vt.model_id)
FROM sales s
	INNER JOIN dealerships d on s.dealership_id = d.dealership_id
	INNER JOIN vehicles v on s.vehicle_id = v.vehicle_id
	INNER JOIN vehicletypes vt on v.vehicle_type_id = vt.vehicle_type_id
	INNER JOIN vehiclemodels mo on vt.model_id = mo.vehicle_model_id
WHERE sales_type_id = 1
GROUP BY
	business_name, 
	d.dealership_id,
	vt.model_id
ORDER BY d.dealership_id;

-- Which dealerships are currently selling the highest number of vehicle models? 
--This will let dealerships know which regions have either a high population, or less brand loyalty.
SELECT business_name,
	COUNT(vt.model_id)
FROM sales s
	INNER JOIN dealerships d on s.dealership_id = d.dealership_id
	INNER JOIN vehicles v on s.vehicle_id = v.vehicle_id
	INNER JOIN vehicletypes vt on v.vehicle_type_id = vt.vehicle_type_id
	INNER JOIN vehiclemodels mo on vt.model_id = mo.vehicle_model_id
WHERE sales_type_id = 1
GROUP BY 
	business_name, 
	d.dealership_id,
	vt.model_id
ORDER BY d.dealership_id DESC;
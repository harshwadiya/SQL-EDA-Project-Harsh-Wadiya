-------------------------------------------------------------------------------------				
					
							/*Measure Exploration*/

-------------------------------------------------------------------------------------	


-- Find the Total Sales
-- Find how many items are sold
-- Find the average selling price
-- Find the Total number of Orders
SELECT 
SUM(sales_amount) as TotalSales,
SUM(quantity) as Total_items_sold,
AVG(price) as AVG_Selling_Price,
count(Distinct order_number) as total_no_of_orders
from gold.fact_sales;

-- Find the total number of products
select Count(Distinct product_key) as Total_number_of_products from gold.dim_products

-- Find the total number of customers
SELECT Count(customer_KEY) AS TOTAL_CUSTOMERS FROM GOLD.dim_customers

-- Find the total number of customers that has placed an order.
SELECT Count(distinct customer_key) AS TOTAL_CUSTOMERS_PLACED_ORDER
FROM GOLD.fact_sales


--------------------------------------------------------------------------------
-- Generate a Report that shows all key metrics of the business

SELECT 'Total Sales' AS measure_name, 
       SUM(sales_amount) AS measure_value
FROM gold.fact_sales

UNION ALL

SELECT 'Total Quantity' AS measure_name, 
       SUM(quantity) AS measure_value
FROM gold.fact_sales

UNION ALL

SELECT 'Average Price' AS measure_name, 
       CAST(AVG(price) AS INT) AS measure_value   -- rounding like in image
FROM gold.fact_sales

UNION ALL

SELECT 'Total Nr. Orders' AS measure_name, 
       COUNT(DISTINCT order_number) AS measure_value
FROM gold.fact_sales

UNION ALL

SELECT 'Total Nr. Products' AS measure_name, 
       COUNT(DISTINCT product_key) AS measure_value
FROM gold.dim_products

UNION ALL

SELECT 'Total Nr. Customers' AS measure_name, 
       COUNT(customer_key) AS measure_value
FROM gold.dim_customers;

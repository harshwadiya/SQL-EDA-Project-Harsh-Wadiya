-------------------------------------------------------------------------------------				
					
							/*Date Exploration*/

-------------------------------------------------------------------------------------						
						

--Find the date of the first and last order 
-- How many months of sales data is available

select 
MIN(order_date) AS FIRST_ORDER,
MAX(order_date) AS lAST_ORDER,
DATEDIFF(MONTH,MIN(order_date) , MAX(order_date)) AS RANGE_IN_MONTHS
from gold.fact_sales;

--Find the youngest and oldest customer.
SELECT 
MIN(birthdate) as OLDEST_CUSTOMER,
DATEDIFF(YEAR,MIN(birthdate), GETDATE()) AS AGE_OF_OLDEST_CUSTOMER,
MAX(birthdate) as YOUNGEST_CUSTOMER,
DATEDIFF(YEAR,MAX(birthdate), GETDATE()) AS AGE_OF_YOUNGEST_CUSTOMER
from gold.dim_customers;

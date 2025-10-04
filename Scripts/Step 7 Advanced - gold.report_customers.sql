/*
===============================================================================
Customer Report
===============================================================================
Purpose:
    - This report consolidates key customer metrics and behaviors

Highlights:
    1. Gathers essential fields such as names, ages, and transaction details.
	2. Segments customers into categories (VIP, Regular, New) and age groups.
    3. Aggregates customer-level metrics:
	   - total orders
	   - total sales
	   - total quantity purchased
	   - total products
	   - lifespan (in months)
    4. Calculates valuable KPIs:
	    - recency (months since last order)
		- average order value
		- average monthly spend
===============================================================================
*/

-- =============================================================================
-- Create Report: gold.report_customers
-- =============================================================================

create view gold.report_customers as 
/*-----------------------------------------------------------------------------
1) Base Query - For retrieving core columns from the tables 
-------------------------------------------------------------------------------*/


WITH Base_Query as 
(
select 
f.order_number,f.product_key,f.order_date,f.sales_amount,f.quantity,
c.customer_key,c.customer_number,concat(c.first_name,' ', c.last_name )as customer_name,
DATEDIFF(YEAR,c.birthdate,GETDATE()) AS AGE
from gold.fact_sales as f
left join gold.dim_customers as c
on f.customer_key = c.customer_key
WHERE order_date IS NOT NULL
)

/*------------------------------------------------------------------------
2) Customer Aggregations: Summarizes key metrics at the customer level
---------------------------------------------------------------------------*/

, Customer_Aggregation as(
select 
customer_key,customer_number,customer_name,
AGE,

count(distinct order_number) as total_orders,
sum(sales_amount) as total_sales,
sum(quantity) as total_quantity_purchased,
count (distinct product_key) as total_products,
max(order_date) as last_order_date,
DATEDIFF(MONTH,MIN(order_date),MAX(order_date)) AS lifespan
from Base_Query
group by customer_key,customer_number,customer_name,
AGE )


select 
* ,
CASE
WHEN age < 20 THEN 'Under 20'
WHEN age Between 20 and 29 THEN '20-29'
WHEN age Between 30 and 39 THEN '30-39'
WHEN age Between 40 and 49 THEN '40-49'
ELSE '50 and above'
END AS age_group,
Case 
when lifespan >= 12 and total_sales > 5000 THEN 'VIP'
when lifespan >= 12 and total_sales <= 5000 THEN 'Regular'
Else 'new'
end as customer_segments,
Datediff(month, last_order_date,getdate()) as recency,

-- Compuate average order value (AVO)
CASE WHEN total_sales = 0 THEN 0
ELSE total_sales / total_orders
END AS avg_order_value,

--Compute Average Monthly Spends
CASE WHEN lifespan = 0 THEN total_sales
ELSE total_sales / lifespan
END AS avg_monthly_spend

from 
Customer_Aggregation



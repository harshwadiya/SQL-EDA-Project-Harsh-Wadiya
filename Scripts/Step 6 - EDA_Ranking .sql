-------------------------------------------------------------------------------------				
					
							/* EDA_RANKING */

-------------------------------------------------------------------------------------	


-- Which 5 products generate the highest revenue?
	SELECT * FROM GOLD.dim_products;
	SELECT * FROM GOLD.fact_sales

	SELECT TOP 5 P.product_name,SUM(F.sales_amount) AS REVENUE
	FROM GOLD.fact_sales AS F
	LEFT JOIN GOLD.dim_products AS P
	ON P.product_key = F.product_key
	GROUP BY P.product_name
	ORDER BY REVENUE DESC
-- What are the 5 worst-performing products in terms of sales?

	SELECT TOP 5 P.product_name,SUM(F.sales_amount) AS REVENUE
	FROM GOLD.fact_sales AS F
	LEFT JOIN GOLD.dim_products AS P
	ON P.product_key = F.product_key
	GROUP BY P.product_name
	ORDER BY REVENUE ASC

-- Find the top 10 customers who have generated the highest revenue
	SELECT TOP 10
			C.customer_key,
			C.first_name,
			SUM(F.SALES_AMOUNT) AS TOTAL_REVENUE_BY_CUSTOMER
			FROM GOLD.fact_sales AS F
			LEFT JOIN GOLD.dim_CUSTOMERS AS C
			ON C.customer_key = F.customer_key
			GROUP BY C.customer_key,C.first_name
			ORDER BY TOTAL_REVENUE_BY_CUSTOMER DESC;

-- The 3 customers with the fewest orders placed
			SELECT TOP 3
			c.customer_key,
			c.first_name,
			c.last_name,
			COUNT (DISTINCT order_number) AS total_orders
			FROM gold. fact_sales f
			LEFT JOIN gold.dim_customers c
			ON c.customer_key = f.customer_key
			GROUP BY
			c.customer_key,
			c.first_name,
			c.last_name
			ORDER BY total_orders
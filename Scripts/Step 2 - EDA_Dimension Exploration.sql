-------------------------------------------------------------------------------------				
					
						/*EDA - Dimensions Exploration */

-------------------------------------------------------------------------------------
	
	

--Explore All countries our customers Come From ..
SELECT DISTINCT COUNTRY FROM gold.dim_customers

-- Explore all Categories 'The major divisions'

SELECT DISTINCT Category, Subcategory, product_name
from gold.dim_products
order by 1,2,3;
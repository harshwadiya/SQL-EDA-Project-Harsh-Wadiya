-------------------------------------------------------------------------------------				
					
						/* DataBase Exploration */

-------------------------------------------------------------------------------------


--Explore all Objects in the Database .

SELECT * FROM INFORMATION_SCHEMA.TABLES;

--Explore all Columns From the Tables
SELECT * FROM INFORMATION_SCHEMA.COLUMNS

--Explore all Columns From any Particular Table.
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'dim_customers'
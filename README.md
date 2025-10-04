# SQL-EDA-Project-Harsh-Wadiya

# 📊 SQL Projects – Data Warehouse Analytics  

This repository contains SQL queries and reports built on top of the **`datawarehouseanalytics`** database.  
The project demonstrates **basic to advanced SQL concepts**, as well as **Exploratory Data Analysis (EDA)** using **MS SQL Server**.  

---

## 🚀 Project Overview  

- Practiced **SQL fundamentals**:  
  - `SELECT`, `WHERE`, `GROUP BY`, `ORDER BY`  
- Applied **aggregate functions**:  
  - `SUM()`, `AVG()`, `MIN()`, `MAX()`, `COUNT()`  
- Worked with **window functions**:  
  - `RANK()`, `ROW_NUMBER()`, `DENSE_RANK()`  
- Implemented **advanced SQL concepts**:  
  - **Common Table Expressions (CTEs)**  
  - **Views**  

---

## 📈 EDA Projects  

- **Basic EDA**: Initial exploration of product and customer datasets.  
- **Advanced EDA**: Deeper insights into sales, orders, and customer behaviors using analytical SQL queries.  

---

## 📑 Reports  

### 1️⃣ Product Report  

**Purpose**: Consolidates key product metrics and performance.  

**Highlights**:  
- Extracts **product details** (name, category, subcategory, cost).  
- Segments products into **High-Performers, Mid-Range, Low-Performers** based on revenue.  
- Aggregates:  
  - Total Orders  
  - Total Sales  
  - Total Quantity Sold  
  - Unique Customers  
  - Lifespan (months)  
- KPIs calculated:  
  - **Recency** (months since last sale)  
  - **Average Order Revenue (AOR)**  
  - **Average Monthly Revenue**  

📌 **Report Table**: `gold.report_products`  

---

### 2️⃣ Customer Report  

**Purpose**: Summarizes customer behavior and spending patterns.  

**Highlights**:  
- Captures customer details (name, age, transactions).  
- Segments customers into:  
  - **VIP, Regular, New**  
  - **Age Groups**  
- Aggregates:  
  - Total Orders  
  - Total Sales  
  - Total Quantity Purchased  
  - Total Products Bought  
  - Lifespan (months)  
- KPIs calculated:  
  - **Recency** (months since last order)  
  - **Average Order Value (AOV)**  
  - **Average Monthly Spend**  

📌 **Report Table**: `gold.report_customers`  

---

## 🛠️ Tools & Technologies  

- **SQL Server (MS SQL Server)**  
- **Data Warehouse Analytics Database**  
- SQL Concepts Used:  
  - Joins (INNER, LEFT, etc.)  
  - Aggregations & Window Functions  
  - CTEs and Views  

---

## 📂 Repository Structure  

```bash
📦 SQL-DataWarehouse-Analytics
 ┣ 📜 queries/              # SQL queries for practice
 ┣ 📜 eda_basic.sql         # Basic EDA queries
 ┣ 📜 eda_advanced.sql      # Advanced EDA queries
 ┣ 📜 product_report.sql    # Product Report
 ┣ 📜 customer_report.sql   # Customer Report
 ┗ 📜 README.md             # Documentation

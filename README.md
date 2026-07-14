# 🛒 E-Commerce Data Analysis using MySQL

## 📌 Project Overview

This project focuses on analyzing an E-Commerce database using MySQL to solve real-world business problems through SQL queries. The analysis covers customer behavior, product performance, sales trends, and revenue insights to support business decision-making.

The project demonstrates the practical application of SQL in extracting meaningful insights from relational databases using joins, aggregate functions, subqueries, Common Table Expressions (CTEs), and window functions.

---

## 🎯 Project Objectives

- Analyze customer purchasing behavior.
- Identify high-value markets and customer segments.
- Evaluate product performance and revenue trends.
- Monitor month-on-month sales and customer growth.
- Support inventory, marketing, and business strategy decisions using SQL.

---

## 🗂 Dataset

The project uses four relational tables:

| Table | Description |
|--------|-------------|
| **Customers** | Customer information including customer ID, name and location |
| **Orders** | Order details including customer ID, order date, and total amount |
| **OrderDetails** | Product-wise order information including quantity and price per unit |
| **Products** | Product information including category and product name |

---

## 🗄 Database Schema

```
Customers
----------
customer_id (PK)
customer_name
location
        │
        │ customer_id
        ▼
Orders
----------
order_id (PK)
customer_id (FK)
order_date
total_amount
        │
        │ order_id
        ▼
OrderDetails
--------------
order_id (FK)
product_id (FK)
quantity
price_per_unit
        │
        │ product_id
        ▼
Products
--------------
product_id (PK)
name
category
price
```

---

## 🛠 Tools & Technologies

- MySQL
- MySQL Workbench
- SQL
- GitHub

---

## 📚 SQL Concepts Used

- SELECT
- GROUP BY
- ORDER BY
- HAVING
- INNER JOIN
- Aggregate Functions (COUNT, SUM, AVG)
- DISTINCT
- Subqueries
- Common Table Expressions (CTEs)
- Window Functions (LAG)
- DATE_FORMAT()
- LIMIT

---

# 📊 Business Problems Solved

### Q1. Identify the top 3 cities with the highest number of customers to determine key markets for targeted marketing and logistic optimization.

**Concepts Used**

- GROUP BY
- COUNT()
- ORDER BY
- LIMIT

---

### Q2. Determine how many customers fall into each order frequency category based on the number of orders they have placed.

**Concepts Used**

- Subquery
- COUNT()
- GROUP BY

---

### Q3. Identify products where the average purchase quantity per order is 2 but with a high total revenue, suggesting premium product trends.

**Concepts Used**

- AVG()
- SUM()
- GROUP BY
- HAVING
- ORDER BY

---

### Q4. For each product category, calculate the unique number of customers purchasing from it.

**Objective**

Understand which product categories have wider appeal across the customer base.

**Concepts Used**

- INNER JOIN
- COUNT(DISTINCT)
- GROUP BY

---

### Q5. Analyze the month-on-month percentage change in total sales to identify growth trends.

**Concepts Used**

- DATE_FORMAT()
- SUM()
- Window Function (LAG)
- Subquery

---

### Q6. Examining how the average order value changes month-on-month. Insights can guide pricing and promotional strategies to enhance order value.

**Concepts Used**

- Common Table Expression (CTE)
- AVG()
- Window Function (LAG)

---

### Q7. Based on sales data, identify products with the fastest turnover rates, suggesting high demand and the need for frequent restocking.

**Concepts Used**

- COUNT()
- GROUP BY
- ORDER BY
- LIMIT

---

### Q8. List products purchased by less than 40% of the customer base, indicating potential mismatches between inventory and customer interest.

**Concepts Used**

- INNER JOIN
- COUNT(DISTINCT)
- HAVING
- Subquery

---

### Q9. Evaluate the month-on-month growth rate in the customer base to understand the effectiveness of marketing campaigns and market expansion efforts.

**Concepts Used**

- Common Table Expression (CTE)
- MIN()
- DATE_FORMAT()
- GROUP BY

---

### Q10. Identify the months with the highest sales volume, aiding in planning for stock levels, marketing efforts, and staffing in anticipation of peak demand periods.

**Concepts Used**

- SUM()
- DATE_FORMAT()
- GROUP BY
- ORDER BY
- LIMIT

---

# 📈 Key Business Insights

- Identified the top customer locations for targeted marketing and logistics planning.
- Analyzed customer ordering patterns to understand purchasing frequency.
- Identified premium products generating high revenue with moderate purchase quantities.
- Evaluated customer interest across different product categories.
- Tracked month-on-month sales trends to monitor business growth.
- Examined changes in average order value to support pricing strategies.
- Identified high-demand products for inventory planning and replenishment.
- Highlighted products with low customer reach for inventory optimization.
- Monitored customer acquisition trends over time.
- Determined peak sales months for improved demand forecasting and resource planning.

---

# 💡 Skills Demonstrated

- SQL Query Writing
- Relational Database Management
- Data Aggregation
- Business Analytics
- Customer Segmentation
- Sales Trend Analysis
- Revenue Analysis
- Product Performance Analysis
- Window Functions
- Data-Driven Decision Making

---

# 📂 Project Structure

```
E-Commerce-Data-Analysis/
│
├── Customers.csv
├── Orders.csv
├── OrderDetails.csv
├── Products.csv
│
├── Ecommerce_SQL_Analysis.sql
│
│
└── README.md
```

---

# 🚀 Learning Outcomes

Through this project, I gained hands-on experience in:

- Writing SQL queries to solve real-world business problems.
- Performing customer, product, and sales analysis.
- Working with relational databases and multiple table joins.
- Using aggregate functions and window functions for analytical reporting.
- Converting business requirements into SQL-based analytical solutions.
- Extracting actionable insights to support business decision-making.

---

## 👨‍💻 Author

**Mithun M**

Aspiring Data Analyst | Biomedical Engineering Graduate

### Technical Skills

- SQL
- Python
- Excel
- Power BI
- Data Analysis
- Data Visualization

---

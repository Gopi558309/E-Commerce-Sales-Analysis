# E-Commerce Sales Analysis

## 📊 Project Overview

This project is an end-to-end **E-Commerce Sales Analysis** performed using **MySQL** and **Microsoft Excel**. The objective was to analyze 10,000 e-commerce transactions and transform raw sales data into meaningful business insights through SQL analysis and an interactive Excel dashboard.

The project focuses on customer behavior, product performance, category analysis, payment methods, order status, sales trends, and advanced SQL techniques such as **CTEs, RANK(), and LAG()**.

---

## 🎯 Project Objectives

* Analyze overall business performance using SQL.
* Calculate key performance indicators (KPIs).
* Understand customer purchasing behavior.
* Identify top-performing products and categories.
* Analyze payment methods and order statuses.
* Study monthly sales trends using time-series analysis.
* Perform data quality validation.
* Create an Excel dashboard to visualize important business insights.

---

## 🛠️ Tools Used

* **MySQL**
* **MySQL Workbench**
* **Microsoft Excel**
* **CSV Dataset**

---

## 📁 Repository Structure

```text
E-Commerce-Sales-Analysis
│
├── SQL
│   ├── E_Commerce_Sales Analysis.sql
│   ├── ecommerce_sales_analysis.sql
│   ├── SQL File 3.sql
│   ├── SQL File 4.sql
│   ├── SQL File 5.sql
│   ├── SQL File 6.sql
│   ├── SQL File 7.sql
│   └── SQL File 8.sql
│
├── Documentation
│   └── E-Commerce Sales Analysis - Project Report.docx
│
├── Dashboard
│   └── E-Commerce Sales Dashboard.xlsx
│
└── README.md
```

> **Note:** The dataset is not included in this repository.

---

## 📌 Dataset Summary

* **Total Records:** 10,000
* **Unique Customers:** 4,327
* **Order Period:** August 2022 – August 2025
* **Product Categories:** 6
* **Countries Covered:** 10
* **Payment Methods:** 3
* **Order Statuses:** 5

---

## 📈 Key Performance Indicators

| KPI                 |     Value |
| ------------------- | --------: |
| Total Orders        |    10,000 |
| Unique Customers    |     4,327 |
| Total Order Value   | 7,450,763 |
| Average Order Value |    745.08 |

---

## 🔍 SQL Analysis Performed

### Data Exploration

* Dataset inspection
* Record count validation
* Distinct values analysis
* Date range validation

### Product & Category Analysis

* Orders by category
* Revenue by category
* Average order value by category
* Top-performing products
* Product ranking using `RANK()`

### Customer Analysis

* Unique customer analysis
* Top customers by revenue
* Customer segmentation using purchase frequency
* Repeat vs Frequent vs One-time customer analysis

### Order & Payment Analysis

* Order status distribution
* Payment method distribution
* Cancellation analysis
* Delivery performance by category
* Country-wise performance

### Time-Series Analysis

* Monthly order volume
* Monthly order value
* Month-over-month revenue comparison using `LAG()`

### Advanced SQL

* Common Table Expressions (CTEs)
* Window Functions
* `RANK()`
* `LAG()`
* Conditional aggregation
* Data quality checks

---

## 💡 Key Business Insights

* **Electronics** generated the highest order volume and total order value.
* **Repeat customers** contributed the highest overall revenue.
* **Frequent customers** had the highest average customer value.
* **iPhone 14** was the highest revenue-generating product.
* **Books** recorded the highest cancellation rate among categories.
* **Cash on Delivery** was the most frequently used payment method.
* Monthly sales showed fluctuating performance across the three-year period rather than a consistent upward or downward trend.
* Data quality checks confirmed **10,000 unique order IDs**, **0 duplicate rows**, and **no NULL values** in the validated columns.

---

## 📊 Dashboard

The Excel dashboard includes:

* KPI Cards
* Total Order Value by Category
* Customers by Segment
* Order Status Distribution
* Payment Method Distribution
* Monthly Order Value Trend
* Top 10 Products by Order Value
* Order Value by Country

The dashboard was created using **Microsoft Excel** based on the SQL analysis results.

---

## 🧹 Data Quality Validation

The following checks were performed using SQL:

* Duplicate Order ID validation
* NULL value validation
* Quantity range verification
* Unit price range verification
* Rating range verification
* Order date range verification
* Distinct order status validation
* Distinct payment method validation
* Distinct category validation

### Validation Results

| Check            | Result |
| ---------------- | ------ |
| Total Records    | 10,000 |
| Unique Order IDs | 10,000 |
| Duplicate Rows   | 0      |
| Missing Values   | 0      |
| Quantity Range   | 1–5    |
| Unit Price Range | 25–999 |
| Rating Range     | 1–5    |

---

## 🚀 Skills Demonstrated

* SQL Aggregation
* GROUP BY & ORDER BY
* Filtering & Sorting
* CASE Statements
* Subqueries
* Common Table Expressions (CTEs)
* Window Functions
* RANK()
* LAG()
* Customer Segmentation
* Time-Series Analysis
* Business KPI Analysis
* Excel Dashboard Development
* Data Quality Validation

---

## 👤 Author

**Gopichandu Batta**

Aspiring Data Analyst | SQL | Excel | Data Analytics

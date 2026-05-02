# 📊 E-Commerce Customer Intelligence & Sales Optimization

## 🚀 Project Overview
This project focuses on analyzing e-commerce transaction data to extract meaningful business insights. It demonstrates an end-to-end data analytics workflow including data cleaning, SQL-based analysis, customer segmentation, and market basket analysis.

The project uses a real-world retail dataset and transforms raw data into actionable insights using PostgreSQL and Python.

---

## 📁 Dataset
- Source: Online Retail Dataset  
- Total Records: 541,909  
- Cleaned Records: 397,884  

### 🔹 Data Cleaning Steps
- Removed null customer IDs (135,080 rows)  
- Removed return transactions (8,905 rows)  
- Removed zero-price entries (40 rows)  

---

## 🛠️ Tech Stack
- Excel → Data Cleaning  
- PostgreSQL → Data Storage & SQL Analysis  
- Python → Market Basket Analysis  
- Libraries → Pandas, NumPy, Mlxtend  

---

## 🧠 Key Features

### 🔹 SQL Analysis
- Total Revenue, Orders, and Customers calculation  
- Top 10 revenue-generating products  
- Country-wise sales analysis  
- Monthly revenue trend analysis  
- Customer purchase behavior  

### 🔹 Customer Segmentation
- RFM Analysis (Recency, Frequency, Monetary)  
- Identification of high-value, loyal, and low-value customers  

### 🔹 Market Basket Analysis
- Apriori Algorithm implementation  
- Association rule mining  
- Metrics: Support, Confidence, Lift  
- Identification of frequently bought-together products  

---

## 📊 Key SQL Queries

sql
-- Total revenue
SELECT SUM(revenue) FROM retail_analysis.retail_sales;

-- Total orders
SELECT COUNT(DISTINCT invoice_no) FROM retail_analysis.retail_sales;

-- Top products
SELECT description, SUM(revenue)
FROM retail_analysis.retail_sales
GROUP BY description
ORDER BY SUM(revenue) DESC
LIMIT 10;

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

🧠 Analytical Views Created

The project uses SQL views to build an analytics layer:

sales_summary → Overall KPIs
product_performance → Product insights
country_sales → Geographic analysis
monthly_sales → Sales trends
customer_rfm → Customer segmentation
customer_clv → Customer lifetime value

📊 Key Insights
Top 20% customers contribute majority of revenue
United Kingdom generates the highest sales
Certain products consistently dominate revenue
Repeat customers generate higher lifetime value
Strong product associations identified using market basket analysis

🗂️ Project Structure
Ecommerce-Customer-Intelligence/
├── data/
│   ├── raw/
│   └── processed/
├── sql/
│   ├── database_setup.sql
│   ├── table_creation.sql
│   ├── data_analysis.sql
│   ├── views.sql
├── python/
│   ├── basket_analysis.py
│   └── requirements.txt
├── output/
├── docs/
└── README.md

▶️ How to Run
🔹 1. SQL Setup
Create database using database_setup.sql
Create schema & table using table_creation.sql
Import cleaned dataset
Run views.sql to generate analytics views

🔹 2. Python Analysis
pip install -r python/requirements.txt
python python/basket_analysis.py

📌 Output
Cleaned dataset (397K records)
SQL-based analytics results
Customer segmentation (RFM)
Market Basket Analysis (association rules)

🚀 Future Improvements
Add Power BI interactive dashboard
Implement real-time data pipeline
Add machine learning models (churn prediction, recommendation system)

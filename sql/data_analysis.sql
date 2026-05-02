-- =====================================================
-- BASIC DATA OVERVIEW
-- =====================================================

-- Total number of records
SELECT COUNT(*) AS total_rows
FROM retail_analysis.retail_sales;

-- Total revenue generated
SELECT SUM(revenue) AS total_revenue
FROM retail_analysis.retail_sales;

-- Total unique orders
SELECT COUNT(DISTINCT invoice_no) AS total_orders
FROM retail_analysis.retail_sales;

-- Total unique customers
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM retail_analysis.retail_sales;

-- =====================================================
-- PRODUCT ANALYSIS
-- =====================================================

-- Top 10 revenue-generating products
SELECT 
    description,
    SUM(revenue) AS total_revenue
FROM retail_analysis.retail_sales
GROUP BY description
ORDER BY total_revenue DESC
LIMIT 10;

-- =====================================================
-- COUNTRY ANALYSIS
-- =====================================================

-- Revenue by country
SELECT 
    country,
    SUM(revenue) AS total_revenue
FROM retail_analysis.retail_sales
GROUP BY country
ORDER BY total_revenue DESC;

-- =====================================================
-- TIME SERIES ANALYSIS
-- =====================================================

-- Monthly revenue trend
SELECT 
    DATE_TRUNC('month', invoice_date) AS month,
    SUM(revenue) AS monthly_revenue
FROM retail_analysis.retail_sales
GROUP BY month
ORDER BY month;

-- =====================================================
-- CUSTOMER ANALYSIS
-- =====================================================

-- Top 10 customers by spending
SELECT 
    customer_id,
    SUM(revenue) AS total_spent
FROM retail_analysis.retail_sales
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;

-- Customer purchase frequency
SELECT 
    customer_id,
    COUNT(DISTINCT invoice_no) AS purchase_frequency
FROM retail_analysis.retail_sales
GROUP BY customer_id
ORDER BY purchase_frequency DESC;

-- =====================================================
-- DATA EXPORT FOR PYTHON
-- =====================================================

-- Dataset for Market Basket Analysis
SELECT
    invoice_no,
    description,
    quantity
FROM retail_analysis.retail_sales; 
--sample changee--
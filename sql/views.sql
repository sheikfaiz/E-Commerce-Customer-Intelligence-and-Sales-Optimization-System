-- =====================================================
-- SALES SUMMARY VIEW
-- =====================================================

CREATE VIEW retail_analysis.sales_summary AS
SELECT
    COUNT(DISTINCT invoice_no) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    SUM(quantity) AS total_items_sold,
    SUM(revenue) AS total_revenue,
    SUM(revenue) / COUNT(DISTINCT invoice_no) AS avg_order_value
FROM retail_analysis.retail_sales;

-- =====================================================
-- PRODUCT PERFORMANCE
-- =====================================================

CREATE VIEW retail_analysis.product_performance AS
SELECT
    description,
    SUM(quantity) AS total_quantity,
    SUM(revenue) AS total_revenue
FROM retail_analysis.retail_sales
GROUP BY description
ORDER BY total_revenue DESC;

-- =====================================================
-- COUNTRY SALES
-- =====================================================

CREATE VIEW retail_analysis.country_sales AS
SELECT
    country,
    SUM(revenue) AS total_revenue,
    COUNT(DISTINCT invoice_no) AS total_orders
FROM retail_analysis.retail_sales
GROUP BY country
ORDER BY total_revenue DESC;

-- =====================================================
-- CUSTOMER VALUE
-- =====================================================

CREATE VIEW retail_analysis.customer_value AS
SELECT
    customer_id,
    COUNT(DISTINCT invoice_no) AS total_orders,
    SUM(revenue) AS lifetime_value
FROM retail_analysis.retail_sales
GROUP BY customer_id;

-- =====================================================
-- MONTHLY SALES
-- =====================================================

CREATE VIEW retail_analysis.monthly_sales AS
SELECT
    DATE_TRUNC('month', invoice_date) AS month,
    SUM(revenue) AS monthly_revenue
FROM retail_analysis.retail_sales
GROUP BY month
ORDER BY month;

-- =====================================================
-- RFM ANALYSIS
-- =====================================================

CREATE VIEW retail_analysis.customer_rfm AS
SELECT
    customer_id,
    DATE_PART('day', CURRENT_DATE - MAX(invoice_date)) AS recency,
    COUNT(DISTINCT invoice_no) AS frequency,
    SUM(revenue) AS monetary
FROM retail_analysis.retail_sales
GROUP BY customer_id;

-- =====================================================
-- CUSTOMER LIFETIME VALUE
-- =====================================================

CREATE VIEW retail_analysis.customer_clv AS
SELECT
    customer_id,
    COUNT(DISTINCT invoice_no) AS total_orders,
    SUM(revenue) AS lifetime_value,
    AVG(revenue) AS avg_order_value
FROM retail_analysis.retail_sales
GROUP BY customer_id;
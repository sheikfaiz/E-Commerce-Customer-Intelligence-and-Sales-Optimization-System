CREATE SCHEMA retail_analysis;

CREATE TABLE retail_analysis.retail_sales (
invoice_no VARCHAR(20),
stock_code VARCHAR(20),
description TEXT,
quantity INT,
invoice_date TIMESTAMP,
unit_price NUMERIC,
customer_id INT,
country VARCHAR(50),
revenue NUMERIC
);
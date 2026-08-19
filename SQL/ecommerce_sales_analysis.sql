-- =========================================================
-- PROJECT 2: E-COMMERCE SALES ANALYSIS
-- =========================================================
-- Database: retail_sales_analysis
-- Table: ecommerce_sales
-- Tool: MySQL Workbench
-- Dataset: ecommerce_dataset_10000.csv
-- Records: 10,000
-- =========================================================


USE retail_sales_analysis;
-- =========================================================
-- 1. DATA EXPLORATION
-- =========================================================
SELECT COUNT(*) AS total_records
FROM ecommerce_sales;
SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM ecommerce_sales;
SELECT COUNT(DISTINCT order_id) AS unique_orders
FROM ecommerce_sales;
SELECT COUNT(DISTINCT country) AS unique_countries
FROM ecommerce_sales;
-- =========================================================
-- 2. PRODUCT & CATEGORY ANALYSIS
-- =========================================================

-- 2.1 Number of orders by country
SELECT
    country,
    COUNT(*) AS total_orders
FROM ecommerce_sales
GROUP BY country
ORDER BY total_orders DESC;


-- 2.2 Number of orders by category
SELECT
    category,
    COUNT(*) AS total_orders
FROM ecommerce_sales
GROUP BY category
ORDER BY total_orders DESC;


-- 2.3 Total order value by category
SELECT
    category,
    ROUND(SUM(quantity * unit_price), 2) AS total_revenue
FROM ecommerce_sales
GROUP BY category
ORDER BY total_revenue DESC;


-- 2.4 Average order value by category
SELECT
    category,
    ROUND(AVG(quantity * unit_price), 2) AS average_order_value
FROM ecommerce_sales
GROUP BY category
ORDER BY average_order_value DESC;


-- 2.5 Top 10 products by total order value
SELECT
    product_name,
    category,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(quantity * unit_price), 2) AS total_revenue
FROM ecommerce_sales
GROUP BY product_name, category
ORDER BY total_revenue DESC
LIMIT 10;
-- =========================================================
-- 3. CUSTOMER ANALYSIS
-- =========================================================

-- 3.1 Top 10 customers by number of orders
SELECT
    customer_id,
    COUNT(*) AS total_orders
FROM ecommerce_sales
GROUP BY customer_id
ORDER BY total_orders DESC
LIMIT 10;


-- 3.2 Top 10 customers by total order value
SELECT
    customer_id,
    COUNT(*) AS total_orders,
    ROUND(SUM(quantity * unit_price), 2) AS total_revenue
FROM ecommerce_sales
GROUP BY customer_id
ORDER BY total_revenue DESC
LIMIT 10;


-- 3.3 Customer segmentation based on order frequency
SELECT
    CASE
        WHEN total_orders = 1 THEN 'One-time'
        WHEN total_orders BETWEEN 2 AND 3 THEN 'Repeat'
        ELSE 'Frequent'
    END AS customer_segment,
    COUNT(*) AS number_of_customers
FROM (
    SELECT
        customer_id,
        COUNT(*) AS total_orders
    FROM ecommerce_sales
    GROUP BY customer_id
) AS customer_orders
GROUP BY customer_segment
ORDER BY number_of_customers DESC;


-- 3.4 Revenue contribution by customer segment
SELECT
    CASE
        WHEN total_orders = 1 THEN 'One-time'
        WHEN total_orders BETWEEN 2 AND 3 THEN 'Repeat'
        ELSE 'Frequent'
    END AS customer_segment,
    COUNT(*) AS number_of_customers,
    ROUND(SUM(total_revenue), 2) AS total_revenue,
    ROUND(AVG(total_revenue), 2) AS avg_customer_revenue
FROM (
    SELECT
        customer_id,
        COUNT(*) AS total_orders,
        SUM(quantity * unit_price) AS total_revenue
    FROM ecommerce_sales
    GROUP BY customer_id
) AS customer_data
GROUP BY customer_segment
ORDER BY total_revenue DESC;
-- =========================================================
-- 4. ORDER STATUS & PAYMENT ANALYSIS
-- =========================================================

-- 4.1 Order distribution by status
SELECT
    order_status,
    COUNT(*) AS total_orders
FROM ecommerce_sales
GROUP BY order_status
ORDER BY total_orders DESC;


-- 4.2 Order status by category
SELECT
    category,
    order_status,
    COUNT(*) AS total_orders
FROM ecommerce_sales
GROUP BY category, order_status
ORDER BY category, total_orders DESC;


-- 4.3 Cancellation rate by category
SELECT
    category,
    COUNT(*) AS total_orders,
    SUM(order_status = 'Cancelled') AS cancelled_orders,
    ROUND(
        SUM(order_status = 'Cancelled') * 100.0 / COUNT(*),
        2
    ) AS cancellation_rate
FROM ecommerce_sales
GROUP BY category
ORDER BY cancellation_rate DESC;


-- 4.4 Orders by payment method
SELECT
    payment_method,
    COUNT(*) AS total_orders
FROM ecommerce_sales
GROUP BY payment_method
ORDER BY total_orders DESC;


-- 4.5 Payment method by country
SELECT
    country,
    payment_method,
    COUNT(*) AS total_orders
FROM ecommerce_sales
GROUP BY country, payment_method
ORDER BY country, total_orders DESC;


-- 4.6 Average rating by category
SELECT
    category,
    ROUND(AVG(rating), 2) AS average_rating,
    COUNT(*) AS total_orders
FROM ecommerce_sales
GROUP BY category
ORDER BY average_rating DESC;


-- 4.7 Revenue associated with each order status
SELECT
    order_status,
    COUNT(*) AS total_orders,
    ROUND(SUM(quantity * unit_price), 2) AS order_value
FROM ecommerce_sales
GROUP BY order_status
ORDER BY order_value DESC;


-- 4.8 Cancelled and returned order value by category
SELECT
    category,
    SUM(order_status = 'Cancelled') AS cancelled_orders,
    ROUND(
        SUM(
            CASE
                WHEN order_status = 'Cancelled'
                THEN quantity * unit_price
                ELSE 0
            END
        ), 2
    ) AS cancelled_value,
    SUM(order_status = 'Returned') AS returned_orders,
    ROUND(
        SUM(
            CASE
                WHEN order_status = 'Returned'
                THEN quantity * unit_price
                ELSE 0
            END
        ), 2
    ) AS returned_value
FROM ecommerce_sales
GROUP BY category
ORDER BY cancelled_value DESC;


-- 4.9 Cancelled and returned order value rate by category
SELECT
    category,
    ROUND(SUM(quantity * unit_price), 2) AS total_value,
    ROUND(
        SUM(
            CASE
                WHEN order_status IN ('Cancelled', 'Returned')
                THEN quantity * unit_price
                ELSE 0
            END
        ), 2
    ) AS cancelled_returned_value,
    ROUND(
        SUM(
            CASE
                WHEN order_status IN ('Cancelled', 'Returned')
                THEN quantity * unit_price
                ELSE 0
            END
        ) * 100.0 / SUM(quantity * unit_price),
        2
    ) AS cancelled_returned_rate
FROM ecommerce_sales
GROUP BY category
ORDER BY cancelled_returned_rate DESC;
-- =========================================================
-- 5. TIME-SERIES ANALYSIS
-- =========================================================

-- 5.1 Monthly order volume
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS order_month,
    COUNT(*) AS total_orders
FROM ecommerce_sales
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY order_month;


-- 5.2 Monthly order value
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS order_month,
    ROUND(SUM(quantity * unit_price), 2) AS total_revenue
FROM ecommerce_sales
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY order_month;


-- 5.3 Month-over-month revenue change
WITH monthly_revenue AS (
    SELECT
        DATE_FORMAT(order_date, '%Y-%m') AS order_month,
        SUM(quantity * unit_price) AS total_revenue
    FROM ecommerce_sales
    GROUP BY DATE_FORMAT(order_date, '%Y-%m')
)
SELECT
    order_month,
    ROUND(total_revenue, 2) AS total_revenue,
    ROUND(
        LAG(total_revenue) OVER (ORDER BY order_month),
        2
    ) AS previous_month_revenue,
    ROUND(
        total_revenue
        - LAG(total_revenue) OVER (ORDER BY order_month),
        2
    ) AS revenue_change
FROM monthly_revenue
ORDER BY order_month;
-- =========================================================
-- 6. ADVANCED SQL ANALYSIS
-- =========================================================

-- 6.1 Top 3 products by revenue within each category
WITH product_revenue AS (
    SELECT
        category,
        product_name,
        SUM(quantity * unit_price) AS total_revenue
    FROM ecommerce_sales
    GROUP BY category, product_name
),
ranked_products AS (
    SELECT
        category,
        product_name,
        ROUND(total_revenue, 2) AS total_revenue,
        RANK() OVER (
            PARTITION BY category
            ORDER BY total_revenue DESC
        ) AS revenue_rank
    FROM product_revenue
)
SELECT
    category,
    product_name,
    total_revenue,
    revenue_rank
FROM ranked_products
WHERE revenue_rank <= 3
ORDER BY category, revenue_rank;


-- 6.2 Delivery performance by category
SELECT
    category,
    COUNT(*) AS total_orders,
    SUM(order_status = 'Delivered') AS delivered_orders,
    SUM(order_status = 'Cancelled') AS cancelled_orders,
    SUM(order_status = 'Returned') AS returned_orders,
    ROUND(
        SUM(order_status = 'Delivered') * 100.0 / COUNT(*),
        2
    ) AS delivery_rate
FROM ecommerce_sales
GROUP BY category
ORDER BY delivery_rate DESC;
-- =========================================================
-- 7. DATA QUALITY CHECKS
-- =========================================================

-- 7.1 Check for duplicate order IDs
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT order_id) AS unique_order_ids,
    COUNT(*) - COUNT(DISTINCT order_id) AS duplicate_order_rows
FROM ecommerce_sales;


-- 7.2 Check for NULL values
SELECT
    SUM(customer_id IS NULL) AS missing_customer_id,
    SUM(first_name IS NULL) AS missing_first_name,
    SUM(last_name IS NULL) AS missing_last_name,
    SUM(gender IS NULL) AS missing_gender,
    SUM(age_group IS NULL) AS missing_age_group,
    SUM(signup_date IS NULL) AS missing_signup_date,
    SUM(country IS NULL) AS missing_country,
    SUM(product_id IS NULL) AS missing_product_id,
    SUM(product_name IS NULL) AS missing_product_name,
    SUM(category IS NULL) AS missing_category,
    SUM(quantity IS NULL) AS missing_quantity,
    SUM(unit_price IS NULL) AS missing_unit_price,
    SUM(order_id IS NULL) AS missing_order_id,
    SUM(order_date IS NULL) AS missing_order_date,
    SUM(order_status IS NULL) AS missing_order_status,
    SUM(payment_method IS NULL) AS missing_payment_method,
    SUM(rating IS NULL) AS missing_rating,
    SUM(review_text IS NULL) AS missing_review_text,
    SUM(review_id IS NULL) AS missing_review_id,
    SUM(review_date IS NULL) AS missing_review_date
FROM ecommerce_sales;


-- 7.3 Check numeric and date ranges
SELECT
    MIN(quantity) AS min_quantity,
    MAX(quantity) AS max_quantity,
    MIN(unit_price) AS min_unit_price,
    MAX(unit_price) AS max_unit_price,
    MIN(rating) AS min_rating,
    MAX(rating) AS max_rating,
    MIN(order_date) AS earliest_order_date,
    MAX(order_date) AS latest_order_date
FROM ecommerce_sales;


-- 7.4 Check available order statuses
SELECT DISTINCT order_status
FROM ecommerce_sales;


-- 7.5 Check available payment methods
SELECT DISTINCT payment_method
FROM ecommerce_sales;


-- 7.6 Check available product categories
SELECT DISTINCT category
FROM ecommerce_sales;
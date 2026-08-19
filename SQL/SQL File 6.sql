SELECT
    country,
    COUNT(*) AS total_orders,
    ROUND(SUM(quantity * unit_price), 2) AS total_revenue,
    ROUND(AVG(quantity * unit_price), 2) AS avg_order_value
FROM ecommerce_sales
GROUP BY country
ORDER BY total_revenue DESC;
SELECT
    order_status,
    COUNT(*) AS total_orders,
    ROUND(SUM(quantity * unit_price), 2) AS total_revenue
FROM ecommerce_sales
GROUP BY order_status
ORDER BY total_revenue DESC;
SELECT
    category,
    SUM(order_status = 'Cancelled') AS cancelled_orders,
    ROUND(
        SUM(CASE
            WHEN order_status = 'Cancelled'
            THEN quantity * unit_price
            ELSE 0
        END), 2
    ) AS cancelled_value,
    SUM(order_status = 'Returned') AS returned_orders,
    ROUND(
        SUM(CASE
            WHEN order_status = 'Returned'
            THEN quantity * unit_price
            ELSE 0
        END), 2
    ) AS returned_value
FROM ecommerce_sales
GROUP BY category
ORDER BY cancelled_value DESC;
SELECT
    category,
    ROUND(SUM(quantity * unit_price), 2) AS total_value,
    ROUND(
        SUM(CASE
            WHEN order_status IN ('Cancelled', 'Returned')
            THEN quantity * unit_price
            ELSE 0
        END), 2
    ) AS cancelled_returned_value,
    ROUND(
        SUM(CASE
            WHEN order_status IN ('Cancelled', 'Returned')
            THEN quantity * unit_price
            ELSE 0
        END) * 100.0 / SUM(quantity * unit_price),
        2
    ) AS cancelled_returned_rate
FROM ecommerce_sales
GROUP BY category
ORDER BY cancelled_returned_rate DESC;
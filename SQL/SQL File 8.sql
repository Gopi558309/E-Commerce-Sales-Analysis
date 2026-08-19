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
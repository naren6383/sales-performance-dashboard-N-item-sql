-- Query 3: Best-selling product per month
WITH monthly_sales AS (
  SELECT
    DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
    oi.product_id,
    SUM(oi.price) AS monthly_revenue
  FROM orders o
  JOIN order_items oi ON o.order_id = oi.order_id
  GROUP BY DATE_TRUNC('month', o.order_purchase_timestamp), oi.product_id
),
ranked AS (
  SELECT *,
    ROW_NUMBER() OVER (PARTITION BY month ORDER BY monthly_revenue DESC) AS rn
  FROM monthly_sales
)
SELECT * FROM ranked WHERE rn = 1
ORDER BY month;
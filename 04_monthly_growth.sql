-- Query 4 (Bonus): Month-over-month revenue growth
WITH monthly_total AS (
  SELECT DATE_TRUNC('month', o.order_purchase_timestamp) AS month, SUM(oi.price) AS revenue
  FROM orders o
  JOIN order_items oi ON o.order_id = oi.order_id
  GROUP BY 1
)
SELECT
  month,
  revenue,
  LAG(revenue) OVER (ORDER BY month) AS prev_month_revenue,
  revenue - LAG(revenue) OVER (ORDER BY month) AS growth
FROM monthly_total
ORDER BY month;
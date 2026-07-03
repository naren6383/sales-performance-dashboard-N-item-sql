-- Query 1: Top 5 products per category
WITH sales_base AS (
  SELECT
    p.product_category_name AS category,
    oi.product_id,
    oi.price AS revenue
  FROM order_items oi
  JOIN products p ON oi.product_id = p.product_id
),
product_totals AS (
  SELECT category, product_id, SUM(revenue) AS total_revenue
  FROM sales_base
  GROUP BY category, product_id
),
ranked AS (
  SELECT *,
    RANK() OVER (PARTITION BY category ORDER BY total_revenue DESC) AS rnk
  FROM product_totals
)
SELECT * FROM ranked WHERE rnk <= 5
ORDER BY category, rnk;
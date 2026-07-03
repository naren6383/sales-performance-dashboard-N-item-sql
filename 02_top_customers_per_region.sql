-- Query 2: Top 3 customers per region
WITH customer_sales AS (
  SELECT
    c.customer_state AS region,
    o.customer_id,
    SUM(oi.price) AS total_spend
  FROM orders o
  JOIN order_items oi ON o.order_id = oi.order_id
  JOIN customers c ON o.customer_id = c.customer_id
  GROUP BY c.customer_state, o.customer_id
),
ranked_customers AS (
  SELECT *,
    DENSE_RANK() OVER (PARTITION BY region ORDER BY total_spend DESC) AS customer_rank
  FROM customer_sales
)
SELECT * FROM ranked_customers WHERE customer_rank <= 3
ORDER BY region, customer_rank;
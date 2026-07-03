# Sales Performance Dashboard — Top-N Analysis (SQL)

SQL project using PostgreSQL window functions to answer common business 
"Top-N per group" questions on real e-commerce sales data.

## Dataset
Olist Brazilian E-Commerce dataset (Kaggle) — 99,441 customers, 99,441 orders, 
112,650 order items, 32,951 products.

## Business Questions Answered
1. **Top 5 best-selling products per category** — helps product managers 
   monitor inventory and evaluate category performance.
2. **Top 3 highest-spending customers per region** — helps identify key 
   customers for targeted marketing.
3. **Best-selling product per month** — tracks monthly sales trends.
4. **Month-over-month revenue growth** (bonus) — tracks overall business trend.

## Concepts Used
- Window Functions: `RANK()`, `DENSE_RANK()`, `ROW_NUMBER()`, `LAG()`
- `PARTITION BY` for group-wise ranking
- CTEs (`WITH` clause) for clean, multi-step queries
- Aggregate functions and `DATE_TRUNC()` for time-based grouping

## RANK() vs DENSE_RANK() vs ROW_NUMBER()

| Function | Ties get same rank? | Skips numbers after tie? | Use case |
|---|---|---|---|
| RANK() | Yes | Yes | Leaderboards, natural ranking |
| DENSE_RANK() | Yes | No | Top-N distinct groups |
| ROW_NUMBER() | No (always unique) | N/A | Deduplication, exact single row |

## Files
- `01_top_products_per_category.sql`
- `02_top_customers_per_region.sql`
- `03_best_product_per_month.sql`
- `04_monthly_growth.sql`

## Tech Stack
PostgreSQL, SQL

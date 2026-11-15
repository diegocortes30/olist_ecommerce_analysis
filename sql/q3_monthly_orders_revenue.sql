-- Q3: How do monthly orders and revenue evolve over time?
-- Assumptions: months from 2017-01 to 2018-08 (complete months); canceled and unavailable orders excluded;
-- revenue = sum of price.
SELECT strftime('%Y-%m', o.order_purchase_timestamp) AS year_month,
       COUNT(DISTINCT o.order_id) AS orders,
       ROUND(SUM(oi.price), 2) AS revenue,
       ROUND(SUM(oi.price) / COUNT(DISTINCT o.order_id), 2) AS revenue_per_order
FROM orders AS o
JOIN order_items AS oi
  ON o.order_id = oi.order_id
WHERE o.order_status NOT IN ('unavailable', 'canceled')
  AND o.order_purchase_timestamp >= '2017-01-01'
  AND o.order_purchase_timestamp < '2018-09-01'
GROUP BY year_month
ORDER BY year_month

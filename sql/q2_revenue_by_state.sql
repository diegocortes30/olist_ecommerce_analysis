-- Q2: Which customer states generate the most revenue?
-- Assumptions: revenue = sum of price (shipping excluded); canceled and unavailable orders are excluded.
SELECT c.customer_state,
       COUNT(DISTINCT o.order_id) AS orders,
       ROUND(SUM(oi.price), 2) AS revenue,
       ROUND(SUM(oi.price) / COUNT(DISTINCT o.order_id), 2) AS revenue_per_order,
       ROUND(100.0 * SUM(oi.price) / SUM(SUM(oi.price)) OVER (), 2) AS revenue_share_pct
FROM order_items AS oi
JOIN orders AS o
  ON oi.order_id = o.order_id
JOIN customers AS c
  ON o.customer_id = c.customer_id
WHERE o.order_status NOT IN ('unavailable', 'canceled')
GROUP BY c.customer_state
ORDER BY revenue DESC

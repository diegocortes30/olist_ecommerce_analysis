-- Q4: overall cancellation rate
SELECT COUNT(*) AS total_orders,
       SUM(CASE WHEN o.order_status = 'canceled' THEN 1 ELSE 0 END) AS canceled_orders,
       ROUND(100.0 * SUM(CASE WHEN o.order_status = 'canceled' THEN 1 ELSE 0 END) / COUNT(*), 2) AS canceled_pct
FROM orders AS o

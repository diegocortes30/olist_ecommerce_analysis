-- Q4: cancellation rate by month (2017-01 to 2018-08, months with at least 100 orders)
SELECT strftime('%Y-%m', o.order_purchase_timestamp) AS year_month,
       COUNT(*) AS total_orders,
       SUM(CASE WHEN o.order_status = 'canceled' THEN 1 ELSE 0 END) AS canceled_orders,
       ROUND(100.0 * SUM(CASE WHEN o.order_status = 'canceled' THEN 1 ELSE 0 END) / COUNT(*), 2) AS canceled_pct
FROM orders AS o
WHERE o.order_purchase_timestamp >= '2017-01-01'
  AND o.order_purchase_timestamp < '2018-09-01'
GROUP BY year_month
HAVING COUNT(*) >= 100
ORDER BY year_month

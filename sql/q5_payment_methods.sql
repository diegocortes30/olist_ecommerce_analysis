-- Q5: payments and orders per payment method
SELECT payment_type,
       COUNT(*) AS payments,
       COUNT(DISTINCT order_id) AS orders,
       ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS payments_pct
FROM order_payments
GROUP BY payment_type
ORDER BY payments DESC

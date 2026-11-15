-- Q5: distribution of installments
SELECT payment_installments,
       COUNT(*) AS payments,
       COUNT(DISTINCT order_id) AS orders,
       ROUND(AVG(payment_value), 2) AS avg_value,
       MIN(payment_value) AS min_value,
       MAX(payment_value) AS max_value
FROM order_payments
GROUP BY payment_installments
ORDER BY payment_installments

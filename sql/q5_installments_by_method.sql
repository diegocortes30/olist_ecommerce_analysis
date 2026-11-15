-- Q5: average and maximum installments per payment method
SELECT payment_type,
       COUNT(*) AS payments,
       ROUND(AVG(payment_installments), 2) AS avg_installments,
       MAX(payment_installments) AS max_installments
FROM order_payments
GROUP BY payment_type
ORDER BY payments DESC

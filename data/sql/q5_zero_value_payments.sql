-- Q5: payments with 0 installments or a value of 0 (data quality check)
SELECT *
FROM order_payments
WHERE payment_installments = 0 OR payment_value = 0

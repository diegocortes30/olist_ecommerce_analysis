-- Q1: Which product categories receive the best and worst review scores?
-- Assumptions: reviews of the same order are averaged; an order counts once in each category it contains;
-- products without a category are labeled 'unknown'.
WITH order_scores AS (
    SELECT order_id,
           ROUND(AVG(review_score), 2) AS avg_review_score
    FROM order_reviews
    GROUP BY order_id
),
order_categories AS (
    SELECT DISTINCT oi.order_id,
           COALESCE(t.product_category_name_english,
                    p.product_category_name,
                    'unknown') AS category
    FROM order_items AS oi
    JOIN products AS p
      ON oi.product_id = p.product_id
    LEFT JOIN product_category_name_translation AS t
      ON p.product_category_name = t.product_category_name
)

SELECT oc.category,
       COUNT(*) AS reviewed_orders,
       ROUND(AVG(os.avg_review_score), 2) AS avg_score
FROM order_categories AS oc
JOIN order_scores AS os
  ON oc.order_id = os.order_id
WHERE oc.category LIKE '%appliances%'
GROUP BY oc.category
ORDER BY avg_score

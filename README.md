# olist_ecommerce_analysis
## Business questions

| # | Question | Metric | Tables |
|---|---|---|---|
| 1 | Which product categories receive the best and worst review scores (minimum 100 reviews)? | Average `review_score` per category | `order_reviews`, `order_items`, `products`, `product_category_name_translation` |
| 2 | Which customer states generate the most revenue? | Sum of `price` per customer state (excluding canceled and unavailable orders) | `orders`, `customers`, `order_items` |
| 3 | How do monthly orders and revenue evolve over time? | Number of orders and sum of `price` per month | `orders`, `order_items` |
| 4 | What share of orders is canceled, and does it vary by state or month? | Canceled orders / total orders, by state and by month | `orders`, `customers` |
| 5 | Which payment methods are used most, and how many installments do customers choose? | Number of payments per `payment_type`; distribution of `payment_installments` | `order_payments` |

### Assumptions
- Revenue = sum of `price` (shipping excluded), counting only orders that are not `canceled` or `unavailable`.
- Cancellation rate uses all orders as the denominator.

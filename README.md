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

## Findings
- **Q1 – Review scores by category:** scores differ little across categories, but
  `office_furniture` has the lowest average (3.62) with a large sample (1,263 orders).
  A low score can come from the product, the delivery or the seller; this dataset
  cannot separate them.
- **Q2 – Revenue by state:** revenue is highly concentrated: SP alone generates 38.27%
  and the top 3 states account for 63.4%. Large states win on volume, not on order value.
- **Q3 – Monthly trend:** orders grew quickly during 2017 (peak in Nov 2017: 7,421
  orders, 1,003,862.14 BRL) and stabilized in 2018. Growth came mainly from order
  volume; revenue per order rose only moderately (125 → 153).
- **Q4 – Cancellations:** only 0.63% of orders are canceled. Differences between
  states are small and based on few cases, and the monthly peaks do not follow demand.
- **Q5 – Payments:** credit card makes up 73.92% of payments (avg 3.51 installments,
  max 24); every other method has exactly 1 installment. The 11 zero-value /
  zero-installment payments should be excluded from payment analysis.

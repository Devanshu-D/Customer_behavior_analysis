CREATE DATABASE dataframe;
USE dataframe;
SELECT * FROM customer;

-- Total revenue by gender
select gender, sum(purchase_amount) as revenue
FROM customer
group by gender;

-- Used discout but still spent more
SELECT customer_id, purchase_amount
FROM customer
WHERE discount_applied = 'Yes' AND purchase_amount > (select AVG(purchase_amount) FROM customer);

-- Top 5 products with highest avg review rating
SELECT item_purchased, ROUND(avg(review_rating), 2) as "Avg. review ratings"
FROM customer
group by item_purchased
order by avg(review_rating) desc limit 5;

-- Compare the avg purchase amounts between standard and Express shipping.
select shipping_type, avg(purchase_amount)
from customer
where shipping_type = "Express" OR shipping_type = "Standard" 
-- or shipping_type in ('Standard', 'Express')
group by shipping_type;

-- Do subscribers spend more?
-- compare the avg spend and total revenue b/w subs. & non-subs.
select subscription_status, count(customer_id) as "Total Customer",
sum(purchase_amount) as "Total Revenue",
ROUND(AVG(purchase_amount), 2) as "Avg. purchase"
from customer
group by subscription_status;

-- Top 5 products with highest percentage of 
-- purchases with discount applied?
SELECT item_purchased,
    ROUND(SUM(CASE WHEN discount_applied = 'Yes' THEN 1 ELSE 0 END)/COUNT(*) * 100, 2) AS discount_percentage,
    ROUND(AVG(purchase_amount)) AS avg_price
FROM customer
GROUP BY item_purchased
ORDER BY discount_percentage DESC
LIMIT 5;

-- Segment customers into new, returning and loyal based on their
-- total no. of prev. purchases, and show the count of each segment.
with customer_type as(
	select customer_id, previous_purchases,
    CASE
		WHEN previous_purchases = 1 THEN "New"
        WHEN previous_purchases between 2 AND 10 THEN "Returning"
        ELSE "Loyal"
        END AS customer_segment
	from customer
    )
select customer_segment, count(*) as "No. of customers"
from customer_type
group by customer_segment;

-- Top 3 purchased products in each category
with item_counts as(
	select category, item_purchased,
    count(customer_id) as total_orders,
    ROW_NUMBER() over(partition by category order by count(customer_id) DESC) as item_rank
    from customer
    group by category, item_purchased
    )
select item_rank, item_purchased, category, total_orders
from item_counts
where item_rank <= 3;

-- Are the customers who are repeat buyers(more than 5 prev. purchases)
-- also likely to subscribe?
select subscription_status,
	count(customer_id) as repeat_buyers
from customer
where previous_purchases > 5
group by subscription_status;

-- Revenue contibution for each group?
select age_groups, SUM(purchase_amount) as total_revenue
from customer
group by age_groups
order by total_revenue desc;

create database e_commerce;
use e_commerce;
show tables;

desc customers;
desc products;
desc orders;
desc orderdetails;
ALTER TABLE customers CHANGE COLUMN `ï»¿customer_id` `customer_id` INT;
ALTER TABLE orders CHANGE COLUMN `ï»¿order_id` `order_id` INT;
ALTER TABLE orderdetails CHANGE COLUMN `ï»¿order_id` `order_id` INT;
ALTER TABLE products CHANGE COLUMN `ï»¿product_id` `product_id` INT;

-- Q1 .Identify the top 3 cities with the highest number of customers to determine key markets for targeted marketing and logistic optimization

select 
location,
count(customer_id) as number_of_customers from customers
group by location
order by number_of_customers
desc limit 3;

-- Q2. Determine how many customers fall into each order frequency category based on the number of orders they have placed.

select 
order_count as NumberOfOrders,
count(*) as CustomerCount
from(
    select
    customer_id,
    count(*) as order_count
    from orders
    group by customer_id
) t
group by order_count
order by NumberOfOrders
asc;

-- Q3. Identify products where the average purchase quantity per order is 2 but with a high total revenue, suggesting premium product trends.

select 
Product_id,
avg(quantity) as AvgQuantity,
sum(price_per_unit*quantity) as TotalRevenue
from orderdetails
group by Product_id
having avg(quantity)=2
order by TotalRevenue
desc; 

-- Q4. For each product category, calculate the unique number of customers purchasing from it.
 -- This will help understand which categories have wider appeal across the customer base.
 
 select
p.category as category,
count(distinct o.customer_id) as unique_customers
from products as p
join orderdetails as od 
on p.product_id=od.product_id
join orders as o 
on o.order_id=od.order_id
group by p.category
order by unique_customers
desc; 

-- Q5. Analyze the month-on-month percentage change in total sales to identify growth trends.

select Month,
TotalSales,
round(
    ((TotalSales - lag(TotalSales) over (order by month))/
    lag(TotalSales) over (order by month)) *100,2) as PercentChange
    from(
        select
        Date_Format(order_date, '%Y-%m') as Month,
        sum(total_amount) as TotalSales
        from orders group by Date_Format(order_date, '%Y-%m')
    ) t;
    
-- Q6. Examining how the average order value changes month-on-month. Insights can guide pricing and promotional strategies to enhance order value.

WITH MonthlyOrderValues AS
(
 SELECT DATE_FORMAT(order_date, '%Y-%m') AS Month,
    round(AVG(total_amount),2) AS AvgOrderValue
 FROM Orders
 GROUP BY Month
)
SELECT Month, AvgOrderValue,
 round((AvgOrderValue - LAG(AvgOrderValue) OVER (ORDER BY Month)), 2) AS ChangeInValue
FROM MonthlyOrderValues
order by changeInValue desc;

-- Q7. Based on sales data, identify products with the fastest turnover rates, suggesting high demand and the need for frequent restocking.

select product_id,
count(product_id) as SalesFrequency
from orderdetails
group by product_id
order by SalesFrequency
desc limit 5;

-- Q8. List products purchased by less than 40% of the customer base, indicating potential mismatches between inventory and customer interest.

select
p.product_id,
p.name as Name,
count(distinct o.customer_id) as UniqueCustomerCount
from products as p 
join orderdetails as od 
on p.product_id=od.product_id
join orders as o 
on o.order_id=od.order_id
group by p.product_id,
p.name
HAVING count(distinct o.customer_id) < (SELECT COUNT(*) FROM Customers) * 0.40;

-- Q9. Evaluate the month-on-month growth rate in the customer base to understand the effectiveness of marketing campaigns and market expansion efforts.

with first_purchase as(
    select
    customer_id,
    Min(order_date) as first_order_date
    from orders
    group by customer_id
)
select 
   Date_format(first_order_date, '%Y-%m') as FirstPurchaseMonth,
   count(customer_id) as TotalNewCustomers
   from first_purchase
   group by Date_format(first_order_date, '%Y-%m')
   order by FirstPurchaseMonth asc;
   
-- Q10. Identify the months with the highest sales volume, aiding in planning for stock levels, marketing efforts, and staffing in anticipation of peak demand periods.

SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS Month,
    SUM(total_amount) AS TotalSales
FROM Orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY TotalSales DESC
LIMIT 3;

-- Flipkart
select *from customers;
select *from products;
select *from sales_fact;
select *from sellers;

-- How many unique customers are there in total?
SELECT 
    COUNT(DISTINCT customer_id) AS Total_unique_customers
FROM
    customers);


-- Which customer has made the highest total purchases (sales)?
SELECT 
    c.Customer_ID,
    c.Customer_Name,
    SUM(sf.Total_Amount) AS Total_Sales
FROM
    Customers c
        JOIN
    sales_fact sf ON c.Customer_ID = sf.Customer_ID
GROUP BY c.Customer_ID , c.Customer_Name
ORDER BY Total_Sales
LIMIT 5;


-- What is the average order value per customer?
WITH customer_sales AS (
    SELECT 
        customer_id,
        SUM(total_amount) AS total_sales
    FROM sales_fact
    GROUP BY customer_id
)
SELECT 
    ROUND(AVG(total_sales), 2) AS avg_order_value_per_customer
FROM customer_sales;


-- Which city/state has the most customers?
select c.state,c.city, round(sum(sf.total_amount),2)as Total_amount
from customers c
join sales_fact sf on c.customer_id = sf.customer_id
group by c.state, c.city
order by total_amount
limit 5;

-- Which product category generates the highest sales?
SELECT 
    p.category, ROUND(SUM(sf.total_amount), 2) AS Total_Amount
FROM
    products p
        JOIN
    sales_fact sf ON p.product_id = sf.product_id
GROUP BY p.category
ORDER BY Total_Amount DESC; 

-- Which product is sold the most (by quantity)?
select c.customer_id, c.customer_name, sum(sf.quantity) as Total_Quantity_Sold
from customers c
join sales_fact sf on c.customer_id = sf.customer_id
group by c.customer_id, c.Customer_name
order by Total_Quantity_Sold desc
limit 10; 


-- Which product is the least profitable?
SELECT 
    p.product_id,
    p.product_name,
    SUM(s.Total_Amount) AS total_profit
FROM sales_fact s
JOIN products p 
    ON s.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_profit ASC
LIMIT 1;


-- What are the top 10 products by revenue?
SELECT 
    p.product_id,
    p.product_name,
    SUM(s.Total_amount) AS total_revenue
FROM sales_fact s
JOIN products p 
    ON s.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC
LIMIT 10;

-- What is the total revenue and profit for each year?
SELECT 
    EXTRACT(YEAR FROM s.order_date) AS year,
    SUM(s.Total_amount) AS total_revenue,
    SUM(s.Total_amount) AS total_profit
FROM sales_fact s
GROUP BY EXTRACT(YEAR FROM s.order_date)
ORDER BY year;



-- What is the monthly sales trend?
SELECT 
    EXTRACT(YEAR FROM s.order_date) AS year,
    EXTRACT(MONTH FROM s.order_date) AS month,
    SUM(s.Total_amount) AS total_sales
FROM sales_fact s
GROUP BY EXTRACT(YEAR FROM s.order_date), EXTRACT(MONTH FROM s.order_date)
ORDER BY year, month;



-- Which region contributes the most to total sales?
SELECT 
    c.country,
    SUM(s.total_amount) AS total_sales
FROM sales_fact s
JOIN customers c 
    ON s.customer_id = c.customer_id
GROUP BY c.country
ORDER BY total_sales DESC
LIMIT 1;










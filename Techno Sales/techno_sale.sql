-- import the dataset
-- 1.	How many total sales records are present in the dataset?
SELECT 
    COUNT(*) AS Total_record
FROM
    techno_sales;

-- 2.	List the unique products or categories available in the data.
SELECT DISTINCT
    Category
FROM
    techno_sales;

-- 3.	What is the total quantity sold across all products?
SELECT 
    SUM(quantity) AS quantity_sold
FROM
    techno_sales;
    
-- 4.	Find the total sales (Quantity × Price if applicable) by each state or area.
SELECT 
    state_code, SUM(quantity) AS total_quantity
FROM
    techno_sales ts
GROUP BY state_code;
    
-- 5.	Which product has the highest total quantity sold?
SELECT 
    product, SUM(quantity) AS highest_quantity
FROM
    techno_sales
GROUP BY product
ORDER BY highest_quantity DESC
LIMIT 1;

-- 6.	Calculate the average quantity sold per month.
SELECT 
    EXTRACT(MONTH FROM order_date) AS sale_month,
    AVG(quantity) AS average_quantity
FROM
    techno_sales
GROUP BY sale_month
ORDER BY sale_month;

-- 7.	Filter and list all sales where quantity is greater than 5.
select *from techno_sales
where quantity >5;


-- 8.	Find all entries where a specific product (e.g., "Laptop" or "Smartphone") was sold.
SELECT 
    *
FROM
    techno_sales
WHERE
    product = 'Smartphone' OR 'Laptop';
    
    
-- 9.	Identify the top 5 customers by total purchase volume.
SELECT customer_name, SUM(quantity) AS total_quantity
FROM techno_sales
GROUP BY customer_name
ORDER BY total_quantity DESC
LIMIT 5;





    
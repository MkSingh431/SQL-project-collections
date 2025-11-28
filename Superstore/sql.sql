-- SuperStore
select *from superstore

drop table superstore
-- How many total orders are in the dataset?
SELECT 
    SUM(quantity)
FROM
    superstore;
    
-- List the unique ship modes and their frequency.
SELECT 
    ship_mode, COUNT(*) AS frequency
FROM
    superstore
GROUP BY ship_mode
ORDER BY frequency DESC;

-- Which segment (Consumer, Corporate, Home Office) contributes the most sales?
select segment,round(sum(sales),0) as Sales from superstore
group by segment
order by sales desc;

-- Find the total number of customers and the top 5 by sales.
WITH TopCustomers AS (
    SELECT 
        Customer_ID,
        Customer_Name,
        SUM(Sales) AS Total_Sales
    FROM superstore
    GROUP BY Customer_ID, Customer_Name
    ORDER BY Total_Sales DESC
    LIMIT 5
)
SELECT 
    (SELECT COUNT(DISTINCT Customer_ID) FROM superstore) AS Total_Customers,
    Customer_ID,
    Customer_Name,
    Total_Sales
FROM TopCustomers;

-- What is the average order value (Sales per Order ID)?
SELECT 
    SUM(Sales) * 1.0 / COUNT(DISTINCT Order_ID) AS Avg_Order_Value
FROM Superstore;

-- Identify the top 10 most profitable products.
SELECT 
    product_name, SUM(profit) AS Total_profit
FROM
    superstore
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 10;


-- Find the top 5 least profitable sub-categories.
SELECT 
    sub_category, SUM(profit) AS Total_profit
FROM
    superstore
GROUP BY sub_category
ORDER BY total_profit DESC
LIMIT 5;


-- Which region generates the highest sales and profit?
SELECT 
    region, SUM(profit) AS Total_profit
FROM
    superstore
GROUP BY region
ORDER BY total_profit DESC;


-- Compare Furniture vs Technology vs Office Supplies in sales and profit.
SELECT 
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM Superstore
WHERE Category IN ('Furniture', 'Technology', 'Office Supplies')
GROUP BY Category
ORDER BY Total_Sales DESC;

-- Find the monthly sales trend (Sales by Order Date).
SELECT 
    DATE_FORMAT(Order_Date, '%Y-%m') AS YearMonth,
    SUM(Sales) AS Total_Sales
FROM Superstore
GROUP BY YearMonth
ORDER BY YearMonth;


-- Which year had the highest profit?
SELECT 
    YEAR(Order_Date) AS Year,
    SUM(Profit) AS Total_Profit
FROM Superstore
GROUP BY YEAR(Order_Date)
ORDER BY Total_Profit DESC;


-- Compare sales growth year-over-year.
SELECT 
    YEAR(Order_Date) AS Year,
    SUM(Sales) AS Total_Sales,
    LAG(SUM(Sales)) OVER (ORDER BY YEAR(Order_Date)) AS Previous_Year_Sales,
    ROUND(
        ( (SUM(Sales) - LAG(SUM(Sales)) OVER (ORDER BY YEAR(Order_Date))) 
          / LAG(SUM(Sales)) OVER (ORDER BY YEAR(Order_Date)) ) * 100, 2
    ) AS YoY_Growth_Percentage
FROM Superstore
GROUP BY YEAR(Order_Date)
ORDER BY Year;



-- Identify seasonal spikes in sales (e.g., holiday months).
SELECT 
    MONTH(Order_Date) AS Month,
    DATE_FORMAT(Order_Date, '%M') AS Month_Name,
    SUM(Sales) AS Total_Sales
FROM Superstore
GROUP BY MONTH(Order_Date), DATE_FORMAT(Order_Date, '%M')
ORDER BY Month;

-- Which state has the highest number of customers?
SELECT 
    state, COUNT(customer_name) AS Total_Customers
FROM
    superstore
GROUP BY state
ORDER BY Total_Customers DESC;








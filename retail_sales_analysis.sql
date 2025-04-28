SELECT * FROM retail_sales;

SELECT COUNT(*) FROM RETAIL_sales;

--- Data Cleaning
SELECT * FROM retail_sales
WHERE transaction_id IS NULL;

SELECT * FROM retail_sales
WHERE sale_date IS NULL;

SELECT * FROM retail_sales
WHERE sale_time IS NULL;

SELECT * FROM retail_sales
WHERE customer_id IS NULL;

SELECT * FROM retail_sales
WHERE gender IS NULL;

SELECT * FROM retail_sales
WHERE 
	transaction_id IS NULL
	OR
	category IS NULL
	OR
	quantity IS NULL
	OR 
	price_per_unit IS NULL
	OR
	cogs IS NULL
	OR
	total_sale IS NULL;

---

DELETE FROM retail_sales
WHERE 
	transaction_id IS NULL
	OR
	category IS NULL
	OR
	quantity IS NULL
	OR 
	price_per_unit IS NULL
	OR
	cogs IS NULL
	OR
	total_sale IS NULL;

-- Data Exploration

-- How many sales we have?
SELECT COUNT(*) AS total_sales FROM retail_sales;

-- How many uniuque customer we have?
SELECT COUNT(DISTINCT customer_id) AS total_sales FROM retail_sales;

SELECT DISTINCT category FROM retail_sales;


-- Data Analysis & Business Key Problem & Answers


-- Q.1 Write a SQL query to retrive all columns for sales made on '2022-11-05'

SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';


-- Q.2 Write a SQL query to retrieve all transaction where the category is 'Clothing' and the quantity sold is more then 10 in the month of nov-2022

SELECT 
*
FROM retail_sales
WHERE 
	category = 'Clothing'
	AND
	TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
	AND
	quantity >= 4;


-- Q.3 Write a SQL query to calculate the total sale (total_sale) for each category.

SELECT 
	category, sum(total_sale) as net_sale,
	COUNT(*) as total_order
FROM retail_sales
GROUP by 1;


-- Q.4 Write a SQL query to find the average age of customers who purchased item from the 'Beauty' category.

SELECT
	ROUND(AVG(age),2) as avg_age
from retail_sales
WHERE category = 'Beauty'


-- Q.5 Write a SQL query to find all transaction where the total_sales is greater then 1000

SELECT * FROM retail_sales
WHERE total_sale > 1000;


-- Q.6 Write a SQL query to find the total number of transaction made by each gender in each category.

SELECT
	Category,
	Gender,
	COUNT(*) as Total_trans
from retail_sales
GROUP BY category, gender
ORDER BY category;


-- Q.7 Write a SQL query to calculate the average of sale each month. Find out vest selling month in each year.

	SELECT
		year,month,avg_sale
	FROM
	(SELECT
		EXTRACT(YEAR FROM sale_date) as year,
		EXTRACT(MONTH FROM sale_date) as month,
		AVG(total_sale) as avg_sale,
		RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC) as rank
	FROM retail_sales
	GROUP BY 1,2
--ORDER BY 1,3 DESC;
	) as t1
	WHERE rank = 1


-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sale.

SELECT 
	customer_id,
	SUM(total_sale) as total_sales
FROM retail_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;


-- Q.9 Write a SQL query to find the number of unique customer who purchased item from each category.

SELECT 
	 category,
	 COUNT(DISTINCT customer_id) as cnt_unique_cs
FROM retail_sales
GROUP BY 1;


-- Q.10 Write a SQL query to create each shift number of order (Example Morning <= 12, Afternoon between 12 & 17, Evening >17).

WITH hourly_sale
AS
(
SELECT *,
	CASE
		WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
		WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
		ElSE 'Evening'
	END as shift
from retail_sales
)
SELECT 
	shift,
	COUNT(*) as totat_orders
FROM hourly_sale
GROUP BY 1;

--END


	
	
	
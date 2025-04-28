# 🛒 Retail Sales Analysis SQL Project
This project demonstrates core SQL skills through exploration, cleaning, and analysis of retail sales data. It covers database setup, exploratory data analysis (EDA), and answers business questions with SQL queries — ideal for beginners building a solid foundation in SQL.

## 📄 Project Files
retail_sales_analysis.sql:
Contains SQL queries for cleaning, exploring, and analyzing retail sales data.

SQL - Retail Sales Analysis_utf.csv:
Sample dataset containing retail sales records, including fields like transaction dates, product categories, quantities, and revenues.

## Objectives

1. **Set up a retail sales database**: Create and populate a retail sales database with the provided sales data.
2. **Data Cleaning**: Identify and remove any records with missing or null values.
3. **Exploratory Data Analysis (EDA)**: Perform basic exploratory data analysis to understand the dataset.
4. **Business Analysis**: Use SQL to answer specific business questions and derive insights from the sales data.

## Project Structure

### 1. Database Setup

- **Database Creation**: The project starts by creating a database named `sql_retail_sales_analysis`.
- **Table Creation**: A table named `retail_sales` is created to store the sales data. The table structure includes columns for transaction ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount.

- ```sql
CREATE DATABASE p1_retail_db;

CREATE TABLE retail_sales
(
    transactions_id INT PRIMARY KEY,
    sale_date DATE,	
    sale_time TIME,
    customer_id INT,	
    gender VARCHAR(10),
    age INT,
    category VARCHAR(35),
    quantity INT,
    price_per_unit FLOAT,	
    cogs FLOAT,
    total_sale FLOAT
);
```

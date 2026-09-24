Online store sales analysis using Python and SQL
# Online Store Sales Analysis

This is a small data analysis project based on online store sales data.

I worked with the same dataset using Python and SQL. My main goal was to practice the basic steps of a data analyst workflow and understand the sales data from different perspectives.

# Python Analysis

For the Python part, I used:
* Pandas
* NumPy
* Matplotlib
* Seaborn

First, I loaded the dataset and checked its structure, shape, data types, missing values, and duplicated rows.

Then I prepared the date column and extracted the year and month from the order date.

I also created new columns for:

* General Price
* Discounted Price
* Net Sales

After that, I analyzed the data by:

* Category
* City
* Payment Method
* Product
* Order Status
* Year and Month

I calculated total sales, average sales, total quantity, minimum and maximum sales, and looked at the products and categories with higher sales.

I also created simple visualizations to see net sales by category and monthly net sales.

# SQL Analysis

For the SQL part, I used Oracle SQL.

I practiced different SQL concepts using the same sales dataset.

Some of the things I worked on:

* Counting total orders
* Counting unique customers
* Calculating total quantity sold
* Calculating total sales
* Grouping sales by category
* Grouping sales by product
* Using `HAVING` with subqueries
* Using CTEs
* Using `CASE WHEN`
* Using `ROW_NUMBER()`
* Finding the top-selling products for each city

I also compared category and product sales with their average sales and used window functions to rank products within each city.

# Files

* `Online_store_sales_500.ipynb` — Python data analysis
* `online_store_sales_500.sql` — SQL queries

# What I Practiced

Through this project, I practiced how to:

1. Load and inspect a dataset
2. Check missing values and duplicates
3. Prepare data for analysis
4. Create calculated columns
5. Analyze data using Pandas
6. Group and aggregate data
7. Write SQL queries for business questions
8. Use subqueries and CTEs
9. Use window functions for ranking
10. Create basic sales visualizations

This project was mainly created for practice and to improve my data analysis skills using Python and SQL.

Analysis SQL_Project
Project Overview:This project focuses on designing, cleaning, exploring, and analyzing a Fashion Boutique sales dataset using SQL.

Database creation
Table design
Data cleaning
Data exploration
Date functions
Grouping and filtering
Database Structure

Database Name:sql_project_fashion

Table Name:fashion_boutique_dataset


Table Schema

Column Name	Description
product_id =	Unique product identifier

category =	Product category such as Tops, Shoes, etc.

brand =	Brand name (Zara, Mango,...)

season =	Season (Summer, Winter, Fall, Spring)

size = 	Clothing size

color	= Product color

original_price =	Original selling price

markdown_percentage=	Discount percentage

current_price	= Price after discount

stock_quantity =	Quantity in stock or sold

customer_rating = 	Customer rating (0–5)

is_returned	= Whether returned (TRUE/FALSE)

return_reason =	Reason for return

Data Cleaning Performed

product_id

category

brand

season

size

color

original_price

markdown_percentage

current_price

purchase_date

stock_quantity

customer_rating

is_returned

return_reason

These SQL queries ensure the dataset is complete and clean.

Data Exploration:

Total records:
select count(*) from fashion_boutique_dataset;

Unique counts

Categories

Brands

Colors

Sizes

Seasons

Price statistics:

SUM(original_price)

SUM(current_price)

AVG(original_price)

AVG(current_price)

Total sales by category:

select category,
    sum(current_price) as net_sale,
       count(*) as total_orders
from fashion_boutique_dataset
group by category;



Top 5 highest-selling products:

elect product_id,

       sum(current_price) as total_price
       
from fashion_boutique_dataset

group by product_id

order by total_price desc

limit 5;



Brand-wise product count:

select brand,

       count(distinct product_id)
       
from fashion_boutique_dataset

group by brand;



Monthly average sales:


select
extract(year from str_to_date(purchase_date,'%d-%m-%y')) as year,

extract(month from str_to_date(purchase_date,'%d-%m-%y')) as month,

avg(current_price) as avg_sale

from fashion_boutique_dataset

group by year, month

order by avg_sale;


Discount Analysis (Markdown Percentage)

 Category-wise Discount Amount:
 
 select category,
 
       original_price,
       
       markdown_percentage,
       
       (original_price * (markdown_percentage/100)) as discount_amount
       
from fashion_boutique_dataset;



 
Brand-wise Discount Amount:

select brand,

       original_price,
       
       markdown_percentage,
       
       (original_price * (markdown_percentage/100)) as discount_amount
       
from fashion_boutique_dataset;





Key Learnings from the Project

Designing an SQL database & table

Checking and cleaning null values

Using DISTINCT for unique counts

Using SUM(), AVG(), COUNT()

Grouping and filtering

Date extraction using extract() and str_to_date()


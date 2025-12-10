-- sql_Project_Fashion_Butique--
create database sql_project_fashion;
use sql_project_fashion;
drop table if exists fashion_boutique_dataset;
create table fashion_boutique_dataset(
product_id int primary key,
category varchar(20),
	brand varchar(30),
    season varchar(20),
    size varchar(10),	
    color varchar(20),
	original_price decimal(10,2),
    markdown_percentage	decimal(5,2),
    current_price decimal(10,2),
	purchase_date date,	
    stock_quantity int,
	customer_rating decimal(5,1),
	is_returned boolean,
	return_reason varchar(100));

select*from sql_project_fashion;
drop  table sql_project_fashion;
select*from fashion_boutique_dataset
limit 20

select count(*)
 from fashion_boutique_dataset;
 
-- Data cleaning--
 select*from fashion_boutique_dataset
 where product_id is null
 
  select*from fashion_boutique_dataset
 where category is null
 
  select*from fashion_boutique_dataset
 where brand is null
 
  select*from fashion_boutique_dataset
 where season is null
 
  select*from fashion_boutique_dataset
 where size is null
 
   select*from fashion_boutique_dataset
 where color is null
 or
 original_price is null
 or
 markdown_percentage is null
 or
 current_price is null
 or
 purchase_date is null
 or
 stock_quantity is null
 or
 customer_rating is null
 or
 is_returned is null
 or
 return_reason is null;
 
-- --data Exploration
-- how many sales we have?
select count(*) as total
-- how many original price we have?
select count(*) as original_price from fashion_boutique_dataset;
-- how many category we have?
-- unique means use distinct
select count(distinct category) from fashion_boutique_dataset;
select distinct category from fashion_boutique_dataset;
-- how many brand we have?
select count(distinct brand) from fashion_boutique_dataset;
select distinct brand from fashion_boutique_dataset;

select*from fashion_boutique_dataset

-- how many color we have?
select count(distinct color)from fashion_boutique_dataset;
select distinct color from fashion_boutique_dataset;
-- how many sizes we have?
select count(distinct size) from fashion_boutique_dataset;
select distinct size from fashion_boutique_dataset;
-- how many seasons we have?
select count(distinct season) from fashion_boutique_dataset;
select distinct season from fashion_boutique_dataset;
select sum(original_price)from fashion_boutique_dataset;
 select sum(current_price) from fashion_boutique_dataset;
 select avg(original_price)from fashion_boutique_dataset;
select avg(current_price)from fashion_boutique_dataset;
select count(*) as stock_quantity from fashion_boutique_dataset;
select count(distinct Zara)from coloumn brand;

-- Data Analysis and Bussiness key problems and answers
-- q1 Write a sql query to all columns for sale on purchase date 8/6/2025'
select* from fashion_boutique_dataset
where purchase_date='8/6/2025';
--- write a sql query to retrive all transaction where category is tops and the quantity sold is more than 10
--- in the month of may-2025
select category,
sum(stock_quantity)
from fashion_boutique_dataset
where category='tops'
group by 1;

select * from fashion_boutique_dataset
where category='shoes'
and stock_quantity>=2;

---- write a sql query to calculate the total sale for each category
select category,
sum(original_price) as net_sale,
count(*) as total_orders
from fashion_boutique_dataset
group by 1

select category,
sum(current_price) as net_sale2,
count(*) as total_orderrs2
from fashion_boutique_dataset
group by 1;

select category,
avg(original_price) as price1
from fashion_boutique_dataset
group by 1;

select
count(brand)
from fashion_boutique_dataset
where category='tops';
select count(brand)
from fashion_boutique_dataset
where category='shoes';

select
count(brand)
from fashion_boutique_dataset
where brand='mango';
select*from fashion_boutique_dataset
where current_price>100;
select* from fashion_boutique_dataset
where original_price >150;
select* from fashion_boutique_dataset
where is_returned='FALSE';

select* from fashion_boutique_dataset
where is_returned='true';
--- Changed Mind
select* from fashion_boutique_dataset
where season = 'fall';
select* from fashion_boutique_dataset
where return_reason='Changed Mind'
and size='M';
select brand,
sum(original_price)
as total_original_price
from fashion_boutique_dataset
where brand='Gap'
group by brand;

select brand,
avg(original_price)
as total_original_price
from fashion_boutique_dataset
where brand='Uniqlo'
group by brand;
--- average and sum of sale(original and current price) of each month
select
extract(year from  str_to_date(purchase_date,'%d-%m-%y')) as year,
extract(month from  str_to_date(purchase_date,'%d-%m-%y')) as month,
avg(current_price) as avg_sale
 from fashion_boutique_dataset
 group by 1,2
 order by 3;
--- top 5 heighest totle sale
select 
product_id,
sum(current_price) as total_price
from  fashion_boutique_dataset
group by 1
order by 2 desc
limit 5;

--- find the numbers of unique category who purchased items for each category
select
 category,
 count(distinct product_id)
from  fashion_boutique_dataset
group by category;

--- find the numbers of  customer rating by category
select
category,
count(distinct customer_rating)
from  fashion_boutique_dataset
group by category;

--- Find the average of cutomer_rating
select
category,
avg(distinct customer_rating)
from  fashion_boutique_dataset
group by category;

--- sum of customer ratings
select
category,
sum(distinct customer_rating)
from  fashion_boutique_dataset
group by category;

----- brand wise product_id count
select
 brand,
 count(distinct product_id)
from  fashion_boutique_dataset
group by brand;


--- find brand wiseaverage of customer_rating
select
brand,
avg(distinct customer_rating)
from  fashion_boutique_dataset
group by brand;

---- find brand wise sum of customer rating
select brand,
sum(distinct customer_rating)
from  fashion_boutique_dataset
group by brand;

---- how to find category wise  markdown percentage to find discount ammount 

select
category,
original_price,
markdown_percentage,
(original_price*(markdown_percentage/100.0)) as discount_ammount
from  fashion_boutique_dataset;

--- how to find brand wise markdown percentage to find discount amount
select
brand,
original_price,
markdown_percentage,
(original_price*(markdown_percentage/100.0)) as discount_amount
from  fashion_boutique_dataset;

--End of Project



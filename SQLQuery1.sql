TOTAL REVENUE:
select sum(total_price) AS "Total_revenue" from pizza_sales

AVERAGE ORDER VALUE:
select (sum(total_price)/count(distinct(order_id))) as "Avg_order_value" from pizza_sales

TOTAL QUANTITY OF PIZZA’S SOLD:
select sum(quantity) as "Total_pizzas_sold" from pizza_sales

TOTAL ORDERS PLACED FOR ALL PIZZA’S:
select count(distinct(order_id)) as "Total_orders" from pizza_sales

AVERAGE NUMBER OF PIZZA’S SOLD PER ORDER:
select cast(cast(sum(quantity)as decimal(10,2))/cast(count(distinct(order_id)) as decimal(10,2))as decimal(10,2)) as "Avg_no_of_pizzas_per_order" from pizza_sales

SUM OF ORDERS PLACED ON ALL DAYS OF THE WEEK:
select datename(dw,order_date) as"day", count(distinct(order_id)) as "total_orders_per_day" from pizza_sales
group by datename(dw,order_date)

SUM OF ORDERS PLACED ON ALL MONTHS OF THE YEAR:
select datename(month,order_date) as "month", count(distinct(order_id)) as "total_orders_per_month" from pizza_sales
group by datename(month,order_date)

PERCENTAGE OF PIZZA CATEGORIES SOLD:
select pizza_category , sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as "percentage_of_sales"  
from pizza_sales
group by pizza_category

PERCENTAGE OF PIZZA’S ACCORDING TO THEIR SIZE:
select pizza_size , round(sum(total_price) * 100 / (select sum(total_price) from pizza_sales),2) as "percentage_of_sales"  
from pizza_sales
group by pizza_size
order by percentage_of_sales desc

TOP 5 REVENUE EARNING PIZZA’S:
select top 5 pizza_name , round(sum(total_price),2) as "total_revenue"  
from pizza_sales
group by pizza_name
order by total_revenue desc

BOTTOM 5 REVENUE EARNING PIZZA’S :
select top 5 pizza_name , round(sum(total_price),2) as "total_revenue"  
from pizza_sales
group by pizza_name
order by total_revenue asc

TOP 5 PIZZA’S ACCORDING TO TOTAL QUANTITY PLACED:
select top 5 pizza_name , sum(quantity) as "total_quantity"  
from pizza_sales
group by pizza_name
order by total_quantity desc

BOTTOM 5 PIZZA’S ACCORDING TO TOTAL QUANTITY PLACED:
select top 5 pizza_name , sum(quantity) as "total_quantity"  
from pizza_sales
group by pizza_name
order by total_quantity ASC

TOP 5 PIZZA’S ACCORDING TO THE NUMBER OF ORDERS PLACED:
select top 5 pizza_name , count(distinct(order_id)) as "total_orders"  
from pizza_sales
group by pizza_name
order by total_orders desc

BOTTOM 5 PIZZA’S ACCORDING TO THE NUMBER OF ORDERS PLACED:
select top 5 pizza_name , count(distinct(order_id)) as "total_orders"  
from pizza_sales
group by pizza_name
order by total_orders asc

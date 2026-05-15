use sales_dataset_practice;
show tables;
select * from customer_clean;

-- identify top 5 customers by revenue in each country

select * from territories;

select * from sales_2016;
select * from products;


with all_sales as (select * from sales_2015 union all select * from sales_2016 union all select * from sales_2017),
customer_revenue as (select s.customerkey, t.country, sum(s.orderquantity * p.productprice) as revenue
from all_sales s
join products p on s.productkey = p.productkey
join territories t on s.territorykey = t.salesterritorykey
group by s.customerkey, t.country)
select * from (select *, dense_rank() over (partition by country order by revenue desc) as rnk from customer_revenue) t where rnk <=5;


-- new vs repeat customer
with all_sales as (select * from sales_2015 union all select * from sales_2016 union all select * from sales_2017)
select customerkey, orderdate, case
when row_number() over (partition by customerkey order by orderdate) = 1 then 'New' else 'Repeat'
end as customer_type
from all_sales;

-- customer segementation(4) total spend
with all_sales as (select * from sales_2015 union all select * from sales_2016 union all select * from sales_2017),
total_spend as (
select customerkey, sum(s.orderquantity * p.productprice) as total_spent
from all_sales s
join products p on s.productkey = p.productkey
group by customerkey)
select *, ntile(4) over (order by total_spent desc) as segement
from total_spend;


-- customer purchase gap(churn signal)


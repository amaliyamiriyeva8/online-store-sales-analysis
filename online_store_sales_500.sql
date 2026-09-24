create table sales_data(
             Order_ID varchar2(10) primary key,
             Order_Date date,
             Customer_ID varchar2(10) unique not null,
             Customer_Name varchar2(50),
             City varchar2(50),
             Category varchar2(50),
             Product varchar2(50),
             Quantity number,
             Unit_Price number(10,2),
             Discount number,
             Payment_Method varchar2(50),
             Order_Status varchar2(50)
)
select * from sales_data s
drop table sales_data
--Ümumi sifariş sayı
select count(*) as total_sales
from sales_data

--Unikal müştəri sayı
select count(distinct s.customer_id) as unikal_customer
from sales_data s

--Umumi satılan məhsul sayı
select sum(s.quantity) as sum_of_quality
from sales_data s

--Şəhərlərin siyahısı
select distinct s.city
from sales_data s

--Kateqoriyalar üzrə ümumi satış məbləğini hesabla və ən yüksəkdən ən aşağıya sırala.
select s.category,
       sum(s.quantity*s.unit_price) as general_sales
from sales_data s
group by s.category
order by general_sales desc

--Hansı kateqoriyanın ümumi satış məbləği dataset üzrə orta kateqoriya satışından yüksəkdir?
select s.category,
       sum(s.quantity*s.unit_price) as general_sales
from sales_data s
group by s.category
having sum(s.quantity*s.unit_price)>(select avg(general_sales)
                                     from  (select s.category,
                                      sum(s.quantity*s.unit_price) as general_sales
                                      from sales_data s
                                      group by s.category))
order by general_sales desc


--Məhsullar üzrə ümumi satış məbləğini hesabla və yalnız orta məhsul satışından yüksək olan məhsulları göstər.

select s.product,
       sum(s.quantity*s.unit_price) as total_sales
from sales_data s
group by s.product
having sum(s.quantity*s.unit_price)>(select avg(total_sales)
                                     from( select s.product,
                                                  sum(s.quantity*s.unit_price) as total_sales
                                           from sales_data s
                                           group by s.product))
order by total_sales desc

--CTE
with product_sales as(
select s.product,
       sum(s.quantity*s.unit_price) as total_sales
from sales_data s
group by s.product
)
select product,
       total_sales
from product_sales
where total_sales>(select avg(total_sales)
                   from product_sales)
order by total_sales desc

--Məhsulların hər biri üzrə ümumi satışını hesabla və həmin satışa görə məhsulu kateqoriyaya ayır:
select s.product,
       sum(s.quantity*s.unit_price) as sales_level,
       case when sum(s.quantity*s.unit_price)>=5000 then 'high'
            when sum(s.quantity*s.unit_price)>=2000 then 'medium'
            else 'low'
            end as result
from sales_data s
group by s.product

--Hər region üzrə məhsulların ümumi satışını hesabla və hər region daxilində satışa görə ROW_NUMBER() ver.
select  s.city,
        s.product,
        sum(s.quantity*s.unit_price) as total_price,
        row_number() over(partition by s.city order by sum(s.quantity*s.unit_price) desc) as row_num
from sales_data s
group by s.city,s.product

--Hər şəhər üzrə ən çox satış edən yalnız 1 məhsulu tap.
with row_number as(
select  s.city,
        s.product,
        sum(s.quantity*s.unit_price) as total_price,
        row_number() over(partition by s.city order by sum(s.quantity*s.unit_price) desc) as row_num
from sales_data s
group by s.city,s.product)
select *
from row_number
where row_num=1

--Hər şəhər üzrə ən çox satış edən 2 məhsulu tap.
with result as(
select s.product,
       s.city,
       sum(s.quantity*s.unit_price) as total,
       row_number() over(partition by city order by sum(s.quantity*s.unit_price) desc ) as row_num
from sales_data s
group by s.product,s.city
)
select *
from result
where row_num<=2




















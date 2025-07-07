--Which Product Category has the highest sales

select top 1 sum(sales) as total_sales, product_category from [dbo].[product_sales_details_new] group by product_category order by total_sales desc ;

5984248.17547321	Technology

-- What are the Top 3 and Bottom 3 regions in terms of sales? 

select top 3 sum(sales) as total_sales, region from [dbo].[product_sales_details_new] group by region order by total_sales desc ;
--Top 3
3597549.269871	West
3063212.47638369	Ontario
2837304.60503292	Prarie

select top 3 sum(sales) as total_sales, region from [dbo].[product_sales_details_new] group by region order by total_sales asc ;
---Bottom 3
116376.48383522	Nunavut
800847.330903053	Northwest Territories
975867.375723362	Yukon

--What were the total sales of appliances in Ontario? 
select sum(sales) total_sales from [dbo].[product_sales_details_new] Where region = 'Ontario' and product_sub_category = 'Appliances' ;
202346.839630127

--Advise the management of KMS on what to do to increase the revenue from the bottom 10 customers 
select top 10 sum(shipping_cost) as total_fee, customer_name, sum(profit) from [dbo].[product_sales_details_new] group by customer_name order by total_fee asc ;
85.7200021743774	Jeremy Farry	6.80999970436096
125.900001525879	Natalie DeCherney	5.84999990463257
153.030006408691	Nicole Fjeld	-82.1899976730347
180.760005950928	Katrina Edelman	-103.219998121262
198.080001831055	Dorothy Dickinson	32.689998626709
293.2200050354	Christine Kargatis	56.0800018310547
343.32799911499	Eric Murdock	-326.490000247955
350.180004119873	Chris McAfee	69.1999969482422
415.819980621338	Rick Huthwaite	-13.2399997711182
450.990005493164	Mark Hamilton	-91.0699977874756

--KMS incurred the most shipping cost using which shipping method?
select top 1 sum(shipping_cost) as total_fee, ship_mode from [dbo].[product_sales_details_new] group by ship_mode order by total_fee desc ;
51971.9397373199	Delivery Truck

--Who are the most valuable customers, and what products or services do they typically purchase? 
select top 10 sum(sales) as total_sales, customer_name, sum(profit) as profit, product_category from [dbo].[product_sales_details_new] group by customer_name, product_category
order by total_sales desc;
110481.965362549	Emily Phan	34233.9892120361	Technology
76795.7947387695	Deborah Brumfield	28296.6393127441	Technology
60434.642868042	Dennis Kane	10829.7800140381	Technology
57739.271484375	Jasper Cacioppo	539.980117797852	Technology
54454.9494018555	Clytie Kelty	17206.0599765778	Technology
53450.7795410156	Raymond Book	18353.2503166199	Technology
52477.3690910339	Lisa DeCherney	2850.73993492126	Furniture
51696.0215606689	Alejandro Grove	20399.1695270538	Office Supplies
50837.2688293457	Grant Carroll	21353.4795703888	Office Supplies
50177.2399902344	Roy Skaria	4658.23987579346	Furniture

--Which small business customer had the highest sales? 
select top 10 sum(sales) as total_sales, customer_name from [dbo].[product_sales_details_new] where customer_segment = 'Small Business' group by customer_name order by total_sales desc;
75967.5932159424	Dennis Kane

--Which Corporate Customer placed the most number of orders in 2009 – 2012?
select top 1 sum(order_quantity) total_order, customer_name from [dbo].[product_sales_details_new] where customer_segment = 'Corporate' and order_date between '01-JAN-2009' and '31-DEC-2012'
group by customer_name order by total_order desc;
773	Roy Skaria

--Which consumer customer was the most profitable one? 
select top 1 sum(profit) total_profit, customer_name from [dbo].[product_sales_details_new] where customer_segment = 'Consumer'
group by customer_name order by total_profit desc;
34005.4392166138	Emily Phan

--Which customer returned items, and what segment do they belong to? 
select a.order_id, a.status, b.customer_name, b.customer_segment from [dbo].[order_status] a, [dbo].[product_sales_details_new] b where a.order_id = b.order_id and a.status = 'Returned';
This has been saved as an excel sheet


/*--If the delivery truck is the most economical but the slowest shipping method and 
Express Air is the fastest but the most expensive one, do you think the company 
appropriately spent shipping costs based on the Order Priority? Explain your answer */
select order_priority, ship_mode, shipping_cost from [dbo].[product_sales_details_new];
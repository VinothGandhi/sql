/product/
create table products(
product_id int primary key,
product_name varchar(20),
description varchar(20),
standard_cost number(7,2),
list_price number(7,2),
category_id int);
 
desc products;
/order items/
create table order_items(
order_id int,
item_id int,
product_id int,
quantity int,
unit_price number(7,2));

alter table order_items add constraint fk_prod foreign key(product_id) references products(product_id);
/orders/
create table orders(
order_id int,
customer_id int,
status varchar(20),
employee_id int,
order_date date);

drop table orders cascade constraints ;
alter table order_items add constraint fk_orderid foreign key(order_id) references orders(order_id);
alter table orders add constraint pk_orderid primary key(order_id);
alter table orders add constraint fk_custid foreign key(customer_id) references customers(customer_id);
desc order_items;
drop table order_items;

desc orders;

/customers/
create table customers(
customer_id int primary key,
name varchar(20),
address varchar(20),
website varchar(20),
credit_limit number(7,2));

/employees/

create table employees(
employee_id int primary key,
first_name varchar(20),
last_name varchar(20),
email varchar(20),
phone int,
hire_date date,
manager_id int,
job_title varchar(20));

alter table orders add constraint fk_salesid foreign key(employee_id) references employees(employee_id);
select * from orders;
desc orders;
desc products;
select * from products;
--insert products--
--1 fitness watch--
insert into products values(1,'noisefit','track fitness',3000.00,2800.00,1);
insert into products values(2,'amazefit','track fitness',4000.00,3800.00,1);
insert into products values(3,'profit','track fitness',2000.00,1800.00,1);
insert into products values(4,'mifit','track fitness',5000.00,4500.00,1);

alter table products modify product_name varchar(40);
alter table products modify description varchar(50);
alter table products modify standard_cost number(13,2);
alter table products modify list_price number(13,2);
--2 smartphones--
insert into products values(5,'mi note 10','mid range smartphone',23000.00,22800.00,2);
insert into products values(6,'samsung m40','mid range smartphone',14000.00,13800.00,2);
insert into products values(7,'poco x3 pro','mid range gaming mobile',25000.00,24800.00,2);
insert into products values(8,'i phone 12 mini','mini version of iphone 12',55000.00,54500.00,2);

select * from tab;
select * from customers;
--insert customers--
insert into customers values(1,'mani','85,karambakkam,porur','www.amazon.com',50000.00);
insert into customers values(2,'hari','85,karambakkam,porur','www.amazon.com',50000.00);
insert into customers values(3,'suresh','85,karambakkam,porur','www.amazon.com',50000.00);
insert into customers values(4,'surya','85,karambakkam,porur','www.amazon.com',50000.00);
insert into customers values(5,'agis','85,karambakkam,porur','www.amazon.com',50000.00);
insert into customers values(6,'vinith','85,karambakkam,porur','www.amazon.com',50000.00);

select * from orders;
--orders--
insert into orders values(1,1,'shipped',1,'12-12-2021');
insert into orders values(2,1,'shipped',1,'13-12-2021');
insert into orders values(3,2,'packed',5,'14-12-2021');
insert into orders values(4,3,'delivered',1,'18-12-2021');
insert into orders values(5,2,'packed',5,'15-12-2021');
insert into orders values(6,5,'shipped',5,'12-12-2021');

update orders
set salesman_id = 1
where order_id in 6;

select * from order_items;

--insert order_items--
insert into order_items values(1,1,1,1,2800.00);
insert into order_items values(2,2,3,1,1800.00);
insert into order_items values(3,3,5,1,22800.00);
insert into order_items values(4,4,2,1,3800.00);
insert into order_items values(5,5,4,1,4500.00);
insert into order_items values(6,6,7,5,24800.00);

update order_items
set quantity = 5
where order_id in 1;


alter table employees modify job_title varchar(50);
--insert employees--
insert into employees values(1,'mani','kandan','manihfg,fjf@gmail.com',8685094302,'01-04-2019',4,'delivery boy');
insert into employees values(2,'suresh','kumar','sureshhfg,fjf@gmail.com',8685094302,'11-08-2019',6,'help and support');
insert into employees values(3,'hari','krishnan','harihfg,fjf@gmail.com',8685094302,'15-08-2019',6,'help and support');
insert into employees values(4,'abdul','agis','agishfg,fjf@gmail.com',8685094302,'25-05-2019',4,'manager');
insert into employees values(5,'surya','kumar yadav','suryahfg,fjf@gmail.com',8685094302,'29-07-2019',4,'delivery boy');
insert into employees values(6,'vinith','kumar','vinithhfg,fjf@gmail.com',8685094302,'28-09-2020',6,'manager');

select * from employees;
select * from products;
select * from orders;
select * from order_items;
select * from customers;

select order_items.order_id,products.product_name,products.description,order_items.quantity,order_items.unit_price,
(quantity*unit_price)as amt
from order_items join products on
order_items.order_id=products.product_id;




select order_items.order_id,products.product_name,products.description,order_items.quantity,order_items.unit_price,
(quantity*unit_price)as amt
from order_items join products on
order_items.order_id=products.product_id where unit_price between 1500 and 5000 order by product_name;


select order_items.order_id,products.product_name,products.description,order_items.quantity,order_items.unit_price,
(quantity*unit_price)as amt
from order_items join products on
order_items.order_id=products.product_id  where description like 't%' order by product_name;



select orders.order_date,order_items.order_id,products.product_name,products.description,
order_items.quantity,order_items.unit_price,(quantity*unit_price)as total_amt,orders.status from  products 
inner join 
order_items on products.product_id=order_items.order_id
inner join
orders on products.product_id=orders.order_id order by  orders.order_date;


select orders.order_date,order_items.order_id,products.product_name,products.description,
order_items.quantity,order_items.unit_price,(quantity*unit_price)as amt,orders.status
from  products 
inner join 
order_items on products.product_id=order_items.order_id
inner join 
orders on products.product_id=orders.order_id
where description like 't%' and unit_price between 1500 and 5000 order by  orders.order_date;

create table categories(
category_id int primary key,
category_name varchar(20));

select * from categories;

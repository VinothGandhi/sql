create table pro(pro_id int primary key,pro_name varchar2(50),description varchar2(500),standard_cost number,list_price number,category_id int);
desc pro;
select * from pro;
drop table product;
create table orderss(ord_id int primary key,order_name varchar2(50),order_date date);
desc orderss;
drop table ord;
select * from orderss;


drop table pro cascade constraints;
alter table pro add constraint fk_cateid foreign key(category_id) references categories(category_id);
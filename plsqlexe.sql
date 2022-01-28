set serveroutput on

CREATE OR REPLACE PACKAGE sales AS
--------------------customer
---------------add
procedure addcustomers(
                        c_id in customers.customer_id%type,
                        c_name1 in customers.name%type,
                        c_address in customers.address%type,
                        c_web in customers.website%type,
                        c_l in customers.credit_limit%type,
                         p_status out varchar2,
                        p_error out varchar2);
--------------------------------------delect
procedure deletecustomers(c_id in customers.customer_id%type, p_status out varchar2,p_error out varchar2);
------------------------category
procedure addcategory( 
                 cate_id in categories.category_id%type,
                 cate_name in categories.category_name%type,
             p_status out varchar2,
               p_error out varchar2);
-----------------delete
procedure delcategories(cate_id in categories.category_id%type,p_status out varchar2,p_error out varchar2);
-------------------products
   PROCEDURE addproduct(
   p_id in pro.pro_id%type,
   p_name in pro.pro_Name%type,
    p_desc pro.description%type,
   p_stprice in  pro.standard_cost%type,
   p_lprice in pro.list_price %type,  
   cate_id in  pro.category_id%type,
    p_status out varchar2,
   p_error out varchar2);  
   -- Removes a product
      PROCEDURE delproduct(p_id in pro.pro_id%TYPE,p_status out varchar2,p_error out varchar2);
      -----employee
------------------------add
procedure Addemployee(
                    emp_id in employees.employee_id%type,
                    emp_first in  employees.first_name%type ,
                    emp_lastname in employees.last_name%type ,
                    emp_email in employees.email%type,
                    emp_pho  in employees.phone%type,
                    emp_hdate in employees.hire_date%type,
                    emp_mid in employees.manager_id%type,
                    emp_job in employees.job_title%type,p_status out varchar2,p_error out varchar2);

---delete employee
PROCEDURE Delemployee(emp_id in employees.employee_id%TYPE,p_status out varchar2,p_error out varchar2);
   ---------order table
   PROCEDURE addorder(
                  o_id in orders.order_id%type,
                  c_id in orders.customer_id%type,
                  o_status in  orders.status%type,
                  emp_id in orders.employee_id %type,  
                  o_date in orders.order_date%type,p_status out varchar2,p_error out varchar2);
   ------------delect
 procedure deleteorder (o_id in orders.order_id%type,p_status out varchar2,p_error out varchar2);
 ----order_items
 --------------add
 procedure additems(o_id in order_items.order_id%type,
                    i_id order_items.item_id%type,
                   p_id in order_items.product_id%type,
                    qty in order_items.quantity%type,
                    u_p in order_items.unit_price%type,p_status out varchar2,p_error out varchar2);
-----------------delect
procedure deleteitems(i_id in order_items.item_id%type,p_status out varchar2,p_error out varchar2);
END sales;
/


------package body-----
select * from products1;

CREATE OR REPLACE PACKAGE body sales  AS
-----------------------add customer

  procedure addcustomers(
                         c_id in customers.customer_id%type,
                        c_name1 in customers.name%type,
                        c_address in customers.address%type,
                        c_web in customers.website%type,
                        c_l in customers.credit_limit%type,
                         p_status out varchar2,
                        p_error out varchar2) is
begin
insert into customers(customer_id,name,address,website,credit_limit)values(c_id,c_name1,c_address,c_web,c_l);
if Sql%rowcount>0 then
         p_status:='inserted';
          end if;
          if sql%rowcount=0 then
          p_status :='not inserted';
          end if;      
EXCEPTION
WHEN others then  
    p_status :='some thing is  wrong';
     p_error :=sqlcode ||' '|| sqlerrm;
  commit;
end addcustomers;

procedure deletecustomers(c_id in  customers.customer_id%type,p_status out varchar2,p_error out varchar2) is
begin
delete from customers where customer_id=c_id;
if Sql%rowcount>0 then
         p_status:='deleted';
          end if;
          if sql%rowcount=0 then
          p_status :='not deleted';
          end if;      
EXCEPTION
WHEN others then
    p_status :='some thing is  wrong';
     p_error :=sqlcode ||' '|| sqlerrm;
  commit;
   end deletecustomers;
   -----------------------------categories
   procedure addcategory( cate_id in categories.category_id%type,cate_name in categories.category_name%type,p_status out varchar2,p_error out varchar2) is
   begin
   insert into categories(category_id,category_name)values(cate_id,cate_name);
        if Sql%rowcount>0 then
         p_status:='inserted';
          end if;
          if sql%rowcount=0 then
          p_status :='not inserted';
          end if;      
EXCEPTION
WHEN others then  
    p_status :='some thing is  wrong';
     p_error :=sqlcode ||' '|| sqlerrm;
  commit;
end addcategory;

----------------------------------delect
procedure delcategories(cate_id in categories.category_id%type,p_status out varchar2,p_error out varchar2) is
begin
delete from categories where category_id=cate_id;
if Sql%rowcount>0 then
         p_status:='inserted';
          end if;
          if sql%rowcount=0 then
          p_status :='not inserted';
          end if;      
EXCEPTION
WHEN others then
    p_status :='some thing is  wrong';
     p_error :=sqlcode ||' '|| sqlerrm;
  commit;
  end delcategories;
   -- Adds a product
   
   PROCEDURE addproduct(
    p_id in pro.pro_id%type,
   p_name in pro.pro_Name%type,
    p_desc in pro.description%type,
   p_stprice in  pro.standard_cost%type,
   p_lprice in pro.list_price %type,  
   cate_id in pro.category_id%type,
     p_status out varchar2,p_error out varchar2) is
   
    BEGIN
      INSERT INTO pro(pro_id,pro_name,description,standard_cost,list_price,category_id)
         VALUES(p_id, p_name,p_desc, p_stprice, p_lprice, cate_id);
         if Sql%rowcount>0 then
         p_status:='inserted';
          end if;
          if sql%rowcount=0 then
          p_status :='not inserted';
          end if;      
EXCEPTION
WHEN others then
    p_status :='some thing is  wrong';
     p_error :=sqlcode ||' '|| sqlerrm;
  commit;
END addproduct;  

--   --------------------delete product
   PROCEDURE delproduct(p_id in pro.pro_id%type,p_status out varchar2,p_error out varchar2) IS
   BEGIN
      DELETE FROM pro WHERE pro_id = p_id ;
              if SQL%ROWCOUNT >0 then
                      p_status:='Deleted';
                 end if;
             if sql%rowcount=0
                then p_status:='No Value Deleted';
                end if;
exception
  when others then
   p_status:='Somthing went wrong';
   p_error:=sqlcode ||' '|| sqlerrm;
   END delproduct;
   
     ----------------------employee
--   ----------------------------------add
   
   procedure Addemployee( emp_id in employees.employee_id%type,
                            emp_first in  employees.first_name%type ,
                            emp_lastname in  employees.last_name%type ,
                            emp_email in employees.email%type,
                            emp_pho in employees.phone%type,
                            emp_hdate in employees.hire_date%type,
                            emp_mid in employees.manager_id%type,
                            emp_job in employees.job_title%type,p_status out varchar2,p_error out varchar2)is
                           
begin
insert into employees(employee_id,first_name,last_name,email,phone,hire_date,manager_id,job_title)values(emp_id,emp_first,emp_lastname,emp_email,emp_pho,emp_hdate,emp_mid,emp_job);
    if Sql%rowcount>0 then
         p_status:='inserted';
          end if;
          if sql%rowcount=0 then
          p_status :='not inserted';
          end if;      
EXCEPTION
WHEN others then
    p_status :='some thing is  wrong';
     p_error :=sqlcode ||' '|| sqlerrm;
   COMMIT;
   END Addemployee;

----delete employees---
PROCEDURE Delemployee(emp_id  employees.employee_id%type,p_status out varchar2,p_error out varchar2) IS
   BEGIN
      DELETE FROM employees WHERE employee_id=emp_id ;
         DELETE FROM employees WHERE employee_id = emp_id ;
              if SQL%ROWCOUNT >0 then
                      p_status:='Deleted';
                 end if;
             if sql%rowcount=0
                then p_status:='No Value Deleted';
                end if;
exception
  when others then
   p_status:='Somthing went wrong';
   p_error:=sqlcode ||' '|| sqlerrm;
     commit;
   END Delemployee;
   
--   ------------order table
      PROCEDURE addorder(o_id in orders.order_id%type,
                      c_id in orders.customer_id%type,
                          o_status in orders.status%type,
                          emp_id in orders.employee_id%type,  
                        o_date in orders.order_date%type,p_status out varchar2,p_error out varchar2) is
                           
    BEGIN
      INSERT INTO orders(order_id,customer_id,status,employee_id,order_date) VALUES(o_id, c_id, o_status, emp_id, o_date);
         if Sql%rowcount>0 then
                      p_status:='inserted';
          end if;
          if sql%rowcount=0 then
                              p_status :='not inserted';
          end if;      
EXCEPTION
WHEN others then
    p_status :='some thing is  wrong';
     p_error :=sqlcode ||' '|| sqlerrm;
COMMIT;
END addorder;
   -----order delete
   procedure deleteorder(o_id IN orders.order_id%type,p_status out varchar2,p_error out varchar2) IS  
    begin
   delete from orders where order_id= o_id;
            if SQL%ROWCOUNT >0 then
                      p_status:='Deleted';
                 end if;
             if sql%rowcount=0
                then p_status:='No Value Deleted';
                end if;
exception
  when others then
   p_status:='Somthing went wrong';
   p_error:=sqlcode ||' '|| sqlerrm;
   COMMIT;
   end deleteorder;
          ---------------------------order_items
   procedure additems(o_id in order_items.order_id%type,
                  i_id order_items.item_id%type,
                   p_id in order_items.product_id%type,
                    qty in order_items.quantity%type,
                    u_p in order_items.unit_price%type,p_status out varchar2,p_error out varchar2) is
    begin
    insert into order_items(order_id,item_id,product_id,quantity,unit_price)values(o_id,i_id,p_id,qty,u_p);
             if Sql%rowcount>0 then
                      p_status:='inserted';
          end if;
          if sql%rowcount=0 then
                              p_status :='not inserted';
          end if;      
EXCEPTION
WHEN others then
    p_status :='some thing is  wrong';
     p_error :=sqlcode ||' '|| sqlerrm;
COMMIT;
   end additems;
   
   -----------------------delect items
   procedure deleteitems(i_id in order_items.item_id%type,p_status out varchar2,p_error out varchar2) IS  
begin
   delete from order_items where item_id=i_id;
      if SQL%ROWCOUNT >0 then
                      p_status:='Deleted';
                 end if;
             if sql%rowcount=0
                then p_status:='No Value Deleted';
                end if;
exception
  when others then
   p_status:='Somthing went wrong';
   p_error:=sqlcode ||' '|| sqlerrm;
   COMMIT;
   end deleteitems;
  END sales;
/

   
   
   set serverout on
set serveroutput on

declare
p_status varchar2(199);
p_error varchar2(500);
begin
sales.Addemployee('munish','ram','munish@gmail.com',9995612397,'12-12-19',1,'hr',p_status,p_error);
dbms_output.put_line(p_status||p_error);
end ;
/
select * from customers;
select * from pro;
select * from employees;
select * from orders;
select * from order_items;
select * from categories;

/
declare 
p_status varchar2(100);
p_error varchar2(100);
begin 
sales.addcustomers(12,'hari','chennai','www.amazon.com',50000,p_status,p_error);
dbms_output.put_line(p_status||p_error);
end;


declare 
p_status varchar2(100);
p_error varchar2(100);
begin 
sales.deletecustomers(12,p_status,p_error);
dbms_output.put_line(p_status||p_error);
end;


declare 
p_status varchar2(100);
p_error varchar2(100);
begin 
sales.addcategory(1,'sports',p_status,p_error);
sales.addcategory(2,'sports',p_status,p_error);

dbms_output.put_line(p_status||p_error);
end;


declare 
p_status varchar2(100);
p_error varchar2(100);
begin 
sales.addproduct(1,'cycle','sports',1000,900,1,p_status,p_error);
sales.addproduct(2,'shoe','sports',1000,900,2,p_status,p_error);
sales.addproduct(3,'mobile','vivo',1000,900,1,p_status,p_error);
sales.addproduct(4,'bat','sports',1000,900,2,p_status,p_error);
sales.addproduct(5,'stump','sports',1000,900,1,p_status,p_error);



dbms_output.put_line(p_status||p_error);
end;

declare 
p_status varchar2(100);
p_error varchar2(100);
begin 
sales.Delemployee(1,p_status,p_error);


dbms_output.put_line(p_status||p_error);
end;

declare 
p_status varchar2(100);
p_error varchar2(100);
begin 
sales.delemployee(10,p_status,p_error);


dbms_output.put_line(p_status||p_error);
end;


create or replace function get_employee(

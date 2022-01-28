set serveroutput on
declare 
    n2 number:='&num2';
    n1 number:='&num';
begin
loop
    dbms_output.put_line(n1*n2);
if (n2>10) then
exit ;
end if;
n2:=n2+1;
end loop;
end;
/

set serveroutput on
declare
    n1 number :=0;
begin
loop
while(n1<5)
loop
n1 := n1+1;
DBMS_OUTPUT.PUT_line(n1);
end loop;
end;
/

declare
a number :=10;
begin
for i in 1..10
loop
a:=a+1;
DBMS_OUTPUT.PUT_LINE(to_char ||'_'||to_char(a));
end loop;
end;
/



declare

begin
for a in 1..5
loop
a:=a+1;
 DBMS_OUTPUT.PUT_LINE(a);
end loop;
end;
/


Create table employeeee
(id int primary key,
first_name varchar(50),
last_name varchar(50),
email varchar(50),
phone_number varchar(50),
hire_datet date,
salary int,
date_of_birth date);
 
 desc employeeee;

Insert into employeeee
values(1,'anu','sharma','anu@gmail.com',9864675634,'07-12-2015',20000,'01-12-1998');
Insert into employeeee
values(2,'ananthi','sharma','ananthi@gmail.com',8608491910,'08-03-1995',22000,'03-12-1994');
Insert into employeeee
values(3,'amarnath','pillai','amarnath@gmail.com',7894589654,'07-03-2005',38000,'01-12-1995');
Insert into employeeee
values(4,'clinton','pritheev','clinton@gmail.com',7708480901,'06-01-2005',23000,'09-05-1994');
Insert into employeeee
values(5,'collin','paul','collin@gmail.com',9842524655,'06-02-2016',30500,'12-2-1996');
Insert into employeeee values(
6, 'haritha', 'mohan', 'haritha@gmail.com', 7710589123, '07-2-2006', 41000, '06-12-1993');
Insert into employeeee values
(7, 'shrihari', 'pillai', 'shrihari@gmail.com', 9842512456, '07-01-2005', 21000, '05-01-1995');
Insert into employeeee values
(8, 'jeeva', 'annath', 'jeeva@gmail.com', 8608491912, '06-02-2013',
28000, '12-3-2019');
Insert into employeeee values
(9, 'jimesh', 'sharma', 'jimesh@gmail.com', 9634565231, '05-06-2019', 51000, '10-2-1992');


select * from employeeee;

DECLARE 
   ID_emp employeeee.id%type := 5; 
   NAME_emp employeeee.FIRST_NAME%type; 
   SAL_emp employeeee.SALARY%type; 
BEGIN 
   SELECT  first_name, salary INTO  NAME_emp,SAL_emp
   FROM employeeee 
   WHERE id = id_emp;  
   DBMS_OUTPUT.PUT_LINE ('Name: '|| NAME_emp ); 
   DBMS_OUTPUT.PUT_LINE ('salary: ' || SAL_emp); 

EXCEPTION 
   WHEN no_data_found THEN 
      dbms_output.put_line('No such Employee!'); 
   WHEN others THEN 
      dbms_output.put_line('Error!'); 
END; 
/


declare 
f_name employee.first_name%type;
l_name employee.last_name%type;
sal employee.salary%type;
ema employee.email%type;
cursor c_d is select employee.first_name,employee.last_name ,employee.salary,employee.email from employee where rownum<5;
begin
open c_d;
loop
fetch c_d into f_name,l_name,sal,ema;

exit when c_d%notfound;
dbms_output.put_line(c_d%rowcount);
dbms_output.put_line(f_name||' '||l_name||' '||sal||' '||ema);
end loop;
close c_d;
end;
/


select employee.first_name,employee.last_name ,employee.salary,employee.email from employee where rownum<4;

----------------------------------------------------------------------------------------------------

create or replace  procedure procee
is
begin
---dbms_output.put_line(ro_char(a+b));
dbms_output.put_line('hello');


end ;
/
exec procee;



-----------------------------------------------------------------
CREATE PACKAGE em_sal AS 
   PROCEDURE find_sal(e_id employeeee.id%type); 
END em_sal; 
/

CREATE OR REPLACE PACKAGE BODY em_sal AS  
   
   PROCEDURE find_sal(e_id employeeee.id%TYPE) IS 
   e_sal employeeee.salary%TYPE; 
   BEGIN 
      SELECT salary INTO e_sal 
      FROM employeeee 
      WHERE id = e_id; 
      dbms_output.put_line('Salary: '|| e_sal); 
   END find_sal; 
END em_sal; 
/


DECLARE 
   code employeeee.id%type := &ee_id; 
BEGIN 
   em_sal.find_sal(code); 
END; 
/

select * from employeeee;



create table emp (empno number,empname varchar2(20),empsalary number(7),empdept varchar2(20),CONSTRAINT empno_pk primary key(empno));

--creating sequence for empno
create sequence emp_seq increment by 1;

--package creation

create or replace package chainsys as 
procedure hire (empname in varchar2,empsalary in number,empdept in varchar2);
procedure fire (empnum in number);
end;

create or replace package body chainsys as
 procedure hire
(empname in varchar2,empsalary in number,empdept in varchar2) IS
begin
insert into emp (empno,empname,empsalary,empdept) values (EMP_SEQ.nextval,empname,empsalary,empdept);
commit;
end hire;
procedure fire (empnum in number) IS
begin
delete from emp where empno = empnum;
commit;
end fire;
end;


execute chainsys.hire('pothi',25000,'Technical team');

execute chainsys.fire(03);

---------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE c_ord AS 
   -- Adds a product 
   PROCEDURE addorder(o_id orders.order_id%type, 
   c_id orders.customer_id%type, 
   o_status   orders.status%type, 
   o_salmen  orders.salesman_id %type,  
   o_date  orders.order_date%type);
end c_ord;

CREATE OR REPLACE PACKAGE body c_ord  AS 
   -- Adds a product 
   PROCEDURE addorder(o_id orders.order_id%type, 
   c_id orders.customer_id%type, 
   o_status   orders.status%type, 
   o_salmen  orders.salesman_id %type,  
   o_date  orders.order_date%type)
    IS iv_err_code varchar2(20); 
    BEGIN 
      INSERT INTO orders(order_id,customer_id,status,salesman_id,order_date) 
         VALUES(o_id, c_id, o_status, o_salmen, o_date); 
         if Sql%found then 
         dbms_output.put_line('record inserted');
         else
          dbms_output.put_line('record  not inserted');
          end if;
          iv_err_code:='s';
           dbms_output.put_line('status:'||' '||iv_err_code);
         
EXCEPTION
WHEN others then 
       iv_err_code:='e';
       dbms_output.put_line('record  not inserted ||||sqlerrm'); 
       dbms_output.put_line('record  not inserted');

   
   COMMIT;
   END addorder;
   
   
   END  c_ord;
   /

execute c_ord.addorder('123','21','finsih','1100','10-05-2021');
desc orders;
select*from orders;

select * from Pro;
--------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE sales AS
   -- Adds a product
   PROCEDURE addproduct(p_id pro.pro_id%type,
   p_name pro.pro_Name%type,
   p_stprice   pro.standard_cost%type,
   p_lprice  pro.list_price %type); 
   
   
   -- Removes a product
   PROCEDURE delproduct(p_id  pro.pro_id%TYPE);
   --Lists all products
   
 
END sales;
/

------package body-----
desc pro
CREATE OR REPLACE PACKAGE body sales  AS
   -- Adds a product
   PROCEDURE addproduct(p_id pro.pro_id%type,
   p_name pro.pro_Name%type,
   p_stprice   pro.standard_cost%type,
   p_lprice  pro.list_price %type)  
    IS iv_err_code varchar2(20);
    BEGIN
      INSERT INTO pro(pro_id,pro_Name,standard_cost,list_price)
         VALUES(p_id, p_name, p_stprice, p_lprice);
         if Sql%found then
         dbms_output.put_line('record inserted');
         else
          dbms_output.put_line('record  not inserted');
          end if;
          iv_err_code:='s';
           dbms_output.put_line('status:'||' '||iv_err_code);
         
EXCEPTION
WHEN others then
       iv_err_code:='e';
       dbms_output.put_line('record  not inserted ||||sqlerrm');
       dbms_output.put_line('record  not inserted');

   
   COMMIT;
   END addproduct;
   
   PROCEDURE delproduct(p_id  pro.pro_id%type) IS
   BEGIN
      DELETE FROM pro WHERE pro_id =p_id ;
       IF SQL%FOUND THEN
         DBMS_OUTPUT.PUT_LINE('PRODUCT DELETED');
         ELSE
          DBMS_OUTPUT.PUT_LINE('PRODUCT NOT DELETE');
   END IF;
     
   END delproduct;
   
   END  sales;
   /
EXECUTE  sales.addproduct('9','NOKIA',250,20,123);
EXECUTE sales.delproduct(765);
set serveroutput on;
desc pro;



select* from orders;

--------order----

CREATE OR REPLACE PACKAGE c_ord AS
   -- Adds a product
   PROCEDURE addorder(o_id orders.order_id%type,
   c_id orders.customer_id%type,
   o_status   orders.status%type,
   o_salmen  orders.salesman_id %type,  
   o_date  orders.order_date%type);
end c_ord;

----order body----
CREATE OR REPLACE PACKAGE body c_ord  AS
   -- Adds a product
   PROCEDURE addorder(o_id orders.order_id%type,
   c_id orders.customer_id%type,
   o_status   orders.status%type,
   o_salmen  orders.salesman_id %type,  
   o_date  orders.order_date%type)
    IS iv_err_code varchar2(20);
    BEGIN
      INSERT INTO orders(order_id,customer_id,status,salesman_id,order_date)
         VALUES(o_id, c_id, o_status, o_salmen, o_date);
         if Sql%found then
         dbms_output.put_line('record inserted');
         else
          dbms_output.put_line('record  not inserted');
          end if;
          iv_err_code:='s';
           dbms_output.put_line('status:'||' '||iv_err_code);
         
EXCEPTION
WHEN others then
       iv_err_code:='e';
       dbms_output.put_line('record  not inserted ||||sqlerrm');
       dbms_output.put_line('record  not inserted');

   
   COMMIT;
   END addorder;
   
   
   END  c_ord;
   /

execute c_ord.addorder('1234','22','finsihied','1200','11-06-2021');
desc orders;
select*from employees;
set serveroutput on
-------employee---
create or replace package e_emp as
procedure add_emp(emp_id employees.employee_id%type,emp_name employees.first_name%type ,emp_email employees.email%type ,emp_no employees.phone%type,
h_date employees.hire_date%type,man_id employees.manager_id%type,emp_job employees.job_title%type);

end e_emp;

------body------
CREATE OR REPLACE PACKAGE body e_emp  AS
procedure add_emp(emp_id employees.employee_id%type,emp_name employees.first_name%type ,emp_email employees.email%type ,emp_no employees.phone%type,
h_date employees.hire_date%type,man_id employees.manager_id%type,emp_job employees.job_title%type)
is iv_err_code varchar2(20);
begin
insert into employees(employee_id,first_name,email,phone,hire_date,manager_id,job_title) values(emp_id,emp_name,emp_email,emp_no,h_date,man_id,emp_job);
  if Sql%found then
         dbms_output.put_line('employee  inserted');
         else
          dbms_output.put_line('employee not inserted');
          end if;
          iv_err_code:='s';
           dbms_output.put_line('status:'||' '||iv_err_code);
         
EXCEPTION
WHEN others then
       iv_err_code:='e';
       dbms_output.put_line('employee not inserted ||||sqlerrm');
       dbms_output.put_line('remployee not inserted');

   
   COMMIT;
   END add_emp;
   end e_emp;
   /
   execute e_emp.add_emp(456,'pandidurai','pandi@gmail.com',9840220587,'22-12-2021',777,'sales');
  desc employees;
  select* from employees;
select* from order_items;
------order items----
CREATE OR REPLACE PACKAGE sales AS
   -- Adds a product
  procedure add_items (o_id order_items.order_id%type,
o_item_id order_items.item_id%type,
pro_id order_items.product_id%type,
quantity order_items.quantity%type,
u_price order_items.unit_price%type);
--procedure del_items(o_id order_items.order_id%type);
---procedure upd_items(o_id order_items.order_id%type);
end sales;

-----order items body----
CREATE OR REPLACE PACKAGE body sales  AS
 procedure add_items (o_id order_items.order_id%type,
o_item_id order_items.item_id%type,
pro_id order_items.product_id%type,
quantity order_items.quantity%type,
u_price order_items.unit_price%type)
is iv_err_code varchar2(20);
begin
insert into order_items(order_id ,item_id ,product_id ,quantity ,unit_price)
values(o_id,o_item_id,pro_id,quantity,u_price);
  if Sql%found then
         dbms_output.put_line('order_items  inserted');
         else
          dbms_output.put_line('order_items not inserted');
          end if;
          iv_err_code:='s';
           dbms_output.put_line('status:'||' '||iv_err_code);
         
EXCEPTION
WHEN others then
       iv_err_code:='e';
       dbms_output.put_line('order_items not inserted ||||sqlerrm');
       dbms_output.put_line('order_items not inserted');

   
   COMMIT;
   END add_items;
   end sales;
------customer spcification---
select *from customer;
desc customer;
  CREATE  or replace PACKAGE cus AS  
procedure addCustomer(c_id customer.cust_id%TYPE, c_name customer.name%type,c_address customer.address%type,
c_web customer.website%type,c_climit customer.credit_limit%type);

end cus;
/
-------package--------

CREATE OR REPLACE PACKAGE BODY cus_table AS
procedure addCustomer (c_id customer.customer_id%TYPE, c_name customer.customer_name%type,c_address customer.address%type,
c_web customer.website%type,c_climit customer.create_limit%type)
is iv_err_code varchar2(20);  
begin    
insert into customer(customer_id,customer_name,address,website,create_limit ) values
( c_id,c_name,c_address,c_web,c_climit );  
if Sql%found then
         dbms_output.put_line('customer inserted');
         else
          dbms_output.put_line('customer not inserted');
          end if;
          iv_err_code:='s';
           dbms_output.put_line('status:'||' '||iv_err_code);
         
EXCEPTION
WHEN others then
       iv_err_code:='e';
       dbms_output.put_line('customers not inserted ||||sqlerrm');
       dbms_output.put_line('customers not inserted');
       
 end addcustomer;
 end cus_table;
----------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------




select * from product;


---product table---
CREATE OR REPLACE PACKAGE sales AS
   -- Adds a product
   PROCEDURE Addproduct(p_id pro.pro_id%type,
   p_name pro.pro_Name%type,
   p_des  pro.description%type,
   p_stdcost   pro.standard_cost%type,
   p_lprice  pro.list_price %type);  
   
   
   -- Removes a product
   PROCEDURE Delproduct(p_id  pro.pro_id%TYPE);

----order table---
----Add order table----

select* from orders;
 PROCEDURE Addorder(o_id orders.order_id%type,
   o_cid orders.customer_id%type,
   o_status   orders.status%type,
   o_salmen  orders.salesman_id %type,  
   o_date  orders.order_date%type);

---delete order table----
PROCEDURE Delorder(o_id  orders.order_id%TYPE);

------employee table---
---employee Addtable---
procedure Add_emp(emp_id employees.employee_id%type,
emp_salesman employees.salesman_name%type ,
emp_lastname employees.last_name%type ,
emp_email employees.email%type,
emp_pho employees.phone%type,emp_hdate employees.hire_date%type,
emp_mid employees.manager_id%type,
emp_job employees.job_title%type);

---delete employee---
PROCEDURE Delemp(emp_id  employees.employee_id%TYPE);

-----orderitems---
 PROCEDURE Add_orderitem(oi_oi order_items.order_id%type,
   oi_itemid order_items.item_id%type,
   oi_proid  order_items.product_id%type,
   oi_qi  order_items.quanity_id %type,  
   oi_uprice  order_items.unit_price%type);

----delorderitem---
PROCEDURE Delorderitem(oi_oi order_items.order_id%TYPE);

-----customer table----
----Addcustomer---
procedure addCustomer(c_id customer.customer_id%TYPE,
c_name customer.customer_name%type,
c_address customer.address%type,
c_web customer.website%type,
c_climit customer.create_limit%type);

----delcustomer---
PROCEDURE Delcustomer(c_id customer.customer_id%TYPE);
end sales;



-----package body-----
CREATE OR REPLACE PACKAGE body sales  AS
   -- Add product
    PROCEDURE Addproduct(p_id products.product_id%type,
   p_name products.product_Name%type,
   p_des  products.descrption%type,
   p_stdcost   products.standard_cost%type,
   p_lprice  products.list_price %type,  
   p_catid  products.category_id%type)  
   IS iv_err_code varchar2(20);
    BEGIN
      INSERT INTO products(product_id,product_Name,descrption,standard_cost,list_price,category_id)
         VALUES(p_id, p_name,p_des, p_stdcost, p_lprice, p_catid);
         if Sql%found then
         dbms_output.put_line('record inserted');
         else
          dbms_output.put_line('record  not inserted');
          end if;
          iv_err_code:='s';
           dbms_output.put_line('status:'||' '||iv_err_code);
         
EXCEPTION
WHEN others then
       iv_err_code:='e';
       dbms_output.put_line('record  not inserted ||||sqlerrm');
       dbms_output.put_line('record  not inserted');

   
   COMMIT;
   END Addproduct;
   ----delete program---
   PROCEDURE Delproduct(p_id  products.product_id%type) IS
   BEGIN
      DELETE FROM products WHERE product_id =p_id ;
       IF SQL%FOUND THEN
         DBMS_OUTPUT.PUT_LINE('PRODUCT DELETED');
         ELSE
          DBMS_OUTPUT.PUT_LINE('PRODUCT NOT DELETE');
   END IF;
     
   END Delproduct;
   
   
------orders program----
PROCEDURE Addorder(o_id orders.order_id%type,
   o_cid orders.customer_id%type,
   o_status   orders.status%type,
   o_salmen  orders.salesman_id %type,  
   o_date  orders.order_date%type)
    IS iv_err_code varchar2(20);
    BEGIN
      INSERT INTO orders(order_id,customer_id,status,salesman_id,order_date)
         VALUES(o_id, o_cid, o_status, o_salmen, o_date);
         if Sql%found then
         dbms_output.put_line('record inserted');
         else
          dbms_output.put_line('record  not inserted');
          end if;
          iv_err_code:='s';
           dbms_output.put_line('status:'||' '||iv_err_code);
         
EXCEPTION
WHEN others then
       iv_err_code:='e';
       dbms_output.put_line('record  not inserted ||||sqlerrm');
       dbms_output.put_line('record  not inserted');
  COMMIT;
END addorder;
----delete order program---  
   PROCEDURE Delorder(o_id  orders.order_id%type) IS
   BEGIN
      DELETE FROM orders WHERE order_id =o_id ;
       IF SQL%FOUND THEN
         DBMS_OUTPUT.PUT_LINE('order DELETED');
         ELSE
          DBMS_OUTPUT.PUT_LINE('order NOT DELETE');
   END IF;
     
   END delorder;
   
-------employee program----
-----Add employeee----
procedure Add_emp(emp_id employees.employee_id%type,
emp_salesman employees.salesman_name%type ,
emp_lastname employees.last_name%type ,
emp_email employees.email%type,
emp_pho employees.phone%type,
emp_hdate employees.hire_date%type,
emp_mid employees.manager_id%type,
emp_job employees.job_title%type)
is iv_err_code varchar2(20);
begin
insert into employees(employee_id,salesman_name,last_name,email,phone,hire_date,manager_id,job_title)
values(emp_id,emp_salesman,emp_lastname,emp_email,emp_pho,emp_hdate,emp_mid,emp_job);

  if Sql%found then
         dbms_output.put_line('employee  inserted');
         else
          dbms_output.put_line('employee not inserted');
          end if;
          iv_err_code:='s';
           dbms_output.put_line('status:'||' '||iv_err_code);
         
EXCEPTION
WHEN others then
       iv_err_code:='e';
       dbms_output.put_line('employee not inserted ||||sqlerrm');
       dbms_output.put_line('remployee not inserted');

   
   COMMIT;
   END Add_emp;

----delete employees---
PROCEDURE Delemp(emp_id  employees.employee_id%type) IS
   BEGIN
      DELETE FROM employees WHERE employee_id=emp_id ;
       IF SQL%FOUND THEN
         DBMS_OUTPUT.PUT_LINE('employee DELETED');
         ELSE
          DBMS_OUTPUT.PUT_LINE('employee NOT DELETE');
   END IF;
     
   END Delemp;
 
----orderitems program----
 PROCEDURE Add_orderitem(oi_oi order_items.order_id%type,
   oi_itemid order_items.item_id%type,
   oi_proid  order_items.product_id%type,
   oi_qi  order_items.quanity_id %type,  
   oi_uprice  order_items.unit_price%type)
is iv_err_code varchar2(20);
begin
insert into order_items(order_id ,item_id ,product_id ,quanity_id ,unit_price)
values(oi_oi,oi_itemid,oi_proid,oi_qi,oi_uprice);
  if Sql%found then
         dbms_output.put_line('order_items  inserted');
         else
          dbms_output.put_line('order_items not inserted');
          end if;
          iv_err_code:='s';
           dbms_output.put_line('status:'||' '||iv_err_code);
         
EXCEPTION
WHEN others then
       iv_err_code:='e';
       dbms_output.put_line('order_items not inserted ||||sqlerrm');
       dbms_output.put_line('order_items not inserted');

   
   COMMIT;
   END Add_orderitem;
----delete order_items---
PROCEDURE Delorderitem(oi_oi order_items.order_id%type) IS
   BEGIN
      DELETE FROM order_items WHERE order_id=oi_oi ;
       IF SQL%FOUND THEN
         DBMS_OUTPUT.PUT_LINE('orderitem DELETED');
         ELSE
          DBMS_OUTPUT.PUT_LINE('orderitem NOT DELETE');
   END IF;
     
   END Delorderitem;
 
  ------customer----
   procedure addCustomer(c_id customer.customer_id%TYPE,
c_name customer.customer_name%type,
c_address customer.address%type,
c_web customer.website%type,
c_climit customer.create_limit%type)
is iv_err_code varchar2(20);  
begin    
insert into customer(customer_id,customer_name,address,website,create_limit ) values
( c_id,c_name,c_address,c_web,c_climit );  
if Sql%found then
         dbms_output.put_line('customer inserted');
         else
          dbms_output.put_line('customer not inserted');
          end if;
          iv_err_code:='s';
           dbms_output.put_line('status:'||' '||iv_err_code);
         
EXCEPTION
WHEN others then
       iv_err_code:='e';
       dbms_output.put_line('customers not inserted ||||sqlerrm');
       dbms_output.put_line('customers not inserted');
       
 end addcustomer;

----delete customer---
PROCEDURE Delcustomer(c_id customer.customer_id%type) IS
   BEGIN
      DELETE FROM customer WHERE customer_id=c_id ;
       IF SQL%FOUND THEN
         DBMS_OUTPUT.PUT_LINE('customer DELETED');
         ELSE
          DBMS_OUTPUT.PUT_LINE('customer NOT DELETE');
   END IF;
     
   END Delcustomer;

   end sales;
---tables----  
 select* from products;
 select* from orders;
 select* from employees;
 select* from order_items;
 select* from customer;
   
   
   
 set serveroutput on;  
 --exectute  product--  
EXECUTE sales.addproduct(120,'vivo','good',15000,16000,1234);
EXECUTE sales.delproduct(999);

---execute order--
execute sales.addorder(210,31,'preocess',101,'10-10-2020');
execute sales.delorder(209);  

----execute employee---
execute sales.add_emp(1011,'ram','kumar','ramkumar@gmail.com',987654321,'12-12-2021',11,'worker');
execute sales.delemp(1009);

----execute orderitem---
execute sales.add_orderitem(333,222,111,21,1000);
execute sales.delorderitem(209);

----execute customer---
execute sales.addcustomer(21,'ram','ganapathi st','filpkart',8000);
execute sales.delcustomer(21);

set serveroutput on

select * from pro;
select * from orders;
select * from order_items;
select * from customers;
select * from employees;

CREATE OR REPLACE PACKAGE sales AS
   PROCEDURE addproduct(p_id pro.pro_id%type,
   p_name pro.pro_Name%type,
   p_desc pro.description%type,
   p_stprice   pro.standard_cost%type,
   p_lprice  pro.list_price %type); 
   -- Removes a product
   PROCEDURE delproduct(p_id  pro.pro_id%TYPE);
   --------------updaate a product
--   procedure updateproduct((p_id products1.product_id%type,
--   p_name products1.product_Name%type,
--   p_stprice   products1.standard_cost%type,
--   p_lprice  products1.list_price %type,  
--   p_catid  products1.category_id%type);
   --Lists all products
   ---------order table
   PROCEDURE addorder(o_id orders.order_id%type,
                  c_id orders.customer_id%type,
                  o_status   orders.status%type,
                  o_salmen  orders.salesman_id %type,  
                  o_date  orders.order_date%type);
   ------------delect
 procedure deleteorder (o_id orders.order_id%type);
 ----order_items
 --------------add
 procedure additems(oi_id order_items.order_id%type,
                    i_id order_items.item_id%type,
                    p_id order_items.product_id%type,
                    qty order_items.quantity%type,
                    u_p order_items.unit_price%type);
-----------------delect
procedure deleteitems(oi_id order_items.order_id%type);
------------------customer
-------------add
procedure addcustomers(c_id customers.customer_id%type,
                        c_name customers.name%type,
                        c_address customers.address%type,
                        c_web customers.website%type,
                        c_l customers.credit_limit%type);
--------------------------------------delect
procedure deletecustomers(c_id customers.customer_id%type);

---employee
----------------------add
procedure Addemployee(emp_id employees.employee_id%type,
                    emp_first employees.first_name%type ,
                    emp_lastname employees.last_name%type ,
                    emp_email employees.email%type,
                    emp_pho employees.phone%type,
                    emp_hdate employees.hire_date%type,
                    emp_mid employees.manager_id%type,
                    emp_job employees.job_title%type);

---delete employee
PROCEDURE Delemployee(emp_id  employees.employee_id%TYPE);
END sales;
/




------package body-----





CREATE OR REPLACE PACKAGE body sales  AS
   -- Adds a product
   PROCEDURE addproduct(p_id pro.pro_id%type,
   p_name pro.pro_Name%type,
   p_desc pro.description%type,
   p_stprice   pro.standard_cost%type,
   p_lprice  pro.list_price %type)
    IS iv_err_code varchar2(20);
    BEGIN
      INSERT INTO pro(pro_id,pro_Name,description,standard_cost,list_price)
         VALUES(p_id, p_name,p_desc, p_stprice, p_lprice);
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
   --------------------delete product
   PROCEDURE delproduct(p_id  pro.pro_id%type) IS
   BEGIN
      DELETE FROM pro WHERE pro_id =p_id ;
       IF SQL%FOUND THEN
         DBMS_OUTPUT.PUT_LINE('PRODUCT DELETED');
         ELSE
          DBMS_OUTPUT.PUT_LINE('PRODUCT NOT DELETE');
   END IF;    
   END delproduct;  
   
   ------------order table
      PROCEDURE addorder(o_id orders.order_id%type,
                         c_id orders.customer_id%type,
                          o_status   orders.status%type,
                          o_salmen  orders.salesman_id%type,  
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
   -----order delete
   procedure deleteorder(o_id orders.order_id%type)
IS iv_err_code varchar2(20);
    begin
   delete from orders where order_id=o_id;
   if Sql%found then
         dbms_output.put_line('record deleted');
         else
          dbms_output.put_line('record  not deleted');
          end if;
          iv_err_code:='s';
          dbms_output.put_line('status:'||' '||iv_err_code);        
EXCEPTION
WHEN others then
       iv_err_code:='e';
       dbms_output.put_line('record  not deleted ||||sqlerrm');
       dbms_output.put_line('record  not deleted');
   COMMIT;
   end deleteorder;
   ---------------------------order_items
    procedure additems(oi_id order_items.order_id%type,
                    i_id order_items.item_id%type,
                    p_id order_items.product_id%type,
                    qty order_items.quantity%type,
                    u_p order_items.unit_price%type)
                    IS iv_err_code varchar2(20);
    begin
    insert into order_items(order_id,item_id,product_id,quantity,unit_price)values(oi_id,i_id,p_id,qty,u_p);
    if Sql%found then
        DBMS_OUTPUT.PUT_LINE('inserted success');
    else
        dbms_output.put_line('inserted failed');
        end if;
    iv_err_code:='s';
        dbms_output.put_line('status :' ||' ' ||iv_err_code);
    EXCEPTION
WHEN others then
       iv_err_code:='e';
       dbms_output.put_line('record  not inserted ||||sqlerrm');
       dbms_output.put_line('record  not inserted');
COMMIT;
   end additems;
   -----------------------delect items
   procedure deleteitems(oi_id order_items.order_id%type)
   IS iv_err_code varchar2(20);
   begin
   delete from order_items where order_id=oi_id;
      if Sql%found then
         dbms_output.put_line('record deleted');
          end if;
          iv_err_code:='s';
          dbms_output.put_line('status:'||' '||iv_err_code);        
EXCEPTION
WHEN others then
       iv_err_code:='e';
       dbms_output.put_line('record  not deleted ||||sqlerrm');
       dbms_output.put_line('record  not deleted');
   COMMIT;
   end deleteitems;
   ---------------------------------------customers
   procedure addcustomers(c_id customers.customer_id%type,
                        c_name customers.name%type,
                        c_address customers.address%type,
                        c_web customers.website%type,
                        c_l customers.credit_limit%type)
                        is iv_err_code varchar2(20);
begin
insert into customers(customer_id,name,address,website,credit_limit)values(c_id,c_name,c_address,c_web,c_l);
     if sql%found then
        DBMS_OUTPUT.PUT_LINE('inserted success');
        end if;
    iv_err_code:='s';
        dbms_output.put_line('status :' ||' ' ||iv_err_code);
    EXCEPTION
WHEN others then
       iv_err_code:='e';
       dbms_output.put_line('record  not inserted ||||sqlerrm');
       dbms_output.put_line('record  not inserted');
COMMIT;
end addcustomers;
procedure deletecustomers(c_id customers.customer_id%type)   is iv_err_code varchar2(20);
begin
delete from customers where customer_id=c_id;
   if Sql%found then
         dbms_output.put_line('record deleted');
    end if;
          iv_err_code:='s';
          dbms_output.put_line('status:'||' '||iv_err_code);        
EXCEPTION
WHEN others then
       iv_err_code:='e';
       dbms_output.put_line('record  not deleted ||||sqlerrm');
       dbms_output.put_line('record  not deleted');
   COMMIT;  
   end deletecustomers;
   ----------------------employee
   ----------------------------------add
   
   procedure Addemployee(emp_id employees.employee_id%type,
                            emp_first employees.first_name%type ,
                            emp_lastname employees.last_name%type ,
                            emp_email employees.email%type,
                            emp_pho employees.phone%type,
                            emp_hdate employees.hire_date%type,
                            emp_mid employees.manager_id%type,
                            emp_job employees.job_title%type)
                            is iv_err_code varchar2(20);
begin
insert into employees(employee_id,first_name,last_name,email,phone,hire_date,manager_id,job_title)values(emp_id,emp_first,emp_lastname,emp_email,emp_pho,emp_hdate,emp_mid,emp_job);

  if Sql%found then
         dbms_output.put_line('employee details inserted');
--         else
--          dbms_output.put_line('employee not inserted');
          end if;
          iv_err_code:='s';
           dbms_output.put_line('status:'||' '||iv_err_code);
         
EXCEPTION
WHEN others then
       iv_err_code:='e';
       dbms_output.put_line('employee not inserted ||||sqlerrm');
       dbms_output.put_line('remployee not inserted');
   COMMIT;
   END Addemployee;

----delete employees---
PROCEDURE Delemployee(emp_id  employees.employee_id%type) IS
   BEGIN
      DELETE FROM employees WHERE employee_id=emp_id ;
      IF SQL%FOUND THEN
      DBMS_OUTPUT.PUT_LINE('employee DELETED');
--     ELSE
--    DBMS_OUTPUT.PUT_LINE('employee NOT DELETE');
   END IF;
     
   END Delemployee;
   
   end sales;
   /
   
   EXECUTE  sales.addproduct(8,'sathish','sports',50,45);
   EXECUTE  sales.addproduct(9,'santhosh','sports',100,85);
   EXECUTE  sales.addproduct(10,'rahul','sports',125,100);
   EXECUTE  sales.addproduct(11,'hari','sports',155,145);
   
   EXECUTE sales.delproduct(10);
   
  EXECUTE sales.deleteorder(6);
  
  EXECUTE sales.deleteitems(4);
  EXECUTE sales.addcustomers(7,'sathish','kolathur,chennai','www.flipkart.com',6000);
  EXECUTE sales.deletecustomers(7);
  EXECUTE sales.addemployee(8,'santhosh','kumar','santhosh22@gmail.com',9842798812,01-12-2021,4,'deliveryboy');
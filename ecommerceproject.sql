/*Admin*/
create table Admins (admin_id int primary key,admin_name varchar2(100) not null,password varchar2(50)not null);
desc admins;
select * from admins;
drop table admins;
insert into admins values(100,'vinoth','vino@123' );
insert into admins values(101,'sathish','sathish@123' );
insert into admins values(102,'santhosh','santhosh@123' );
insert into admins values(103,'sriram','sriram@123' );
insert into admins values(104,'vishnu','vishnu@123' );
insert into admins values(105,'sugan','sugan@123' );
insert into admins values(106,'siva','siva@123' );
insert into admins values(107,'shuresh','shuresh@123' );
insert into admins values(108,'saravana','saravana@123' );
insert into admins values(109,'udhay','udhay@123' );
insert into admins values(110,'vaanji','vaanji@123' );
 drop table admins;
---------------------------------------------------------------------------------------------------------
/*users*/

create table users(user_id int primary key,user_name varchar2(100)not null,password varchar2(100)not null,mobile_no int not null,
email_id varchar2(50)not null);
desc users;
drop table users;
select * from users;
insert into users values(100,'gowtham','gowtham@123',8438319150,'gowtham123@gamil.com');
insert into users values(101,'hari','hari@123',8524984187,'harivignesh123@gamil.com');

insert into users values(102,'mani','mani@123',6382472492,'mani123@gamil.com');

insert into users values(103,'rahul','rahul@123',9952719471,'rahul123@gamil.com');

insert into users values(104,'muniswaran','muniswaran@123',8438319150,'muniswaran123@gamil.com');

insert into users values(105,'vinothgandhi','gandhi@123',6382408816,'vinothgandhi33@gamil.com');

insert into users values(106,'pragathi','pragathi@123',6382472492,'pragathi456@gamil.com');

insert into users values(107,'thivya','thivya@123',8438319150,'thivya12123@gamil.com');

insert into users values(108,'priyanka','priyanka@123',9952719471,'priyanka1123@gamil.com');

insert into users values(109,'gowthami','gowthami@123',9790036667,'gowthami123@gamil.com');

insert into users values(110,'jeeva','jeeva@123',9790973547,'jeeva123@gamil.com');

-----------------------------------------------------------------------------------------------------------------------------
/*productss*/

create table productss (products_id int primary key,Brand_name varchar2(100),
Brand_type varchar2(100),size_US int,size_IND int,color varchar2(50),prices int);

desc productss;
drop table productss;
select * from productss;
insert into productss values(001,'Puma','Sneakers',12,6,'Blue',1000);
insert into productss values(002,'Puma','Sneakers',12,6,'Black',1099);
insert into productss values(003,'Puma','Sneakers',12,6,'White',1199);
insert into productss values(004,'Puma','Sneakers',13,7,'Blue',1000);
insert into productss values(005,'Puma','Sneakers',13,7,'Black',1200);
insert into productss values(006,'Puma','Sneakers',13,7,'White',1300);
insert into productss values(007,'Puma','Sneakers',14,8,'Blue',1000);
insert into productss values(008,'Puma','Sneakers',14,8,'Black',1150);
insert into productss values(009,'Puma','Sneakers',14,8,'White',1250);
insert into productss values(010,'Puma','Sneakers',15,9,'Blue',1000);
insert into productss values(011,'Puma','Sneakers',15,9,'Black',1300);
insert into productss values(012,'Puma','Sneakers',15,9,'White',1250);
insert into productss values(013,'Puma','Formal',12,6,'Black',2000);
insert into productss values(014,'Puma','Formal',12,6,'Brown',2300);
insert into productss values(015,'Puma','Formal',13,7,'Black',2400);
insert into productss values(016,'Puma','Formal',13,7,'Brown',3000);
insert into productss values(017,'Puma','Formal',14,8,'Black',35000);
insert into productss values(018,'Puma','Formal',14,8,'Brown',3700);
insert into productss values(019,'Puma','Formal',15,9,'Black',3000);
insert into productss values(020,'Puma','Formal',15,9,'Brown',2800);
insert into productss values(021,'Puma','Sports',15,9,'Brown',2800);
insert into productss values(022,'Puma','Sports',15,9,'Brown',2800);
insert into productss values(023,'puma','Sports',15,9,'Brown',2800);
insert into productss values(024,'puma','Sports',15,9,'Brown',2800);
insert into productss values(025,'puma','Formal',15,9,'Brown',2800);
insert into productss values(026,'puma','Formal',15,9,'Brown',2800);
insert into productss values(027,'puma','Formal',15,9,'Brown',2800);
insert into productss values(028,'puma','Formal',15,9,'Brown',2800);
insert into productss values(029,'puma','Formal',15,9,'Brown',2800);
insert into productss values(030,'puma','Formal',15,9,'Brown',2800);
insert into productss values(031,'puma','Formal',15,9,'Brown',2800);
insert into productss values(032,'puma','Formal',15,9,'Brown',2800);
insert into productss values(033,'puma','Formal',15,9,'Brown',2800);
insert into productss values(034,'puma','Formal',15,9,'Brown',2800);
insert into productss values(035,'puma','Formal',15,9,'Brown',2800);
insert into productss values(036,'puma','Formal',15,9,'Brown',2800);
insert into productss values(037,'puma','Formal',15,9,'Brown',2800);
insert into productss values(038,'puma','Formal',15,9,'Brown',2800);
insert into productss values(039,'puma','Formal',15,9,'Brown',2800);
insert into productss values(040,'puma','Formal',15,9,'Brown',2800);
insert into productss values(041,'puma','Formal',15,9,'Brown',2800);
insert into productss values(042,'puma','Formal',15,9,'Brown',2800);
insert into productss values(043,'puma','Formal',15,9,'Brown',2800);
insert into productss values(044,'puma','Formal',15,9,'Brown',2800);
insert into productss values(045,'puma','Formal',15,9,'Brown',2800);
insert into productss values(046,'puma','Formal',15,9,'Brown',2800);
insert into productss values(047,'puma','Formal',15,9,'Brown',2800);
insert into productss values(048,'puma','Formal',15,9,'Brown',2800);
insert into productss values(049,'puma','Formal',15,9,'Brown',2800);
insert into productss values(050,'puma','Formal',15,9,'Brown',2800);
insert into productss values(051,'puma','Formal',15,9,'Brown',2800);






/*create table staff(sno int ,name varchar(32));
describe staff;
alter table staff add age int;
describe staff;
insert into staff(sno,name,age) values('1','vinoth','45');
describe staff;
insert into staff values('2','gandhi','54');
insert into staff(sno,name,age)values('3','gandh','64');
insert into staff(sno,name,age)values('4','gan','84');
delete from staff where name='gandh';
update staff set name='ga',age=23 where sno=4 ;
select * from staff order by name;
select * from staff;
create table product(idno int not null primary key,prodname varchar(38),desce varchar(43));
describe product;
insert into product values(1,'amazon','fever');
insert into product values(2,'cold');
insert into product values(3,'flipkart','cough');
insert into product values(4,'myntra','fetet');
insert into product values(5,'wqert','fsxgvfhgvsx');
select prodname as pro from product;
select * FROM PRODUCT FETCH FIRST 3 ROWS ONLY;

select * from product;
delete from product;
ROLLBACK*/
create table programmer(PNAME varchar(25),DOB date,DOJ date,SEX varchar(30),PROF1 varchar(30),PROF2 varchar(30),SALARY int);
describe programmer;
insert into programmer(pname,dob,doj,sex,prof1,prof2,salary) values('gandhi','03/oct/1996','10/jan/2021','male','java','sql',21000);
insert into programmer(pname,dob,doj,sex,prof1,prof2,salary) values('rahul','04/jan/1996','02/jan/2022','male','java','oracle',21000);
insert into programmer(pname,dob,doj,sex,prof1,prof2,salary) values('santhosh','05/feb/1996','04/jan/2011','male','java','c++',21000);
insert into programmer(pname,dob,doj,sex,prof1,prof2,salary) values('sathish','06/mar/1996','06/jan/2041','male','java','c',21000);
insert into programmer(pname,dob,doj,sex,prof1,prof2,salary) values('vino','07/apr/1996','14/jan/2011','male','java','sql',21000);
insert into programmer(pname,dob,doj,sex,prof1,prof2,salary) values('sriram','08/july/1996','16/jan/2013','male','java','html',21000);
insert into programmer(pname,dob,doj,sex,prof1,prof2,salary) values('shuresh','09/dec/1996','19/jan/2018','male','java','css',21000);
update programmer set pname='udhay' where dob='04/jan/1996';
alter table programmer add mob int;
delete from programmer where pname='gandhi';
select * from programmer;

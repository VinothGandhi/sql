create database SHOES;
create table admin(adminname varchar2(38),password varchar2(32));
insert into admin(adminname,password)values('vinoth','vino@123');
insert into admin(adminname,password)values('vino','vino@456'); 
insert into admin(adminname,password)values('gandhi','vino@789');
insert into admin(adminname,password)values('vin','vino@231');
insert into admin(adminname,password)values('vinith','vino@765');
select * from admin;
create table shoesuser(id int primary key,email varchar2(23),mobileno int,password varchar2(34));
describe shoesuser;
insert all 
into shoesuser(id,email,mobileno,password) values(01);
into shoesuser(id,email,mobileno,password) values(02);
into shoesuser(id,email,mobileno,password) values(03);
into shoesuser(id,email,mobileno,password) values(04);
into shoesuser(id,email,mobileno,password) values(05);
select * from shoesuser;

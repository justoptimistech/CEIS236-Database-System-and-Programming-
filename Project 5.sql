drop table if exists employee;
create table employee (
emp_num varchar(3) not null,
emp_lname varchar(15) not null,
emp_fname varchar(15) not null,
emp_initial varchar(1),
emp_hiredate date,
job_code varchar(3),
primary key(emp_num));

insert into employee values('101', 'Top', 'Sovanarry', 'T', '2000-11-08', '502');
insert into employee values('102', 'Senior', 'David', 'H', '1989-07-12', '501');
insert into employee values('103', 'Arbough', 'June', 'E', '1996-12-01', '500');
insert into employee values('104', 'Ramoras', 'Anne', 'K', '1987-11-15', '501');
insert into employee values('105', 'Johnson', 'Alice', 'K', '1993-02-01', '502');
select * from employee;

update employee
set job_code = '501'
where emp_num = '103';
select * from employee;

create table emp_2 select * from employee;
select * from emp_2;

alter table emp_2
add emp_pct decimal(4,2),
add proj_num char(3);
select * from emp_2;

SET SQL_SAFE_UPDATES=0;
update emp_2
set emp_pct = 5
where emp_num in('101', '102', '105');

select *
from product, vendor
where vendor.v_code = product.v_code
order by p_price;

select p_code, p_descript, round(p_QOH*p_price,2) as Total_Inventory
from product
order by Total_Inventory desc;

select cus_lname, cus_fname, inv_date, line_price
from customer, invoice, line
where customer.cus_code = invoice.cus_code
and invoice.inv_number = line.inv_number
and line_price <10;

select count(*) as High_Balances
from customer
where cus_balance > 500;
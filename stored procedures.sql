create database department;

use department;

create table employee(
id int,
name varchar(20),
department varchar(20),
salary int);

insert into employee values
(1,"Alice","HR",50000),
(2,"Bob","HR",60000),
(3,"Charlie","IT",70000),
(4,"David","IT",80000),
(5,"Eve","HR",55000);

select * from employee;
#1
select id,name,department,salary , rank() over(partition by department order by salary desc) as rank_by_salary from employee;

#2.calculate avg salary for each dept  and display it along with each employee details.
select name,department,avg(salary) over(partition by department) as avg_salary from employee;

#3.list employee with thier salaries and the maximum salary in thier dept.
select name,department,max(salary) over(partition by department) as max_salary from employee;

#4.find the def btween each employee salary and the average salary of thier department.
select name,department,salary,avg(salary) over(partition by department) as avg_salary,salary-avg(salary) over(partition by department) as salary_diff from employee;

DELIMITER //
create function square_num(n int)
returns int
deterministic
begin
return n*n;
end //
delimiter ;

select square_num(5);

create function square_num2(n int)
returns int
deterministic
return n*n;

select square_num2(2122);

create function check_odd_even(n int) returns varchar(20) deterministic return if(n%2=0,"even","odd");
select check_odd_even(43);

# function to create simple interst
create function calculate_simple_intrest(principle decimal(10,2),rate decimal(5,2),time1 decimal(5,2)) returns decimal(10,2) deterministic return ((principle*rate*time1)/100);
select calculate_simple_intrest(1000,6,2);


# function to get full name
create table employeeo(
id int,
name varchar(50),
salary int);
insert into employeeo values(1,"amit",50000),(2,"riya",60000);
create function get_salary(emp_id int)
returns int
deterministic
return(select salary from employee where id = emp_id);
select get_salary(1);


#function to count vowels
create function count_vowels(n varchar(10)),return int deterministic return(
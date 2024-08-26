-- DDL (DATA DEFENATION LANGUAGE) 1.CREATE 2.ALTER 3.TURNCATE 4.DROP .
-- To create database
create database Hamzaa_Shaikh;
-- To see all database
show databases;
-- To select database(use database_name)
use Hamzaa_Shaikh;
-- To see all tables in database
show tables;
-- To delete database(drop databade database_name)
drop database hamzaa_shaikh;
-- To creeate table
create table employee(
Employee_Id int,
Employee_FirstName varchar(60),
Employee_lastname varchar(60)
);
create table student(
student_rollno int,
student_FirstName varchar(50),
student_lastname varchar(50),
student_age int,
student_dob date
);
desc student;

-- To add column for existing table
-- atler table <table_name> add column <column_name> <data_type>
alter table student add column marks int;

-- atler table <table_name> add column <column_name> <data_type> after <existing_column_name>
alter table student add column teacher_id int after student_lastname;


-- atler table <table_name> add column <column_name> <data_type> first;
alter table student add column email varchar(80) first;

-- to delete existing column
-- alter table<table_name> drop column <column_name>;
alter table student drop column teacher_name;

-- to drop table
drop table student;

create table books(
book_no int,
book_name varchar(70),
book_author varchar(60)
);
desc books;

-- alter table <table_name> change <oldcolumn_name> <newcolumn_name> datatype;
alter table books change book_no book_number varchar(90);
-- alter table <table_name> change <oldcolumn_name> <newcolumn_name> datatype; (same query to change <datatype>)
alter table books change book_number book_num int;

-- alter table <old-table-name> rename to <new-table-name>
alter table books rename to book_shop;
desc book_shop;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- DML (Data Manipulation Language); 1.INSERT 2.DELETE 3.UPDATE .

create database ham_shaikh;
use ham_shaikh;

create table department(
department_id char(2),
department_name varchar(50)
);
desc DEPARTMENT;

-- insert into <table_name> values <v1,v2,v3>;
insert into department values("d1","I.T");

select * FROM DEPARTMENT;

-- insert into <table-name> (c1,c2,c3) values (c1v1,c2v2,c3v3)
insert into department (department_id) values ("d2"); 

insert into department (department_name,department_id) values ("Marketing","d3");

create table staff(
staff_id int,
staff_name varchar(70),
staff_age int
);
desc staff;

insert into staff values(1.1,"XYZ",30);
insert into staff values(1.2,"abc",31);
insert into staff values(2,"tyu",32);
insert into staff values 
(4,"ham",32),
(5,"faa",21),
(6,"guru",22);
insert into staff (staff_id,staff_name)
values
(7,"amit"),
(8,"qwe"),
(9,"rty");
select * from staff;

create table bike(
bike_no int,
bike_name varchar(80),
bike_tankinliter int
);

desc bike;

insert into bike values(111,"XYZ",10);

insert into bike 
values
(222,"sdf",20),
(333,"asd",30);

insert into bike (bike_no,bike_name)
values
(444,"wer"),
(555,"ryw");
select * from bike;


alter table bike alter bike_no set default 0;

alter table bike alter bike_no drop default;

desc bike;

-- alter table <table_name> add constraint <constraint_name> check <condition>;
alter table bike add constraint check_no check (bike_no>=0); 

insert into bike values(777,"mno",22);
insert into bike values(-888,"pqr",33);

-- alter table <table_name> drop constraint <constraint_name>;
alter table bike drop constraint check_no;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- foreign-key.
-- 1.
create table category(
category_id int primary key,
category_name varchar(90) not null
);

desc category;

insert into category values 
(1,"ELECTRONICS"),
(2,"MOBILE");
insert into category values(4,"T.V");

SELECT * FROM category;

create table product(
product_id int primary key,
product_name varchar(90) not null,
product_price int default 0 check(product_price>=0),
category_id int,
constraint category_product foreign key(category_id) 
references category(category_id)
);

desc product;

insert into product values (11,"T.V",55000,1);
insert into product values (12,"T.Vs",55003,4);
select * from product;

-- alter table<table-name> drop foreign key <name-ofoconstraint>;
alter table product drop foreign key category_product;

-- alter table <table-name> add constraint <constraint-name> foreign key (column-name) references (table-name<column-name>);
alter table product add constraint category_product foreign key(category_id) 
references category(category_id);

-- 2..
-- school
create table schooll(
schooll_id int primary key,
schooll_name varchar(100)
);

desc schooll;

insert into schooll values(11,"M.E.A");

select * from schooll;

-- student
create table students(
roll_no int primary key,
students_name varchar(100) not null,
phone_No bigint,
schooll_id int,
constraint schooll_students foreign key (schooll_id)
references schooll(schooll_id)
);

desc students;

insert into students values(1,"xyz",9876543211,11);

select * from students;



-- 3...
-- courses
create table courses(
courses_id int primary key,
courses_name varchar(90) not null
);

desc courses;




select * from courses;

-- teacher
create table teacher(
teacher_id int primary key,
teacher_name varchar(80) not null,
phone_noo bigint,
courses_id int,
constraint courses_teacher foreign key (courses_id)
references courses(courses_id)
);

desc teacher;




select * from teacher;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TURE=1 / FALSE=0

select(3>1);
select(3!=3);
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- AND (ALL STATEMENT SHOULD BE TURE)
select (20>10 and 40=40);
select (20<10 and 40!=40);

select (10<20 and 40>40);
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- OR 
select (20>10 or 40=40);
select (20<10 or 40!=40);

select (10<20 or 40>40);

select(90=90 or 40!=40 or 50>50);

-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- NOT
select not(90=90 or 40!=40 or 50>50);

select not(20>10 and 40=40);

select not(3!=3);

-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 4-----------
drop table department;
drop table employee;




create table department(
department_id varchar(60) primary key,
department_name varchar(90) not null
);

desc department;
insert into department values ("D1","MARKETING"),("D2","IT"),("D3","HUMAN_RESOURCE");

create table employee(
e_id int4 primary key,
e_name varchar(80) not null,
city varchar (80),
salary bigint,
department varchar(60),
constraint department_employee foreign key (department)
references department(department_id)
);

desc employee;
insert into employee values
(1111,"nikita","mumbai",67000,"D1"),
(1112,"prajakta","pune",80000,"D1"),
(1113,"manisha","banglore",20000,"D2"),
(1114,"nilesh","mumbai",35469,"D3"),
(1115,"monal","pune",34452,"D2");

insert into employee values (1116,"nikita","mumbai",67000,"D4");

-- select column_name from table_name
select e_id from employee;

select e_name,salary from employee; 

select * from employee;

select * from department;

alter table employee drop foreign key department_employee;

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- (AS) TO GIVE TEMP NAME TO COLUMN.

select (100>90) as Answer;

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- WHERE CLAUSE

 select * from employee where e_id="1111";
select department from employee where e_id="1111";
select city,e_name from employee where e_id="1111";

select * from employee where salary>20000;
select * from employee where salary<=20000;

select * from employee where city="mumbai" and salary<50000;

select * from employee where city="mumbai" or  city="banglore";

select * from employee where salary>=10000 and salary<=34500;

select * from employee where department="D1" and salary<=20000;

select * from employee where department="D1" and city="pune";

-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- (IN) OPRAETER

select * from employee where city in("mumbai","pune");

select * from employee where e_id in("1111","1113","1114");

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- BETWEEN OPRAETER 

select * from employee where salary between 30000 and 40000;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE --
-- update <table-name> set column1=value1,column2=value2,.....
-- where condition;
alter table employee add column age int;

update employee set age=0;
update employee set age=25 where e_id=1111;
update employee set age=26 where e_id=1112;
update employee set age=27 where e_id=1113;
update employee set age=28 where e_id=1114;
update employee set age=29 where e_id=1115;

update employee set city="pune" where e_id=1111; 
update employee set city="mumbai" where e_id=1112;

update employee set salary=(39452+5000) where e_id=1115;
 update employee set salary=salary+3000 where e_id=1111;

update employee set age=age+2;

update employee set salary=salary-2000 where department="D1";

UPDATE employee set city=null where e_id in("1111","1113"); 

select * from employee where city is null;
select * from employee where city is not null;


select * from employee;
desc employee;

select * from employee where e_name!="nikita";

-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select * from employee order by salary;

select * from employee order by salary desc;

select * from employee order by salary,age desc limit 1;

select * from employee order by salary limit 1;

select * from employee order by age;

select * from employee order by age desc ;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

show tables;

select department, count(e_id) from employee
group by department;

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

select city, count(e_id) 
from employee
group by city;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

select sum(salary) from employee;

select city,sum(salary),
avg(salary),min(salary),max(salary),count(e_id)
from employee 
group by city;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------

select department, 
sum(salary) AS SALARY,
avg(salary) AS AVGS,
min(salary) AS MIN,
max(salary) AS MAX,
count(e_id) AS E_ID 
from employee 
group by department;

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

alter table employee add column gender char;

desc employee;

select * from employee;

update employee set gender="f";

update employee set gender="m" where e_id=1114;

select gender, count(e_id)
from employee group by gender;

select gender, count(e_id)
from employee 
group by gender 
having gender="f";

select gender, count(e_id)
from employee where salary>50000 
group by gender 
having gender="f";

select count(*)
from employee where salary>50000 
and gender="f";

select department, avg(salary) as average_sal
from employee
group by department
having avg(salary)<50000;

select department, avg(salary) as average_sal
from employee
group by department
order by average_sal limit 1;

select department, avg(salary) as average_sal
from employee
group by department
order by average_sal desc limit 1;
 
select department, count(e_id)
from employee 
group by department
order by count(e_id) limit 1;

select department, count(e_id)
from employee 
group by department
order by count(e_id) desc limit 1;

select department, sum(salary) as min_sal
from employee
group by department
order by min_sal limit 1;

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- built in function

-- concat("hello","world")  output=helloworld

select concat("Mohammed"," ","Hamzaa"," ","Shaikh");

select concat("Mohammed"," ","Hamzaa"," ","Shaikh") as "name";

select * from employee;

select e_id,e_name,concat(e_id,"-",e_name) as "employee's" from employee;

select e_id,e_name,concat(e_id,"-","ename@itvedant.com") as Email
from employee;

-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
desc employee;

-- UPPER ("sql") output=SQL

SELECT upper("sql");
select lower("OUR");

insert into employee
values (1116,"faiz",lower("mUmBai"),38000,"D1",26,upper("f"));

select length("w e l c o m e");

select length("w e l c o m e")>15 as lengths;

select e_name, length(e_name) from employee;

-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- substring
-- h e l l o
-- 1 2 3 4 5
select substr("hello",1);

select substr("hello",2,1);

select substr("hamza",length("hamza"),1);

select e_name, substr(e_name,length(e_name),1) from employee;

select e_name, upper(substr(e_name,length(e_name),1)) from employee;

select e_name,concat(e_name,"-",upper(substr(e_name,length(e_name),1))) from employee;

select concat(upper(substr(e_name,1,1)),lower(substr(e_name,2,length(e_name)-1))),upper(substr(e_name,length(e_name),1))
from employee;


select concat(upper(substr(e_name,1,1)),lower(substr(e_name,2,length(e_name)-2)),upper(substr(e_name,length(e_name),1))) 
as CASES
from employee;


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

desc employee;


alter table employee add column joining_date date;

select e_name,salary,
case 
   when salary<30000 then "very less"
   when salary<60000 then "average"
   when salary<100000 then "very high"
else "-"
end as salarydata
from employee;



select e_name,salary,
case 
   when salary<30000 then "very less"
   when salary<60000 then "average"
   when salary<100000 then "very high"
else "-"
end as salarydata,
case
    when department="D1" then "marketing"
    when department="D2" then "fianance"
    when department="D3" then "i.t"
    else "-"
    end as department_name
from employee;


select e_id,e_name,department,
case
    when department="D1" then "marketing"
    when department="D2" then "fianance"
    when department="D3" then "i.t"
    else "-"
    end as department_name
from employee;


select * from employee;

update employee set salary=
case 
    when department="D1" then salary+2000
    when department="D2" then salary+1000
	when department="D3" then salary+2500
else salary
end;


alter table employee add column Email varchar(90);

select * from employee;

update employee 
set email=concat(substr(city,1,1),".",upper(e_name),"_",e_id,"@itvedant.com");

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--  COALESCE --
-- ---------
   
   select * from employee;
   
alter table employee add column phone_no bigint;

update employee set phone_no=9876543211,email=null where e_id in (1111,1112,1113);                                                      

select e_name,email,phone_no,coalesce(email,phone_no) from employee;
USE hamzaa_shaikh;

SELECT date_add(curdate(),INTERVAL 100 DAY);
SELECT e_name,joining_date, date_add(joining_date,INTERVAL 1 YEAR) AS anniversary FROM employee;


ALTER TABLE employee ADD COLUMN joinng_date DATE;
update employee set joinng_date="2023-06-23" where e_id=1111; 
update employee SET joinng_date="2021-02-7" where e_id=1112;
update employee set joinng_date="2020-6-30" where e_id=1113;
update employee SET joinng_date="2022-11-10" where e_id=1114;
update employee set joinng_date="2023-06-9" where e_id=1115;
update employee SET joinng_date="2023-04-8" where e_id=1116;


SELECT * FROM employee
JOIN departmennt
ON employee.d_id=department.d_id;

UPDATE employee SET department=NULL WHERE e_id=1111;
INSERT INTO department VALUE ("D4","operation");

 select * from department;
 select * from employee;

-- join ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 

 -- inner join --
 
 SELECT e.e_id,d.department_id,d.department_name FROM employee e
 INNER JOIN department d
ON
e.department=d.department_id;


alter table employee drop column joining_date;

-- left join --

select * from employee e

left join department d
on
e.department=d.department_id
where e.salary<40000;


select * from employee e
left join department d
on
e.department=d.department_id
order by e.salary desc limit 1;

-- right join --

select * from employee e
right join department d
on
e.department=d.department_id
where e.e_id is null; 
                                                             

insert into department values ("D5","Salesman"); 

-- cross join -- 

select * from employee e,department;

select * from employee e,department d 
where e.department=d.department_id;
-- (EQUI JOIN)
select * from employee e,department d 
where e.department=d.department_id and department_id="D1";


-- union --

create table department_duplicate(
department_id char(2),
department_name varchar(50),
city varchar(60)
);

select * from department;

insert into department_duplicate values
("D1","marketing","mumbai"),
("D6","training","pune");


select * from department_duplicate;

select department_id,department_name from department
union 
select department_id,department_name from department_duplicate;


select department_id,department_name from department
union all
select department_id,department_name from department_duplicate;


-- full outer  join ---------------------------------------------------------------------------
use hamza_shaikh;

select * from employee e 
left join department d
on e.department=d.department_id

union

select * from employee e 
right join department d
on e.department=d.department_id;


-- NON-EQUI JOIN  ---------------------------------------------------------------------------------------------------------------------------------------------------------

select * from employee e,department d
where e.department=d.department_id and e.salary<50000;


-- SUB-QUERIES -------------------------------------------------------------------------------------------------------------------------------------------------------------

select min(salary) from employee;
select * from employee where salary=21000;
select * from employee where salary=(select min(salary) from employee);


select max(salary) from employee;
select * from employee where salary=78000;
select * from employee 
where salary=(select max(salary) from employee);


select avg(salary) from employee;
select * from employee where salary<(select avg(salary) from employee);


select * from employee 
where salary<(select max(salary) from employee) 
order by Salary desc limit 1;

-- 3RD HIGHEST SALARY
 
select * from employee where 
salary<(select salary from employee 
where salary<(select max(salary) from employee) 
order by Salary desc limit 1) 
order by salary desc limit 1;


select department_id from department where department_name="marketing";
select * from employee 
where department=(select department_id from department where department_name="marketing");


select * from department;

alter table department add column d_city varchar(70);

update department set d_city="mumbai" where department_id="D1";
update department set d_city="mumbai" where department_id="D2";
update department set d_city="bangalore" where department_id="D3";
update department set d_city="pune" where department_id="D4";
update department set d_city="mumbai" where department_id="D5";


select department_id from department where d_city="mumbai";
select * from employee where department 
in (select department_id from department where d_city="mumbai");


select * from employee;

-- > ALL

select salary from employee where e_name="faiz" or e_name="nilesh"; 
select * from employee where salary>all
(select salary from employee where e_name="faiz" or e_name="nilesh");

-- >= ALL

select salary from employee where e_name="faiz" or e_name="nilesh"; 
select * from employee where salary>=all
(select salary from employee where e_name="faiz" or e_name="nilesh");

-- < ALL

select salary from employee where e_name="fiaz" or e_name="nilesh"; 
select * from employee where salary<all
(select salary from employee where e_name="faiz" or e_name="nilesh");

-- <= ALL

select salary from employee where e_name="fiaz" or e_name="nilesh"; 
select * from employee where salary<=all
(select salary from employee where e_name="faiz" or e_name="nilesh");

-- < ANY

select salary from employee where e_name="fiaz" or e_name="nilesh";
select * from employee where salary<any
(select salary from employee where e_name="faiz" or e_name="nilesh");

-- <= ANY

select salary from employee where e_name="fiaz" or e_name="nilesh";
select * from employee where salary<=any
(select salary from employee where e_name="faiz" or e_name="nilesh");

-- > ANY

select salary from employee where e_name="fiaz" or e_name="nilesh";
select * from employee where salary>any
(select salary from employee where e_name="faiz" or e_name="nilesh");

-- >= ANY

select salary from employee where e_name="fiaz" or e_name="nilesh";
select * from employee where salary>=any
(select salary from employee where e_name="faiz" or e_name="nilesh");


select max(age) from employee;
select * from employee 
where age<(select max(age) from employee) 
order by age desc limit 1;

select * from department where department_id=
(select Department from employee where age=
(select age from employee where 
age<(select max(age) from employee) 
order by age desc limit 1));

-- VIEWS -------------------------------------------------------------------------------------------------------------------------------------------------------------------------

create view department_salary as
select department,sum(salary) from employee group by department;

select * from  department_salary;


select * from employee;

create view emp as
select e_id,e_name,city,department,age,gender,Email,phone_no,joinng_date from employee;

select * from emp;

create view sal_40000 as
select * from employee e
left join department d
on
e.department=d.department_id
where e.salary<40000;

select* from sal_40000;

-- drop view view_name
drop view sal_40000;

-- SIMPLE VIEW COMPLEX VIEW -------------------------------------------------------------------------------------------------------------------------------------------------------

-- delimiter (to change end symbol)

delimiter $$

select * from employee $$


/*
delimiter $$
create procedure procedure_name()  
begin
-- ---
-- ---
-- ---
-- ---
end$$
delimiter ;
*/


delimiter $$
create procedure getemployee()
begin

     select * from employee;



end$$
delimiter ;

call getemployee;



delimiter $$
create procedure get_department()
begin


    select * from department where d_city="mumbai";

end$$
delimiter ;

call get_department();

drop procedure get_department;





delimiter $$
create procedure get_departments()
begin


    select * from department;

end$$
delimiter ;

call get_departments();


delimiter $$
create procedure get_by_city(in city varchar(100))
begin

select count(e_id) from employee
where employee.city=city; 

end$$
delimiter ;


call get_by_city("mumbai");






delimiter $$
create procedure get_by_department(in dep_count varchar(100))
begin

select * from employee
where department=dep_count; 

end$$
delimiter ;


call get_by_department("D1");

DROP procedure get_by_department;


SELECT * FROM EMPLOYEE;

delimiter $$
create procedure update_phoneno(in ID INT(12),update_no BIGINT)
begin

     update employee set phone_no=update_no where e_id=ID; 
 

end$$
delimiter ;


CALL update_phoneno(1115,9876655110);
SELECT * FROM EMPLOYEE;


-- IN AND OUT / INOUT / DECLARE
desc employee;

delimiter $$
create procedure updatesalary(in e_id int,inout salary bigint)
begin
     declare old_salary bigint;
     select employee.salary into old_salary from employee where employee.e_id=e_id;
     update employee set employee.salary=salary where employee.e_id=e_id;
     set salary=old_salary;
end $$
delimiter ;
select * from employee;
set @salary=70000;
call updatesalary(1111,@salary);
select @salary;


/*
delimiter $$ 
create function fun_name(p1,p2,.......pn)
returns (datatype)
begin
   logic ------

   returns value;
end$$
delimiter;
*/




delimiter $$ 
create function addition(a int, b int)
returns int
begin
  return a+b;
end $$
delimiter ;

select addition(40,10) as ab;

-- -------------------------

delimiter $$
create function sub(c int,d int)
returns int
begin
  return c-d;
end $$
delimiter ;

select sub(4,5);



delimiter $$
create function formatname(word varchar(100))
returns varchar(100)
begin

    return concat(upper(substr(word,1,1)),lower(substr(word,2)));
end$$
delimiter ;


select formatname("hAMzA");

-- ----------------------------------------

delimiter $$
create function format_name(word varchar(100))
returns varchar(100)
begin
    return concat(LOWER(substr(word,1,1)),UPPER(substr(word,2)));
end$$
delimiter ;

select format_name("hAMzA");

select formatname(e_name),formatname(city),addition(salary,5000) from employee;

-- -----------------------------------------

delimiter $$
create function grade (marks int)
returns char(20) 
begin
    declare grade char (20);
    set grade=case
              when marks between 75 and 100 then "A"
               when marks between 41 and 74 then "B"
               when marks between 0 and 40 then "C"
               else"invalid marks"
               end;
       return grade;        
end $$
delimiter ;

select grade (78);

-- syntax -------------

/*
if condition then
     statements
 end if;
 
 
if condition then
     statement 1
else
     statement 2    
 end if;
*/



delimiter $$
create function checknumber(n int)
returns varchar(4)
  begin
     if (n%2=0)then    
          return "even";
     else
           return "odd";
         end if;
end $$
delimiter ;

select checknumber(6784) as "even/odd";


delimiter $$
create function agecheck(age int)
returns varchar(6)
  begin
     if (age>18)then    
          return "true";
     else
           return "false";
         end if;
end $$
delimiter ;

select agecheck(5) as eligible_to_vote;


/*
if condition then
     statement 1
ELSE IF condition THEN
    statement2
ELSE IF condition THEN
    statement3
Else
    statement
 .
 .
 .
 .
 end if;   
*/


DELIMITER $$
create function selectlanguage(choise int)
returns varchar(20)
 begin
     if (choise=1) then 
     return "english";
     elseif (choise=2) then 
     return "marathi";
     elseif (choise=3) then 
     return "hindi";
     else
     RETURN  "invalid info";
      end if;
end$$
DELIMITER ;
drop function  selectlanguage;

select  selectlanguage(3);


DELIMITER $$
create function selectdays(days int)
returns varchar(20)
 begin
     if (days=1) then 
     return "monday";
     elseif (days=2) then 
     return "tuesday";
     elseif (days=3) then 
     return "wednesday";
     elseif (days=4) then 
     return "thursday";
     elseif (days=5) then 
     return "fridy";
     elseif (days=6) then 
     return "saturday";
     elseif (days=7) then 
     return "sunday";
     else
     RETURN  "invalid info";
      end if;
end$$
DELIMITER ;


select selectdays(9);


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LOOP -----------
 
   
   
/*
lablename: loop
  if condition then
      leave lablename;
 end if;
 end loop lablename;
*/

delimiter $$
create procedure loopexample()
begin
   
   declare i int;
   set i=1;
   
   simpleloop : loop
    if i=6 then
     leave simpleloop;
	end if;
    
    select i ;
     set i=i+1;
    end loop simpleloop;
 
end $$
delimiter ;

drop procedure loopexample;

call loopexample();




delimiter $$
create procedure loophello()
begin
   
   declare i int;
   set i=1;
   
   simpleloop : loop
    if i=6 then
     leave simpleloop;
	end if;
    
    select "hello";
     set i=i+1;
    end loop simpleloop;
 
end $$
delimiter ;


call loophello();



-- --


create table emps( 
emp_id varchar (7));


delimiter $$
create procedure loopEMP()
begin
   
   declare i int;
   set i=1;
   
   threeloop : loop
    if i=6 then
     leave threeloop;
	end if;
    
    insert into emps values (concat("emp",i));
    
     set i=i+1;
    end loop threeloop;
 
end $$
delimiter ;

drop procedure loopEMP;

call loopEMP();

select * from emps;

-- WHILE_LOOP ------------------------------------------------------------------------

/*
lablename: WHILE
   condition do
// statement
end while lablename;   
*/

delimiter $$
create procedure whileloop_1()
begin
     declare i int;
	 set i=1;
   whileloop: while
       i<=10 do
    select i;
    set i=i+1 ;
   end while whileloop;
    
       
end$$
delimiter ;

call whileloop_1;




delimiter $$
create procedure whileloop_2()
begin
     declare i int;
	 set i=11;
   whileloopS: while
       i<=20 do
    select i;
    set i=i+1 ;
   end while whileloopS;
    
       
end$$
delimiter ;


call whileloop_2;





delimiter $$
create procedure whileloop_3()
begin

  declare i int;
  set i=0;
 
   whilelooppp : while
   i<=50 do 
   select i;
   set i=i+2 ;
   end while whilelooppp;
  
end$$
delimiter ;

drop procedure whileloop_3;

call whileloop_3();

/*
delimiter $$
create procedure whileloop_3()
begin

  declare i int;
  set i=1 ;
 
   whilelooppp : while
   i<=50 do 
    if i%2=0 then
   select i;
   set i=i+ 1 ;
   end while whilelooppp;
  
end$$
delimiter ;
*/


create table demo(d_id int not null);
alter table demo add primary key (d_id);
insert into demo values (null);

desc demo;


delimiter $$
create procedure exceptionhandling(in d_id int)
    begin
        declare continue handler for 1048
    begin
       select "you can not insert null value";
    end;
    
    insert into demo values (d_id);
    select "code after inseration";
    end $$
delimiter ;

drop procedure exceptionhandling;

call exceptionhandling(null);

select * from demo;



delimiter $$
create procedure exceptionhandling_2(in d_id int)
    begin
    declare continue handler for 1062
    begin
     select "unique value";
     end;
    insert into demo values (d_id);
    select "code after inseration";
    end $$
delimiter ;

drop procedure exceptionhandling_2;

call exceptionhandling_2(100);

-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*
DELIMITER $$
CREATE PROCEDURE cursorExample()
BEGIN
   DECLARE s_id INT;
   DECLARE s_name VARCHAR(100);
   DECLARE n INT;
   
   DECLARE student_cursor CURSOR FOR
   SELECT studentID,Name FROM students;
   
   DECLARE CONTINUE HANDLER FOR 1329
   BEGIN
      SET n=1;
   END;
   OPEN student_cursor;
   
   cursorLoop:LOOP
   IF n=1 THEN
     LEAVE cursorLoop;
   END IF;
     FETCH student_cursor INTO s_id,s_name;
     SELECT s_id,s_name;
   END LOOP cursorLoop;
   
   SELECT "Hello";
   CLOSE student_cursor;
   
END$$
DELIMITER ;
DROP PROCEDURE cursorExample;
CALL cursorExample();
*/


-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*
DELIMITER $$
CREATE PROCEDURE insert_values_with_cursor()
BEGIN
   
    DECLARE tname VARCHAR(100);
    DECLARE cname VARCHAR(100);
    DECLARE n INT;
   
    DECLARE teacher_courses CURSOR FOR
          SELECT c.CourseName,t.name FROM courses c
          JOIN Teachers t
          USING(TeacherID);
         
    DECLARE CONTINUE HANDLER FOR 1329
    BEGIN
         SET n=1;
    END;
         
    OPEN teacher_courses;
   
    teacher_courses_loop:LOOP
            FETCH teacher_courses INTO tname,cname;
            IF n=1 THEN
               LEAVE teacher_courses_loop;
            END IF;
            INSERT INTO student_management.teacher_courses VALUES(tname,cname);
    END LOOP  teacher_courses_loop;
   
    CLOSE teacher_courses;
   
END$$
DELIMITER ;

DROP PROCEDURE insert_values_with_cursor;
CALL insert_values_with_cursor();


truncate teacher_courses;
SELECT * FROM teacher_courses;
*/

-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


/*
insert      (new)
update      (new)   (old)
delete      (old)


delimiter $$
create trigger  (trigger_name)
(before|after) (insert|update|delete)
on (table_name) for each row
begin

-- -----------
-- -----------
-- -----------

end $$
delimiter;
*/


show tables;


-- TRIGGER -----
drop table company;

create table dep1(
d_id char primary key,
d_name varchar (90)
);

create table company(
name varchar(100),
workin_hours int,
pay_per_hour int,
salary int,
d_id char,
constraint company_dep foreign key (d_id)
references dep1(d_id)
);
select * from dep1;

INSERT into dep1 values ("d1","IT"),
("d2","marketing") ;

insert into company (name,workin_hours,pay_per_hour,d_id)
values("nisha",10,1000,"D1");



delimiter $$
create trigger before_insert_employee
before insert
on company for each row
begin

   set new.salary=new.workin_hours*new.pay_per_hour;
   
end $$
delimiter ;

insert into company(name,workin_hours,pay_per_hour)
values("nisha",10,1000);

select * from company;




delimiter $$
create trigger before_update_employee
before update
on company for each row
begin

   set new.salary=new.workin_hours*new.pay_per_hour;
   
end $$
delimiter ;

  
update company set workin_hours=40 where name="nisha";

select * from company;


alter table company add column pervious_pay int;





delimiter $$
create trigger before_update2_employee
before update
on company for each row
begin

   set new.pervious_pay=old.pay_per_hour;
   
end $$
delimiter ;

select * from company;

update company set pay_per_hour=600 where name="nisha";



/*
delimiter $$
create trigger before_delete_employee
before delete
on department for each row
begin

   update company set d_id=null where d_id=old.d_id;
   
end $$
delimiter ;
*/

-- INDEX ---------------------

/*
create index index_name on (table_name) (column_name);

show indexes from (tablename);
*/



create index name_index on employee(e_name);
show indexes from employee;

create index name_index2 on schooll(schooll_name);
show indexes from schooll;


show tables;


-- alter table (table_ name) drop index (index_name)

alter table employee drop index name_index;


/*
-- NORMALIZATION --
1 NORMAL FROM (NF)

TABLE IS NOT IN 1 NF

ID     NAME       PHONE_NO     
101    NISHA      9879889698,5676674654 
102    AJAY       9798798698,6786986788


NOW TABLE IS IN NF

ID     NAME       PHONE_NO
101    NISHA      9879889698
101    NISHA      5676674654 
102    AJAY       9798798698
102    AJAY       6786986788



-- 2NF

IT IS NOT IN 2NF

ID     NAME       PHONE_NO       HOBBIES    COURSES
101    NISHA      9879889698     DANCING    WD
101    NISHA      5676674654     DRAWING    SQL
102    AJAY       9798798698     SINGING    WD
102    AJAY       6786986788     READING    JAVA



IT IS IN 2NF

STUDENT_TABLE
ID     NAME       PHONE_NO      COURSES
101    NISHA      9879889698    C1
101    NISHA      5676674654    C2 
102    AJAY       9798798698    C1
102    AJAY       6786986788    C3

COURSES_TABLE
C_ID      C_NAME
C1        WD
C2        SQL
C3        JAVA


-- 3NF
-- 4NF
*/




















































































































































































































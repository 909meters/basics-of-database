--1
CREATE DATABASE laboratory_work3;

--2
CREATE TABLE departments (
  code INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL ,
  budget DECIMAL NOT NULL
);

CREATE TABLE employees (
  ssn INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL ,
  lastname VARCHAR(255) NOT NULL ,
  department INTEGER NOT NULL ,
  city VARCHAR(255),
  FOREIGN KEY (department) REFERENCES departments(code)
);

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL ,
  lastname VARCHAR(255) NOT NULL ,
  city VARCHAR(255)

);


INSERT INTO departments(code,name,budget) VALUES(14,'IT',65000);
INSERT INTO departments(code,name,budget) VALUES(37,'Accounting',15000);
INSERT INTO departments(code,name,budget) VALUES(59,'Human Resources',240000);
INSERT INTO departments(code,name,budget) VALUES(77,'Research',55000);
INSERT INTO departments(code,name,budget) VALUES(45,'Management',155000);
INSERT INTO departments(code,name,budget) VALUES(11,'Sales',85000);

INSERT INTO employees(ssn,name,lastname,department, city) VALUES('123234877','Michael','Rogers',14, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('152934485','Anand','Manikutty',14, 'Shymkent');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('222364883','Carol','Smith',37, 'Astana');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('326587417','Joe','Stevens',37, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('332154719','Mary-Anne','Foster',14, 'Astana');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('332569843','George','ODonnell',77, 'Astana');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('546523478','John','Doe',59, 'Shymkent');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('631231482','David','Smith',77, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('654873219','Zacary','Efron',59, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('745685214','Eric','Goldsmith',59, 'Atyrau');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('845657245','Elizabeth','Doe',14, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('845657246','Kumar','Swamy',14, 'Almaty');



INSERT INTO customers(name,lastname, city) VALUES('John','Wills', 'Almaty');
INSERT INTO customers(name,lastname, city) VALUES('Garry','Foster', 'London');
INSERT INTO customers(name,lastname, city) VALUES('Amanda','Hills', 'Almaty');
INSERT INTO customers(name,lastname, city) VALUES('George','Doe', 'Tokyo');
INSERT INTO customers(name,lastname, city) VALUES('David','Little', 'Almaty');
INSERT INTO customers(name,lastname, city) VALUES('Shawn','Efron', 'Astana');
INSERT INTO customers(name,lastname, city) VALUES('Eric','Gomez', 'Shymkent');
INSERT INTO customers(name,lastname, city) VALUES('Elizabeth','Tailor', 'Astana');
INSERT INTO customers(name,lastname, city) VALUES('Julia','Adams', 'Astana');


select * from departments;
select * from employees;
select * from customers;

--3
select name from employees;

--4
select DISTINCT lastname from employees;

--5
select * from employees where lastname like 'Smith';

--6
select * from employees where lastname like 'Smith' or lastname like 'Doe';

--7
select * from employees where department = '59';

--8
select * from employees where (department = '14' or department = '77')
and city = 'Almaty';


--9
select sum(budget) as budget_sum from departments;

--10
select department, count(department) from employees group by department;

--11
select department, count(department) from employees group by department
having count(department) > 2;

--12
select (select max(budget) from departments
where budget not in (select max(budget) from departments)) as second_max;

--13
select name, lastname from employees where department in (select code
    from departments where budget = (select min(budget) from departments)
    or budget = (select max(budget) from departments));

--14
select name from employees where city = 'Astana'  union select name from customers c
where c.city = 'Astana' ;

--15
select name, budget, code from departments where budget > 55000
order by budget ASC, code DESC;

--16
update departments set budget = budget * 0.9
where budget = (select min(budget) from departments);
select name, budget from departments;

--17
update employees set department = 14
where department = 77;
select * from employees;

--18
delete from employees
where department = 14;
select * from employees;

--19
truncate employees;
delete from employees;
select * from employees;


--20
select code, name from departments
where budget = (select max(budget) from departments
    where budget not in (select max(budget) from departments));

--21
update departments set budget = budget * 0.85
where budget = (select min(budget) from departments);
select name, budget from departments;

select name from departments
order by  name
limit 3 offset 2;
create database lab8;

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
  salary integer,
  FOREIGN KEY (department) REFERENCES departments(code)
);

create table countries(
    country_id serial primary key,
    postal_code varchar(255) unique,
    name varchar(255)
);

drop table countries cascade ;

INSERT INTO departments(code,name,budget) VALUES(14,'IT',65000);
INSERT INTO departments(code,name,budget) VALUES(37,'Accounting',15000);
INSERT INTO departments(code,name,budget) VALUES(59,'Human Resources',240000);
INSERT INTO departments(code,name,budget) VALUES(77,'Research',55000);
INSERT INTO departments(code,name,budget) VALUES(45,'Management',155000);
INSERT INTO departments(code,name,budget) VALUES(11,'Sales',85000);

INSERT INTO employees(ssn,name,lastname,department, city, salary) VALUES('123234877','Michael','Rogers',14, 'Almaty', 500000);
INSERT INTO employees(ssn,name,lastname,department, city, salary) VALUES('152934485','Anand','Manikutty',14, 'Shymkent', 200000);
INSERT INTO employees(ssn,name,lastname,department, city, salary) VALUES('222364883','Carol','Smith',37, 'Astana', 300000);
INSERT INTO employees(ssn,name,lastname,department, city, salary) VALUES('326587417','Joe','Stevens',37, 'Almaty', 230000);
INSERT INTO employees(ssn,name,lastname,department, city, salary) VALUES('332154719','Mary-Anne','Foster',14, 'Astana', 450000);
INSERT INTO employees(ssn,name,lastname,department, city, salary) VALUES('332569843','George','ODonnell',77, 'Astana', 120000);
INSERT INTO employees(ssn,name,lastname,department, city, salary) VALUES('546523478','John','Doe',59, 'Shymkent', 300200);
INSERT INTO employees(ssn,name,lastname,department, city, salary) VALUES('631231482','David','Smith',77, 'Almaty', 203000);
INSERT INTO employees(ssn,name,lastname,department, city, salary) VALUES('654873219','Zacary','Efron',59, 'Almaty', 500000);
INSERT INTO employees(ssn,name,lastname,department, city, salary) VALUES('745685214','Eric','Goldsmith',59, 'Atyrau', 400300);
INSERT INTO employees(ssn,name,lastname,department, city, salary) VALUES('845657245','Elizabeth','Doe',14, 'Almaty', 300000);
INSERT INTO employees(ssn,name,lastname,department, city, salary) VALUES('845657246','Kumar','Swamy',14, 'Almaty', 230000);

insert into countries (postal_code, name)
values ('DEP1', 'Kazakhstan'),
        ('DEP2', 'USA'),
        ('DEP3', 'Canada'),
        ('DEP4', 'Japan'),
        ('DEP5', 'South Korea'),
        ('DEP6', 'Russia'),
        ('DEP7', 'Ukrain'),
        ('DEP8', 'Kazakhstan'),
        ('DEP9', 'USA'),
        ('DEP10', 'India');

--1
explain select * from countries where name = 'South Korea';
create index countries_name on countries (name) where name = 'South Korea';

--2
explain select * from employees where name = 'Joe' and lastname = 'Stevens';
create index employees_full_name on employees (name, lastname)
    where name = 'Joe' and lastname = 'Stevens';

--3
explain select * from employees where salary < 600000 and salary > 400000;
create index index_salary on employees (salary) where salary between 400000 and 600000;

--4
explain select * from employees where substring(name from 1 for 4) = 'abcd';
create index index_sub_name on employees (name) where substring(name from 1 for 4) = 'Eric';


--5
explain select * from employees e join departments d on d.code = e.department
where d.budget > 140000 and e.salary < 140000;
create index ind_bud_sal on employees using btree(salary);


--6
alter table employees add column points point;
explain analyse select ssn from employees;
create index rtree_index on employees using rtree(points);
explain analyse select ssn from employees;

--7
explain select ssn from employees;
create index index_ssn on employees using hash(ssn);
explain analyse select ssn from employees;

--8
explain select name, lastname from employees;
create unique index index_full_name_2 on employees (name, lastname);
explain analyse select name, lastname from employees;

insert into employees (ssn, name, lastname, department, city, salary)
values ('546133478','John','Ben', null, 'Shymkent', null);



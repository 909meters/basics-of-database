--1
create database lab9;

--2
create table salesmen(
    salesman_id integer primary key,
    name varchar(255),
    city varchar(255),
    commision numeric
);


create table customers(
    customers_id integer primary key,
    cust_name varchar(255),
    city varchar(255),
    grade integer,
    salesman_id integer references salesmen
);

create table orders(
    ord_id integer primary key,
    purch_amt numeric,
    ord_date date,
    customer_id integer references customers,
    salesman_id integer references salesmen
);

insert into salesmen(salesman_id, name, city, commision)
VALUES (5001, 'James Hoog', 'New York', 0.15);
insert into salesmen(salesman_id, name, city, commision)
values (5002, 'Nail Knite', 'Paris', 0.13);
insert into salesmen(salesman_id, name, city, commision)
VALUES (5005, 'Pit Alex', 'London', 0.11);
insert into salesmen(salesman_id, name, city, commision)
values (5006, 'Mc Lyon', 'Paris', 0.14);
insert into salesmen(salesman_id, name, city, commision)
VALUES (5003, 'Lauson Hen', null, 0.12);
insert into salesmen(salesman_id, name, city, commision)
values (5007, 'Paul Adam', 'Rome', 0.13);

insert into customers(customers_id, cust_name, city, grade, salesman_id)
VALUES (3002, 'Nick Rimando', 'New York', 100, 5001);
insert into customers(customers_id, cust_name, city, grade, salesman_id)
VALUES (3005, 'Graham Zusi', 'California', 200, 5002);
insert into customers(customers_id, cust_name, city, grade, salesman_id)
VALUES (3001, 'Brad Guzan', 'London', null, 5005);
insert into customers(customers_id, cust_name, city, grade, salesman_id)
VALUES (3004, 'Fabian Johns', 'Paris', 300, 5006);
insert into customers(customers_id, cust_name, city, grade, salesman_id)
VALUES (3007, 'Brad Davis', 'New York', 200, 5001);
insert into customers(customers_id, cust_name, city, grade, salesman_id)
VALUES (3009, 'Geoff Cameron', 'Berlin', 100, 5003);
insert into customers(customers_id, cust_name, city, grade, salesman_id)
VALUES (3008, 'Julian Green', 'London', 300, 5002);

insert into orders(ord_id, purch_amt, ord_date, customer_id, salesman_id)
VALUES (70001, 150.5, '2012-10-05', 3005, 5002);
insert into orders(ord_id, purch_amt, ord_date, customer_id, salesman_id)
VALUES (70009, 270.65, '2012-09-10', 3001, 5005);
insert into orders(ord_id, purch_amt, ord_date, customer_id, salesman_id)
values (70002, 65.26, '2012-10-05', 3002, 5001);
insert into orders(ord_id, purch_amt, ord_date, customer_id, salesman_id)
VALUES (70004, 110.5, '2012-08-17', 3009, 5003);
insert into orders(ord_id, purch_amt, ord_date, customer_id, salesman_id)
VALUES (70007, 948.5, '20112-09-10', 3005, 5002);
insert into orders(ord_id, purch_amt, ord_date, customer_id, salesman_id)
VALUES (70005, 2400.6, '2012-07-27', 3007, 5001);
insert into orders(ord_id, purch_amt, ord_date, customer_id, salesman_id)
values (70008, 5760, '2012-09-10', 3002, 5001);

--3
create view new_yorkers as select * from salesmen where city = 'New York';
select * from new_yorkers;

--4
create view each_order as select ord_id, cust_name, name from orders
    join customers c on orders.customer_id = c.customers_id
    join salesmen s on s.salesman_id = c.salesman_id;
select * from each_order;

--5
create view max_grade as select max(grade) from customers;
select * from max_grade;

--6
create view number_city as select city, count(city) from salesmen group by city;
select * from number_city;

--7
create view  more_than_one_customer as
    select name, count(c.salesman_id) from salesmen join customers c
    on c.salesman_id = salesmen.salesman_id
group by name having count(c.salesman_id) > 1 order by name asc;
select * from more_than_one_customer;

--8
create view paris_customers as select * from customers where city like 'Paris';
select * from paris_customers;

--9
create view date_for_order as select ord_date, city from orders
    join customers c on c.customers_id = orders.customer_id
    where city = 'London';
select * from date_for_order;

--10
create view names as select name from salesmen union select cust_name from customers;
select * from names;

--11
create view dates as select ord_date from orders order by ord_date desc;
select * from dates;

--12
create view abc as select purch_amt from orders;
select * from abc;

alter view abc rename to xyz;
select * from xyz;

alter view xyz rename to abc;

--13
create view purchase as select salesman_id, sum(purch_amt) from orders group by salesman_id;
select * from purchase;
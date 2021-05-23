create database lab7;

--1
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
values (5007, 'Paul Adam', 'Rome', 0.13);
insert into salesmen(salesman_id, name, city, commision)
VALUES (5003, 'Lauson Hen', 'San Joe', 0.12);

insert into customers(customers_id, cust_name, city, grade, salesman_id)
VALUES (3002, 'Nick Rimando', 'New York', 100, 5001);
insert into customers(customers_id, cust_name, city, grade, salesman_id)
VALUES (3007, 'Brad Davis', 'New York', 200, 5001);
insert into customers(customers_id, cust_name, city, grade, salesman_id)
VALUES (3005, 'Graham Zusi', 'California', 200, 5002);
insert into customers(customers_id, cust_name, city, grade, salesman_id)
VALUES (3008, 'Julian Green', 'London', 300, 5002);
insert into customers(customers_id, cust_name, city, grade, salesman_id)
VALUES (3004, 'Fabian Johnson', 'Paris', 300, 5006);
insert into customers(customers_id, cust_name, city, grade, salesman_id)
VALUES (3009, 'Geoff Cameron', 'Berlin', 100, 5003);
insert into customers(customers_id, cust_name, city, grade, salesman_id)
values (3003, 'Jozy Altidor', 'Moscow', 200, 5007);
insert into customers(customers_id, cust_name, city, grade, salesman_id)
VALUES (3001, 'Brad Guzan', 'London', NULL, 5005);

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
insert into orders(ord_id, purch_amt, ord_date, customer_id, salesman_id)
values (70010, 1983.43, '2012-10-10', 3004, 5006);
insert into orders(ord_id, purch_amt, ord_date, customer_id, salesman_id)
values (70003, 2480.4, '2012-10-10', 3009, 5003);
insert into orders(ord_id, purch_amt, ord_date, customer_id, salesman_id)
values (70012, 250.45, '2012-06-27', 3008, 5002);
insert into orders(ord_id, purch_amt, ord_date, customer_id, salesman_id)
values (70011, 75.29, '2012-08-17', 3003, 5007);
insert into orders(ord_id, purch_amt, ord_date, customer_id, salesman_id)
values (70013, 3045.6, '2012-04-25', 3002, 5001);

select * from customers;
select * from orders;
select * from salesmen;

--2
select name, c.cust_name, c.city from salesmen join customers c on c.city = salesmen.city;

--3
select ord_id, purch_amt, c.cust_name, c.city from orders
    join customers c on orders.customer_id = c.customers_id
where purch_amt between 500 and 2000;

--4
select name, cust_name from salesmen join customers c on c.salesman_id = salesmen.salesman_id;

--5
select cust_name from customers join salesmen s on s.salesman_id = customers.salesman_id
where commision > 0.12;

--6
select cust_name, city, ord_id, ord_date, purch_amt from orders
    join customers c on orders.customer_id = c.customers_id
order by ord_date asc;

--7
select name, count(c.salesman_id) from salesmen join customers c
    on c.salesman_id = salesmen.salesman_id
group by name
having count(c.salesman_id) = 1 or count(c.salesman_id) > 1 or count(c.salesman_id) is null
order by name asc;

--task
insert into customers(customers_id, cust_name, city, grade, salesman_id)
values (3010, 'Bred Morano', 'Neew York', null, 5001);

select cust_name, ord_id from customers
full join orders o on o.customer_id = customers.customers_id
where ord_id is null;


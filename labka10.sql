create database lab10;

--1
create table Reviewer(
    rID integer primary key,
    name varchar(255)
);
create table Movie(
    mID integer primary key,
    title varchar(255),
    year integer,
    director varchar(255)
);
create table Rating(
    rID integer references Reviewer,
    mID integer references Movie,
    stars integer,
    ratingDate date
);
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

insert into Reviewer(rID, name)
values (201, 'Sarah Martinez'),
       (202, 'Daniel Lewis'),
       (203, 'Brittany Harris'),
       (204, 'Mike Anderson'),
       (205, 'Chris Jackson'),
       (206, 'Elizabeth Thomas'),
       (207, 'James Cameron'),
       (208, 'Ashley White');

insert into Rating(rID, mID, stars, ratingDate)
values (201, 101, 2, '2011-01-22'),
       (201, 101, 4, '2011-01-27'),
       (202, 106, 4, null),
       (203, 103, 2, '2011-01-20'),
       (203, 108, 4, '2011-01-12'),
       (203, 108, 2, '2011-01-30'),
       (204, 101, 3, '2011-01-09'),
       (205, 103, 3, '2011-01-27'),
       (205, 104, 2, '2011-01-22');

insert into Movie(mID, title, year, director)
values (101, 'Gone with the Wind', 1939, 'Victor Fleming'),
       (102, 'Star Wars', 1977, 'George Lucas'),
       (103, 'The Sound of Music', 1965, 'Robert Wise'),
       (104, 'E.T.', 1982, 'Steven Spielberg'),
       (105, 'Tintanic', 1997, 'James Cameron'),
       (106, 'Snow White', 1937, null),
       (107, 'Avatar', 2009, 'James Cameron'),
       (108, 'Raiders of the Lost Ark', 1981, 'Steven Spielberg');

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


select * from Rating;
select * from Reviewer;
select * from Movie;
select * from orders;
select * from customers;
select * from salesmen;


--2
create role junior_dev login;
select * from pg_roles where rolname = 'junior_dev';

--3
create view each_order as select ord_id, cust_name, name from orders
    join customers c on orders.customer_id = c.customers_id
    join salesmen s on s.salesman_id = c.salesman_id;
select * from each_order;
grant all privileges on each_order to junior_dev;


--4
create view max_grade as select cust_name, grade
from customers where grade in (select max(grade) from customers);
select * from max_grade;
grant select on max_grade to junior_dev;


--5
create role intern login;
select * from pg_roles where rolname = 'intern';
reassign owned by junior_dev to intern;

--6
create view high_rated_movies as select title, year from Movie join Rating R
    on R.mID = Movie.mID
where stars = 4 or stars = 5 order by year;
select * from high_rated_movies;

--7
create role new_role login createrole;
select * from pg_roles where rolname = 'new_role';

--8
alter default privileges grant all privileges on tables to new_role;

--9
create role student password 'university' valid until 'January 1 00:00:00 2021 +1';
select * from pg_roles where rolname = 'student';

--10
alter role student with password 'school';
alter role student with password null;
select * from pg_roles where rolname = 'student';
select rolname, rolpassword from pg_roles where rolname = 'student';

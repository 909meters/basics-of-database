CREATE DATABASE lab6;

drop database lab6;
drop table locations;
drop table departments cascade;
drop table employees;


CREATE TABLE locations
(
    location_id    SERIAL PRIMARY KEY,
    street_address VARCHAR(25),
    postal_code    VARCHAR(12),
    city           VARCHAR(30),
    state_province VARCHAR(12)
);

CREATE TABLE departments
(
    department_id   SERIAL PRIMARY KEY,
    department_name VARCHAR(50) UNIQUE,
    budget          INTEGER,
    location_id     INTEGER REFERENCES locations
);

CREATE TABLE employees
(
    employee_id  SERIAL PRIMARY KEY,
    first_name   VARCHAR(50),
    last_name    VARCHAR(50),
    email        VARCHAR(50),
    phone_number VARCHAR(50),
    salary       INTEGER,
    depatment_id INTEGER REFERENCES departments
);


INSERT INTO locations(street_address, postal_code, city, state_province)
VALUES (('ST1', '9DJW', 'Washington', 'USA'),
        ('ST2', 'PW32', 'Madrid', 'Barcelona'),
        ('ST3', 'OLSJ', 'Dubai', 'UAE'),
        ('ST4', 'DJ3D', 'Shymkent', 'Kazakhstan'),
        ('ST5', 'SK3Q', 'Tashkent', 'Ozbekistan'));

select *
from locations;

INSERT INTO departments(department_id, department_name, budget, location_id)
VALUES ((40, 'DEP1', 300000, 2),
        (50, 'DEP2', 100000, 4),
        (80, 'DEP3', 20000, 1),
        (60, 'DEP4', 150000, 3),
        (50, 'DEP5', 90000, 5));

select *
from departments;


INSERT INTO employees(first_name, last_name, email, phone_number, salary, depatment_id)
VALUES (('Karen', 'Bilson', 'karen020345@gmail.com', '87007931288', 77000, 80),
        ('Anya', 'Korsova', 'anya@gmail.com', '87923992299', 89000, NULL),
        ('Talshyn', 'Tanysbekova', 'tal_tan@mail.com', '87204437744', 60000, NULL),
        ('Riz', 'Smith', 'r_wizard@gmail.com', '87026673215', 77000, 40),
        ('Bob', 'Debb', 'bobby@mail.com', '87074990015', 143000, 70));

select *
from employees;
--1
create database lab6;

--2
create table locations(
    location_id serial primary key,
    street_address varchar(25),
    postal_code varchar(12),
    city varchar(30),
    state_province varchar(12)
);

create table departments(
    department_id serial primary key,
    department_name varchar(50) unique,
    budget integer,
    location_id integer references locations
);

create table employees(
    employee_id serial primary key,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    phone_number varchar(50),
    salary integer,
    depatment_id integer references departments
);

select * from employees;
select * from departments;
select * from locations;


--3
insert into locations(street_address, postal_code, city, state_province)
values ('Shalyapin', '2UWE', 'Almaty', 'Bostandyk');
insert into locations(street_address, postal_code, city, state_province)
values ('Auezov', 'PENW', 'Almaty', 'Almalinski');
insert into locations(street_address, postal_code, city, state_province)
values ('Ashimov', 'IN42', 'Astana', 'Naurizbay');
insert into locations(street_address, postal_code, city, state_province)
values ('Ak Meshit', 'DPF3', 'Almaty', 'Medeuski');
insert into locations(street_address, postal_code, city, state_province)
values ('Kazybek bi', 'XJWN', 'Semei', 'Rayimmbek');

select * from locations;

insert into departments(department_id, department_name, budget, location_id)
values (40, 'DEP1', 40000, 3);
insert into departments(department_id, department_name, budget, location_id)
values (60, 'DEP2', 52000, 2);
insert into departments(department_id, department_name, budget, location_id)
values (80, 'DEP3', 29300, 5);
insert into departments(department_id, department_name, budget, location_id)
values (70, 'DEP4', 102000, 1);
insert into departments(department_id, department_name, budget, location_id)
values (50, 'DEP5', 82000, 4);

select * from departments;


insert into employees(first_name, last_name, email, phone_number, salary, depatment_id)
values ('Karen', 'Bilson', 'karen020345@gmail.com', '87007931288', 77000, 80);
insert into employees(first_name, last_name, email, phone_number, salary, depatment_id)
values ('Anya', 'Korsova', 'anya@gmail.com', '87923992299', 89000, null);
insert into employees(first_name, last_name, email, phone_number, salary, depatment_id)
values ('Talshyn', 'Tanysbekova', 'tal_tan@mail.com', '87204437744', 60000, 60);
insert into employees(first_name, last_name, email, phone_number, salary, depatment_id)
values ('Riz', 'Smith', 'r_wizard@gmail.com', '87026673215', 77000, 40);
insert into employees(first_name, last_name, email, phone_number, salary, depatment_id)
values ('Bob', 'Debb', 'bobby@mail.com', '87074990015', 143000, 60);

select * from employees;


--4
select first_name, last_name, employees.depatment_id, d.department_name
from employees join departments d on employees.depatment_id = d.department_id;

--5
select first_name, last_name, employees.depatment_id, d.department_name
from employees join departments d on employees.depatment_id = d.department_id
where depatment_id = 80 or depatment_id = 40;

--6
select first_name, last_name, department_name, l.city, l.state_province from employees
join departments d on employees.depatment_id = d.department_id
join locations l on d.location_id = l.location_id;

--7
select department_name from departments;

--8
select first_name, last_name, d.department_id, d.department_name from employees
full join departments d on employees.depatment_id = d.department_id
where first_name is not null ;

--9
select last_name, first_name from employees
join departments d on employees.depatment_id = d.department_id
join locations l on d.location_id = l.location_id
where city like 'Almaty';

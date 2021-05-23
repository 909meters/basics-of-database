--1
create database laboratory_work_4;


--2
create table Warehouses (
    code integer primary key,
    location varchar(255),
    capacity integer
);

create table Packs (
    code character(4) primary key,
    contents varchar(255),
    value real,
    warehouse integer,
    foreign key (warehouse) references Warehouses(code)
);

insert into Warehouses(code, location, capacity) values (1, 'Chicago', 3);
insert into Warehouses(code, location, capacity) values (2, 'Chicago', 4);
insert into Warehouses(code, location, capacity) values (3, 'New York', 7);
insert into Warehouses(code, location, capacity) values (4, 'Los Angeles', 2);
insert into Warehouses(code, location, capacity) values (5, 'San Francisco', 8);

insert into Packs(code, contents, value, warehouse) values ('0MN7', 'Rocks', 180, 3);
insert into Packs(code, contents, value, warehouse) values ('4H8P', 'Rocks', 250, 1);
insert into Packs(code, contents, value, warehouse) values ('4RT3', 'Scissors', 190, 4);
insert into Packs(code, contents, value, warehouse) values ('7G3H', 'Rocks', 200, 1);
insert into Packs(code, contents, value, warehouse) values ('8JN6', 'Papers', 75, 1);
insert into Packs(code, contents, value, warehouse) values ('8Y6U', 'Papers', 50, 3);
insert into Packs(code, contents, value, warehouse) values ('9J6F', 'Papers', 175, 2);
insert into Packs(code, contents, value, warehouse) values ('LL08', 'Rocks', 140, 4);
insert into Packs(code, contents, value, warehouse) values ('P0H6', 'Scissors', 125, 1);
insert into Packs(code, contents, value, warehouse) values ('P2T6', 'Scissors', 150, 2);
insert into Packs(code, contents, value, warehouse) values ('TUSS', 'Papers', 90, 5);



select value ,
       case
            when value < 70000 then 'little'
            when value>= 70000 then 'large'
        end duration
from packs
order by value;


insert into packs(code, contents, value, warehouse)
values ('833K', null, null, 4);
select value - coalesce(warehouse, 0) from packs;
--3
select * from Warehouses;
select * from Packs;

--4(5)
select * from Packs where value > 180;

--5(6)
select distinct contents from Packs;

--6(7)
select warehouse, count(contents) from Packs group by warehouse;

--7(8)
select warehouse, count(contents) from Packs group by warehouse having count(contents) > 2;

--8(9)
insert into warehouses (code, location, capacity) VALUES (6, 'Texas', 5);

select * from Warehouses;

--9(10)
insert into packs(code, contents, value, warehouse) VALUES ('H5RT', 'Papers', 350, 2);

select * from packs;

--10(11)
update packs set value = value * 0.82
where value in (select value from packs order by value desc offset 3 limit 1);
select * from packs;

--11(12)
delete from packs where value < 150;
select * from packs;

--12(13)
delete from Packs where warehouse = 1 or warehouse = 2
returning *;

--examples
--in
select * from warehouses where code in (select warehouse from Packs where value = 180);

--not in
select * from warehouses where code not in (select warehouse from Packs where contents like 'Rocks');

--case
select code, location, capacity,
case when capacity = 2 or capacity = 3 then 'small'
when capacity = 4 or capacity = 5 then 'medium'
when capacity > 6 then 'large'
end capacity_des
from warehouses
order by code;

--exists
select * from warehouses
where exists (select warehouse from Packs p where p.warehouse = warehouses.code);

--coalesce
insert into packs(code, contents, value, warehouse)
VALUES ('T81S', NULL, 91, 1);

select coalesce(value) from packs;

--any
select * from Packs where value = any(select value from packs where value > 155);

select * from packs;
select * from Warehouses;

--all
select * from warehouses
where capacity > all(select capacity from warehouses where location like 'Chicago');

--some
select * from Packs where value = some(select value from packs where value > 160);


select *

create database lab12;

CREATE TABLE accounts (
    id INT GENERATED BY DEFAULT AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    balance DEC(15,2) NOT NULL,
    PRIMARY KEY(id)
);

select * from accounts;

INSERT INTO accounts(name,balance)
VALUES('Bob',10000);

--BEGIN TRANSACTION
begin transaction;

INSERT INTO accounts(name,balance)
VALUES('Alice',10000);

commit transaction;

select * from accounts;

-------------
begin;

update accounts
set balance = balance - 1000
where id = 1;

update accounts
set balance = balance + 1000
where id = 2;

select * from accounts;

commit;

----------------
INSERT INTO accounts(name, balance)
VALUES('Jack',0);

begin;

update accounts set balance = balance - 1500 where id = 1;
update accounts set balance = balance + 1500 where id = 2;

select * from accounts;

rollback;

--OWN EXAMPLE
create table students(
    id serial primary key,
    name varchar,
    scholarship integer
);

insert into students (name, scholarship)
values ('Kim Mingyu', 21000);
insert into students (name, scholarship)
values ('Mark Lee', 20000);
insert into students (name, scholarship)
values ('Johnny Seo', 19019);

select * from students;

begin;
update students set scholarship = scholarship + 20000 where id = 1;
update students set scholarship = scholarship + 10000 where id = 3;

commit;

select * from students;

begin;
update students set scholarship = scholarship + 40000 where id = 2;
update students set scholarship = scholarship - 19000 where id = 1;
update students set scholarship = scholarship - 21000 where id = 3;

select * from students;

rollback;
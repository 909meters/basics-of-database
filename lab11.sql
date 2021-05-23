--1
create function cube(a integer) returns integer as $$
begin
return a * a * a;
end; $$
language plpgsql;

select cube(3);

--2
create function average_sum(a integer, b integer, c integer) returns integer as $$
begin
return (a + b + c) / 3 ;
end; $$
language plpgsql;

select average_sum(2, 4, 6);

--3
create function max_number(a integer, b integer, c integer, out m integer) as $$
begin
m := greatest(a, b, c);
end; $$
language plpgsql;

select max_number(2, 7, 4);

--4
create function min_number(a integer, b integer, c integer, out m integer) as $$
begin
m := least(a, b, c);
end; $$
language plpgsql;

select min_number(2, 7, 4);

--5
create function numbers(a integer[]) returns integer as $$
    declare
        m integer := 0;
        i integer;
begin
foreach i in array $1
    loop
    m := m + 1;
    end loop;
return m;
end; $$
language plpgsql;

select numbers('{2, 4, 22, 6, 222, 9}');

--6
create table students(
    id varchar,
    name varchar,
    speciality varchar,
    birth_date date,
    address varchar,
    mobile_number varchar
);

insert into students(id, name, speciality, birth_date, address, mobile_number)
values ('19B0203020', 'Ken Kaneki', 'FIT', '2002-09-11', 'Baker st.', '20030293'),
       ('19B0348282', 'Gojo Satori', 'MKM', '2001-01-15', 'Liver st.', '394929655'),
       ('19B0382484', 'Levi Ackerman', 'BS', '2001-05-23', 'Ten st.', '29399299'),
       ('19B0302002', 'Yuji Itadori', 'FIT', '2002-03-07', 'Fer st.', '19959023'),
       ('19B9938481', 'Mikasa Ackerman', 'BS', '2001-12-31', 'Rio st.', '10393992');

select * from students;

create function students_info() returns
    table(id varchar, name varchar, speciality varchar, birth_date varchar, address varchar,
    mobile_number varchar) as $$
    declare p record;
    begin
        for p in execute 'select * from students'
            loop
                id = p.id;
                name = p.name;
                speciality = p.speciality;
                birth_date = p.birth_date;
                address = p.address;
                mobile_number = p.mobile_number;
                return next;
            end loop;
    end;
    $$
language plpgsql;

select students_info();


--7
select * from students;

--8
alter table students add column height numeric;

update students set height = 188.3 where name = 'Ken Kaneki';
update students set height = 193.5 where name = 'Gojo Satori';
update students set height = 171 where name = 'Levi Ackerman';
update students set height = 177.1 where name = 'Yuji Itadori';
update students set height = 172.7 where name = 'Mikasa Ackerman';

select name, height from students;

create function max_height() returns
    table(name varchar, height numeric) as $$
    begin
        return query select students.name, students.height from students
        where students.height in (select max(students.height) from students);
    end;
    $$
language plpgsql;

select max_height();
--1
CREATE DATABASE laboratory_work1;

--2
CREATE TABLE staff
(
    num SERIAL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    middle_name VARCHAR(50),
    birth_date DATE
);

SELECT * FROM staff;

--3
ALTER TABLE staff
ADD admin_group INTEGER,
ADD salary INTEGER;


ALTER TABLE staff
ADD COLUMN registration_adress VARCHAR(50);

ALTER TABLE staff
ALTER COLUMN registration_adress SET DEFAULT 'KALKAMAN';

INSERT INTO staff(num, first_name, last_name, middle_name, birth_date, admin_group, salary, registration_adress)
VALUES (1, 'Aida', 'Kuatkyzy' , 'Kuatkyzy' , '06.01.2001', TRUE, DEFAULT, DEFAULT);

--4
ALTER TABLE staff
ALTER COLUMN admin_group TYPE BOOLEAN
USING admin_group::BOOLEAN;

--5
ALTER TABLE staff
ALTER COLUMN admin_group SET DEFAULT FALSE,
ALTER COLUMN salary SET DEFAULT 100000;

--6
ALTER TABLE staff
Add CONSTRAINT num PRIMARY KEY (num);

--7
CREATE TABLE jobs
(
    num SERIAL,
    name VARCHAR(50),
    staff_num INTEGER,
    descriptiom VARCHAR(50)
);

SELECT * FROM jobs;

--8
DROP TABLE jobs;

--9
DROP DATABASE laboratory_work1;

drop table staff;


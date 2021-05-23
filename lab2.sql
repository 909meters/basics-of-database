--1
CREATE DATABASE laboratory_work2;

--2
CREATE TABLE lands(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    district_id INTEGER,
    population INTEGER
);


--3
INSERT INTO lands(id, name, district_id, population)
VALUES (DEFAULT, 'Alatau', 1, 260441);

--4
INSERT INTO lands(name)
VALUES ('Almaly');

--5
INSERT INTO lands(district_id)
VALUES (NULL);

--6
INSERT INTO lands(name, district_id, population)(
    VALUES ('Auezov', 6, 295543),
           ('Zhetisu', 8, 74000),
           ('Bostandyk', 3, 343541)
);

--7
ALTER TABLE lands
ALTER COLUMN name SET DEFAULT 'Earth';

--8
INSERT INTO lands(name) VALUES (DEFAULT);

select *
from lands;

--9
ALTER TABLE lands
ALTER COLUMN district_id SET DEFAULT 10,
ALTER COLUMN population SET DEFAULT 18776707;

INSERT INTO lands(name, district_id, population)
VALUES (DEFAULT, DEFAULT, DEFAULT);

--10
CREATE TABLE lands_new (LIKE lands);

SELECT * FROM lands_new;

--11
INSERT INTO lands_new(id, name, district_id, population)
select * from lands;

--12
UPDATE lands_new SET district_id = 1
WHERE district_id IS NULL;

--13
SELECT id, name, district_id, population, (population * 1.15)
    AS new_population FROM lands_new;

--14
DELETE FROM lands_new
WHERE population < 100000;

SELECT * FROM lands_new WHERE name IS NOT NULL;
SELECT * FROM lands_new WHERE district_id IS NOT NULL;
SELECT * FROM lands_new WHERE population IS NOT NULL;

--15
SELECT id, name, district_id, population, (population * 1.45)
    AS population_new FROM lands_new;





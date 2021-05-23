create database taskforindexes;

CREATE TABLE COUNTRIES(
    NAME VARCHAR(50),
    POPULATION INTEGER
);

INSERT INTO countries(name, population)
SELECT 'country_' || i, i * 1000
FROM generate_series(1, 100000) i;

select * from countries;

explain analyse select * from countries where POPULATION = 144000 or POPULATION = 190000;

create index find_index on countries(name, population) where POPULATION = 144000 or POPULATION = 190000;
explain analyse select * from countries where POPULATION = 144000 or POPULATION = 190000;
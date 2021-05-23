create database arrayexamples;

create table infoforarray(
    id serial primary key,
    name varchar(255),
    children text []
);


--insertion
insert into infoforarray (name, children)
values ('Tanya Kirkorova', array ['Olya', 'Katya']);
insert into infoforarray (name, children)
values ('Amanda Byce', array ['Maria']);

select * from infoforarray;

--selecting array length
select array_length(children, 1) from infoforarray;

--concatenate
select array_cat(children, array['Yoongi', 'Hoseok']) from infoforarray;

--number of dimensions
select array_ndims(children) from infoforarray;

--dimension
select array_dims(children) from infoforarray;

--fill
select array_fill(6, array[1, 2], array[3, 4]);

--lower
select array_lower(children, 1) from infoforarray;

--position
select array_position(children, 'Maria') from infoforarray;

--append
select name, array_append(children, 'Kaneki') from infoforarray
where name like 'Amanda Byce';
create database midterm;

create table movies(
    id serial primary key,
    title varchar(255) not null unique,
    rating integer,
    genre varchar(50) not null
);

create table theaters(
    id serial primary key,
    name varchar(255) not null unique,
    size integer not null check(size >= 3),
    city varchar(50) not null
);

insert into movies (title, rating, genre) VALUES ('Citizen Kane', 5, 'Drama');
insert into movies (title, rating, genre) VALUES ('Singin in the Rain', 8, 'Comedy');
insert into movies (title, rating, genre) VALUES ('The Wizard of Oz', 2, 'Fantasy');
insert into movies (title, rating, genre) VALUES ('The Quiet Man', null, 'Comedy');
insert into movies (title, rating, genre) VALUES ('North by Northwest', null, 'Thriller');
insert into movies (title, rating, genre) VALUES ('The Last Tango in Paris', 9, 'Drama');
insert into movies (title, rating, genre) VALUES ('Some Like it Hot', 4, 'Comedy');
insert into movies (title, rating, genre) VALUES ('A Night at the Opera', null, 'Comedy');


insert into theaters (name, size, city) VALUES ('Kinopark Esentai', 15, 'Almaty');
insert into theaters (name, size, city) VALUES ('Star Cinema Mega', 7, 'Almaty');
insert into theaters (name, size, city) VALUES ('Kinopark 8', 9, 'Shymkent');
insert into theaters (name, size, city) VALUES ('Star cinema 15', 11, 'Astana');
insert into theaters (name, size, city) VALUES ('Cinemax', 4, 'Aktau');

select name from theaters where city in (select distinct city from theaters);

select id, title,
       case when rating >= 0 and rating <= 3 then 'Low rating'
            when rating >= 4 and rating <= 7 then 'Medium rating'
            when rating >= 8 and rating <= 10 then 'High rating'
            else 'No rating'
        end  as category from movies;

create table movietheaters(
    theater_id integer references theaters,
    movie_id integer references movies,
    rating integer
);


select name from theaters where size
in (select size from theaters order by size desc limit 3);

select upper(title), title = substring(title, 4), char_length(title) from movies;
select title = substring(title,4)  from movies;
SELECT  char_length(title) from movies;

select title from movies where id not in (select movie_id from movietheaters);

select city, avg(size) from theaters group by city;

update movies set rating = null where rating = 1;

select * from movies where rating is not null;

select * from movies where rating = (select max(rating) from movies
where rating < (select max(rating) from movies
where rating < (select max(rating) from movies)));

select * from movies where title like 'S%o_';

select distinct on(city) name from theaters;

select title from movies, movietheaters
where movies.id = movietheaters.movie_id
group by title having count(movietheaters.movie_id) > 2;

SELECT * FROM movies WHERE rating
NOT IN (SELECT rating FROM movies WHERE rating=NULL)
HAVING genre='Comedy' or 'Fantasy';


select * from movies
where rating not in (select rating from movies where rating = null)
having genre like 'Comedy' or genre like 'Fantasy';

select * from movies where id not in (select theater_id from movietheaters);
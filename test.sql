create database testik;

create table kino(
    id serial primary key,
    title varchar(255) not null unique,
    rating integer,
    genre varchar(50) not null
);

create table teatr(
    id serial primary key,
    name varchar(255) not null unique,
    size integer not null check(size >= 3),
    city varchar(50) not null
);

insert into kino (title, rating, genre) VALUES ('Citizen Kane', 5, 'Drama');
insert into kino (title, rating, genre) VALUES ('Singin in the Rain', 7, 'Comedy');
insert into kino (title, rating, genre) VALUES ('The Wizard of Oz', 7, 'Fantasy');
insert into kino (title, rating, genre) VALUES ('The Quiet Man', null, 'Comedy');
insert into kino (title, rating, genre) VALUES ('Citizen Kane', null, 'Drama');
insert into kino (title, rating, genre) VALUES ('Citizen Kane', 5, 'Drama');
insert into kino (title, rating, genre) VALUES ('Citizen Kane', 5, 'Drama');
insert into kino (title, rating, genre) VALUES ('Citizen Kane', 5, 'Drama');
insert into kino (title, rating, genre) VALUES ('Citizen Kane', 5, 'Drama');
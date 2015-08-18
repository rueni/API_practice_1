create database good_eats;
\c good_eats
create table restaurants (id serial primary key, name varchar(255), location varchar(255), cuisine_type varchar(255), cost_person integer);

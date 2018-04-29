-- Copyright (C) 2001 YesSoftware. All rights reserved.
-- Events_MySQL.sql

drop table if exists users;
drop table if exists categories;
drop table if exists events;

create table users
(
	user_id integer auto_increment primary key,
	user_login varchar(15) not null,
	user_password varchar(15) not null,
	name varchar(20) not null,
	email varchar(30),
	unique (user_login)
);

insert into users (user_login, user_password, name) values ('admin','admin','Admin');
insert into users (user_login, user_password, name) values ('guest','guest','Guest');

create table categories
(
	category_id integer auto_increment primary key,
	category_desc varchar(50) not null
);

insert into categories (category_desc) values ('Computers & Internet');
insert into categories (category_desc) values ('Business & Economy');
insert into categories (category_desc) values ('Entertainment');
insert into categories (category_desc) values ('Science');

create table events
(
	event_id integer auto_increment primary key,
	name varchar(100) not null,
	category_id integer,
	approved integer not null default 0,
	date_start datetime not null,
	date_end datetime,
	presenter varchar(100),
	location text not null,
	description text
);

insert into events (name, category_id, approved, date_start,	presenter, 	location)
	values ('CodeCharge Presentation', 1, 1, '2000-12-15', 'Konrad Musial', 'SanFrancisco');

insert into events (name, category_id, approved, date_start,	presenter, 	location)
	values ('CodeCharge Training', 1, 1, '2000-12-16', 'Oleg Dudko', 'SanFrancisco');
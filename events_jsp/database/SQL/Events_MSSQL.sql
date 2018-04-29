-- Copyright (C) 2001 YesSoftware. All rights reserved.
-- Events_MSSQL.sql

if exists (select * from sysobjects where id = object_id(N'users') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table users
GO
if exists (select * from sysobjects where id = object_id(N'categories') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table categories
GO
if exists (select * from sysobjects where id = object_id(N'events') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table events
GO

create table users
(
	user_id integer identity primary key,
	user_login varchar(15) not null,
	user_password varchar(15) not null,
	name varchar(20) not null,
	email varchar(30),
	unique (user_login)
)
GO


insert into users (user_login, user_password, name) values ('admin','admin','Admin')
GO
insert into users (user_login, user_password, name) values ('guest','guest','Guest')
GO

create table categories
(
	category_id integer identity primary key,
	category_desc varchar(50) not null
)
GO

insert into categories (category_desc) values ('Computers & Internet')
GO
insert into categories (category_desc) values ('Business & Economy')
GO
insert into categories (category_desc) values ('Entertainment')
GO
insert into categories (category_desc) values ('Science')
GO

create table events
(
	event_id integer identity primary key,
	name varchar(100) not null,
	category_id integer,
	approved integer not null default 0,
	date_start datetime not null,
	date_end datetime,
	presenter varchar(100),
	location text not null,
	description text
)
GO

insert into events (name, category_id, approved, date_start,	presenter, 	location)
	values ('CodeCharge Presentation', 1, 1, '12/15/2000', 'Konrad Musial', 'SanFrancisco')
GO

insert into events (name, category_id, approved, date_start,	presenter, 	location)
	values ('CodeCharge Training', 1, 1, '12/16/2000', 'Oleg Dudko', 'SanFrancisco')
GO
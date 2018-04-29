-- Copyright (C) 2001 YesSoftware. All rights reserved.
-- EmplDir_MySQL.sql

drop table if exists deps;
drop table if exists emps;

create table deps
(
  dep_id integer auto_increment primary key,
  name varchar(50)
);

insert into deps (name) values ('Software');
insert into deps (name) values ('Administration');
insert into deps (name) values ('Support');
insert into deps (name) values ('Marketing');
insert into deps (name) values ('Finance');

create table emps
(
  emp_id integer auto_increment primary key,
  dep_id integer,
  name varchar(100),
  title varchar(50),
  work_phone varchar(50),
  home_phone varchar(50),
  cell_phone varchar(50),
  address varchar(100),
  email varchar(50),
  picture varchar(50),
  emp_login varchar(20) not null,
  emp_password varchar(20) not null,
  emp_level integer default 0,
  manmonth integer
);

insert into emps (name, title, email, work_phone, home_phone, cell_phone, address, dep_id, picture, emp_login, emp_password, emp_level, manmonth)
	values('John Smith', 'Director', 'johns@company.com', '(364) 134-5455', '(364) 134-5455', '(960) 393-3466', '', 2, 'johns.jpg', 'johns', '', 0, 0);
insert into emps (name, title, email, work_phone, home_phone, cell_phone, address, dep_id, picture, emp_login, emp_password, emp_level, manmonth)
	values('Li Jang', 'Developer', 'lij@company.com', '(364) 134-5456', '(364) 354-2646', '(730) 643-4397', '', 1, 'lij.jpg', 'lij', '', 0, 1);
insert into emps (name, title, email, work_phone, home_phone, cell_phone, address, dep_id, picture, emp_login, emp_password, emp_level, manmonth)
	values('Rob McDonald', 'Manager', 'robd@company.com', '(364) 134-5456', '(264) 823-2367', '(960) 423-3466', '', 5, 'robd.jpg', 'robd', '', 0, 0);
insert into emps (name, title, email, work_phone, home_phone, cell_phone, address, dep_id, picture, emp_login, emp_password, emp_level, manmonth)
	values('David Snyder', 'Developer', 'davids@company.com', '(364) 134-5457', '(344) 823-2367', '', '', 1, 'davids.jpg', 'davids', '', 0, 0);
insert into emps (name, title, email, work_phone, home_phone, cell_phone, address, dep_id, picture, emp_login, emp_password, emp_level, manmonth)
	values('Pablo Sanchez', 'Developer', 'pablos@company.com', '(364) 134-5458', '(454) 222-2287', '', '', 1, 'pablos.jpg', 'pablos', '', 0, 0);
insert into emps (name, title, email, work_phone, home_phone, cell_phone, address, dep_id, picture, emp_login, emp_password, emp_level, manmonth)
	values('Stefan Fey', 'Support', 'stefanf@company.com', '(364) 134-5459', '(764) 662-2367', '', '', 3, 'stefanf.jpg', 'stefanf', '', 0, 0);
insert into emps (name, title, email, work_phone, home_phone, cell_phone, address, dep_id, picture, emp_login, emp_password, emp_level, manmonth)
	values('Bob Kuch', 'Developer', 'bobk@company.com', '(364) 134-5411', '(564) 343-3367', '', '', 1, 'bobk.jpg', 'bobk', 'bobk', 3, 0);
insert into emps (name, title, email, work_phone, home_phone, cell_phone, address, dep_id, picture, emp_login, emp_password, emp_level, manmonth)
	values('Tim Leist', 'Developer', 'timl@company.com', '(364) 134-5413', '(364) 345-5267', '', '', 1, 'timl.jpg', 'timl', '', 0, 0);
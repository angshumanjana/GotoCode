-- Copyright (C) 2001 YesSoftware. All rights reserved.
-- BugTrack_MSSQL.sql

if exists (select * from sysobjects where id = object_id(N'bugs') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table bugs
go

if exists (select * from sysobjects where id = object_id(N'statuses') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table statuses
go

if exists (select * from sysobjects where id = object_id(N'projects') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table projects
go

if exists (select * from sysobjects where id = object_id(N'priorities') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table priorities
go

if exists (select * from sysobjects where id = object_id(N'employees') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table employees
go

CREATE TABLE employees (
       employee_id          int IDENTITY PRIMARY KEY,
       employee_name        varchar(50) NULL,
       login                varchar(15) NULL,
       pass                 varchar(15) NULL,
       email                varchar(50) NULL,
       security_level       int NULL DEFAULT 1
)
go

insert into employees (employee_name, login, pass, email, security_level)
	values ('Administrator', 'admin', 'admin', NULL, 3)
go

insert into employees (employee_name, login, pass, email, security_level)
	values ('Guest', 'guest', 'guest', NULL, 1)
go

insert into employees (employee_name, login, pass, email, security_level)
	values ('James Globus', 'james', 'james', 'james@nowhere.com', 1)
go

insert into employees (employee_name, login, pass, email, security_level)
	values ('Bob Morton', 'bob', 'bob', 'bob@nowhere.com', 1)
go

insert into employees (employee_name, login, pass, email, security_level)
	values ('Terry Lincoln', 'terry', 'terry', 'terry@nowhere.com	', 1)
go

insert into employees (employee_name, login, pass, email, security_level)
	values ('Steve Wolf', 'steve', 'steve', 'steve@nowhere.com', 1)
go

CREATE TABLE priorities (
       priority_id          int IDENTITY PRIMARY KEY,
       priority_desc        varchar(15) NULL
)
go

insert into priorities (priority_desc) values ('Highest')
go
insert into priorities (priority_desc) values ('High')
go
insert into priorities (priority_desc) values ('Normal')
go
insert into priorities (priority_desc) values ('Low')
go
insert into priorities (priority_desc) values ('Lowest')
go

CREATE TABLE projects (
       project_id           int IDENTITY PRIMARY KEY,
       project_name         varchar(50) NULL,
       employee_id          int
)
go

insert into projects (project_name, employee_id) values ('CodeCharge', 1)
go
insert into projects (project_name, employee_id) values ('My Project', 5)
go
insert into projects (project_name, employee_id) values ('Test Project',	4)
go
insert into projects (project_name, employee_id) values ('Great Project', 3)
go
insert into projects (project_name, employee_id) values ('Super Project', 6)
go

CREATE TABLE statuses (
       status_id            int IDENTITY PRIMARY KEY,
       status               varchar(15) NULL
)
go

insert into statuses (status) values ('Open')
go
insert into statuses (status) values ('On hold')
go
insert into statuses (status) values ('Closed')
go
insert into statuses (status) values ('In progress')
go

CREATE TABLE bugs (
       bug_id              int IDENTITY PRIMARY KEY,
       project_id           int NOT NULL,
       priority_id          int NOT NULL, 
       status_id            int NOT NULL,
       bug_name            varchar(100) NULL,
       bug_desc            text NULL,
       resolution           text NULL,
       assigned_by          int NOT NULL,
       assigned_to          int NOT NULL,
       date_assigned        datetime NULL,
       date_resolved        datetime NULL
)
go

insert into bugs (project_id, priority_id, status_id, bug_name, bug_desc, resolution, assigned_by, assigned_to, date_assigned)
	values (4,  2,  1,  'Remove ListOfValues',  null,  null,  1,  3,  '12/02/00')
go
insert into bugs (project_id, priority_id, status_id, bug_name, bug_desc, resolution, assigned_by, assigned_to, date_assigned)
	values (1,  1,  1,  'Rename URL to Param',  null, null ,  1,  4,  '12/02/00')
go

insert into bugs (project_id, priority_id, status_id, bug_name, bug_desc, resolution, assigned_by, assigned_to, date_assigned)
	values (1,  2,  3,  'Show ADO property page', null,  null, 1 , 3 ,  '12/02/00')
go

insert into bugs (project_id, priority_id, status_id, bug_name, bug_desc, resolution, assigned_by, assigned_to, date_assigned)
	values (2,  1,  1,  'Add: ODBC',  null,  null,  1,  3,  '12/02/00')
go

insert into bugs (project_id, priority_id, status_id, bug_name, bug_desc, resolution, assigned_by, assigned_to, date_assigned)
	values (3,  2,  4,  'Create buttons instead of links',  null,  null,  1,  5,  '10/30/00')
go

insert into bugs (project_id, priority_id, status_id, bug_name, bug_desc, resolution, assigned_by, assigned_to, date_assigned)
	values (1,  1,  1,  'Error during generation', null,  null,  1,  6,  '12/02/00') 
go
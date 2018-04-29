-- Copyright (C) 2001 YesSoftware. All rights reserved.
-- BugTrack_MySQL.sql

DROP TABLE IF EXISTS bugs;

DROP TABLE IF EXISTS statuses;

DROP TABLE IF EXISTS projects;

DROP TABLE IF EXISTS priorities;

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
       employee_id          int auto_increment PRIMARY KEY,
       employee_name        varchar(50) NULL,
       login                varchar(15) NULL,
       pass                 varchar(15) NULL,
       email                varchar(50) NULL,
       security_level       int NULL DEFAULT 1
);

insert into employees (employee_name, login, pass, email, security_level)
	values ('Administrator', 'admin', 'admin', NULL, 3);

insert into employees (employee_name, login, pass, email, security_level)
	values ('Guest', 'guest', 'guest', NULL, 1);

insert into employees (employee_name, login, pass, email, security_level)
	values ('James Globus', 'james', 'james', 'james@nowhere.com', 1);

insert into employees (employee_name, login, pass, email, security_level)
	values ('Bob Morton', 'bob', 'bob', 'bob@nowhere.com', 1);

insert into employees (employee_name, login, pass, email, security_level)
	values ('Terry Lincoln', 'terry', 'terry', 'terry@nowhere.com	', 1);

insert into employees (employee_name, login, pass, email, security_level)
	values ('Steve Wolf', 'steve', 'steve', 'steve@nowhere.com', 1);

CREATE TABLE priorities (
       priority_id          int auto_increment PRIMARY KEY,
       priority_desc        varchar(15) NULL
);

insert into priorities (priority_desc) values ('Highest');
insert into priorities (priority_desc) values ('High');
insert into priorities (priority_desc) values ('Normal');
insert into priorities (priority_desc) values ('Low');
insert into priorities (priority_desc) values ('Lowest');

CREATE TABLE projects (
       project_id           int auto_increment PRIMARY KEY,
       project_name         varchar(50) NULL,
       employee_id          int
);

insert into projects (project_name, employee_id) values ('CodeCharge', 1);
insert into projects (project_name, employee_id) values ('My Project', 5);
insert into projects (project_name, employee_id) values ('Test Project',	4);
insert into projects (project_name, employee_id) values ('Great Project', 3);
insert into projects (project_name, employee_id) values ('Super Project', 6);

CREATE TABLE statuses (
       status_id            int auto_increment PRIMARY KEY,
       status               varchar(15) NULL
);

insert into statuses (status) values ('Open');
insert into statuses (status) values ('On hold');
insert into statuses (status) values ('Closed');
insert into statuses (status) values ('In progress');

CREATE TABLE bugs (
       bug_id              int auto_increment PRIMARY KEY,
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
);

insert into bugs (project_id, priority_id, status_id, bug_name, bug_desc, resolution, assigned_by, assigned_to, date_assigned)
	values (4,  2,  1,  'Remove ListOfValues',  null,  null,  1,  3,  '12/02/00');
insert into bugs (project_id, priority_id, status_id, bug_name, bug_desc, resolution, assigned_by, assigned_to, date_assigned)
	values (1,  1,  1,  'Rename URL to Param',  null, null ,  1,  4,  '12/02/00');

insert into bugs (project_id, priority_id, status_id, bug_name, bug_desc, resolution, assigned_by, assigned_to, date_assigned)
	values (1,  2,  3,  'Show ADO property page', null,  null, 1 , 3 ,  '12/02/00');

insert into bugs (project_id, priority_id, status_id, bug_name, bug_desc, resolution, assigned_by, assigned_to, date_assigned)
	values (2,  1,  1,  'Add: ODBC',  null,  null,  1,  3,  '12/02/00');

insert into bugs (project_id, priority_id, status_id, bug_name, bug_desc, resolution, assigned_by, assigned_to, date_assigned)
	values (3,  2,  4,  'Create buttons instead of links',  null,  null,  1,  5,  '10/30/00');

insert into bugs (project_id, priority_id, status_id, bug_name, bug_desc, resolution, assigned_by, assigned_to, date_assigned)
	values (1,  1,  1,  'Error during generation', null,  null,  1,  6,  '12/02/00') ;
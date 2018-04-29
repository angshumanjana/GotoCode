-- Copyright (C) 2001 YesSoftware. All rights reserved.
-- Ledger_MySQL.sql

drop table if exists account_types;
drop table if exists accounts;
drop table if exists transactions;

CREATE TABLE account_types (
       account_type_id      int auto_increment primary key,
       account_type         varchar(50) NULL
);

CREATE TABLE accounts (
       account_id           int auto_increment primary key,
       account_number       varchar(50) NULL,
       account_name         varchar(50) NULL,
       account_type_id      int NULL
);

insert into accounts (account_number, account_name) values (1, 'Internet');
insert into accounts (account_number, account_name) values (2, 'Profit');
insert into accounts (account_number, account_name) values (3, 'Salary');
insert into accounts (account_number, account_name) values (4, 'Phone');
insert into accounts (account_number, account_name) values (5, 'Travels');

CREATE TABLE transactions (
       transaction_id       int auto_increment primary key,
       transaction_number   int NULL,
       transaction_date     datetime NOT NULL,
       transaction_description varchar(255) NULL,
       account_id           int NOT NULL,
       withdrawal_amount    decimal(10,2) NOT NULL DEFAULT 0,
       deposit_amount       decimal(10,2) NOT NULL DEFAULT 0
);

INSERT INTO transactions(transaction_number,transaction_date,transaction_description,account_id,withdrawal_amount,deposit_amount) values (1,'2000-12-15','',4,100,0);
INSERT INTO transactions(transaction_number,transaction_date,transaction_description,account_id,withdrawal_amount,deposit_amount) values (2,'2000-12-19','',1,200,0);
INSERT INTO transactions(transaction_number,transaction_date,transaction_description,account_id,withdrawal_amount,deposit_amount) values (3,'2000-12-19','',3,0,300);

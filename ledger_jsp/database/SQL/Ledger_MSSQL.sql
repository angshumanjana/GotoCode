-- Copyright (C) 2001 YesSoftware. All rights reserved.
-- Ledger_MSSQL.sql

if exists (select * from sysobjects where id = object_id(N'account_types') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table account_types
GO
if exists (select * from sysobjects where id = object_id(N'accounts') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table accounts
GO
if exists (select * from sysobjects where id = object_id(N'transactions') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table transactions
GO

CREATE TABLE account_types (
       account_type_id      int IDENTITY primary key,
       account_type         varchar(50) NULL
)
go

CREATE TABLE accounts (
       account_id           int IDENTITY primary key,
       account_number       varchar(50) NULL,
       account_name         varchar(50) NULL,
       account_type_id      int NULL
)
go

insert into accounts (account_number, account_name) values (1, 'Internet')
GO
insert into accounts (account_number, account_name) values (2, 'Profit')
GO
insert into accounts (account_number, account_name) values (3, 'Salary')
GO
insert into accounts (account_number, account_name) values (4, 'Phone')
GO
insert into accounts (account_number, account_name) values (5, 'Travels')
GO

CREATE TABLE transactions (
       transaction_id       int IDENTITY primary key,
       transaction_number   int NULL,
       transaction_date     datetime NOT NULL,
       transaction_description varchar(255) NULL,
       account_id           int NOT NULL,
       withdrawal_amount    money NOT NULL DEFAULT 0,
       deposit_amount       money NOT NULL DEFAULT 0
)
go

INSERT INTO transactions(transaction_number,transaction_date,transaction_description,account_id,withdrawal_amount,deposit_amount) values
	(1,'12/15/2000','',4,100,0)
GO
INSERT INTO transactions(transaction_number,transaction_date,transaction_description,account_id,withdrawal_amount,deposit_amount) values
	(2,'12/19/2000','',1,200,0)
GO
INSERT INTO transactions(transaction_number,transaction_date,transaction_description,account_id,withdrawal_amount,deposit_amount) values
	(3,'12/19/2000','',3,0,300)
GO


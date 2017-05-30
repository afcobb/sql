drop table if exists [line_item]
drop table if exists [request]
drop table if exists [product]
drop table if exists [vendor]
drop table if exists [user]
go -- use the go statement to make logical transactions work together, theyre regularly used when you are creating/dropping tables often
create table [user] ( 
	ID int identity(1,1) primary key,
	UserName varchar(20) not null, 
	Password varchar(10) not null, --varbinary(128) for ecncryption
	FirstName varchar(20) not null,
	LastName varchar(20) not null,
	Phone varchar(12), -- an example: nnn-nnn-nnnn
	Email varchar(75) not null,
	IsManager bit not null default 0 -- default: false
)
go
create unique index idx_user_username --convention, so we know theres an index on the username field
	on [user](Username asc)
go
insert into [user]
	(UserName, Password, FirstName, LastName, Email) --the list of columns that we're going to insert data into - note nothing added for ID
Values
	('normaluser', 'password', 'John', 'Doe', 'jdoe@aol.com')
	go
--Vendor Table
create table [vendor] (
	ID int identity(1,1) primary key,
	Code varchar(10) not null,
	Name varchar(255) not null,
	Address varchar(255) not null,
	City varchar(255) not null,
	State varchar(2) not null, 
	Zip varchar(5) not null,
	Phone varchar(12), 
	Email varchar(255),
	IsPreApproved bit not null default 0 
)
go
create unique index idx_vendor_code
	on [vendor](Code asc)
go
insert into [vendor]
	(Code, Name, Address, City, State, Zip)
	values
	('WAL0123', 'Walmart', '123 Any Street', 'Little Rock', 'AR', '12345')
go
--PRODUCT TABLE
create table [product] (
	ID int identity(1,1) primary key,
	VendorID int foreign key references [vendor](ID) not null, --NOTE THIS FORMATTING
	Name varchar(150) not null,
	PartNumber varchar(50) not null,
	Price decimal(10,2) not null default 0.00, --NOTE THIS FORMATTING
	Unit varchar(20) not null default 'Each',
	PhotoPath varchar(255)
)
go
create unique index idx_product_vendorid_partnumber
	on [product](VendorID, PartNumber)
go
insert into [product]
	(VendorID, Name, PartNumber, Price)
	values
	(1, 'Ball', 'BALL001', '5.99')
go
--REQUEST TABLE
create table [request] (
	ID int identity(1,1) primary key,
	UserID int foreign key references [user](ID)  not null,
	Description varchar(100),
	Justification varchar(255), 
	DateNeeded datetime, 
	DeliveryMode varchar(25),
	DocsAttached bit not null default 1, --defaults to true
	Status varchar(10), 
	Total decimal(10,2) not null default 0.00,
	SubmittedDate datetime default getdate() not null --this defaults date to current
)
go
create unique index idx_request_userid
	on [request](UserID asc)
go
insert into [request]
	(UserID, Description, Status)
	values
	(1,'My first request', 'NEW!')
go
CREATE TABLE [dbo].[line_item](
	[ID] [int] IDENTITY(1,1) NOT NULL primary key,
	[Quantity] [int] not null,
	[RequestID] [int] not null foreign key references [request](ID),
	[ProductID] [int] not null foreign key references [product](ID)
)
go
create unique index idx_requestid_productid
	on [line_item](RequestID, ProductID)
	go
insert into [line_item]
	(RequestId, ProductId, Quantity)
values
	(1, 1, 10)
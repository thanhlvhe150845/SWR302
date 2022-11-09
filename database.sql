create database Project
drop database Project
CREATE TABLE [Categories] (
	categoy_id int identity(1,1) PRIMARY KEY NOT NULL,
	category_name VARCHAR(20) NOT NULL
)

CREATE TABLE [Managers] (
	manager_id int identity(1,1) PRIMARY KEY NOT NULL,
	manager_name VARCHAR(20) NOT NULL,
	phone VARCHAR(10) NOT NULL,
	email VARCHAR(30) NOT NULL,
	[manager_address] VARCHAR(50) CHECK(manager_address LIKE '%-%-%'),
	account VARCHAR(20),
	[password] VARCHAR(20) CHECK([password] LIKE '________%')
 )

 CREATE TABLE [Products] (
	product_id int identity(1,1) PRIMARY KEY  NOT NULL,
	product_name VARCHAR(20) NOT NULL,
	price INT,
	quantity INT,
	category_id int FOREIGN KEY REFERENCES dbo.Categories(categoy_id),
	[image] VARCHAR(100),
	[description] TEXT
 )
 

 CREATE TABLE Customer_Account(
	customer_id int identity(1,1) NOT NULL ,
	account VARCHAR(20) NOT NULL,
	[password] VARCHAR(20) NOT NULL,
	isSell int ,
	isAdmin int
	PRIMARY KEY(customer_id)
 )
 

 CREATE TABLE Customers(
	customer_id int identity(1,1) NOT NULL,
	contact_name VARCHAR(20),
	[customer_address]  VARCHAR(50) CHECK(customer_address LIKE '%-%-%'),
	phone VARCHAR(10) NOT NULL
	PRIMARY KEY(customer_id)
 )

 ALTER TABLE dbo.Customers 
 add amount float;
 ADD FOREIGN KEY(customer_id) REFERENCES dbo.Customer_Account(customer_id)
 
 CREATE TABLE [Order](
	order_id int identity(1,1) PRIMARY KEY NOT NULL,
	customer_id int FOREIGN KEY REFERENCES dbo.Customers(customer_id),
	time_order DATE,
 )
 ALTER TABLE [Order]
  ADD totalmoney int;

 CREATE TABLE [Order_Details](

	order_id int identity(1,1) FOREIGN KEY REFERENCES dbo.[Order](order_id),
	Product_id int NOT NULL FOREIGN KEY REFERENCES dbo.Products(product_id),
	required_date DATE,
	ship_via INT,
	ship_address VARCHAR(60) CHECK(ship_address LIKE '%-%-%')
 )

  ALTER TABLE [Order_Details]
  add price int;
  add quantity int;


 CREATE TABLE [Carts] (
	Product_id int NOT NULL FOREIGN KEY REFERENCES dbo.Products(product_id),
	order_id int NOT NULL FOREIGN KEY REFERENCES [Order](order_id),
	quantity INT,
	discount INT,
	PRIMARY KEY(Product_id, order_id)
 )


insert Categories values('Casual Dress')
insert Categories values('Smart Casual')
insert Categories values('Business Casual')
insert Categories values('Business Formal')
insert Categories values('Cocktail Attire')
insert Categories values('Semi Formal')
insert Categories values('Black Tie')
insert Categories values('White Tie')



insert Products values(?,?,?,?,?,?)
insert Products values('jacket',200000,10,1,'img/Casual Dress/1.png',null)
insert Products values('jean',200000,10,1,'img/Casual Dress/2.png',null)
insert Products values('shoes',200000,10,1,'img/Casual Dress/3.png',null)
insert Products values('tee',200000,10,1,'img/Casual Dress/4.png',null)

insert Products values('chinos',200000,10,2,'img/Smart Casual/4.png',null)
insert Products values('dark jeans',200000,10,2,'img/Smart Casual/2.png',null)
insert Products values('blazer',200000,10,2,'img/Smart Casual/1.png',null)
insert Products values('shoes ',200000,10,2,'img/Smart Casual/3.png',null)

insert Products values('jean',200000,10,3,'img/Business Casual/1.png',null)
insert Products values('sweater',200000,10,3,'img/Business Casual/2.png',null)
insert Products values('shoes',200000,10,3,'img/Business Casual/3.png',null)
insert Products values('shirt',200000,10,3,'img/Business Casual/4.png',null)

insert Products values('blazer',200000,10,4,'img/Business Formal/1.png',null)
insert Products values('jean',200000,10,4,'img/Business Formal/2.png',null)
insert Products values('calavat',200000,10,4,'img/Business Formal/3.png',null)
insert Products values('shirt',200000,10,4,'img/Business Formal/4.png',null)

insert Products values('shirt',200000,10,5,'img/Cocktail Attire/1.png',null)
insert Products values('shoe',200000,10,5,'img/Cocktail Attire/2.png',null)
insert Products values('blazer',200000,10,5,'img/Cocktail Attire/3.png',null)
insert Products values('jean',200000,10,5,'img/Cocktail Attire/4.png',null)

insert Products values('calavat',200000,10,6,'img/Semi Formal/1.png',null)
insert Products values('blazer',200000,10,6,'img/Semi Formal/2.png',null)
insert Products values('shoes',200000,10,6,'img/Semi Formal/3.png',null)
insert Products values('shirt',200000,10,6,'img/Semi Formal/4.png',null)

insert Products values('shirt',200000,10,7,'img/Black Tie/1.png',null)
insert Products values('blazer',200000,10,7,'img/Black Tie/2.png',null)
insert Products values('shoes',200000,10,7,'img/Black Tie/3.png',null)
insert Products values('bow tie',200000,10,7,'img/Black Tie/4.png',null)
insert Products values('shoes',200000,10,7,'img/Black Tie/5.png',null)
insert Products values('shirt',200000,10,7,'img/Black Tie/6.png',null)
insert Products values('calavat',200000,10,7,'img/Black Tie/7.png',null)
insert Products values('blazer',200000,10,7,'img/Black Tie/8.png',null)

insert Products values('shoes',200000,10,8,'img/Black Tie/1.png',null)
insert Products values('tie',200000,10,8,'img/Black Tie/2.png',null)
insert Products values('jean',200000,10,8,'img/Black Tie/3.png',null)
insert Products values('blazer',200000,10,8,'img/Black Tie/4.png',null)
insert Products values('blazer',200000,10,8,'img/Black Tie/5.png',null)
insert Products values('shoes',200000,10,8,'img/Black Tie/6.png',null)
insert Products values('tie',200000,10,8,'img/Black Tie/7.png',null)
insert Products values('shirt',200000,10,8,'img/Black Tie/8.png',null)

insert Customer_Account values('asdf','1233',1,0)
insert Customer_Account values('yeu','3212dd',0,0)
insert Customer_Account values('em','123dd',1,0)
insert Customer_Account values('nhieu','454gg',0,0)
insert Customer_Account values('long','ghgh',0,0)
insert Customer_Account values('nay','56hgh',0,0)
insert Customer_Account values('nhoi','56',1,0)
insert Customer_Account values('dau','gh',1,0)
insert Customer_Account values('qua','jh',0,0)
insert Customer_Account values('di','6767',0,0)
insert Customer_Account values('thoi','hj7',0,0)
insert Customer_Account values('hieu','123',1,1)


select top 8 *  from Products order by product_id desc


use Project
select * from Products where category_id = 1
select * from Products where product_id = 1
select * from Products where product_name like '%j%'
select * from Products
select * from Categories
select * from Customer_Account
select * from Customer_Account where account='hieu'
select * from Customer_Account where account = 'hieu' and [password] ='123'
delete  from Products 
delete  from Categories 
insert into Customer_Account values('hieudeptrai','111',0,0)
delete from Products where product_id =4

update Products set 
product_name =? ,
price = ?,
quantity =?,
category_id = ?,
[image] = ?,
[description] where product_id = ?

select * from Products where 1=1 and category_id in (1,2)
and price >0 and price<500
select top 1 order_id from [Order] order by order_id desc
select * from [Order]
select * from Order_Details
insert into Order_Details values
select * from Customers
insert into [Order] values(?,?,?)
select * from Customer_Account where account = ? and password=?
ALTER TABLE Order_Details
DROP COLUMN ship_address;
update Customer_Account set password = '123' where account = 'hieu'
select * from Customer_Account where customer_id= '12'
select * from Customers

insert Customers values('hoa','asdf-aaa-aasdf','2323',200.1)
insert Customers values('hieu','123-hoahung-tphcm2','2342344424',200.1)
insert Customers values('sac','123-hoa hung tphcm2','214214214',200.1)
insert Customers values('a','123-hoa hung tphcm3','123432414',200.1)
insert Customers values('b','123-hoa hung tphcm4','234234324',200.1)
insert Customers values('c','123-hoa hung tphcm5','13434124124',200.1)
insert Customers values('d','123-hoa hung tphcm6','1412344234',200.1)
insert Customers values('e','123-hoa hung tphcm8','1345645456',200.1)
insert Customers values('f','123-hoa hung tphcm9','5646456',200.1)
insert Customers values('g','123-hoa hung tphcm10','3456456456',200.1)
insert Customers values('h','123-hoa hung tphcm11','546456456456',200.1)
insert Customers values('f','123-hoa hung tphcm12','56436456346',200.1)
insert Customers values('t','123-hoa hung tphcm13','45645656767',200.1)
insert Customers values('d','123-hoa hung tphcm14','0768678',200.1)
DELETE FROM Customers;
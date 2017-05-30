create procedure AddUser
  @username varchar(50),
  @password varchar(50),
  @firstname varchar(50),
  @lastname varchar(50),
  @phone int(12),

as
begin 
insert into [user] (
	UserName, Password, FirstName, LastName)
	values (
	'username', 'password', 'firstname', 'lastname'
	)
end

--exec abc

insert into [vendor] (code, Name, Address, City, State, Zip, Phone, Email, IsPreApproved)
	values ('NATIV1001', 'Native Instruments', '123 Synth Ln', 'OH', '45223', '5131234506', 'info@nativeinstruments.com', 'Yes')
	--amazon products
select @vendorId = id from [vendor] where code = 'AMAZON001'
insert into [product] (VendorId, Name, PartNumber, Price, Unit, PhotoPath)
	values (@vendorId, 'Echo', 'AMZN-Echo', 99.99, 'Each', NULL)
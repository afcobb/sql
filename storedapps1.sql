alter procedure HelloWorld 
@name varchar(50)
as
BEGIN
	if @name is null 
		set @name = 'Default Name' 
	select concat('Hello, World!', ' ', @name)
END

exec HelloWorld 'Alex'
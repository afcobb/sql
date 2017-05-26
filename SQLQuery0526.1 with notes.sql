select subject as 'Department', section, CONCAT(first_name, ' ', last_name) as "full name"
from class
join instructor
	on class.instructor_id = instructor.id
order by last_name

--query: show class info with instructor name (first and last) in instructor last name seequence 
/*select last_name, first_name, subject
from instructor 
join class 
	on instructor.id = class.instructor_id
	*/
	-- using join and two tables 
/* (select Last_Name, First_Name, description
from student 
join major 
	on student.major_id  = major.id -- when these two things are the same, it will present the data - note the "on" syntax
	where student.sat >= 1000
*/
/*
--query: all student without an assigned major
select * from student where major_id is not NULL
*/
/*update student set major_id = 5 where id = 160 
--this changes the majors for students by major id and student id
select * from class
select * from instructor
*/
--queries the major table
/*
select req_sat, description from education.dbo.major
where description = 'math' or description = 'finance'
order by req_sat desc
*/
--this might describe the query
/*
select * from student
where gpa >= 3.0 and gpa <= 3.5 --selecting a specific range
order by sat desc 
*/
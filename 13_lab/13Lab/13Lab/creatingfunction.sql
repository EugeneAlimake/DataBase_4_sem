use UNIVER
go
--1
create function COUNT_STUDENTS(@faculty varchar(20)) returns int
as begin declare @rc int=0;
set @rc=(select count(NAME) from STUDENT join GROUPS
    on STUDENT.IDGROUP = GROUPS.IDGROUP
	join FACULTY
	    on GROUPS.FACULTY = FACULTY.FACULTY
		    where FACULTY.FACULTY = @faculty);
return @rc;
end;
-- + @prof
go
alter function COUNT_STUDENTS(@faculty varchar(20) = null, @prof varchar(20) = '1-40 01 02') returns int
as begin
declare @rc int = 0;
set @rc = (
SELECT count(IDSTUDENT) from FACULTY inner join GROUPS
	on FACULTY.FACULTY = GROUPS.FACULTY
	inner join STUDENT
		on GROUPS.IDGROUP = STUDENT.IDGROUP
			where FACULTY.FACULTY = @faculty and GROUPS.PROFESSION = @prof);
return @rc;
end; 


--2
create function FSUBJECTS(@p varchar(20)) returns varchar(300)
as begin
declare @sb varchar(10), @s varchar(100) = '';
declare sbj cursor local static
    for select distinct SUBJECT from SUBJECT 
	    where PULPIT like @p;
open sbj;
fetch sbj into @sb;
while @@FETCH_STATUS = 0
begin
	set @s = @s + RTRIM(@sb) + ', ';
	fetch sbj into @sb;
end;
return @s
end;

--3
create function FFACPUL(@f varchar(50),@p varchar(50)) returns table
as return 
select FACULTY.FACULTY, PULPIT.PULPIT
from FACULTY  left outer join PULPIT 
on FACULTY.FACULTY=PULPIT.FACULTY
where PULPIT.FACULTY=isnull(@f, PULPIT.FACULTY) and PULPIT.PULPIT=isnull(@p, PULPIT.PULPIT)

--4

create function FCTEACHER(@p varchar(50)) returns int
as 
begin
	declare @rc int=(select count(*) from TEACHER
	where PULPIT=ISNULL(@p, PULPIT));
	return @rc;
end
go

--6
--факультеты
create function FACULTY_REPORT_FACULTY(@c int) returns varchar(300)
	as 
	begin 
		declare cc CURSOR static for 
	       select FACULTY from FACULTY  where dbo.COUNT_STUDENTS(FACULTY, default) > @c; 
	       declare @f varchar(100), @ss varchar(100) = '';
	       open cc;  
                 fetch cc into @f;
	       while @@fetch_status = 0
	       begin
	           set @ss=@f; 
	            fetch cc into @f;  
	       end;   
                 return @ss; 
	end;
--количество кафедр
create function FACULTY_REPORT_CAFEDR(@c int) returns varchar(300)
	as 
	begin 
		declare cc CURSOR static for 
	       select FACULTY from FACULTY  where dbo.COUNT_STUDENTS(FACULTY, default) > @c; 
	       declare @f varchar(100), @ss varchar(100) = '';
	       open cc;  
                 fetch cc into @f;
	       while @@fetch_status = 0
	       begin
	           set @ss=(select count(PULPIT) from PULPIT where FACULTY = @f); 
	            fetch cc into @f;  
	       end;   
                 return @ss; 
	end;

--количество групп
create function FACULTY_REPORT_GROUP(@c int) returns varchar(300)
	as 
	begin 
		declare cc CURSOR static for 
	       select FACULTY from FACULTY  where dbo.COUNT_STUDENTS(FACULTY, default) > @c; 
	       declare @f varchar(100), @ss varchar(100) = '';
	       open cc;  
                 fetch cc into @f;
	       while @@fetch_status = 0
	       begin
	           set @ss=(select count(IDGROUP) from GROUPS where FACULTY = @f);
	            fetch cc into @f;  
	       end;   
                 return @ss; 
	end;

--количество специальностей
create function FACULTY_REPORT_PROFESSION (@c int) returns varchar(300)
	as 
	begin 
		declare cc CURSOR static for 
	       select FACULTY from FACULTY  where dbo.COUNT_STUDENTS(FACULTY, default) > @c; 
	       declare @f varchar(100), @ss varchar(100) = '';
	       open cc;  
                 fetch cc into @f;
	       while @@fetch_status = 0
	       begin
	           set @ss=(select count(PROFESSION) from PROFESSION where FACULTY = @f);
	            fetch cc into @f;  
	       end;   
                 return @ss; 
	end;
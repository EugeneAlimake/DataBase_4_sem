--1
go
declare @n int = dbo.COUNT_STUDENTS('ИДиП');
print 'Количество студентов: ' + cast(@n as varchar(4));

declare @n int = dbo.COUNT_STUDENTS('ИДиП', '1-40 01 02');
print 'Количество студентов: ' + cast(@n as varchar(4));
--2
go 
select distinct PULPIT, dbo.FSUBJECTS(PULPIT)[Дисциплины] from SUBJECT;

--3
select * from dbo.FFACPUL(NULL, NULL);
   select * from dbo.FFACPUL('ИДиП', NULL);
   select * from dbo.FFACPUL(NULL, 'ИСиТ');
   select * from dbo.FFACPUL('ИДиП', 'ИСиТ');

--4
select PULPIT, dbo.FCTEACHER(PULPIT)[Количество преподавателей] from TEACHER;
select dbo.FCTEACHER(null)[Общее количество преподавателей];

--5
declare @facul nvarchar(100), @cafedr nvarchar(100),@group nvarchar(100),@student nvarchar(100), @profession nvarchar(100);
select @facul = dbo.FACULTY_REPORT_FACULTY(2);
select @cafedr=dbo.FACULTY_REPORT_CAFEDR(2);
select @group=dbo.FACULTY_REPORT_GROUP(2);
select @student=dbo.FACULTY_REPORT_STUDENTS(2);
select @profession=dbo.FACULTY_REPORT_PROFESSION(2);
print 'Факультет: ' + @facul+'Количество кафедр: ' +@cafedr+' Количество групп: '+@group+' Количество студентов: '+@student+' Количество специальностей: '+@profession;

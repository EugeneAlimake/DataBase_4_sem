--1
go
declare @n int = dbo.COUNT_STUDENTS('����');
print '���������� ���������: ' + cast(@n as varchar(4));

declare @n int = dbo.COUNT_STUDENTS('����', '1-40 01 02');
print '���������� ���������: ' + cast(@n as varchar(4));
--2
go 
select distinct PULPIT, dbo.FSUBJECTS(PULPIT)[����������] from SUBJECT;

--3
select * from dbo.FFACPUL(NULL, NULL);
   select * from dbo.FFACPUL('����', NULL);
   select * from dbo.FFACPUL(NULL, '����');
   select * from dbo.FFACPUL('����', '����');

--4
select PULPIT, dbo.FCTEACHER(PULPIT)[���������� ��������������] from TEACHER;
select dbo.FCTEACHER(null)[����� ���������� ��������������];

--5
declare @facul nvarchar(100), @cafedr nvarchar(100),@group nvarchar(100),@student nvarchar(100), @profession nvarchar(100);
select @facul = dbo.FACULTY_REPORT_FACULTY(2);
select @cafedr=dbo.FACULTY_REPORT_CAFEDR(2);
select @group=dbo.FACULTY_REPORT_GROUP(2);
select @student=dbo.FACULTY_REPORT_STUDENTS(2);
select @profession=dbo.FACULTY_REPORT_PROFESSION(2);
print '���������: ' + @facul+'���������� ������: ' +@cafedr+' ���������� �����: '+@group+' ���������� ���������: '+@student+' ���������� ��������������: '+@profession;

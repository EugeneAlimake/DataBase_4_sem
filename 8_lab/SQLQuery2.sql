use UNIVER

DECLARE @a char='a',
		@b varchar(4)='БГТУ',
		@c datetime,
		@d time,
		@e int,
		@f smallint,
		@g tinyint,
		@h numeric(12,5)
SET @c=getdate(); SET @d='12:59:34.21';
SELECT @a a,@b b,@c c, @d d;
SELECT @e=123, @f=5, @g=1;
print 'e='+cast(@e as varchar(10));
print 'f='+cast(@f as varchar(10));
print 'g='+cast(@g as varchar(10));

--2
DECLARE @var1 int
DECLARE	@var2 int
DECLARE	@var3 int
DECLARE	@var4 int
DECLARE @var5 int
SELECT @var1 = SUM(AUDITORIUM_CAPACITY) FROM AUDITORIUM 
if @var1>200
begin
select @var2=(select count(*) from AUDITORIUM),
		@var3=(select avg(AUDITORIUM_CAPACITY) from AUDITORIUM)
	set	@var4=(select count(*) from AUDITORIUM where AUDITORIUM_CAPACITY<@var3)
		Select @var1 'Общее количество', 
		@var2 'Количество аудиторий', 
		@var3 'Среднее значение', 
		@var4 'Количество кабинетов, где вместимость меньше, чем среднняя', 
		100*(cast(@var4 as float)/cast(@var2 as float)) '% ауд.< AVR'		
end
else 
print 'Количество:'+cast(@var1 as varchar(10));

--3
print '@@ROWCOUNT число обраб. строк ' + cast(@@ROWCOUNT as nvarchar(10));
print '@@VERSION версия SQL Server ' + cast(@@VERSION as nvarchar(10));
print '@@SPID системный иден. процесса ' + cast(@@SPID as nvarchar(10));
print '@@ERROR код последней ошибки ' + cast(@@ERROR as nvarchar(10));
print '@@SERVERNAME имя сервера ' + cast(@@SERVERNAME as nvarchar(10));
print '@@TRANCOUNT уровень вложенности транзакций ' + cast(@@TRANCOUNT as nvarchar(10));
print '@@FETCH_STATUS проверка рез-та счит. строк рез.набора ' + cast(@@FETCH_STATUS as nvarchar(10));
print '@@NESTLEVEL ур. влож-сти тек. процедуры ' + cast(@@NESTLEVEL as nvarchar(10));
		
--4
Declare 
@t int =1, @x int =3, @z float;
if(@t>@x)
set @z=power(sin(@t),2);
if(@t<@x)
set @z=4*(@t+@x);
if(@t=@x)
set @z=1-exp(@x-2);
print 'z='+cast(@z as varchar(10));


declare @ss varchar(100)=(select top 1 NAME from STUDENT)
select substring(@ss, 1, charindex(' ', @ss))
		+substring(@ss, charindex(' ', @ss)+1,1)+'.'
		+substring(@ss, charindex(' ', @ss, charindex(' ', @ss)+1)+1,1)+'.'

declare @sss nvarchar(100) = 'Hhjd Gkdfkfd Jfkf';
set @sss = ltrim(@sss);
set @sss = rtrim(@sss);
declare @i int=0;
while(@i<LEN(@sss))
begin
if(SUBSTRING(@sss,@i,1)=' ')
begin
if(SUBSTRING(@sss,@i+1,1)=' ')
begin
set @sss = substring(@sss,1,@i)+substring(@sss,@i+2,len(@sss));
set @i = @i-1;
end
end
set @i = @i+1;
end
select substring(@sss, 1, charindex(' ', @sss))
		+substring(@sss, charindex(' ', @sss)+1,1)+'.'
		+substring(@sss, charindex(' ', @sss, charindex(' ', @sss)+1)+1,1)+'.'



if (MONTH(getdate())!=12)
begin
select NAME , 2022-YEAR(BDAY)[Возраст], MONTH(BDAY)[Месяц дня рождения]
From STUDENT where MONTH(BDAY)=MONTH(getdate())+1 
end;
else
begin
select NAME , 2022-YEAR(BDAY)[Возраст], MONTH(BDAY)[Месяц дня рождения]
From STUDENT where MONTH(BDAY)=1 
end;

DECLARE @group_number INT = 5;
SELECT TOP(1) DATENAME(WEEKDAY, PDATE) AS "WEEKDAY"
FROM PROGRESS
JOIN STUDENT ON PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
JOIN GROUPS ON STUDENT.IDGROUP = GROUPS.IDGROUP
WHERE GROUPS.IDGROUP = @group_number;
--5
declare @xxx int = (select count(*) from STUDENT);
if (select count(*) from STUDENT) > 20
begin
print 'STUDENT > 20';
print 'STUDENT=' + cast(@xxx as varchar(10));
end;
else
begin
print 'STUDENT < 20';
print 'STUDENT=' + cast(@xxx as varchar(10));
end;

--6
use UNIVER;
DECLARE @FACULTY varchar(10) = 'ТОВ';
select case
when NOTE = 10 then '10'
when NOTE = 8 or NOTE = 9 then '8-9'
when NOTE = 6 or NOTE = 7 then '6-7'
else '4-5' 
end NOTE, count(*) [Кол-во]
from PROGRESS
join STUDENT on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
join GROUPS on STUDENT.IDGROUP = GROUPS.IDGROUP
where FACULTY = @FACULTY
group by case
when NOTE = 10 then '10'
when NOTE = 8 or NOTE = 9 then '8-9'
				when NOTE = 6 or NOTE = 7 then '6-7'
				else '4-5' 
end

--7
create table #helps
( tibd int,
tfield varchar(100)
)
set nocount on;
declare @i int=0;
while @i<1000
begin 
insert #helps(tibd,tfield)
values(floor(30000*rand()),replicate('strings',10));
if(@i%100=0)
print @i;
set @i=@i+1;
end;
select * from #helps

--8
Declare @xx int =1
print @xx+1
print @xx+2
Return 
print @xx+3

--9
begin TRY
	update PROGRESS set NOTE='ваавав'	
			where NOTE=6
end TRY
begin CATCH
	print ERROR_NUMBER()	--код последней ошибки
	print ERROR_MESSAGE()	--сообщение об ошибке
	print ERROR_LINE()		--код последней ошибки
	print ERROR_PROCEDURE()	--имя процедуры или NULL
	print ERROR_SEVERITY()	--уровень серьезности ошибки
	print ERROR_STATE()		--метка ошибки
end CATCH



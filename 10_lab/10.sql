--1
DECLARE Subs CURSOR
	for SELECT SUBJECT from SUBJECT 
	where SUBJECT.PULPIT='ИСиТ' ORDER BY SUBJECT DESC; 
DECLARE @sub char(5),
		@str char(100)=' '; 
OPEN Subs;  
	fetch  Subs into @sub;    
	print   'Дисциплины на кафедре ИСиТ:';   
	while @@fetch_status = 0                                   
	begin 
		set @str = rtrim(@sub)+', '+@str; -- удаляет все завершающие пробелы        
		fetch  Subs into @sub; 
	end;   
    print @str;        
CLOSE  Subs;
deallocate Subs; 
--СТУДЕНТЫ, ПРЕДМЕТЫ, КАФЕДРЫ
Declare tests cursor
for select (select COUNT(*) From SUBJECT) as first_,
(select COUNT(*) from STUDENT) as second_,
(select COUNT(*) from FACULTY) as third_

Declare @first int, @second int, @third int, @srt char(100);
open tests;
fetch tests into @first, @second, @third
set @srt = cast(@first as nvarchar(5))+' '+cast(@second as nvarchar(5))+' '+cast(@third as nvarchar(5)) ;
print @srt;
close tests;
deallocate tests;

Declare test cursor
		for select SUBJECT from SUBJECT
declare @first int=0, @subj char(100), @subjall char(100)
open test
fetch test into @subj
while @@FETCH_STATUS=0
	begin
set @subjall = rtrim(@subj)+', '+@subj;
	set @first=@first+1;
	fetch test into @subj
	end;
	print @first;
	print @subjall;
	close test


--2
declare second cursor local
	FOR SELECT SUBJECT, PULPIT From SUBJECT;
declare @sub1 char(5), @pul char(5) 
Open second ;
fetch second into @sub1,@pul;
print '1.'+@sub1 + @pul;
go
declare @sub1 char(5), @pul char(5) 
fetch second into @sub1,@pul;
print '2.'+@sub1 + @pul;
go

declare secondone cursor global
 for select SUBJECT, PULPIT From SUBJECT;
declare @sub1 char(5), @pul char(5) 
open secondone;
fetch secondone into @sub1,@pul;
print '1.'+@sub1 + @pul;
go
declare @sub1 char(5), @pul char(5) 
fetch secondone into @sub1,@pul;
print '2.'+@sub1 + @pul;
close secondone;
deallocate secondone;
go

--3
Declare @idstud int,@idgr int, @name nvarchar(max);
declare third cursor local static
for select IDGROUP,IDGROUP,NAME from STUDENT where IDGROUP=16;
open third;
print 'количество строк:'+cast(@@CURSOR_ROWS as varchar(5));
update STUDENT set IDGROUP=11 where IDGROUP=16;
fetch third into @idstud, @idgr, @name;
while @@FETCH_STATUS=0
begin 
print cast(@idstud as varchar(6))+ ' ' + cast(@idgr as varchar(6))+ ' '+ @name;
fetch third into @idstud, @idgr, @name;
end;
close third;

Declare @idstud1 int,@idgr1 int, @name1 nvarchar(max);
declare third cursor local 
for select IDGROUP,IDGROUP,NAME from STUDENT where IDGROUP=11;
open third;
print 'количество строк:'+cast(@@CURSOR_ROWS as varchar(5));
update STUDENT set IDGROUP=16 where IDGROUP=11;
fetch third into @idstud1, @idgr1, @name1;
while @@FETCH_STATUS=0
begin 
print cast(@idstud1 as varchar(6))+ ' ' + cast(@idgr1 as varchar(6))+ ' '+ @name1;
fetch third into @idstud1, @idgr1, @name1;
end;
close third;

--4
declare @number int, @sub1 char(5), @pul char(5) 
declare secondone cursor local dynamic scroll
 for select ROW_NUMBER()over(order by SUBJECT)N, SUBJECT, PULPIT From SUBJECT;
open secondone;
fetch secondone into @number, @sub1,@pul;
print cast(@number as varchar(4))+' '+@sub1+' '+@pul;
fetch next from secondone into @number, @sub1,@pul;
print cast(@number as varchar(4))+' '+@sub1+' '+@pul;
fetch last from secondone into @number,@sub1,@pul;
print cast(@number as varchar(4))+' '+@sub1 +' '+ @pul;
fetch absolute -3 from secondone into @number,@sub1,@pul;
print cast(@number as varchar(4))+' '+@sub1 +' '+ @pul;
fetch relative -3 from secondone into @number,@sub1,@pul;
print cast(@number as varchar(4))+' '+@sub1 +' '+ @pul;
close secondone;

--5
Declare @idstud2 int,@idgr2 int, @name2 nvarchar(max);
declare fifth cursor local dynamic 
	for select IDGROUP,IDGROUP,NAME from STUDENT where IDGROUP=29 for update;
	open fifth ;
	fetch fifth into @idstud2, @idgr2, @name2;
	UPDATE STUDENT set IDGROUP=IDGROUP-20 Where current of fifth;
	print cast(@idstud2 as varchar(6))+ ' ' + cast(@idgr2 as varchar(6))+ ' '+ @name2;
	close fifth;


--6
DECLARE @name3 nvarchar(50), @note int;  
DECLARE sixth CURSOR LOCAL for 
SELECT NAME, NOTE from PROGRESS join STUDENT 
	on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
		where NOTE<5

OPEN sixth;  
    fetch  sixth into @name3, @note;  
	while @@fetch_status = 0
	begin 		
		--delete PROGRESS where CURRENT OF sixth;	
		print @name3 +' '+ cast(@note as nvarchar(3));
		fetch  sixth into @name3, @note;  
	end
CLOSE sixth;
	
DECLARE @name4 nvarchar(50),@id int, @note4 int;  
DECLARE sixthone CURSOR LOCAL for 
SELECT NAME,  NOTE from PROGRESS join STUDENT 
	on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
		Where PROGRESS.IDSTUDENT=1000;

OPEN sixthone;  
    fetch  sixthone into @name4, @note4;  
	while @@fetch_status = 0
	begin 		
		print @name4 +' '+ cast(@note4 as nvarchar(3));
		update PROGRESS set NOTE=NOTE+1 where CURRENT OF sixthone;	
		fetch  sixthone into @name4, @note4;  
	end
CLOSE sixthone;
create table TR_AUDIT
(
	ID int identity,	--номер
	STMT varchar(20)	--DML_оператор
		check (STMT in('INS','DEL','UPD')),
	TRANAME varchar(50),--имя триггера
	CC varchar(300)	--комментарий
)

--1
create trigger TR_TEACHER_INS
				on TEACHER after insert
as declare @a1 char(10), @a2 varchar(100), @a3 char(1),@a4 char(20),@in varchar(300);
print 'Операция вставки';
set @a1=(select TEACHER from INSERTED);
set @a2=(select TEACHER_NAME from INSERTED);
set @a3=(select GENDER from INSERTED);
set @a4=(select	PULPIT from INSERTED);
set @in= @a1+' '+ @a2 +' '+ @a3+ ' ' +@a4;
insert into TR_AUDIT(STMT,TRANAME,CC) 
				values('INS','TR_TEACHER_INS',@in);
return;

	  insert into  TEACHER values('ИВНВ', 'Иванов Иван Иванович', 'м', 'ИСиТ');
	  select * from TR_AUDIT
	 

--2
create trigger TR_TEACHER_DEL
				on TEACHER after DELETE
as declare  @a1 char(10), @a2 varchar(100), @a3 char(1),@a4 char(20),@in varchar(300);
print 'Операция удаления'
set @a1=(select TEACHER from deleted);
set @a2=(select TEACHER_NAME from deleted);
set @a3=(select GENDER from deleted);
set @a4=(select	PULPIT from deleted);
set @in= @a1+' '+ @a2 +' '+ @a3+ ' ' +@a4;
insert into TR_AUDIT(STMT,TRANAME,CC) 
				values('DEL','TR_TEACHER_DEL', @in);
return; 

delete from TEACHER where TEACHER='ИВНВ';
 select * from TR_AUDIT;

 --3

create trigger TR_TEACHER_UPD 
				on TEACHER after UPDATE
as declare  @a1 char(10), @a2 varchar(100), @a3 char(1),@a4 char(20),@in varchar(300);
 print 'Операция обновления';
      set @a1 = (select TEACHER from INSERTED);
      set @a2= (select TEACHER_NAME from INSERTED);
      set @a3= (select GENDER from INSERTED);
	  set @a4 = (select PULPIT from INSERTED);
      set @in = @a1+' '+ @a2 +' '+ @a3+ ' ' +@a4;
      set @a1 = (select TEACHER from deleted);
      set @a2= (select TEACHER_NAME from DELETED);
      set @a3= (select GENDER from DELETED);
	  set @a4 = (select PULPIT from DELETED);
      set @in =@in + '' + @a1+' '+ @a2 +' '+ @a3+ ' ' +@a4;
      insert into TR_AUDIT(STMT, TRANAME, CC)  
                            values('UPD', 'TR_TEACHER_UPD', @in);	         
      return;  
      go

  update TEACHER set GENDER = 'ж' where TEACHER='ИВНВ'
	  select * from TR_AUDIT

--4
 create trigger TR_TEACHER on TEACHER after INSERT, DELETE, UPDATE
 as declare @a1 char(10), @a2 varchar(100), @a3 char(1),@a4 char(20),@in varchar(300);
 declare @ins int=(select count(*) from inserted),
		 @del int=(select count(*) from deleted);
		if @ins > 0 and @del=0
		begin 
		print 'Событие добавление';
		set @a1=(select TEACHER from INSERTED);
		set @a2=(select TEACHER_NAME from INSERTED);
		set @a3=(select GENDER from INSERTED);
		set @a4=(select	PULPIT from INSERTED);
		set @in= @a1+' '+ @a2 +' '+ @a3+ ' ' +@a4;
		insert into TR_AUDIT(STMT,TRANAME,CC) 
				values('INS','TR_TEACHER_INS',@in);
end;
else
if @ins=0 and @del>0
begin 
print 'Операция удаления'
set @a1=(select TEACHER from deleted);
set @a2=(select TEACHER_NAME from deleted);
set @a3=(select GENDER from deleted);
set @a4=(select	PULPIT from deleted);
set @in= @a1+' '+ @a2 +' '+ @a3+ ' ' +@a4;
insert into TR_AUDIT(STMT,TRANAME,CC) 
				values('DEL','TR_TEACHER_DEL', @in);
end;
else
if @ins>0 and @del>0
begin 
 print 'Операция обновления';
      set @a1 = (select TEACHER from INSERTED);
      set @a2= (select TEACHER_NAME from INSERTED);
      set @a3= (select GENDER from INSERTED);
	  set @a4 = (select PULPIT from INSERTED);
      set @in = @a1+' '+ @a2 +' '+ @a3+ ' ' +@a4;
      set @a1 = (select TEACHER from deleted);
      set @a2= (select TEACHER_NAME from DELETED);
      set @a3= (select GENDER from DELETED);
	  set @a4 = (select PULPIT from DELETED);
      set @in =@in + '' + @a1+' '+ @a2 +' '+ @a3+ ' ' +@a4;
      insert into TR_AUDIT(STMT, TRANAME, CC)  
                            values('UPD', 'TR_TEACHER_UPD', @in);	         
	end;
return;  

--5
update TEACHER set GENDER = 'й' where TEACHER='ИВНВ'
 select * from TR_AUDIT

 --6

go   
create trigger TR_TEACHER_DEL1 on TEACHER after DELETE  
as declare  @a1 char(10), @a2 varchar(100), @a3 char(1),@a4 char(20),@in varchar(300);
print 'TR_TEACHER_DEL1';
set @a1=(select TEACHER from deleted);
set @a2=(select TEACHER_NAME from deleted);
set @a3=(select GENDER from deleted);
set @a4=(select	PULPIT from deleted);
set @in= @a1+' '+ @a2 +' '+ @a3+ ' ' +@a4;
insert into TR_AUDIT(STMT,TRANAME,CC) 
				values('DEL','TR_TEACHER_DEL', @in);
 return;  
go 
create trigger TR_TEACHER_DEL2 on TEACHER after DELETE  
as declare  @a1 char(10), @a2 varchar(100), @a3 char(1),@a4 char(20),@in varchar(300);
print 'TR_TEACHER_DEL2';
set @a1=(select TEACHER from deleted);
set @a2=(select TEACHER_NAME from deleted);
set @a3=(select GENDER from deleted);
set @a4=(select	PULPIT from deleted);
set @in= @a1+' '+ @a2 +' '+ @a3+ ' ' +@a4;
insert into TR_AUDIT(STMT,TRANAME,CC) 
				values('DEL','TR_TEACHER_DEL', @in);

 return;  
go  
create trigger TR_TEACHER_DEL3 on TEACHER after DELETE  
as declare  @a1 char(10), @a2 varchar(100), @a3 char(1),@a4 char(20),@in varchar(300);
print 'TR_TEACHER_DEL3';
set @a1=(select TEACHER from deleted);
set @a2=(select TEACHER_NAME from deleted);
set @a3=(select GENDER from deleted);
set @a4=(select	PULPIT from deleted);
set @in= @a1+' '+ @a2 +' '+ @a3+ ' ' +@a4;
insert into TR_AUDIT(STMT,TRANAME,CC) 
				values('DEL','TR_TEACHER_DEL', @in);
 return;  
go    

select t.name, e.type_desc
	from sys.triggers t join sys.trigger_events e 
		on t.object_id=e.object_id
		where OBJECT_NAME(t.parent_id)='TEACHER' and e.type_desc='DELETE'

exec sp_settriggerorder @triggername='TR_TEACHER_DEL3',
		@order = 'First', @stmttype='DELETE'

exec sp_settriggerorder @triggername='TR_TEACHER_DEL2',
		@order = 'Last', @stmttype='DELETE'

select t.name, e.type_desc
	from sys.triggers t join sys.trigger_events e 
		on t.object_id=e.object_id
		where OBJECT_NAME(t.parent_id)='TEACHER' and e.type_desc='DELETE'

--7
create trigger Tov_Teach
		on TEACHER after INSERT, DELETE, UPDATE
		as declare @c int=(select COUNT(TEACHER) from TEACHER);
		if(@c>10)
		begin raiserror('Учителей не может быть больше 10', 10, 1);
		rollback;
		end;
		return;

--8
create trigger Tov_INSTEAD_OF
		on FACULTY instead of DELETE 
			as raiserror(N'Удаление запрещено',10,1);
			return;

delete from FACULTY where FACULTY='ФИТ';

--9
use UNIVER
go
create trigger DDL_UNIVER on database
	for DDL_DATABASE_LEVEL_EVENTS as
declare @t varchar(50) =  EVENTDATA().value('(/EVENT_INSTANCE/EventType)[1]', 'varchar(50)');
  declare @t1 varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/ObjectName)[1]', 'varchar(50)');
  declare @t2 varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/ObjectType)[1]', 'varchar(50)'); 
if @t='DROP_TABLE' or @t='CREATE_TABLE'
begin
	 print 'Тип события: '+@t;
	 print 'Имя обекта: '+@t1;
	 print 'Тип объекта: '+@t2;
	 raiserror(N'Операции по удалению и созданию таблиц запрещены', 16,1);
	 rollback;
end;

use UNIVER
create TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);
DROP TABLE Persons
--1
Create View [Преподаватель]
as select TEACHER[Код],
		  TEACHER_NAME[Имя преподавателя],
		  GENDER[пол],
		  PULPIT[кафедры] from TEACHER
--2
Create view [Количество кафедр]
as Select FACULTY.FACULTY_NAME[Факультет],
(select count(*) from PULPIT where FACULTY.FACULTY=PULPIT.FACULTY) [количество кафедр]
from FACULTY
--3
Create view [Аудитории]
as Select AUDITORIUM.AUDITORIUM[код],
		  AUDITORIUM.AUDITORIUM_NAME[наименование аудитории]
		  from AUDITORIUM
		  WHERE AUDITORIUM_TYPE='ЛК%'
go
insert Аудитории values('304-4','304-4')
--4
Create VIEW[Лекционные_аудитории](код, наименование_аудитории)
as select AUDITORIUM,AUDITORIUM_NAME FROM AUDITORIUM
Where AUDITORIUM_TYPE='ЛК'with check option
go
insert Аудитории values('300-4','300-4')

--5
Create VIEW [Дисциплины](код, наименование_дисциплины, код_кафедры)
as select TOP 150 SUBJECT, SUBJECT_NAME, PULPIT From SUBJECT
ORDER BY SUBJECT_NAME
--6
alter view [Количество кафедр] with schemabinding
as select f.FACULTY [факультет],
count (p.PULPIT) [Количество кафедр] from dbo.PULPIT p join dbo.FACULTY f
on p.FACULTY=f.FACULTY
group by f.FACULTY

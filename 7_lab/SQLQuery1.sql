--1
Create View [�������������]
as select TEACHER[���],
		  TEACHER_NAME[��� �������������],
		  GENDER[���],
		  PULPIT[�������] from TEACHER
--2
Create view [���������� ������]
as Select FACULTY.FACULTY_NAME[���������],
(select count(*) from PULPIT where FACULTY.FACULTY=PULPIT.FACULTY) [���������� ������]
from FACULTY
--3
Create view [���������]
as Select AUDITORIUM.AUDITORIUM[���],
		  AUDITORIUM.AUDITORIUM_NAME[������������ ���������]
		  from AUDITORIUM
		  WHERE AUDITORIUM_TYPE='��%'
go
insert ��������� values('304-4','304-4')
--4
Create VIEW[����������_���������](���, ������������_���������)
as select AUDITORIUM,AUDITORIUM_NAME FROM AUDITORIUM
Where AUDITORIUM_TYPE='��'with check option
go
insert ��������� values('300-4','300-4')

--5
Create VIEW [����������](���, ������������_����������, ���_�������)
as select TOP 150 SUBJECT, SUBJECT_NAME, PULPIT From SUBJECT
ORDER BY SUBJECT_NAME
--6
alter view [���������� ������] with schemabinding
as select f.FACULTY [���������],
count (p.PULPIT) [���������� ������] from dbo.PULPIT p join dbo.FACULTY f
on p.FACULTY=f.FACULTY
group by f.FACULTY

use UNIVER;
Select FACULTY_NAME from FACULTY
Where not exists (select* from PULPIT 
where PULPIT.FACULTY=FACULTY.FACULTY)
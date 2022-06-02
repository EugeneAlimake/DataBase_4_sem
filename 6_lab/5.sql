use UNIVER;
Select GROUPS.PROFESSION, PROGRESS.SUBJECT,GROUPS.FACULTY,
round (avg (cast (PROGRESS.NOTE as float(4))),2) as '������� ������'
from GROUPS inner join FACULTY
on GROUPS.FACULTY = FACULTY.FACULTY
inner join STUDENT
on STUDENT.IDGROUP = GROUPS.IDGROUP
inner join PROGRESS
on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
where GROUPS.FACULTY like '����'
group by GROUPS.PROFESSION, PROGRESS.SUBJECT, GROUPS.FACULTY
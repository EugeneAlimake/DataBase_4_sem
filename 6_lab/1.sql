use UNIVER;
Select max(AUDITORIUM_CAPACITY)[Максимальная вместимость аудитории],
	   min(AUDITORIUM_CAPACITY)[Минимальная вместимость аудитории],
	   avg(AUDITORIUM_CAPACITY)[Средняя вместимость аудитории],
	   sum(AUDITORIUM_CAPACITY)[Сумма вместимости аудиторий],
	   count(*)				   [Количество всех аудиторий]
From AUDITORIUM
--2
Select AUDITORIUM_TYPE.AUDITORIUM_TYPENAME,
max(AUDITORIUM_CAPACITY)[Максимальная вместимость аудитории],
	   min(AUDITORIUM_CAPACITY)[Минимальная вместимость аудитории],
	   avg(AUDITORIUM_CAPACITY)[Средняя вместимость аудитории],
	   sum(AUDITORIUM_CAPACITY)[Сумма вместимости аудиторий],
	   count(*)				   [Количество всех аудиторий]
From AUDITORIUM Inner Join AUDITORIUM_TYPE
On AUDITORIUM.AUDITORIUM_TYPE=AUDITORIUM_TYPE.AUDITORIUM_TYPE Group by AUDITORIUM_TYPE.AUDITORIUM_TYPENAME;
--3
Select*
From(select 
Case 
when PROGRESS.NOTE = 10 then '10'
				when PROGRESS.NOTE = 8 or PROGRESS.NOTE = 9 then '8-9'
				when PROGRESS.NOTE = 6 or PROGRESS.NOTE = 7 then '6-7'
				else '4-5' 
end[Оценка], COUNT(*)[Количество]
From PROGRESS Group by Case
when PROGRESS.NOTE = 10 then '10'
				when PROGRESS.NOTE = 8 or PROGRESS.NOTE = 9 then '8-9'
				when PROGRESS.NOTE = 6 or PROGRESS.NOTE = 7 then '6-7'
				else '4-5' 
end) as P
Order by case[Оценка]
when '10' then 1
when '8-9' then 2
when '6-7' then 3
else 4 
end
--4
select FACULTY.FACULTY, GROUPS.PROFESSION,
round (avg (cast (PROGRESS.NOTE as float(4))),2) as 'средняя оценка'
from FACULTY inner join GROUPS
on FACULTY.FACULTY = GROUPS.FACULTY
inner join STUDENT
on STUDENT.IDGROUP = GROUPS.IDGROUP
inner join PROGRESS
on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
group by FACULTY.FACULTY, GROUPS.PROFESSION
--4_1
select FACULTY.FACULTY, GROUPS.PROFESSION,
round (avg (cast (PROGRESS.NOTE as float(4))),2) as 'средняя оценка'
from FACULTY inner join GROUPS
on FACULTY.FACULTY = GROUPS.FACULTY
inner join STUDENT
on STUDENT.IDGROUP = GROUPS.IDGROUP
inner join PROGRESS
on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
where PROGRESS.SUBJECT like 'БД' or PROGRESS.SUBJECT = 'ОАиП'
group by FACULTY.FACULTY, GROUPS.PROFESSION
--5
Select GROUPS.PROFESSION, PROGRESS.SUBJECT,GROUPS.FACULTY,
round (avg (cast (PROGRESS.NOTE as float(4))),2) as 'средняя оценка'
from GROUPS inner join FACULTY
on GROUPS.FACULTY = FACULTY.FACULTY
inner join STUDENT
on STUDENT.IDGROUP = GROUPS.IDGROUP
inner join PROGRESS
on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
where GROUPS.FACULTY like 'ИДиП'
group by GROUPS.PROFESSION, PROGRESS.SUBJECT, GROUPS.FACULTY
--5_1
Select GROUPS.PROFESSION, PROGRESS.SUBJECT,GROUPS.FACULTY,
round (avg (cast (PROGRESS.NOTE as float(4))),2) as 'средняя оценка'
from GROUPS inner join FACULTY
on GROUPS.FACULTY = FACULTY.FACULTY
inner join STUDENT
on STUDENT.IDGROUP = GROUPS.IDGROUP
inner join PROGRESS
on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
where GROUPS.FACULTY like 'ИДиП'
group by rollup (GROUPS.PROFESSION, PROGRESS.SUBJECT), GROUPS.FACULTY
--6
Select GROUPS.PROFESSION, PROGRESS.SUBJECT,GROUPS.FACULTY,
round (avg (cast (PROGRESS.NOTE as float(4))),2) as 'средняя оценка'
from GROUPS inner join FACULTY
on GROUPS.FACULTY = FACULTY.FACULTY
inner join STUDENT
on STUDENT.IDGROUP = GROUPS.IDGROUP
inner join PROGRESS
on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
where GROUPS.FACULTY like 'ИДиП'
group by cube (GROUPS.PROFESSION, PROGRESS.SUBJECT), GROUPS.FACULTY
--7
Select GROUPS.PROFESSION, PROGRESS.SUBJECT,GROUPS.FACULTY,
round (avg (cast (PROGRESS.NOTE as float(4))),2) as 'средняя оценка'
from GROUPS inner join FACULTY
on GROUPS.FACULTY = FACULTY.FACULTY
inner join STUDENT
on STUDENT.IDGROUP = GROUPS.IDGROUP
inner join PROGRESS
on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
where GROUPS.FACULTY like 'ИДиП'
group by GROUPS.PROFESSION, PROGRESS.SUBJECT, GROUPS.FACULTY
union all
Select GROUPS.PROFESSION, PROGRESS.SUBJECT,GROUPS.FACULTY,
round (avg (cast (PROGRESS.NOTE as float(4))),2) as 'средняя оценка'
from GROUPS inner join FACULTY
on GROUPS.FACULTY = FACULTY.FACULTY
inner join STUDENT
on STUDENT.IDGROUP = GROUPS.IDGROUP
inner join PROGRESS
on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
where GROUPS.FACULTY like 'ТОВ'
group by GROUPS.PROFESSION, PROGRESS.SUBJECT, GROUPS.FACULTY
--8
Select GROUPS.PROFESSION, PROGRESS.SUBJECT,GROUPS.FACULTY,
round (avg (cast (PROGRESS.NOTE as float(4))),2) as 'средняя оценка'
from GROUPS inner join FACULTY
on GROUPS.FACULTY = FACULTY.FACULTY
inner join STUDENT
on STUDENT.IDGROUP = GROUPS.IDGROUP
inner join PROGRESS
on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
where GROUPS.FACULTY like 'ИДиП'
group by GROUPS.PROFESSION, PROGRESS.SUBJECT, GROUPS.FACULTY
intersect
Select GROUPS.PROFESSION, PROGRESS.SUBJECT,GROUPS.FACULTY,
round (avg (cast (PROGRESS.NOTE as float(4))),2) as 'средняя оценка'
from GROUPS inner join FACULTY
on GROUPS.FACULTY = FACULTY.FACULTY
inner join STUDENT
on STUDENT.IDGROUP = GROUPS.IDGROUP
inner join PROGRESS
on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
where GROUPS.FACULTY like 'ТОВ'
group by GROUPS.PROFESSION, PROGRESS.SUBJECT, GROUPS.FACULTY
--9
Select GROUPS.PROFESSION, PROGRESS.SUBJECT,GROUPS.FACULTY,
round (avg (cast (PROGRESS.NOTE as float(4))),2) as 'средняя оценка'
from GROUPS inner join FACULTY
on GROUPS.FACULTY = FACULTY.FACULTY
inner join STUDENT
on STUDENT.IDGROUP = GROUPS.IDGROUP
inner join PROGRESS
on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
where GROUPS.FACULTY like 'ИДиП'
group by GROUPS.PROFESSION, PROGRESS.SUBJECT, GROUPS.FACULTY
except
Select GROUPS.PROFESSION, PROGRESS.SUBJECT,GROUPS.FACULTY,
round (avg (cast (PROGRESS.NOTE as float(4))),2) as 'средняя оценка'
from GROUPS inner join FACULTY
on GROUPS.FACULTY = FACULTY.FACULTY
inner join STUDENT
on STUDENT.IDGROUP = GROUPS.IDGROUP
inner join PROGRESS
on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
where GROUPS.FACULTY like 'ТОВ'
group by GROUPS.PROFESSION, PROGRESS.SUBJECT, GROUPS.FACULTY
--10
Select p1.SUBJECT, p1.NOTE,
(select COUNT(*) from PROGRESS p2
where p2.SUBJECT=p1.SUBJECT
and p2.NOTE=p1.NOTE)[количество студентов]
from PROGRESS p1
GROUP BY p1.SUBJECT, p1.NOTE
HAVING NOTE=8 or NOTE=9


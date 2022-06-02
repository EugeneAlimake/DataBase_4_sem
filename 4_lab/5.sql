use UNIVER;
SELECT FACULTY.FACULTY[Факультет], PULPIT.PULPIT[Кафедра], PROFESSION.PROFESSION_NAME[Специальность], 
STUDENT.NAME[Имя студента],SUBJECT.SUBJECT[Дисциплина],GROUPS.IDGROUP[Группа],
Case 
when(PROGRESS.NOTE='6') then 'six'
when(PROGRESS.NOTE='7') then 'seven'
when(PROGRESS.NOTE='8') then 'eight'
end[Оценка]
from((((((FACULTY
inner join PULPIT on FACULTY.FACULTY=PULPIT.FACULTY)
inner join SUBJECT on PULPIT.PULPIT=SUBJECT.PULPIT)
inner join PROGRESS on SUBJECT.SUBJECT=PROGRESS.SUBJECT)
inner join STUDENT on STUDENT.IDSTUDENT=PROGRESS.IDSTUDENT)
inner join GROUPS on STUDENT.IDGROUP=GROUPS.IDGROUP)
inner join PROFESSION on GROUPS.PROFESSION=PROFESSION.PROFESSION)
where PROGRESS.NOTE between 6 and 8
order by 
(Case 
when(PROGRESS.NOTE='6') then 3
when(PROGRESS.NOTE='7') then 1
when(PROGRESS.NOTE='8') then 2
end)
use UNIVER
SELECT  isnull(TEACHER.TEACHER_NAME,'***')[Преподаватели], PULPIT.PULPIT_NAME
FROM  TEACHER Left Outer JOIN PULPIT
ON PULPIT.PULPIT=TEACHER.PULPIT
use UNIVER;
Select p1.SUBJECT, p1.NOTE,
(select COUNT(*) from PROGRESS p2
where p2.SUBJECT=p1.SUBJECT
and p2.NOTE=p1.NOTE)[количество студентов]
from PROGRESS p1
GROUP BY p1.SUBJECT, p1.NOTE
HAVING NOTE=8 or NOTE=9
